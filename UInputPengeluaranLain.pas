unit UInputPengeluaranLain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, NxEdit, RzRadChk, StdCtrls, RzEdit,
  RzBtnEdt, Mask, RzLabel, RzPanel, ExtCtrls, cxPC, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  TFrm_InputPengeluaranLain = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    LKas: TRzLabel;
    LID: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel6: TRzLabel;
    txtsebesar: TRzNumericEdit;
    txtreferensi: TRzEdit;
    txtkas: TRzButtonEdit;
    txtterbilang: TRzMemo;
    cbgiro: TRzCheckBox;
    dtptanggal: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    ZQuery1: TZQuery;
    dbgdata: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxIconColumn61: TNxIconColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    txtpenerima: TRzEdit;
    procedure BtnCariClick(Sender: TObject);
    procedure dbgdataAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure dbgdataCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure BtnRekamClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgdataExit(Sender: TObject);
    procedure dbgdataKeyPress(Sender: TObject; var Key: Char);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgdataSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgdataCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_InputPengeluaranLain: TFrm_InputPengeluaranLain;

implementation

uses UDM, UDataAkun, NxCells, UMain, UTransaksiGiroKeluar, NxIntf6;

{$R *.dfm}

{ TFrm_InputPengeluaranLain }

procedure TFrm_InputPengeluaranLain.ClearText;
begin
  txtreferensi.Text := DM.GenerateKodeTransaksi('CO',Date);
  dtptanggal.Date := Date;
  dtptanggal.ReadOnly := False;
  txtsebesar.Value := 0;
  txtterbilang.Clear;
  dbgdata.ClearRows;
  LKas.Caption := '0';
  txtkas.Clear;
  txtpenerima.Clear;
  LID.Caption := '0';
  cbgiro.Enabled := True;
  cbgiro.Checked := False;
  BtnRekam.Visible := True;
end;

procedure TFrm_InputPengeluaranLain.UpdateTotal;
var
  total:Double;
  i:integer;
begin
  total := 0;
  with dbgdata do begin
    for i:=0 to RowCount-1 do begin
      total:=total+(Cell[2,i].AsFloat);
    end;
    txtsebesar.Value := total;
    if total = 0 then
      txtterbilang.Clear
    else txtterbilang.Text := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
  end;
end;

