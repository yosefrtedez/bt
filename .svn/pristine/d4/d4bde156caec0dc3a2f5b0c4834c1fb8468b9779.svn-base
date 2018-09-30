unit UPembayaranPiutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, NxEdit, StdCtrls, RzEdit, RzRadChk, Mask,
  RzBtnEdt, RzLabel, RzPanel, ExtCtrls, NxColumns6, NxGridView6,
  NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  TFrm_PembayaranPiutang = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    LCustomer: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel10: TRzLabel;
    LKas: TRzLabel;
    LID: TRzLabel;
    txtcustomer: TRzButtonEdit;
    txtsebesar: TRzNumericEdit;
    txtreferensi: TRzEdit;
    txtkas: TRzButtonEdit;
    cbgiro: TRzCheckBox;
    txtterbilang: TRzMemo;
    dtptanggal: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    ZQuery1: TZQuery;
    RzPanel4: TRzPanel;
    RzLabel13: TRzLabel;
    txtbiaya: TRzNumericEdit;
    BtnBiaya: TRzToolButton;
    LPendapatanDenda: TRzLabel;
    dbgpembayaran: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxDateColumn61: TNxDateColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxDateColumn62: TNxDateColumn6;
    NxTextColumn62: TNxTextColumn6;
    procedure BtnBatalClick(Sender: TObject);
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure dbgpembayaranAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRekamClick(Sender: TObject);
    procedure BtnBiayaClick(Sender: TObject);
    procedure dbgpembayaranCellDblClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgpembayaranKeyPress(Sender: TObject; var Key: Char);
    procedure dtptanggalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateTotal;
    procedure ClearText;
    function CekTerm(ANoPenjualan: Integer):Double;
    function GetEarlyDiskon(ANoPenjualan: Integer;ATotal: Double):Double;
    function GetLateCharge(ANoPenjualan: Integer;ATotal: Double):Double;
  end;

var
  Frm_PembayaranPiutang: TFrm_PembayaranPiutang;

implementation

uses UDataPiutangUsaha, UDataInvoicePiutang, UDM,
  UMain, UDataAkun, NxCells, UTransaksiGiro, USetAkun, NxIntf6;

{$R *.dfm}

procedure TFrm_PembayaranPiutang.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PembayaranPiutang.txtcustomerButtonClick(Sender: TObject);
var
  i: Integer;
