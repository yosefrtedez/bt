unit UPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzRadChk, RzButton, StdCtrls, Mask, RzBtnEdt, RzLabel,
  RzPanel, ExtCtrls, ImgList, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, frxClass, frxDBSet, NxEdit, ComCtrls, RzDTP,
  RzLine, RzCmboBx, cxPC, NxColumns6, NxGridView6, NxControls6,
  NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  TFrm_Pembelian = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    txtsupplier: TRzButtonEdit;
    RzLabel2: TRzLabel;
    txtreferensi: TRzEdit;
    RzLabel4: TRzLabel;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    Q1: TZQuery;
    LSupplier: TRzLabel;
    RzPanel4: TRzPanel;
    QKas: TZQuery;
    RzLabel18: TRzLabel;
    LID: TRzLabel;
    txtpo: TRzButtonEdit;
    LPO: TRzLabel;
    dtpfaktur: TNxDatePicker;
    RzLabel13: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel14: TRzLabel;
    LPosting: TRzLabel;
    txtqty: TRzNumericEdit;
    txtitem: TRzNumericEdit;
    RzPanel5: TRzPanel;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    NxNumberColumn615: TNxNumberColumn6;
    NxTextColumn65: TNxTextColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    NxNumberColumn618: TNxNumberColumn6;
    NxNumberColumn619: TNxNumberColumn6;
    NxNumberColumn616: TNxNumberColumn6;
    NxNumberColumn620: TNxNumberColumn6;
    NxNumberColumn621: TNxNumberColumn6;
    NxNumberColumn622: TNxNumberColumn6;
    NxNumberColumn623: TNxNumberColumn6;
    NxNumberColumn624: TNxNumberColumn6;
    procedure txtsupplierButtonClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtsupplierKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure txtpoButtonClick(Sender: TObject);
    procedure txtpoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpfakturChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
    function CekPO(ANoPO, ANoBarang, ANoSatuan:Integer):Double;
  end;

var
  Frm_Pembelian: TFrm_Pembelian;

implementation

uses UDM, NxCells, UMain, UDataKontak, UDataGudang, UDataPembelianOrder,
  NxIntf6;

{$R *.dfm}

procedure TFrm_Pembelian.txtsupplierButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    if LPO.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    ClearText;
    dbgbarang.AddRow();
    txtsupplier.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSupplier.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_Pembelian.ClearText;
begin
  LID.Caption := '0';
  txtsupplier.Clear;
  LSupplier.Caption := '0';
  txtpo.Clear;
  LPO.Caption := '0';
  dtpfaktur.Date := tanggalserver;
  dtpfaktur.ReadOnly := False;
  txtreferensi.Text := DM.GenerateKodeTransaksi('TO',dtpfaktur.Date);
  dbgbarang.ClearRows;
  LPosting.Caption := '0';
  UpdateTotal;
end;

procedure TFrm_Pembelian.UpdateTotal;
var
  dpp,ppn1,qty:Double;
  i:integer;
begin
  qty := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      qty := qty+Cell[3,i].AsFloat;
    end;
    txtqty.Value := qty;
    txtitem.Value := dbgbarang.RowCount;
  end;
end;

