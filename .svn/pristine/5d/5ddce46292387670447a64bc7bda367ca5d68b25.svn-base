unit UPenyesuaianBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ImgList, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, RzButton,
  RzRadChk, StdCtrls, Mask, RzEdit, RzLabel, RzPanel, ExtCtrls, RzBtnEdt, cxPC,
  NxEdit, NxColumns6, NxGridView6, NxControls6, NxCustomGrid6,
  NxVirtualGrid6, NxGrid6;

type
  TFrm_PenyesuaianBarang = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    txtref: TRzEdit;
    txtketerangan: TRzEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    Q1: TZQuery;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel17: TRzLabel;
    RzPanel4: TRzPanel;
    LMessage: TRzLabel;
    BtnCari: TRzBitBtn;
    LID: TRzLabel;
    BtnAkun: TRzBitBtn;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    txtgudangdari: TRzButtonEdit;
    txtgudangke: TRzButtonEdit;
    RzLabel8: TRzLabel;
    LGudangDari: TRzLabel;
    LGudangKe: TRzLabel;
    dtptanggal: TNxDatePicker;
    dbgbarang: TNextGrid6;
    NxReportGridView62: TNxReportGridView6;
    NxTextColumn62: TNxTextColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn619: TNxNumberColumn6;
    NxNumberColumn620: TNxNumberColumn6;
    NxNumberColumn621: TNxNumberColumn6;
    NxNumberColumn622: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxIconColumn61: TNxIconColumn6;
    NxTextColumn61: TNxTextColumn6;
    cbapprove: TRzCheckBox;
    procedure BtnCariClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangExit(Sender: TObject);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAkunClick(Sender: TObject);
    procedure txtgudangdariButtonClick(Sender: TObject);
    procedure txtgudangdariKeyPress(Sender: TObject; var Key: Char);
    procedure txtgudangkeButtonClick(Sender: TObject);
    procedure txtgudangkeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure dbgbarangSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dtptanggalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_PenyesuaianBarang: TFrm_PenyesuaianBarang;
  tipe:Integer;

implementation

uses UDM, UMain, NxCells, UDataBarang, UDataAkun, UDataGudang, UDataSatuan;


{$R *.dfm}