begin
  Application.CreateForm(TFrm_DataPiutangUsaha, Frm_DataPiutangUsaha);
  Frm_DataPiutangUsaha.RefreshQ;
  if Frm_DataPiutangUsaha.ShowModal = mrok then begin
    ClearText;
    dbgpembayaran.AddRow();
    txtcustomer.Text := Frm_DataPiutangUsaha.QData.FieldValues['namakontak'];
    LCustomer.Caption := Frm_DataPiutangUsaha.QData.FieldValues['nokontak'];
    dbgpembayaran.ClearRows;
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'SELECT e.*,e.totalpiutang-e.jumlahretur-e.jumlahbayar AS sisapiutang FROM ' +
                  '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.selisih),0)AS jumlahbayar FROM ' +
                  '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM ' +
                  '(SELECT nopenjualaninvoice,kodepenjualaninvoice,tglpenjualaninvoice,nokontak,total AS totalpiutang,noakunpiutang,DATE_ADD(tglpenjualaninvoice,INTERVAL duedate DAY) AS tgltempo FROM tbl_penjualaninvoice WHERE nokontak=:isu)AS a ' +
                  'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nopenjualaninvoice GROUP BY a.nopenjualaninvoice)AS c ' +
                  'LEFT JOIN (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih FROM ' +
                  '(SELECT * FROM tbl_pembayaranpiutang)AS a ' +
                  'LEFT JOIN tbl_pembayaranpiutangdetail AS b ON b.nopembayaranpiutang=a.nopembayaranpiutang) AS d ON d.nopenjualaninvoice=c.nopenjualaninvoice GROUP BY c.nopenjualaninvoice)AS e ' +
                  'where e.totalpiutang-e.jumlahretur-e.jumlahbayar>0 ORDER BY e.tglpenjualaninvoice';
      ParamByName('isu').Value := LCustomer.Caption;
      Open;
      if not IsEmpty then begin
        First;
        dbgpembayaran.ClearRows;
        for i:= 0 to RecordCount-1 do begin
          dbgpembayaran.AddRow();
          dbgpembayaran.Cell[0,i].AsString := FieldValues['kodepenjualaninvoice'];
          dbgpembayaran.Cell[1,i].AsDateTime := FieldValues['tglpenjualaninvoice'];
          dbgpembayaran.Cell[2,i].AsDateTime := FieldValues['tgltempo'];
          dbgpembayaran.Cell[3,i].AsFloat := FieldValues['sisapiutang'];
          {if CekTerm(FieldValues['nopenjualaninvoice']) = 1 then begin
            dbgpembayaran.Cell[3,i].AsFloat := GetEarlyDiskon(Frm_DataInvoicePiutang.QData.FieldValues['nopenjualaninvoice'],dbgpembayaran.Cell[2,i].AsFloat);
            dbgpembayaran.Cell[9,i].AsFloat := 0;
          end else if CekTerm(FieldValues['nopenjualaninvoice']) = -1 then begin
            dbgpembayaran.Cell[3,i].AsFloat := 0;
            dbgpembayaran.Cell[9,i].AsFloat := GetLateCharge(Frm_DataInvoicePiutang.QData.FieldValues['nopenjualaninvoice'],dbgpembayaran.Cell[2,i].AsFloat);
          end else if CekTerm(FieldValues['nopenjualaninvoice']) = 0 then begin
            dbgpembayaran.Cell[3,i].AsFloat := 0;
            dbgpembayaran.Cell[9,i].AsFloat := 0;
          end;
          dbgpembayaran.Cell[4,i].AsFloat := Frm_DataInvoicePiutang.QData.FieldValues['sisapiutang']-dbgpembayaran.Cell[3,i].AsFloat;  }
          dbgpembayaran.Cell[7,i].AsInteger := FieldValues['nopenjualaninvoice'];
          dbgpembayaran.Cell[9,i].AsInteger := FieldValues['noakunpiutang'];

          Next;
        end;
        UpdateTotal;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_PembayaranPiutang.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_PembayaranPiutang.ClearText;
begin
  LID.Caption := '0';
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  txtkas.Clear;
  LKas.Caption := '0';
  dtptanggal.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('CR',dtptanggal.Date);
  dtptanggal.ReadOnly := False;
  txtsebesar.Value := 0;
  txtterbilang.Clear;
  dbgpembayaran.ClearRows;
  cbgiro.Checked := False;
  cbgiro.Enabled := True;
  LPendapatanDenda.Caption := '0';
  BtnRekam.Visible := True;
end;

procedure TFrm_PembayaranPiutang.UpdateTotal;
var
  total,denda:Double;
  i:integer;
begin
  total := 0;
  denda := 0;
  with dbgpembayaran do begin
    for i:=0 to RowCount-1 do begin
      total:=total+(Cell[4,i].AsFloat+Cell[5,i].AsFloat);
      denda := denda+(Cell[10,i].AsFloat)
    end;
    txtsebesar.Value := total+denda;
    txtbiaya.Value := denda;
    if total = 0 then
      txtterbilang.Clear
    else txtterbilang.Text := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
  end;
end;

procedure TFrm_PembayaranPiutang.dbgpembayaranAfterEdit(Sender: TObject;
  ACol, ARow: Integer; Value: WideString);
