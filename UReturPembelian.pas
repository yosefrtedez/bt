unit UReturPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzRadChk, RzButton, NxEdit, RzEdit, StdCtrls,
  RzCmboBx, Mask, RzBtnEdt, RzLabel, RzPanel, ExtCtrls, cxPC, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6, frxClass;

type
  TFrm_ReturPembelian = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LSupplier: TRzLabel;
    LID: TRzLabel;
    txtsupplier: TRzButtonEdit;
    txtreferensi: TRzEdit;
    dtpfaktur: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    LHutang: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel14: TRzLabel;
    txttotal: TRzNumericEdit;
    txtpajak: TRzNumericEdit;
    txtsubtotal: TRzNumericEdit;
    Q1: TZQuery;
    QKas: TZQuery;
    RzLabel3: TRzLabel;
    txtpembelian: TRzButtonEdit;
    LNoPembelian: TRzLabel;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxTextColumn65: TNxTextColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    NxNumberColumn618: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    NxNumberColumn615: TNxNumberColumn6;
    NxIconColumn61: TNxIconColumn6;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    NxNumberColumn61: TNxNumberColumn6;
    RzLabel5: TRzLabel;
    txtketerangan: TRzMemo;
    procedure BtnCariClick(Sender: TObject);
    procedure txtsupplierButtonClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure txtsupplierKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangExit(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtpembelianButtonClick(Sender: TObject);
    procedure txtpembelianKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure dbgbarangSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dtpfakturChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_ReturPembelian: TFrm_ReturPembelian;

implementation

uses UDM, NxCells, UMain, UDataBarang, UDataKontak, UDataSatuan, UDataGudang, UDataPajak, UDataInvoice;


{$R *.dfm}

{ TFrm_ReturPembelian }

procedure TFrm_ReturPembelian.ClearText;
begin
  LID.Caption := '0';
  txtsupplier.Clear;
  LSupplier.Caption := '0';
  dtpfaktur.ReadOnly := False;
  dtpfaktur.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('PR',dtpfaktur.Date);
  dbgbarang.ClearRows;
  LHutang.Caption := '0';
  txtpembelian.Clear;
  LNoPembelian.Caption;
  UpdateTotal;
  txtketerangan.Clear;
end;

procedure TFrm_ReturPembelian.UpdateTotal;
var
  dpp,ppn1:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp:=dpp+Cell[19,i].AsFloat;
      ppn1 := ppn1+Cell[20,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtpajak.Value := ppn1;
    txttotal.Value := txtsubtotal.Value+txtpajak.Value;
  end;
end;

procedure TFrm_ReturPembelian.BtnCariClick(Sender: TObject);
var
  i,nogud:Integer;
  total:Double;
  namgud: string;
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := -1;
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    if txtsupplier.Text = '' then begin
      MessageDlg('Supplier : harus diisi !',mtError,[mbOK],0);
      txtsupplier.SetFocus;
      Exit;
    end;
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
      end;  }
      i := dbgbarang.SelectedRow;
      dbgbarang.Cell[0,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
      dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
      dbgbarang.Cell[2,i].AsFloat := 1;
      dbgbarang.Cell[3,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
      dbgbarang.Cell[4,i].AsFloat := dm.CekHargaBeli(Frm_DataBarang.QData.FieldValues['nobarang']);
      total := dbgbarang.Cell[2,i].AsFloat*dbgbarang.Cell[4,i].AsFloat;
      dbgbarang.Cell[5,i].AsFloat := 0;
      total := total-((total*dbgbarang.Cell[5,i].AsFloat)/100);
      dbgbarang.Cell[6,i].AsFloat := 0;
      total := total-dbgbarang.Cell[6,i].AsFloat;
      dbgbarang.Cell[7,i].AsFloat := total;
      dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
      dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_barang where nobarang=:ib';
      ParamByName('ib').Value := dbgbarang.Cell[11,i].AsInteger;
      Open;
      dbgbarang.Cell[14,i].AsInteger := FieldValues['noakunpersediaan'];
      dbgbarang.Cell[15,i].AsInteger := -1;
      dbgbarang.Cell[22,i].AsInteger := FieldValues['tipebarang'];
      dbgbarang.Cell[9,i].AsString := '';
      dbgbarang.Cell[16,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'pembelian');
      dbgbarang.Cell[8,i].AsString := dm.CekKodePajak(dbgbarang.Cell[16,i].AsInteger);
      dbgbarang.Cell[17,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[16,i].AsInteger);
      dbgbarang.Cell[18,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[16,i].AsInteger);
      dbgbarang.Cell[21,i].AsInteger := dm.CekAkunPajak(dbgbarang.Cell[16,i].AsInteger,'pembelian');
      if dbgbarang.Cell[16,i].AsInteger = 0 then begin
        dbgbarang.Cell[19,i].AsFloat := dbgbarang.Cell[7,i].AsFloat;
        dbgbarang.Cell[20,i].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[17,i].AsInteger = 0 then begin
          dbgbarang.Cell[19,i].AsFloat := dbgbarang.Cell[7,i].AsFloat;
          dbgbarang.Cell[20,i].AsFloat := Int((dbgbarang.Cell[7,i].AsFloat*dbgbarang.Cell[18,i].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[17,i].AsInteger = 1 then begin
          dbgbarang.Cell[19,i].AsFloat := Int((dbgbarang.Cell[7,i].AsFloat/(1+(dbgbarang.Cell[18,i].AsFloat/100)))*100)/100;
          dbgbarang.Cell[20,i].AsFloat := dbgbarang.Cell[7,i].AsFloat-dbgbarang.Cell[19,i].AsFloat;
        end;
      end;
      UpdateTotal;
      Free;
      dbgbarang.SelectCell(2,i);
    end;
  end;
end;

procedure TFrm_ReturPembelian.txtsupplierButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtsupplier.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSupplier.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    LHutang.Caption := Frm_DataKontak.QData.FieldValues['noakun'];
    txtpembelian.Clear;
    LNoPembelian.Caption := '0';
  end;
end;

procedure TFrm_ReturPembelian.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_ReturPembelian.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  total:Double;
begin
  if ACol = 2 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[2,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 4 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[4,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 5 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[5,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 6 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[6,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  total := dbgbarang.Cell[2,ARow].AsFloat*dbgbarang.Cell[4,ARow].AsFloat;
  total := total-((total*dbgbarang.Cell[5,ARow].AsFloat)/100);
  total := total-dbgbarang.Cell[6,ARow].AsFloat;
  dbgbarang.Cell[7,ARow].AsFloat := total;
  if dbgbarang.Cell[16,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
    dbgbarang.Cell[20,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[17,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
      dbgbarang.Cell[20,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat*dbgbarang.Cell[18,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[17,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[19,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat/(1+(dbgbarang.Cell[18,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[20,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat-dbgbarang.Cell[19,ARow].AsFloat;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_ReturPembelian.txtsupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsupplierButtonClick(nil);
end;

procedure TFrm_ReturPembelian.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  total,harga:Double;
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil);
  end;
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    if dbgbarang.Cell[23,ARow].AsInteger = 0 then begin
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[11,ARow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      harga := dbgbarang.Cell[4,ARow].AsFloat/dbgbarang.Cell[13,ARow].AsFloat;
      dbgbarang.Cell[3,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
      dbgbarang.Cell[12,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[13,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      dbgbarang.Cell[4,ARow].AsFloat := harga*dbgbarang.Cell[13,ARow].AsFloat;
      total := dbgbarang.Cell[2,ARow].AsFloat*dbgbarang.Cell[4,ARow].AsFloat;
      total := total-((total*dbgbarang.Cell[5,ARow].AsFloat)/100);
      total := total-dbgbarang.Cell[6,ARow].AsFloat;
      dbgbarang.Cell[7,ARow].AsFloat := total;
      if dbgbarang.Cell[16,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
        dbgbarang.Cell[20,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[17,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
          dbgbarang.Cell[20,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat*dbgbarang.Cell[18,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[17,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[19,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat/(1+(dbgbarang.Cell[18,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[20,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat-dbgbarang.Cell[19,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
  if ACol = 9 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
     Frm_DataGudang.RefreshQ;
    if Frm_DataGudang.ShowModal = mrok then begin
      dbgbarang.Cell[9,ARow].AsString := Frm_DataGudang.QData.FieldValues['kodegudang'];
      dbgbarang.Cell[15,ARow].AsInteger := Frm_DataGudang.QData.FieldValues['nogudang'];
    end;
  end;
end;

procedure TFrm_ReturPembelian.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
var
  harga,total :Double;
begin
  if (dbgbarang.SelectedCol = 0) or (dbgbarang.SelectedCol = 1) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
  if dbgbarang.SelectedCol = 3 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[11,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        harga := dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat/dbgbarang.Cell[13,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[3,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
        dbgbarang.Cell[12,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[13,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
        dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat := harga*dbgbarang.Cell[13,dbgbarang.SelectedRow].AsFloat;
        total := dbgbarang.Cell[2,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat;
        total := total-((total*dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat)/100);
        total := total-dbgbarang.Cell[6,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat := total;
        if dbgbarang.Cell[16,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[19,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[20,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[17,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[19,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[20,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[17,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[19,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[20,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[19,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 10 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
      Frm_DataGudang.RefreshQ;
      if Frm_DataGudang.ShowModal = mrok then begin
        dbgbarang.Cell[9,dbgbarang.SelectedRow].AsString := Frm_DataGudang.QData.FieldValues['kodegudang'];
        dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger := Frm_DataGudang.QData.FieldValues['nogudang'];
      end;
    end;
  end;

end;

procedure TFrm_ReturPembelian.dbgbarangExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to dbgbarang.RowCount-1 do begin
    if dbgbarang.Cell[0,i].AsString = '' then begin
      dbgbarang.DeleteRow(i);
      if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    end;
  end;
end;

procedure TFrm_ReturPembelian.BtnRekamClick(Sender: TObject);
var
  i,j,notransaksi:Integer;
  ketretur:string;
  hpp,jumlahqty: Double;
  t:TfrxMemoView;
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
  if LNoPembelian.Caption = '0' then begin
    MessageDlg('No. Invoice : harus diisi terlebih dahulu !',mtError,[mbOK],0);
    txtpembelian.SetFocus;
    Exit
  end;
  if txtketerangan.Text = '' then begin
    MessageDlg('Keterangan : harus diisi!',mtError,[mbOK],0);
    txtsupplier.SetFocus;
    Exit;
  end;
  with dbgbarang do begin
    jumlahqty := 0;
    for i:=0 to RowCount-1 do begin
      jumlahqty := jumlahqty+dbgbarang.Cell[2,i].AsInteger;
    end;
    if jumlahqty <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      if dbgbarang.Cell[2,i].AsFloat = 0 then begin
        MessageDlg('Jumlah barang '+Cell[1,i].AsString+' tidak boleh nol',mtError,[mbOK],0);
        Exit;
      end;
      if dbgbarang.Cell[15,i].AsFloat = -1 then begin
        MessageDlg('Gudang untuk barang '+Cell[1,i].AsString+' belum dipilih!',mtError,[mbOK],0);
        Exit;
      end;
    end;
  end;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      jumlahqty := Cell[2,i].AsFloat*Cell[13,i].AsFloat;
      for j:=0 to RowCount-1 do begin
        if i <> j then begin
          if (Cell[11,i].AsInteger = Cell[11,j].AsInteger) and (Cell[15,i].AsInteger = Cell[15,j].AsInteger) then begin
            jumlahqty := jumlahqty+(Cell[2,j].AsFloat*Cell[13,j].AsFloat);
          end;
        end;
      end;
      if LID.Caption = '0' then begin
        if DM.CekStok(Cell[11,i].AsInteger,Cell[15,i].AsInteger,jumlahqty)=False then begin
          MessageDlg(Cell[1,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
      end else begin
        if DM.CekStok1(Cell[11,i].AsInteger,Cell[15,i].AsInteger,StrToInt(LID.Caption),'PR',jumlahqty)=False then begin
          MessageDlg(Cell[1,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
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
          notransaksi := DM.GenerateNoMaster('returpembelian');
          txtreferensi.Text := DM.GenerateKodeTransaksi('PR',dtpfaktur.Date);
          ketretur := 'Retur Pembelian, '+txtsupplier.Text;
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'PR';
          ParamByName('b').Value := dtpfaktur.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          SQL.Clear;
          // masuk ke tabel pembelian
          SQL.Text := 'insert into tbl_returpembelian values (:a,:b,:c,:d,:e,:g,:h,:i,:j,:k,:l)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LNoPembelian.Caption;
          ParamByName('d').Value := LSupplier.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('g').Value := txtsubtotal.Value;
          ParamByName('h').Value := txtpajak.Value;
          ParamByName('i').Value := txttotal.Value;
          ParamByName('j').Value := Frm_Main.txtuser.Caption;
          ParamByName('k').Value := LHutang.Caption;
          ParamByName('l').Value := txtketerangan.Text;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel retur pembelian detil
              SQL.Text := 'insert into tbl_returpembeliandetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := Cell[11,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[4,i].AsFloat;
              ParamByName('e').Value := Cell[5,i].AsFloat;
              ParamByName('f').Value := Cell[6,i].AsFloat;
              ParamByName('g').Value := Cell[7,i].AsFloat;
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
              ExecSQL;
              if Cell[22,i].AsInteger = 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel buku besar barang
                SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                ParamByName('b').Value := Cell[11,i].AsInteger;
                ParamByName('c').Value := 'PR';
                ParamByName('d').Value := Cell[15,i].AsInteger;
                ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                ParamByName('f').Value := notransaksi;
                ParamByName('g').Value := 'Retur Pembelian '+txtreferensi.Text;
                ParamByName('h').Value := Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                hpp := DM.HitungHPPPenjualan(Cell[11,i].AsInteger,Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                ParamByName('i').Value := hpp;
                ExecSQL;
                //masuk buku besar barang detail
                DM.AmbilNoBuku(Cell[11,i].AsInteger,Cell[15,i].AsInteger,Cell[2,i].AsFloat*Cell[13,i].AsFloat,notransaksi,'PR');
              end;

              DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'PR',notransaksi,ketretur,0,Cell[19,i].AsFloat);
              if Cell[20,i].AsFloat > 0 then
                DM.InsertBukuBesarAkun(Cell[21,i].AsInteger,dtpfaktur.Date,'PR',notransaksi,ketretur,0,Cell[19,i].AsFloat);
            end;
          end;
          DM.InsertBukuBesarAkun(StrToInt(LHutang.Caption),dtpfaktur.Date,'PR',notransaksi,ketretur,txttotal.Value,0);

          DM.InsertBukuBesarKontak(StrToInt(LSupplier.Caption),dtpfaktur.Date,'PR',notransaksi,'Retur Pembelian, '+txtreferensi.Text,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := notransaksi;
            ParamByName('t').Value := 'PR';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := 'PR';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := notransaksi;
              ParamByName('t').Value := 'PR';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end;
            dm.Q_NotaReturPembelian.Close;
            DM.Q_NotaReturPembelian.ParamByName('np').Value := notransaksi;
            DM.Q_NotaReturPembelian.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'PR';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_ReturPembelian.ShowReport(True);
          end;
          if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_JurnalVoucher.Close;
            DM.Q_JurnalVoucher.ParamByName('np').Value := notransaksi;
            DM.Q_JurnalVoucher.ParamByName('t').Value := 'PR';
            DM.Q_JurnalVoucher.Open;
            t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
            t.Memo.Text := 'Jurnal Retur Pembelian';
            DM.Rpt_JurnalVoucher.ShowReport(True);
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
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PR';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PR';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PR';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PR';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'PR';
          ExecSQL;

          ketretur := 'Retur Pembelian, '+txtsupplier.Text;
          Close;
          SQL.Clear;
          // update ke tabel pembelian
          SQL.Text := 'update tbl_returpembelian set nopembelianinvoice=:d,tgltransaksi=:e,nokontak=:b,noakunhutang=:m, ' +
                      'totaldpp=:r,totalpajak=:s,total=:t,keterangan=:l where noreturpembelian=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('d').Value := LNoPembelian.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('b').Value := LSupplier.Caption;
          ParamByName('m').Value := LHutang.Caption;
          ParamByName('r').Value := txtsubtotal.Value;
          ParamByName('s').Value := txtpajak.Value;
          ParamByName('t').Value := txttotal.Value;
          ParamByName('l').Value := txtketerangan.Text;
          ExecSQL;
          //hapus detil retur pembelian
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_returpembeliandetail where noreturpembelian=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel retur pembelian detil
              SQL.Text := 'insert into tbl_returpembeliandetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := Cell[11,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[4,i].AsFloat;
              ParamByName('e').Value := Cell[5,i].AsFloat;
              ParamByName('f').Value := Cell[6,i].AsFloat;
              ParamByName('g').Value := Cell[7,i].AsFloat;
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
              ExecSQL;
              if Cell[22,i].AsInteger = 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel buku besar barang
                SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                ParamByName('b').Value := Cell[11,i].AsInteger;
                ParamByName('c').Value := 'PR';
                ParamByName('d').Value := Cell[15,i].AsInteger;
                ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                ParamByName('f').Value := LID.Caption;
                ParamByName('g').Value := 'Retur Pembelian '+txtreferensi.Text;
                ParamByName('h').Value := Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                hpp := DM.HitungHPPPenjualan(Cell[11,i].AsInteger,Cell[2,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                ParamByName('i').Value := hpp;
                ExecSQL;
                //masuk buku besar barang detail
                DM.AmbilNoBuku(Cell[11,i].AsInteger,Cell[15,i].AsInteger,Cell[2,i].AsFloat*Cell[13,i].AsFloat,StrtoInt(LID.Caption),'PR');
              end;
              DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'PR',StrToInt(LID.Caption),ketretur,0,Cell[19,i].AsFloat);
              if Cell[20,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[21,i].AsInteger,dtpfaktur.Date,'PR',StrToInt(LID.Caption),ketretur,0,Cell[19,i].AsFloat);
            end;
          end;
          DM.InsertBukuBesarAkun(StrToInt(LHutang.Caption),dtpfaktur.Date,'PR',StrToInt(LID.Caption),ketretur,txttotal.Value,0);

          DM.InsertBukuBesarKontak(StrToInt(LSupplier.Caption),dtpfaktur.Date,'PR',StrtoInt(LID.Caption),'Retur Pembelian, '+txtreferensi.Text,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'PR';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := 'PR';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'PR';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end;
            dm.Q_NotaReturPembelian.Close;
            DM.Q_NotaReturPembelian.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaReturPembelian.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'PR';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_ReturPembelian.ShowReport(True);
          end;
          if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_JurnalVoucher.Close;
            DM.Q_JurnalVoucher.ParamByName('np').Value := LID.Caption;
            DM.Q_JurnalVoucher.ParamByName('t').Value := 'PR';
            DM.Q_JurnalVoucher.Open;
            t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
            t.Memo.Text := 'Jurnal Retur Pembelian';
            DM.Rpt_JurnalVoucher.ShowReport(True);
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
    Free;
  end;
end;

procedure TFrm_ReturPembelian.txtpembelianButtonClick(Sender: TObject);
begin
  if txtsupplier.Text = '' then begin
    MessageDlg('Nama Supplier : harus diisi terlebih dahulu !',mtInformation,[mbOK],0);
    txtsupplier.SetFocus;
    Exit;
  end;
  Application.CreateForm(TFrm_DataInvoice, Frm_DataInvoice);
  pemasokid := StrToInt(LSupplier.Caption);
  Frm_DataInvoice.RefreshQ;
  if Frm_DataInvoice.ShowModal = mrok then begin
    txtpembelian.Text := Frm_DataInvoice.QData.FieldValues['kodepembelianinvoice'];
    LNoPembelian.Caption := Frm_DataInvoice.QData.FieldValues['nopembelianinvoice'];
  end;
end;

procedure TFrm_ReturPembelian.txtpembelianKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtpembelianButtonClick(nil);
end;

procedure TFrm_ReturPembelian.dbgbarangCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 10 then begin
    dbgbarang.DeleteRow(ARow);
    if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_ReturPembelian.dbgbarangSelectionChanged(Sender: TObject;
  ACol, ARow: Integer);
var
  i:Integer;
begin
  if ACol = 10 then begin
    if dbgbarang.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgbarang.RowCount-1 then begin
        dbgbarang.AddRow();
        i := dbgbarang.RowCount;
        dbgbarang.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_ReturPembelian.dtpfakturChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('PR',dtpfaktur.Date);
end;

end.