procedure TFrm_PenyesuaianBarang.BtnCariClick(Sender: TObject);
var
  i,j:Integer;
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := StrToInt(LGudangDari.Caption);
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_barang where nobarang=:ib';
      ParamByName('ib').Value := Frm_DataBarang.QData.FieldValues['nobarang'];
      Open;
      if FieldValues['tipebarang']=0 then begin
        i := dbgbarang.RowCount;
        for j:=0 to i-1 do begin
          if dbgbarang.Cell[6,j].AsInteger = Frm_DataBarang.QData.FieldValues['nobarang'] then begin
            MessageDlg('Barang telah diinputkan ditransaksi!',mtError,[mbOK],0);
            Exit;
          end;
        end;
        i := dbgbarang.SelectedRow;
        dbgbarang.Cell[0,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
        dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
        dbgbarang.Cell[2,i].AsFloat := 1;
        dbgbarang.Cell[3,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
        dbgbarang.Cell[6,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
        dbgbarang.Cell[7,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[8,i].AsFloat := Frm_DataBarang.QData.FieldValues['faktor'];
        dbgbarang.Cell[9,i].AsInteger := FieldValues['noakunpersediaan'];
        dbgbarang.SelectCell(2,i);
      end else begin
        MessageDlg('Barang tsb bukan merupakan barang yang memiliki stok!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end;
end;

procedure TFrm_PenyesuaianBarang.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  if ACol = 2 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[2,ARow].AsFloat := 0;
      Exit;
    end;
    if tipe = 2 then begin
      if dbgbarang.Cell[2,ARow].AsFloat < 0 then begin
        dbgbarang.Cell[2,ARow].AsFloat := 1;
      end;
    end;
  end;
end;

procedure TFrm_PenyesuaianBarang.BtnBatalClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PenyesuaianBarang.ClearText;
begin
  dtptanggal.Date := tanggalserver;
  txtref.Text := DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
  dtptanggal.ReadOnly := False;
  dbgbarang.ClearRows;
  LID.Caption := '0';
  txtgudangdari.Text := 'Gudang Utama';
  LGudangDari.Caption := '0';
  txtgudangke.Text := 'Gudang Utama';
  LGudangKe.Caption := '0';
  //if DM.CekUserGudang(Frm_Main.txtuser.Caption)= -1 then begin
    txtgudangdari.ReadOnly := False;
  {end else begin
    txtgudangdari.ReadOnly := True;
    LGudangDari.Caption := IntToStr(DM.CekUserGudang(Frm_Main.txtuser.Caption));
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
      ParamByName('a').Value := LGudangDari.Caption;
      Open;
      txtgudangdari.Text := FieldValues['namagudang'];
      Free;
    end;
  end;  }
  cbapprove.Checked := False;
  if tipe = 1 then begin
    RzGroupBox1.Caption := 'Penyesuaian Persediaan';
    txtketerangan.Text := 'Penyesuaian Persediaan';
    LMessage.Caption := 'Perhatian : Jumlah Barang harus NEGATIF jika dikeluarkan';
    NxTextColumn61.Visible := True;
    txtgudangke.ReadOnly := True;
  end else if tipe = 2 then begin
    RzGroupBox1.Caption := 'Pengiriman Barang antar Gudang';
    txtketerangan.Text := 'Pengiriman Barang antar Gudang';
    LMessage.Caption := 'Perhatian : Jumlah Barang harus POSITIF untuk pengiriman antar gudang';
    NxTextColumn61.Visible := False;
    txtgudangke.ReadOnly := False;
  end else if tipe = 3 then begin
    RzGroupBox1.Caption := 'Stock Opname';
    txtketerangan.Text := 'Stock Opname';
    LMessage.Caption := 'Perhatian : Jumlah Barang harus NEGATIF jika dikeluarkan';
    NxTextColumn61.Visible := True;
    txtgudangke.ReadOnly := True;
  end;
end;

procedure TFrm_PenyesuaianBarang.BtnRekamClick(Sender: TObject);
var
  i,j,nopenyesuaian:Integer;
  hpp,jumlahqty : Double;
begin
  if dbgbarang.RowCount <=1  then begin
    if dbgbarang.RowCount =1 then begin
      if dbgbarang.Cell[0,0].AsString = '' then begin
        MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
        Exit;
      end;
    end else begin
      MessageDlg('Tidak ada transaksi',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      if dbgbarang.Cell[2,i].AsFloat = 0 then begin
        MessageDlg('Jumlah barang '+Cell[1,i].AsString+' tidak boleh nol',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end;
  if (tipe=1) or (tipe=3) then begin
    with dbgbarang do begin
      for i:=0 to RowCount-1 do begin
        if Cell[6,i].AsInteger <> 0 then begin
          if Cell[10,i].AsInteger = 0 then begin
            MessageDlg('Kode Akun harus diisi dengan benar !, '+Cell[1,i].AsString,mtError,[mbOK],0);
            Exit;
          end;
        end;
      end;
    end;
  end;
  {if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtptanggal.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;     }
  with dbgbarang do begin
    jumlahqty:=0;
    for i:=0 to RowCount-1 do begin
      if Cell[6,i].AsInteger <> 0 then begin
        if (Cell[2,i].AsFloat < 0) or (tipe = 2) then begin
          jumlahqty := Abs(Cell[2,i].AsFloat)*Cell[8,i].AsFloat;
          for j:=0 to RowCount-1 do begin
            if i <> j then begin
              if Cell[6,i].AsInteger = Cell[6,j].AsInteger then begin
                jumlahqty := jumlahqty+(Abs(Cell[2,j].AsFloat)*Cell[8,j].AsFloat);
              end;
            end;
          end;
          if LID.Caption = '0' then begin
            if DM.CekStok(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),jumlahqty)=False then begin
              MessageDlg('Jumlah stok barang kurang!, '+Cell[1,i].AsString,mtError,[mbOK],0);
              Exit;
            end;
          end else begin
            if DM.CekStok1(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),StrToInt(LID.Caption),'IJ',jumlahqty)=False then begin
              MessageDlg('Jumlah stok barang kurang!, '+Cell[1,i].AsString,mtError,[mbOK],0);
              Exit;
            end;
          end;
        end;
      end;
    end;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          txtref.Text := DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
          nopenyesuaian := DM.GenerateNoMaster('penyesuaian');
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'IJ';
          ParamByName('b').Value := dtptanggal.Date;
          ParamByName('c').Value := txtref.Text;
          ExecSQL;
          Close;
          // masuk ke tabel penyesuaian
          SQL.Clear;
          SQL.Text := 'insert into tbl_penyesuaian values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
          ParamByName('a').Value := nopenyesuaian;
          ParamByName('b').Value := txtref.Text;
          ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('d').Value := txtketerangan.Text;
          ParamByName('e').Value := LGudangDari.Caption;
          ParamByName('f').Value := LGudangKe.Caption;
          ParamByName('g').Value := tipe;
          ParamByName('h').Value := Frm_Main.txtuser.Caption;
          ParamByName('i').Value := 0;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[6,i].AsInteger > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel detil penyesuaian
                SQL.Text := 'insert into tbl_penyesuaiandetail values(:a,:b,:c,:d,:e,:f,:g)';
                ParamByName('a').Value := nopenyesuaian;
                ParamByName('b').Value := Cell[6,i].AsInteger;
                ParamByName('c').Value := Cell[2,i].AsFloat;
                ParamByName('d').Value := Cell[7,i].AsInteger;
                ParamByName('e').Value := Cell[8,i].AsFloat;
                ParamByName('f').Value := Cell[9,i].AsInteger;
                ParamByName('g').Value := Cell[10,i].AsInteger;
                ExecSQL;
                {if (tipe = 1) or (tipe = 3) then begin
                  if Cell[2,i].AsFloat > 0 then begin
                    hpp := DM.HargaBeli(Cell[6,i].AsInteger);
                    DM.HitungHPPAverage(Cell[6,i].AsInteger,Cell[2,i].AsFloat*Cell[8,i].AsFloat,hpp);
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[6,i].AsInteger;
                    ParamByName('c').Value := 'IJ';
                    ParamByName('d').Value := LGudangDari.Caption;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                    ParamByName('f').Value := nopenyesuaian;
                    ParamByName('g').Value := txtketerangan.Text;
                    ParamByName('h').Value := Cell[2,i].AsFloat*Cell[8,i].AsFloat;
                    ParamByName('i').Value := hpp;
                    ExecSQL;

                    hpp := hpp*Cell[2,i].AsFloat*Cell[8,i].AsFloat;
                    DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,dtptanggal.Date,'IJ',nopenyesuaian,txtketerangan.Text,hpp,0);
                    DM.InsertBukuBesarAkun(Cell[10,i].AsInteger,dtptanggal.Date,'IJ',nopenyesuaian,txtketerangan.Text,0,hpp);
                  end else if Cell[2,i].AsFloat < 0 then begin
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[6,i].AsInteger;
                    ParamByName('c').Value := 'IJ';
                    ParamByName('d').Value := LGudangDari.Caption;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                    ParamByName('f').Value := nopenyesuaian;
                    ParamByName('g').Value := txtketerangan.Text;
                    ParamByName('h').Value := Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                    hpp := DM.HitungHPPPenjualan(Cell[6,i].AsInteger,Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat));
                    ParamByName('i').Value := hpp;
                    ParamByName('j').Value := 0;
                    ExecSQL;

                    //masuk buku besar barang detail
                    dm.AmbilNoBuku(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat),nopenyesuaian,'IJ');

                    hpp := hpp*Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                    DM.InsertBukuBesarAkun(Cell[10,i].AsInteger,dtptanggal.Date,'IJ',nopenyesuaian,txtketerangan.Text,hpp,0);
                    DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,dtptanggal.Date,'IJ',nopenyesuaian,txtketerangan.Text,0,hpp);
                  end;
                end else begin
                  hpp := DM.HitungHPPPenjualan(Cell[6,i].AsInteger,Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat));
                  Close;
                  SQL.Clear;
                  //masuk tabel buku besar barang
                  SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                  //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                  ParamByName('b').Value := Cell[6,i].AsInteger;
                  ParamByName('c').Value := 'IJ';
                  ParamByName('d').Value := LGudangDari.Caption;
                  ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                  ParamByName('f').Value := nopenyesuaian;
                  ParamByName('g').Value := txtketerangan.Text;
                  ParamByName('h').Value := Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                  ParamByName('i').Value := hpp;
                  ParamByName('j').Value := 0;
                  ExecSQL;
                  //masuk buku besar barang detail
                  dm.AmbilNoBuku(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat),nopenyesuaian,'IJ');
                end; }
              end;
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        ClearText;
        dbgbarang.AddRow();
      end;
    end else begin
      {Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
      ParamByName('a').Value := LID.Caption;
      ParamByName('t').Value := 'IJ';
      Open;
      for i:=0 to RecordCount-1 do begin
        if FieldValues['terjual']=0 then begin
          Next;
        end else begin
          MessageDlg('Transaksi tidak dapat diubah, karena barang telah terpakai oleh transaksi lain'#10#13'Hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
          Free;
          Exit;
        end;
      end;     }
      if cbapprove.Checked = False then begin
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          {if tipe <> 2 then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'IJ';
            Open;
            for i:=0 to RecordCount-1 do begin
              if FieldValues['masuk'] > 0 then begin
                DM.HitungHPPAverage1(FieldValues['nobarang'],FieldValues['masuk'],FieldValues['hpp']);
                Next;
              end;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'IJ';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'IJ';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'IJ';
          ExecSQL;}
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            // masuk ke tabel penyesuaian
            SQL.Clear;
            SQL.Text := 'update tbl_penyesuaian set tgltransaksi=:b,keterangan=:c,nogudangdari=:d,nogudangke=:e where nopenyesuaian=:a';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('c').Value := txtketerangan.Text;
            ParamByName('d').Value := LGudangDari.Caption;
            ParamByName('e').Value := LGudangKe.Caption;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_penyesuaiandetail where nopenyesuaian=:a';
            ParamByName('a').Value := LID.Caption;
            ExecSQL;
            with dbgbarang do begin
              for i:=0 to RowCount-1 do begin
                if Cell[6,i].AsInteger > 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel detil penyesuaian
                  SQL.Text := 'insert into tbl_penyesuaiandetail values(:a,:b,:c,:d,:e,:f,:g)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := Cell[6,i].AsInteger;
                  ParamByName('c').Value := Cell[2,i].AsFloat;
                  ParamByName('d').Value := Cell[7,i].AsInteger;
                  ParamByName('e').Value := Cell[8,i].AsFloat;
                  ParamByName('f').Value := Cell[9,i].AsInteger;
                  ParamByName('g').Value := Cell[10,i].AsInteger;
                  ExecSQL;
                  {if (tipe = 1) or (tipe = 3) then begin
                    if Cell[2,i].AsFloat > 0 then begin
                      hpp := DM.HargaBeli(Cell[6,i].AsInteger);
                      DM.HitungHPPAverage(Cell[6,i].AsInteger,Cell[2,i].AsFloat*Cell[8,i].AsFloat,hpp);
                      Close;
                      SQL.Clear;
                      //masuk tabel buku besar barang
                      SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                      //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                      ParamByName('b').Value := Cell[6,i].AsInteger;
                      ParamByName('c').Value := 'IJ';
                      ParamByName('d').Value := LGudangDari.Caption;
                      ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                      ParamByName('f').Value := LID.Caption;
                      ParamByName('g').Value := txtketerangan.Text;
                      ParamByName('h').Value := Cell[2,i].AsFloat*Cell[8,i].AsFloat;
                      ParamByName('i').Value := hpp;
                      ExecSQL;

                      hpp := hpp*Cell[2,i].AsFloat*Cell[8,i].AsFloat;
                      DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,dtptanggal.Date,'IJ',StrToInt(LID.Caption),txtketerangan.Text,hpp,0);
                      DM.InsertBukuBesarAkun(Cell[10,i].AsInteger,dtptanggal.Date,'IJ',StrToInt(LID.Caption),txtketerangan.Text,0,hpp);
                    end else if Cell[2,i].AsFloat < 0 then begin
                      Close;
                      SQL.Clear;
                      //masuk tabel buku besar barang
                      SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                      //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                      ParamByName('b').Value := Cell[6,i].AsInteger;
                      ParamByName('c').Value := 'IJ';
                      ParamByName('d').Value := LGudangDari.Caption;
                      ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                      ParamByName('f').Value := LID.Caption;
                      ParamByName('g').Value := txtketerangan.Text;
                      ParamByName('h').Value := Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                      hpp := DM.HitungHPPPenjualan(Cell[6,i].AsInteger,Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat));
                      ParamByName('i').Value := hpp;
                      ParamByName('j').Value := 0;
                      ExecSQL;

                      //masuk buku besar barang detail
                      dm.AmbilNoBuku(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat),StrToInt(LID.Caption),'IJ');

                      hpp := hpp*Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                      DM.InsertBukuBesarAkun(Cell[10,i].AsInteger,dtptanggal.Date,'IJ',StrToInt(LID.Caption),txtketerangan.Text,hpp,0);
                      DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,dtptanggal.Date,'IJ',StrToInt(LID.Caption),txtketerangan.Text,0,hpp);
                    end;
                  end else begin
                    hpp := DM.HitungHPPPenjualan(Cell[6,i].AsInteger,Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat));
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[6,i].AsInteger;
                    ParamByName('c').Value := 'IJ';
                    ParamByName('d').Value := LGudangDari.Caption;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                    ParamByName('f').Value := LID.Caption;
                    ParamByName('g').Value := txtketerangan.Text;
                    ParamByName('h').Value := Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat);
                    ParamByName('i').Value := hpp;
                    ParamByName('j').Value := 0;
                    ExecSQL;
                    //masuk buku besar barang detail
                    dm.AmbilNoBuku(Cell[6,i].AsInteger,StrToInt(LGudangDari.Caption),Abs(Cell[2,i].AsFloat*Cell[8,i].AsFloat),StrToInt(LID.Caption),'IJ');
                  end; }
                end;
              end;
            end;
            DM.con.Commit;
            Screen.Cursor := crDefault;
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
          ClearText;
          dbgbarang.AddRow();
        end;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_PenyesuaianBarang.dbgbarangCellDblClick(Sender: TObject;
  ACol, ARow: Integer);
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil);
  end;
  if ACol = 3 then begin
    if dbgbarang.Cell[6,ARow].AsInteger = 0 then Exit;
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := dbgbarang.Cell[6,ARow].AsInteger;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      dbgbarang.Cell[3,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
      dbgbarang.Cell[7,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[8,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
    end;
  end;
  if ACol = 4 then begin
    BtnAkunClick(nil);
  end;
end;

procedure TFrm_PenyesuaianBarang.dbgbarangExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgbarang.RowCount-1 do begin
    if dbgbarang.Cell[7,i].AsInteger = 0 then begin
      dbgbarang.DeleteRow(i);
      if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    end;
  end;
end;

procedure TFrm_PenyesuaianBarang.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
begin
  if dbgbarang.SelectedCol = 0 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
  if dbgbarang.SelectedCol = 3 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[6,dbgbarang.SelectedRow].AsInteger = 0 then Exit;
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[6,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        dbgbarang.Cell[3,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
        dbgbarang.Cell[7,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 4 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnAkunClick(nil);
    end;
  end;
end;

procedure TFrm_PenyesuaianBarang.BtnAkunClick(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    if DM.CekAkunPentingTerpakai(Frm_DataAkun.QData.FieldValues['noakun']) = False then begin
      MessageDlg('Anda tidak dibolehkan menggunakan rekening ini karena telah digunakan oleh Akun Default di Menu > Setting > Akun Default.',mtError,[mbOK],0);
      Exit;
    end;
    i := dbgbarang.SelectedRow;
    dbgbarang.Cell[4,i].AsString := Frm_DataAkun.QData.FieldValues['kodeakun'];
    dbgbarang.Cell[10,i].AsInteger := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_PenyesuaianBarang.txtgudangdariButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudangdari.Text := Frm_DataGudang.QData.FieldValues['kodegudang'];
    LGudangDari.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFrm_PenyesuaianBarang.txtgudangdariKeyPress(Sender: TObject;
  var Key: Char);
begin
  if txtgudangdari.ReadOnly = False then txtgudangdariButtonClick(nil);
end;

procedure TFrm_PenyesuaianBarang.txtgudangkeButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudangke.Text := Frm_DataGudang.QData.FieldValues['kodegudang'];
    LGudangKe.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFrm_PenyesuaianBarang.txtgudangkeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if txtgudangke.ReadOnly = False then txtgudangkeButtonClick(nil);
end;

procedure TFrm_PenyesuaianBarang.dbgbarangCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 5 then begin
    dbgbarang.DeleteRow(ARow);
    if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
  end;
end;

procedure TFrm_PenyesuaianBarang.dbgbarangSelectionChanged(Sender: TObject;
  ACol, ARow: Integer);
var
  i: Integer;
begin
  if ACol = 5 then begin
    if dbgbarang.Cell[6,ARow].AsInteger > 0 then begin
      if ARow = dbgbarang.RowCount-1 then begin
        dbgbarang.AddRow();
        i:=dbgbarang.RowCount;
        dbgbarang.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_PenyesuaianBarang.dtptanggalChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtref.Text := DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
end;

end.