begin
  if ACol = 4 then begin
    if dbgpembayaran.Cell[0,ARow].AsString = '' then begin
      dbgpembayaran.Cell[4,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 5 then begin
    if dbgpembayaran.Cell[0,ARow].AsString = '' then begin
      dbgpembayaran.Cell[5,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  if dbgpembayaran.Cell[3,ARow].AsFloat-dbgpembayaran.Cell[4,ARow].AsFloat-dbgpembayaran.Cell[5,ARow].AsFloat < 0 then begin
    dbgpembayaran.Cell[5,ARow].AsFloat := dbgpembayaran.Cell[3,ARow].AsFloat-dbgpembayaran.Cell[4,ARow].AsFloat;
  end;
  UpdateTotal;
end;

procedure TFrm_PembayaranPiutang.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_PembayaranPiutang.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;

procedure TFrm_PembayaranPiutang.BtnRekamClick(Sender: TObject);
var
  i,pakaigiro,noakungiro:Integer;
  nogiro,bankgiro,md: string;
  tempogiro: TDate;
  jumlah: Double;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if txtcustomer.Text = '' then begin
    MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  if LKas.Caption = '0' then begin
    MessageDlg('Kas : harus diisi terlebih dahulu !',mtError,[mbOK],0);
    txtkas.SetFocus;
    Exit;
  end;
  if LPendapatanDenda.Caption = '0' then begin
    if txtbiaya.Value > 0 then begin
      MessageDlg('Akun Denda: harus dipilih !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if dbgpembayaran.RowCount <=1  then begin
    if dbgpembayaran.RowCount =1 then begin
      if dbgpembayaran.Cell[0,0].AsString = '' then begin
        MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
        Exit;
      end;
    end else begin
      MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgpembayaran do begin
    jumlah := 0;
    for i:=0 to RowCount-1 do begin
      jumlah := jumlah+dbgpembayaran.Cell[4,i].AsFloat;
      if dbgpembayaran.Cell[5,i].AsFloat > 0 then begin
        if dbgpembayaran.Cell[8,i].AsInteger = 0 then begin
          MessageDlg('Akun selisih harus diisi!',mtError,[mbOK],0);
          Exit;
        end;
      end;
    end;
    if jumlah = 0 then begin
      MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
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
  end;   }
  if LID.Caption = '0' then begin
    with dbgpembayaran do begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        for i:=0 to RowCount-1 do begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM ' +
                      '(SELECT e.*,e.totalpiutang-e.jumlahretur-e.jumlahbayar AS sisapiutang FROM ' +
                      '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.selisih),0)AS jumlahbayar FROM ' +
                      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM ' +
                      '(SELECT nopenjualaninvoice,kodepenjualaninvoice,tglpenjualaninvoice,nokontak,total AS totalpiutang,noakunpiutang,DATE_ADD(tglpenjualaninvoice,INTERVAL duedate DAY) AS tgltempo FROM tbl_penjualaninvoice WHERE nokontak=:nk)AS a ' +
                      'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nopenjualaninvoice GROUP BY a.nopenjualaninvoice)AS c ' +
                      'LEFT JOIN (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih FROM ' +
                      '(SELECT * FROM tbl_pembayaranpiutang)AS a ' +
                      'LEFT JOIN tbl_pembayaranpiutangdetail AS b ON b.nopembayaranpiutang=a.nopembayaranpiutang) AS d ON d.nopenjualaninvoice=c.nopenjualaninvoice GROUP BY c.nopenjualaninvoice)AS e ' +
                      'WHERE e.totalpiutang-e.jumlahretur-e.jumlahbayar>0 ORDER BY e.tglpenjualaninvoice)AS a WHERE a.nopenjualaninvoice=:np';
          ParamByName('nk').Value := LCustomer.Caption;
          ParamByName('np').Value := dbgpembayaran.Cell[7,i].AsInteger;
          Open;
          if IsEmpty then begin
            MessageDlg('No. Invoice '+dbgpembayaran.Cell[0,i].AsString+' telah lunas dibayar. Cek data Kembali!',mtError,[mbok],0);
            Free;
            Exit;
          end;
        end;
        Free;
      end;
    end;
    if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      Screen.Cursor := crSQLWait;
      try
        dm.con.StartTransaction;
        with TZQuery.Create(Self) do begin
          Connection := DM.con;
          {if cbgiro.Checked = True then begin
            Application.CreateForm(TFrm_TransaksiGiro, Frm_TransaksiGiro);
            Frm_TransaksiGiro.ClearText;
            if Frm_TransaksiGiro.ShowModal = mrok then begin
              pakaigiro := 1;
              tempogiro := Frm_TransaksiGiro.dtptanggal.Date;
              nogiro := Frm_TransaksiGiro.txtnomorgiro.Text;
              bankgiro := Frm_TransaksiGiro.txtbank.Text;
              noakungiro := StrToInt(Frm_TransaksiGiro.LAkunGiro.Caption);
            end else begin
              Free;
              Exit;
            end;
          end else begin
            pakaigiro := 0;
          end;  }
          LID.Caption := IntToStr(DM.GenerateNoMaster('pembayaranpiutang'));
          txtreferensi.Text := DM.GenerateKodeTransaksi('CR',dtptanggal.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'CR';
          ParamByName('b').Value := dtptanggal.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_pembayaranpiutang values (:a,:b,:c,:d,:e,:f,:g,:i,:j,:k)';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LCustomer.Caption;
          ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('e').Value := txtsebesar.Value;
          ParamByName('f').Value := Frm_Main.txtuser.Caption;
          ParamByName('g').Value := LKas.Caption;
          ParamByName('i').Value := pakaigiro;
          ParamByName('j').Value := txtbiaya.Value;
          ParamByName('k').Value := LPendapatanDenda.Caption;
          ExecSQL;
          for i:=0 to dbgpembayaran.RowCount-1 do begin
            if dbgpembayaran.Cell[4,i].AsFloat <> 0 then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_pembayaranpiutangdetail values (:a,:b,:c,:d,:e,:f,:g)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := dbgpembayaran.Cell[7,i].AsInteger;
              ParamByName('c').Value := dbgpembayaran.Cell[4,i].AsFloat;
              ParamByName('d').Value := dbgpembayaran.Cell[5,i].AsFloat;
              ParamByName('e').Value := dbgpembayaran.Cell[9,i].AsInteger;
              ParamByName('f').Value := dbgpembayaran.Cell[8,i].AsInteger;
              ParamByName('g').Value := dbgpembayaran.Cell[10,i].AsFloat;
              ExecSQL;
              DM.InsertBukuBesarAkun(StrtoInt(LKas.Caption),Date,'CR',StrtoInt(LID.Caption),'Pembayaran Piutang,'+txtreferensi.Text,dbgpembayaran.Cell[4,i].AsFloat,0);
              DM.InsertBukuBesarAkun(dbgpembayaran.Cell[9,i].AsInteger,Date,'CR',StrtoInt(LID.Caption),'Pembayaran Piutang,'+txtreferensi.Text,0,dbgpembayaran.Cell[4,i].AsFloat+dbgpembayaran.Cell[5,i].AsFloat);
              if dbgpembayaran.Cell[5,i].AsFloat <> 0 then begin
                DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,Date,'CR',StrtoInt(LID.Caption),'Selisih Pembayaran,'+txtreferensi.Text,dbgpembayaran.Cell[5,i].AsFloat,0);
              end;
              {if dbgpembayaran.Cell[5,i].AsFloat > 0 then begin
                DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,Date,'CR',StrtoInt(LID.Caption),'Selisih Pembayaran,'+txtreferensi.Text,0,dbgpembayaran.Cell[5,i].AsFloat);
              end else if dbgpembayaran.Cell[5,i].AsFloat<0 then begin
                DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,Date,'CR',StrtoInt(LID.Caption),'Selisih Pembayaran,'+txtreferensi.Text,Abs(dbgpembayaran.Cell[5,i].AsFloat),0);
              end;      }
            end;
          end;
          {if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
            ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('b').Value := LID.Caption;
            ParamByName('c').Value := 'CR';
            ParamByName('d').Value := nogiro;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',tempogiro);
            ParamByName('f').Value := bankgiro;
            ParamByName('g').Value := noakungiro;
            ParamByName('h').Value := txtsebesar.Value;
            ParamByName('i').Value := 0;
            ParamByName('j').Value := 'in';
            ExecSQL;
          end else begin
            for i:=0 to dbgpembayaran.RowCount-1 do begin
              DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,0,dbgpembayaran.Cell[4,i].AsFloat);
              if dbgpembayaran.Cell[3,i].AsFloat>0 then begin
                DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),'Potongan Penjualan'+txtcustomer.Text,0,dbgpembayaran.Cell[3,i].AsFloat);
                DM.InsertBukuBesarAkun(dbgpembayaran.Cell[7,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),'Potongan Penjualan'+txtcustomer.Text,dbgpembayaran.Cell[3,i].AsFloat,0);
              end;
            end;
            if txtbiaya.Value > 0 then begin
              DM.InsertBukuBesarAkun(StrToInt(LPendapatanDenda.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,0,txtbiaya.Value);
            end;
            DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value,0);
          end;
          DM.InsertBukuBesarKontak(StrToInt(LCustomer.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value);  }
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'CR';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := 'CR';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'CR';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txtsebesar.Value));
              ExecSQL;
            end;
            dm.Q_NotaPembayaranPiutang.Close;
            DM.Q_NotaPembayaranPiutang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaPembayaranPiutang.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'CR';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PembayaranPiutang.ShowReport(True);
          end;
          ClearText;
          dbgpembayaran.AddRow();
          Free;
        end;
      except
        on E: Exception do begin
          dm.con.Rollback;
          MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
        end;
      end;
    end;
  end else begin
    {if cbgiro.Enabled = False then begin
      md := 'Transaksi ini tidak dapat dihapus/diedit karena giro telah cair!';
      MessageDlg(md,mtWarning,[mbOK],0);
      Free;
      exit;
    end;
    if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      with TZQuery.Create(Self) do begin
        Connection := DM.con;
        if cbgiro.Checked = True then begin
          Application.CreateForm(TFrm_TransaksiGiro, Frm_TransaksiGiro);
          Frm_TransaksiGiro.ClearText;
          if Frm_TransaksiGiro.ShowModal = mrok then begin
            pakaigiro := 1;
            tempogiro := Frm_TransaksiGiro.dtptanggal.Date;
            nogiro := Frm_TransaksiGiro.txtnomorgiro.Text;
            bankgiro := Frm_TransaksiGiro.txtbank.Text;
            noakungiro := StrToInt(Frm_TransaksiGiro.LAkunGiro.Caption);
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
        ParamByName('t').Value := 'CR';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CR';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CR';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'CR';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pembayaranpiutang set nokontak=:b,tglbayar=:c,total=:d,keterangan=:e,nokas=:f,giro=:i,totaldenda=:j,noakundenda=:k where nopembayaranpiutang=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := LCustomer.Caption;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('d').Value := txtsebesar.Value;
        ParamByName('e').Value := txtketerangan.Text;
        ParamByName('f').Value := LKas.Caption;
        ParamByName('i').Value := pakaigiro;
        ParamByName('j').Value := txtbiaya.Value;
        ParamByName('k').Value := LPendapatanDenda.Caption;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:np';
        ParamByName('np').Value := LID.Caption;
        ExecSQL;
        for i:=0 to dbgpembayaran.RowCount-1 do begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_pembayaranpiutangdetail values (:a,:b,:c,:d,:e,:f,:g)';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := dbgpembayaran.Cell[6,i].AsInteger;
          ParamByName('c').Value := dbgpembayaran.Cell[4,i].AsFloat;
          ParamByName('d').Value := dbgpembayaran.Cell[3,i].AsFloat;
          ParamByName('e').Value := dbgpembayaran.Cell[8,i].AsInteger;
          ParamByName('f').Value := dbgpembayaran.Cell[7,i].AsInteger;
          ParamByName('g').Value := dbgpembayaran.Cell[9,i].AsFloat;
          ExecSQL;
        end;
        if cbgiro.Checked = True then begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_giro values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
          ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('b').Value := LID.Caption;
          ParamByName('c').Value := 'CR';
          ParamByName('d').Value := nogiro;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',tempogiro);
          ParamByName('f').Value := bankgiro;
          ParamByName('g').Value := noakungiro;
          ParamByName('h').Value := txtsebesar.Value;
          ParamByName('i').Value := 0;
          ParamByName('j').Value := 'in';
          ExecSQL;
        end else begin
          for i:=0 to dbgpembayaran.RowCount-1 do begin
            DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,0,dbgpembayaran.Cell[4,i].AsFloat);
            if dbgpembayaran.Cell[3,i].AsFloat>0 then begin
              DM.InsertBukuBesarAkun(dbgpembayaran.Cell[8,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),'Potongan Penjualan'+txtcustomer.Text,0,dbgpembayaran.Cell[3,i].AsFloat);
              DM.InsertBukuBesarAkun(dbgpembayaran.Cell[7,i].AsInteger,dtptanggal.Date,'CR',StrToInt(LID.Caption),'Potongan Penjualan'+txtcustomer.Text,dbgpembayaran.Cell[3,i].AsFloat,0);
            end;
          end;
          if txtbiaya.Value > 0 then begin
            DM.InsertBukuBesarAkun(StrToInt(LPendapatanDenda.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,0,txtbiaya.Value);
          end;
          DM.InsertBukuBesarAkun(StrToInt(LKas.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value,0);
        end;
        DM.InsertBukuBesarKontak(StrToInt(LCustomer.Caption),dtptanggal.Date,'CR',StrToInt(LID.Caption),txtketerangan.Text,txtsebesar.Value);
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'CR';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CR';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'CR';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
            ExecSQL;
          end;
          dm.Q_NotaPembayaranPiutang.Close;
          DM.Q_NotaPembayaranPiutang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaPembayaranPiutang.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'CR';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PembayaranPiutang.ShowReport(True);
        end;
        ClearText;
        dbgpembayaran.AddRow();
        Free;
      end;
    end; }
  end;
end;

procedure TFrm_PembayaranPiutang.BtnBiayaClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_SetAkun, Frm_SetAkun);
  JudulAkun := 'Denda Keterlambatan';
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_akun where noakun=:na';
    ParamByName('na').Value := LPendapatanDenda.Caption;
    Open;
    if not IsEmpty then begin
      Frm_SetAkun.LNoAkun.Caption := FieldValues['noakun'];
    end else begin
      Frm_SetAkun.LNoAkun.Caption := '0';
    end;
    if Frm_SetAkun.ShowModal = mrok then begin
      LPendapatanDenda.Caption := Frm_SetAkun.LNoAkun.Caption;
    end;
    Free;
  end;