procedure TFrm_Pembelian.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_Pembelian.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  total:Double;
begin
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
  total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
  total := total-dbgbarang.Cell[7,ARow].AsFloat;
  dbgbarang.Cell[8,ARow].AsFloat := total;
  if dbgbarang.Cell[16,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
    dbgbarang.Cell[20,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[17,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[20,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[18,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[17,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[19,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[18,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[20,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[19,ARow].AsFloat;
    end;
  end;
  if dbgbarang.Cell[25,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[28,ARow].AsFloat := 0;
  end else begin
    dbgbarang.Cell[28,ARow].AsFloat := Int((dbgbarang.Cell[19,ARow].AsFloat*dbgbarang.Cell[26,ARow].AsFloat/100)*100)/100;
  end;
  UpdateTotal;
end;

procedure TFrm_Pembelian.BtnRekamClick(Sender: TObject);
var
  i,notransaksi,nokaskeluar,pakaigiro, jumlahbarang:Integer;
  kodekaskeluar,kethutang,nogiro, ketpurchase:string;
  tempogiro:TDate;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if txtsupplier.Text = '' then begin
    MessageDlg('Supplier : harus diisi terlebih dahulu !',mtError,[mbOK],0);
    txtsupplier.SetFocus;
    Exit;
  end;
  if LPO.Caption = '0' then begin
    MessageDlg('No. PO : belum dipilih !',mtError,[mbOK],0);
    txtpo.SetFocus;
    Exit;
  end;
  with dbgbarang do begin
    jumlahbarang := 0;
    for i:=0 to RowCount-1 do begin
      jumlahbarang := jumlahbarang+dbgbarang.Cell[3,i].AsInteger;
    end;
    if jumlahbarang <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      if dbgbarang.Cell[15,i].AsFloat = -1 then begin
        MessageDlg('Gudang untuk barang '+Cell[2,i].AsString+' belum dipilih!',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end;
  {if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtpfaktur.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;   }
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          notransaksi := DM.GenerateNoMaster('pembelianterima');
          txtreferensi.Text := DM.GenerateKodeTransaksi('TO',dtpfaktur.Date);
          ketpurchase := 'Penerimaan Barang, '+txtreferensi.Text;
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'TO';
          ParamByName('b').Value := dtpfaktur.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          SQL.Clear;
          // masuk ke tabel pembelian
          SQL.Text := 'insert into tbl_pembelianterima values (:a,:b,:c,:d,:e,:g)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := LSupplier.Caption;
          ParamByName('c').Value := LPO.Caption;
          ParamByName('d').Value := txtreferensi.Text;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('g').Value := Frm_Main.txtuser.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel pembelian detil
                SQL.Text := 'insert into tbl_pembelianterimadetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := Cell[11,i].AsInteger;
                ParamByName('c').Value := Cell[3,i].AsFloat;
                ParamByName('d').Value := Cell[5,i].AsFloat;
                ParamByName('e').Value := Cell[6,i].AsFloat;
                ParamByName('f').Value := Cell[7,i].AsFloat;
                ParamByName('g').Value := Cell[8,i].AsFloat;
                ParamByName('h').Value := Cell[15,i].AsInteger;
                ParamByName('i').Value := Cell[12,i].AsInteger;
                ParamByName('j').Value := Cell[13,i].AsFloat;
                ParamByName('k').Value := Cell[14,i].AsInteger;
                ParamByName('l').Value := Cell[19,i].AsFloat;
                ParamByName('m').Value := Cell[20,i].AsFloat;
                ParamByName('n').Value := Cell[16,i].AsInteger;
                ParamByName('o').Value := Cell[17,i].AsInteger;
                ParamByName('p').Value := Cell[18,i].AsFloat;
                ParamByName('q').Value := Cell[21,i].AsInteger;
                ParamByName('r').Value := Cell[22,i].AsInteger;
                ParamByName('s').Value := Cell[23,i].AsInteger;
                ParamByName('t').Value := Cell[24,i].AsInteger;
                ParamByName('u').Value := Cell[25,i].AsInteger;
                ParamByName('v').Value := Cell[26,i].AsFloat;
                ParamByName('w').Value := Cell[27,i].AsInteger;
                ParamByName('x').Value := Cell[28,i].AsFloat;
                ExecSQL;
                if Cell[22,i].AsInteger = 0 then begin
                  DM.HitungHPPAverage(Cell[11,i].AsInteger,Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat,Cell[19,i].AsFloat/(Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat));
                  Close;
                  SQL.Clear;
                  //masuk tabel buku besar barang
                  SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                  //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                  ParamByName('b').Value := Cell[11,i].AsInteger;
                  ParamByName('c').Value := 'TO';
                  ParamByName('d').Value := Cell[15,i].AsInteger;
                  ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                  ParamByName('f').Value := notransaksi;
                  ParamByName('g').Value := 'Penerimaan Pembelian, '+txtreferensi.Text;
                  ParamByName('h').Value := Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                  ParamByName('i').Value := Cell[19,i].AsFloat/(Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                  ExecSQL;
                end;
                DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'TO',notransaksi,ketpurchase,Cell[19,i].AsFloat,0);
                if Cell[20,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[24,i].AsInteger,dtpfaktur.Date,'TO',notransaksi,ketpurchase,Cell[20,i].AsFloat,0);
                DM.InsertBukuBesarAkun(Cell[23,i].AsInteger,dtpfaktur.Date,'TO',notransaksi,ketpurchase,0,(Cell[19,i].AsFloat+Cell[20,i].AsFloat)-Cell[28,i].AsFloat);
                if Cell[28,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[27,i].AsInteger,dtpfaktur.Date,'TO',notransaksi,ketpurchase,0,Cell[28,i].AsFloat);
              end;
            end;
          end;
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_NotaPembelianTO.Close;
            DM.Q_NotaPembelianTO.ParamByName('np').Value := notransaksi;
            DM.Q_NotaPembelianTO.Open;
            DM.Nota_PembelianTO.ShowReport(True);
          end;
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
      if LPosting.Caption = '1' then begin
        MessageDlg('Data tidak dapat diubah. Invoice telah dicetak !!',mtError,[mbOK],0);
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                    '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                    'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
        ParamByName('a').Value := LID.Caption;
        ParamByName('t').Value := 'TO';
        Open;
        First;
        for i:=0 to RecordCount-1 do begin
          if FieldValues['terjual']=0 then begin
            Next;
          end else begin
            MessageDlg('Data tidak dapat diubah, karena barang telah terpakai oleh transaksi lain'#10#13'Hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
            Free;
            Exit;
          end;
        end;
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            SQL.Clear;
            // update ke tabel pembelian terima
            SQL.Text := 'update tbl_pembelianterima set nokontak=:c,nopembelianorder=:d,tglpembelianterima=:e ' +
                        'where nopembelianterima=:a';
            ParamByName('a').Value := LID.Caption;
            ParamByName('c').Value := LSupplier.Caption;
            ParamByName('d').Value := LPO.Caption;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
            ExecSQL;
            //hapus detil pembelian
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_pembelianterimadetail where nopembelianterima=:np';
            ParamByName('np').Value := LID.Caption;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'TO';
            Open;
            for i:=0 to RecordCount-1 do begin
              DM.HitungHPPAverage1(FieldValues['nobarang'],FieldValues['masuk'],FieldValues['hpp']);
              Next;
            end;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'TO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'TO';
            ExecSQL;
            with dbgbarang do begin
              for i:=0 to RowCount-1 do begin
                if Cell[3,i].AsFloat > 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel pembelian detil
                  SQL.Text := 'insert into tbl_pembelianterimadetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := Cell[11,i].AsInteger;
                  ParamByName('c').Value := Cell[3,i].AsFloat;
                  ParamByName('d').Value := Cell[5,i].AsFloat;
                  ParamByName('e').Value := Cell[6,i].AsFloat;
                  ParamByName('f').Value := Cell[7,i].AsFloat;
                  ParamByName('g').Value := Cell[8,i].AsFloat;
                  ParamByName('h').Value := Cell[15,i].AsInteger;
                  ParamByName('i').Value := Cell[12,i].AsInteger;
                  ParamByName('j').Value := Cell[13,i].AsFloat;
                  ParamByName('k').Value := Cell[14,i].AsInteger;
                  ParamByName('l').Value := Cell[19,i].AsFloat;
                  ParamByName('m').Value := Cell[20,i].AsFloat;
                  ParamByName('n').Value := Cell[16,i].AsInteger;
                  ParamByName('o').Value := Cell[17,i].AsInteger;
                  ParamByName('p').Value := Cell[18,i].AsFloat;
                  ParamByName('q').Value := Cell[21,i].AsInteger;
                  ParamByName('r').Value := Cell[22,i].AsInteger;
                  ParamByName('s').Value := Cell[23,i].AsInteger;
                  ParamByName('t').Value := Cell[24,i].AsInteger;
                  ParamByName('u').Value := Cell[25,i].AsInteger;
                  ParamByName('v').Value := Cell[26,i].AsFloat;
                  ParamByName('w').Value := Cell[27,i].AsInteger;
                  ParamByName('x').Value := Cell[28,i].AsFloat;
                  ExecSQL;
                  if Cell[22,i].AsInteger = 0 then begin
                    DM.HitungHPPAverage(Cell[11,i].AsInteger,Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat,Cell[19,i].AsFloat/(Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat));
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[11,i].AsInteger;
                    ParamByName('c').Value := 'TO';
                    ParamByName('d').Value := Cell[15,i].AsInteger;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                    ParamByName('f').Value := LID.Caption;
                    ParamByName('g').Value := 'Penerimaan Pembelian, '+txtreferensi.Text;
                    ParamByName('h').Value := Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                    ParamByName('i').Value := Cell[19,i].AsFloat/(Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                    ExecSQL;
                  end;
                  DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'TO',StrToInt(LID.Caption),ketpurchase,Cell[19,i].AsFloat,0);
                  if Cell[20,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[24,i].AsInteger,dtpfaktur.Date,'TO',StrToInt(LID.Caption),ketpurchase,Cell[20,i].AsFloat,0);
                  DM.InsertBukuBesarAkun(Cell[23,i].AsInteger,dtpfaktur.Date,'TO',StrToInt(LID.Caption),ketpurchase,0,(Cell[19,i].AsFloat+Cell[20,i].AsFloat)-Cell[28,i].AsFloat);
                  if Cell[28,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[27,i].AsInteger,dtpfaktur.Date,'TO',StrToInt(LID.Caption),ketpurchase,0,Cell[28,i].AsFloat);
                end;
              end;
            end;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              dm.Q_NotaPembelianTO.Close;
              DM.Q_NotaPembelianTO.ParamByName('np').Value := LID.Caption;
              DM.Q_NotaPembelianTO.Open;
              DM.Nota_PembelianTO.ShowReport(True);
            end;
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

procedure TFrm_Pembelian.txtsupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsupplierButtonClick(nil);
end;

procedure TFrm_Pembelian.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 10 then begin
      if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
       Frm_DataGudang.RefreshQ;
      if Frm_DataGudang.ShowModal = mrok then begin
        dbgbarang.Cell[10,ARow].AsString := Frm_DataGudang.QData.FieldValues['kodegudang'];
        dbgbarang.Cell[15,ARow].AsInteger := Frm_DataGudang.QData.FieldValues['nogudang'];
      end;
  end;
end;

procedure TFrm_Pembelian.dbgbarangKeyPress(Sender: TObject; var Key: Char);
begin
  if dbgbarang.SelectedCol = 10 then begin
      if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
        if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
        Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
        Frm_DataGudang.RefreshQ;
        if Frm_DataGudang.ShowModal = mrok then begin
          dbgbarang.Cell[10,dbgbarang.SelectedRow].AsString := Frm_DataGudang.QData.FieldValues['kodegudang'];
          dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger := Frm_DataGudang.QData.FieldValues['nogudang'];
        end;
      end;
  end;

end;

function TFrm_Pembelian.CekPO(ANoPO, ANoBarang, ANoSatuan: Integer): Double;
var
  diterima,diorder: Double;
begin
  if ANoPO = 0 then begin
    Result := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select qty,nosatuan,nilai from tbl_pembelianorderdetail where nopembelianorder=:np and nobarang=:nb and nosatuan=:nu';
      ParamByName('np').Value := ANoPO;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := ANoSatuan;
      Open;
      if IsEmpty then
        diorder := 0
      else diorder := FieldValues['qty'];
      Close;
      SQL.Clear;
      SQL.Text := 'select ifnull(sum(b.qty),0)as qty from ' +
                  '(select b.nobarang, ifnull(b.qty,0)as qty, b.nosatuan from ' +
                  '(select nopembelianterima from tbl_pembelianterima where nopembelianorder=:np)as a ' +
                  'left join tbl_pembelianterimadetail as b on b.nopembelianterima=a.nopembelianterima)as b where b.nobarang=:nb and b.nosatuan=:nu';
      ParamByName('np').Value := ANoPO;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := ANoSatuan;
      Open;
      if IsEmpty then
        diterima := 0
      else diterima := FieldValues['qty'];

      Result := diorder-diterima;
      Free;
    end;
  end;
end;

procedure TFrm_Pembelian.txtpoButtonClick(Sender: TObject);
var
  i,nogud: Integer;
  namgud: string;
begin
  Application.CreateForm(TFrm_DataPembelianOrder, Frm_DataPembelianOrder);
  supplierorder := StrToInt(LSupplier.Caption);
  Frm_DataPembelianOrder.RefreshQ;
  if Frm_DataPembelianOrder.ShowModal = mrok then begin
    if Frm_DataPembelianOrder.QData.FieldValues['approve'] = 1 then begin
      if LPO.Caption = Frm_DataPembelianOrder.QData.FieldValues['nopembelianorder'] then begin
        Exit;
      end else begin
        if LPO.Caption <> '0' then begin
          if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
            Exit;
          end;
        end;
        txtpo.Text := Frm_DataPembelianOrder.QData.FieldValues['kodepembelianorder'];
        LPO.Caption := Frm_DataPembelianOrder.QData.FieldValues['nopembelianorder'];
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          {if DM.CekUserGudang(Frm_Main.txtuser.Caption)>0 then begin
            nogud := DM.CekUserGudang(Frm_Main.txtuser.Caption);
            Close;
            SQL.Clear;
            SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
            ParamByName('a').Value := nogud;
            Open;
            namgud := FieldValues['namagudang'];
          end else begin
            namgud := 'Gudang Utama';
            nogud := 0;
          end; }
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepph,'+QuotedStr('-')+')as kodepph,ifnull(b.akunpph,0)as akunpph from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak,ifnull(b.akunpajakpembelianblm,0)as akunpajakpembelianblm from ' +
                      '(select a.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang,b.noakunpersediaan,b.noakunhpp,b.tipebarang from ' +
                      '(select * from tbl_pembelianorderdetail where nopembelianorder=:ib) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                      'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_pajakpenghasilan as b on b.nopph=a.nopph';
          ParamByName('ib').Value := LPO.Caption;
          Open;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            First;
            for i:= 0 to RecordCount -1 do begin
              dbgbarang.AddRow();
              dbgbarang.Cell[0,i].AsString := FieldValues['kodebarang'];
              dbgbarang.Cell[1,i].AsString := FieldValues['namabarang'];
              dbgbarang.Cell[2,i].AsFloat := CekPO(StrToInt(LPO.Caption),FieldValues['nobarang'],FieldValues['nosatuan']);
              dbgbarang.Cell[3,i].AsFloat := CekPO(StrToInt(LPO.Caption),FieldValues['nobarang'],FieldValues['nosatuan']);
              dbgbarang.Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
              dbgbarang.Cell[5,i].AsFloat := FieldValues['harga'];
              dbgbarang.Cell[6,i].AsFloat := FieldValues['diskon1'];
              dbgbarang.Cell[7,i].AsFloat := FieldValues['diskon2'];
              dbgbarang.Cell[8,i].AsFloat := FieldValues['subtotal'];
              dbgbarang.Cell[9,i].AsString := FieldValues['kodepajak'];
              dbgbarang.Cell[10,i].AsString := '';
              dbgbarang.Cell[11,i].AsInteger := FieldValues['nobarang'];
              dbgbarang.Cell[12,i].AsInteger := FieldValues['nosatuan'];
              dbgbarang.Cell[13,i].AsFloat := FieldValues['nilai'];
              dbgbarang.Cell[14,i].AsInteger := FieldValues['noakunpersediaan'];
              dbgbarang.Cell[15,i].AsInteger := -1;
              dbgbarang.Cell[16,i].AsInteger := FieldValues['nopajak'];
              dbgbarang.Cell[17,i].AsInteger := FieldValues['tipepajak'];
              dbgbarang.Cell[18,i].AsFloat := FieldValues['persenpajak'];
              dbgbarang.Cell[19,i].AsFloat := FieldValues['dppbarang'];
              dbgbarang.Cell[20,i].AsFloat := FieldValues['ppnbarang'];
              dbgbarang.Cell[21,i].AsInteger := dm.CekAkunPajak(dbgbarang.Cell[16,i].AsInteger,'pembelian');
              dbgbarang.Cell[22,i].AsInteger := FieldValues['tipebarang'];
              dbgbarang.Cell[23,i].AsInteger := hutangbelum;
              dbgbarang.Cell[24,i].AsInteger := FieldValues['akunpajakpembelianblm'];
              dbgbarang.Cell[25,i].AsInteger := FieldValues['nopph'];
              dbgbarang.Cell[26,i].AsFloat := FieldValues['persenpph'];
              dbgbarang.Cell[27,i].AsInteger := FieldValues['akunpph'];
              dbgbarang.Cell[28,i].AsFloat := FieldValues['pphbarang'];
              Next;
            end;
            UpdateTotal;
          end;
          Free;
        end;
      end;
    end else begin
      MessageDlg('PO belum disetujui !!',mtError,[mbOK],0);
    end;
  end;
end;

procedure TFrm_Pembelian.txtpoKeyPress(Sender: TObject; var Key: Char);
begin
  txtpoButtonClick(nil);
end;

procedure TFrm_Pembelian.dtpfakturChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('TO',dtpfaktur.Date);
end;

end.