procedure TFrm_InputPengeluaranLain.BtnCariClick(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    i := dbgdata.SelectedRow;
    dbgdata.Cell[0,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
    dbgdata.Cell[1,i].AsString := Frm_DataAkun.QData.FieldValues['namaakun'];
    dbgdata.Cell[2,i].AsFloat := 0;
    dbgdata.Cell[5,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
    UpdateTotal;
    dbgdata.SelectCell(2,i);
  end;
end;

procedure TFrm_InputPengeluaranLain.dbgdataAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  if ACol = 0 then begin
    if dbgdata.Cell[0,ARow].AsString = '' then begin
      dbgdata.DeleteRow(ARow);
      if dbgdata.RowCount = 0 then dbgdata.AddRow();
    end else begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and kodeakun=:ka)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi';
        ParamByName('ka').Value := dbgdata.Cell[0,ARow].AsString;
        Open;
        if IsEmpty then begin
          BtnCariClick(nil);
        end else begin
          dbgdata.Cell[0,ARow].AsString := FieldValues['kodeakun'];
          dbgdata.Cell[1,ARow].AsString := FieldValues['namaakun'];
          dbgdata.Cell[2,ARow].AsFloat := 0;
          dbgdata.Cell[5,ARow].AsInteger := FieldValues['noakun'];
          UpdateTotal;
          dbgdata.SelectCell(2,ARow);
        end;
        Free;
      end;
    end;
  end else if ACol = 2 then begin
    if dbgdata.Cell[0,ARow].AsString = '' then begin
      dbgdata.Cell[2,ARow].AsFloat := 0;
      Exit;
    end;
    UpdateTotal;
  end;
end;

procedure TFrm_InputPengeluaranLain.dbgdataCellDblClick(Sender: TObject;
  ACol, ARow: Integer);
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil)
  end;
end;

procedure TFrm_InputPengeluaranLain.BtnRekamClick(Sender: TObject);
var
  i,nopengeluaran,noakungiro,pakaigiro:Integer;
  md,nogiro:string;
  tempogiro: TDate;
  jumlahnilai: Double;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if LKas.Caption = '0' then begin
    MessageDlg('Kas : harus diisi',mtError,[mbOK],0);
    txtkas.SetFocus;
    Exit;
  end;
  with dbgdata do begin
    for i:=0 to RowCount-1 do begin
      if Cell[2,i].AsFloat = 0 then begin
        MessageDlg('Nilai tidak boleh nol',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end;
  with dbgdata do begin
    jumlahnilai := 0;
    for i:=0 to RowCount-1 do begin
      jumlahnilai := jumlahnilai+dbgdata.Cell[2,i].AsFloat;
    end;
    if jumlahnilai <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  {if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtptanggal.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;}
  with TZQuery.Create(Self) do begin
    Connection := DM.con;
    if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      if LID.Caption = '0' then begin
        if cbgiro.Checked = True then begin
          Application.CreateForm(TFrm_TransaksiGiroKeluar, Frm_TransaksiGiroKeluar);
          Frm_TransaksiGiroKeluar.ClearText;
          if Frm_TransaksiGiroKeluar.ShowModal = mrok then begin
            pakaigiro := 1;
            tempogiro := Frm_TransaksiGiroKeluar.dtptanggal.Date;
            nogiro := Frm_TransaksiGiroKeluar.txtnomorgiro.Text;
            noakungiro := StrToInt(Frm_TransaksiGiroKeluar.LAkunGiro.Caption);
          end else begin
            Free;
            Exit;
          end;
        end else begin
          pakaigiro := 0;
        end;
        txtreferensi.Text := DM.GenerateKodeTransaksi('CO',Date);
        nopengeluaran := DM.GenerateNoMaster('pengeluaranlain');
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'CO';
        ParamByName('b').Value := Date;
        ParamByName('c').Value := txtreferensi.Text;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_pengeluaranlain values (:a,:b,:c,:d,:e,:f,:h,:i)';
        ParamByName('a').Value := nopengeluaran;
        ParamByName('b').Value := txtreferensi.Text;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('d').Value := txtpenerima.Text;
        ParamByName('e').Value := Frm_Main.txtuser.Caption;
        ParamByName('f').Value := LKas.Caption;
        ParamByName('h').Value := txtsebesar.Value;
        ParamByName('i').Value := pakaigiro;
        ExecSQL;
        for i:=0 to dbgdata.RowCount-1 do begin
          if dbgdata.Cell[2,i].AsFloat > 0 then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_pengeluaranlaindetail values (:a,:b,:c,:d)';
            ParamByName('a').Value := nopengeluaran;
            ParamByName('b').Value := dbgdata.Cell[5,i].AsInteger;
            ParamByName('c').Value := dbgdata.Cell[2,i].AsFloat;
            ParamByName('d').Value := dbgdata.Cell[3,i].AsString;
            ExecSQL;
            DM.InsertBukuBesarAkun(dbgdata.Cell[5,i].AsInteger,dtptanggal.Date,'CO',nopengeluaran,'Kas Keluar '+txtreferensi.Text,dbgdata.Cell[2,i].AsFloat,0);
          end;
        end;
        DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CO',nopengeluaran,'Kas Keluar '+txtreferensi.Text,0,txtsebesar.Value);
        {if cbgiro.Checked = True then begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:h,:i,:j,:k)';
          ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('b').Value := nopengeluaran;
          ParamByName('c').Value := 'CO';
          ParamByName('d').Value := nogiro;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',tempogiro);
          ParamByName('f').Value := '';
          ParamByName('h').Value := noakungiro;
          ParamByName('i').Value := txtsebesar.Value;
          ParamByName('j').Value := 0;
          ParamByName('k').Value := 'out';
          ExecSQL;
          DM.InsertBukuBesarAkun(noakungiro,dtptanggal.Date,'CO',nopengeluaran,txtketerangan.Text,0,txtsebesar.Value);
        end else begin
          DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CO',nopengeluaran,txtketerangan.Text,0,txtsebesar.Value);
        end;      }
        if MessageDlg('Cetak ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := nopengeluaran;
          ParamByName('t').Value := 'CO';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := nopengeluaran;
            ParamByName('b').Value := 'CO';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := nopengeluaran;
            ParamByName('t').Value := 'CO';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end;
          dm.Q_NotaPengeluaranKas.Close;
          DM.Q_NotaPengeluaranKas.ParamByName('np').Value := nopengeluaran;
          DM.Q_NotaPengeluaranKas.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := nopengeluaran;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'CO';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PengeluaranKas.ShowReport(True);
        end;
        ClearText;
        dbgdata.AddRow();
      end else begin
        if cbgiro.Enabled = False then begin
          md := 'Transaksi ini tidak dapat dihapus/diedit karena giro telah cair!';
          MessageDlg(md,mtWarning,[mbOK],0);
          Free;
          exit;
        end;
        if cbgiro.Checked = True then begin
          Application.CreateForm(TFrm_TransaksiGiroKeluar, Frm_TransaksiGiroKeluar);
          Frm_TransaksiGiroKeluar.ClearText;
          if Frm_TransaksiGiroKeluar.ShowModal = mrok then begin
            pakaigiro := 1;
            tempogiro := Frm_TransaksiGiroKeluar.dtptanggal.Date;
            nogiro := Frm_TransaksiGiroKeluar.txtnomorgiro.Text;
            noakungiro := StrToInt(Frm_TransaksiGiroKeluar.LAkunGiro.Caption);
          end else begin
            Free;
            Exit;
          end;
        end else begin
          pakaigiro := 0;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CO';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CO';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CO';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CO';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pengeluaranlain set tgltransaksi=:c,penerima=:d,noakun=:h,total=:i,giro=:l where nopengeluaran=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('d').Value := txtpenerima.Text;
        ParamByName('h').Value := LKas.Caption;
        ParamByName('i').Value := txtsebesar.Value;
        ParamByName('l').Value := pakaigiro;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_pengeluaranlaindetail where nopengeluaran=:np';
        ParamByName('np').Value := LID.Caption;
        ExecSQL;
        for i:=0 to dbgdata.RowCount-1 do begin
          if dbgdata.Cell[2,i].AsFloat > 0 then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_pengeluaranlaindetail values (:a,:b,:c,:d)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := dbgdata.Cell[5,i].AsInteger;
            ParamByName('c').Value := dbgdata.Cell[2,i].AsFloat;
            ParamByName('d').Value := dbgdata.Cell[3,i].AsString;
            ExecSQL;
            DM.InsertBukuBesarAkun(dbgdata.Cell[5,i].AsInteger,dtptanggal.Date,'CO',StrToInt(LID.Caption),'Kas Keluar '+txtreferensi.Text,dbgdata.Cell[2,i].AsFloat,0);
          end;
        end;
        DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CO',StrToInt(LID.Caption),'Kas Keluar '+txtreferensi.Text,0,txtsebesar.Value);
        {if cbgiro.Checked = True then begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:h,:i,:j,:k)';
          ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('b').Value := LID.Caption;
          ParamByName('c').Value := 'CO';
          ParamByName('d').Value := nogiro;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',tempogiro);
          ParamByName('f').Value := '';
          ParamByName('h').Value := noakungiro;
          ParamByName('i').Value := txtsebesar.Value;
          ParamByName('j').Value := 0;
          ParamByName('k').Value := 'out';
          ExecSQL;
          DM.InsertBukuBesarAkun(noakungiro,dtptanggal.Date,'CO',StrToInt(LID.Caption),txtketerangan.Text,0,txtsebesar.Value);
        end else begin
          DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CO',StrToInt(LID.Caption),txtketerangan.Text,0,txtsebesar.Value);
        end;    }
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CO';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CO';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'CO';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end;
          dm.Q_NotaPengeluaranKas.Close;
          DM.Q_NotaPengeluaranKas.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaPengeluaranKas.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'CO';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PengeluaranKas.ShowReport(True);
        end;
        ClearText;
        dbgdata.AddRow();
      end;
    end;
    Free;
  end;
end;

procedure TFrm_InputPengeluaranLain.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;


procedure TFrm_InputPengeluaranLain.dbgdataExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgdata.RowCount-1 do begin
    if dbgdata.Cell[0,i].AsString = '' then begin
      dbgdata.DeleteRow(i);
      if dbgdata.RowCount = 0 then dbgdata.AddRow();
    end;
  end;
end;

procedure TFrm_InputPengeluaranLain.dbgdataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (dbgdata.SelectedCol = 0) Or (dbgdata.SelectedCol = 1) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
end;

procedure TFrm_InputPengeluaranLain.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_InputPengeluaranLain.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;


procedure TFrm_InputPengeluaranLain.dbgdataSelectionChanged(
  Sender: TObject; ACol, ARow: Integer);
var
  i : integer;
begin
  if ACol = 4 then begin
    if dbgdata.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgdata.RowCount-1 then begin
        dbgdata.AddRow();
        i := dbgdata.RowCount;
        dbgdata.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_InputPengeluaranLain.dbgdataCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 4 then begin
    dbgdata.DeleteRow(ARow);
    if dbgdata.RowCount = 0 then dbgdata.AddRow();
    UpdateTotal;
  end;
end;

end.