end;

function TFrm_PembayaranPiutang.CekTerm(ANoPenjualan: Integer): Double;
var
  diskonday,duedate: Double;
begin
  Result := 0;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_penjualaninvoice where nopenjualaninvoice=:np';
    ParamByName('np').Value := ANoPenjualan;
    Open;
    diskonday := FieldValues['diskonday'];
    duedate := FieldValues['duedate'];
    if FieldValues['tglpenjualaninvoice']+diskonday <= dtptanggal.Date then begin
      Result := 1;
    end else if FieldValues['tglpenjualaninvoice']+duedate > dtptanggal.Date then begin
      Result := -1;
    end else begin
      Result := 0;
    end;
    Free;
  end;
end;

function TFrm_PembayaranPiutang.GetEarlyDiskon(ANoPenjualan: Integer;
  ATotal: Double): Double;
var
  earlydiskon: Double;
begin
  if ANoPenjualan = 0 then begin
    Result := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_penjualaninvoice where nopenjualaninvoice=:np';
      ParamByName('np').Value := ANoPenjualan;
      Open;
      earlydiskon := FieldValues['earlydiskon'];
      Result := ATotal*earlydiskon/100;
      Free;
    end;
  end;
end;

function TFrm_PembayaranPiutang.GetLateCharge(ANoPenjualan: Integer;
  ATotal: Double): Double;
var
  latecharge: Double;
begin
  if ANoPenjualan = 0 then begin
    Result := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_penjualaninvoice where nopenjualaninvoice=:np';
      ParamByName('np').Value := ANoPenjualan;
      Open;
      latecharge := FieldValues['latecharge'];
      Result := ATotal*latecharge/100;
      Free;
    end;
  end;
end;

procedure TFrm_PembayaranPiutang.dbgpembayaranCellDblClick(Sender: TObject;
  ACol, ARow: Integer);
var
  i:Integer;
begin
  if ACol = 6 then begin
    Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
    akunkas := -1;
    noklas := 0;
    nosubklas := 0;
    Frm_DataAkun.RefreshQ;
    if Frm_DataAkun.ShowModal = mrok then begin
      i := dbgpembayaran.SelectedRow;
      dbgpembayaran.Cell[6,i].AsString := Frm_DataAkun.QData.FieldValues['namaakun'];
      dbgpembayaran.Cell[8,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
    end;
  end;
end;

procedure TFrm_PembayaranPiutang.dbgpembayaranKeyPress(Sender: TObject;
  var Key: Char);
var
  i:Integer;
begin
  if dbgpembayaran.SelectedCol = 6 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
      akunkas := -1;
      noklas := 0;
      nosubklas := 0;
      Frm_DataAkun.RefreshQ;
      if Frm_DataAkun.ShowModal = mrok then begin
        i := dbgpembayaran.SelectedRow;
        dbgpembayaran.Cell[6,i].AsString := Frm_DataAkun.QData.FieldValues['namaakun'];
        dbgpembayaran.Cell[8,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
      end;
    end;
  end;
end;

procedure TFrm_PembayaranPiutang.dtptanggalChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('CR',dtptanggal.Date);
end;

end.
