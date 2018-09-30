unit USalesQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBtnEdt, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzButton, NxEdit, RzRadChk, StdCtrls, Mask, RzEdit,
  RzLabel, RzPanel, ExtCtrls, cxPC, RzCmboBx, RzLine, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  TFrm_PenjualanRequest = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LID: TRzLabel;
    RzLabel10: TRzLabel;
    txtreferensi: TRzEdit;
    dtptanggal: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    Q1: TZQuery;
    txtcustomer: TRzButtonEdit;
    LCustomer: TRzLabel;
    QMataUang: TZQuery;
    RzPanel4: TRzPanel;
    RzLabel27: TRzLabel;
    RzLabel12: TRzLabel;
    txttotal: TRzNumericEdit;
    txtsubtotal: TRzNumericEdit;
    txtpajak: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel7: TRzLabel;
    txtbiayalain: TRzNumericEdit;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel5: TRzLabel;
    txtketerangan: TRzMemo;
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
    NxIconColumn61: TNxIconColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    LOrder: TRzLabel;
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCariClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangExit(Sender: TObject);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRekamClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgbarangSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgbarangCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure txtbiayalainChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_PenjualanRequest: TFrm_PenjualanRequest;
  potcust: Double;

implementation

uses UDM, NxCells, UMain, UDataSatuan, UDataBarang, UDataKontak, UDataPajak,
  NxIntf6;

{$R *.dfm}

{ TFrm_PenjualanQuotation }

procedure TFrm_PenjualanRequest.ClearText;
begin
  LID.Caption := '0';
  txtreferensi.Text := DM.GenerateKodeTransaksi('SQ',Date);
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  potcust := 0;
  dtptanggal.Date := Date;
  dtptanggal.ReadOnly := False;
  txtketerangan.Clear;
  txtbiayalain.Value := 0;
  dbgbarang.ClearRows;
  UpdateTotal;
  LOrder.Caption := '0';
end;

procedure TFrm_PenjualanRequest.txtcustomerButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    ClearText;
    dbgbarang.AddRow();
    txtcustomer.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LCustomer.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    potcust := Frm_DataKontak.QData.FieldValues['diskon'];
  end;
end;

procedure TFrm_PenjualanRequest.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_PenjualanRequest.UpdateTotal;
var
  dpp,ppn1:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp:=dpp+Cell[16,i].AsFloat;
      ppn1:=ppn1+Cell[17,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtpajak.Value := ppn1;
    txttotal.Value := dpp+ppn1+txtbiayalain.Value;
  end;
end;

procedure TFrm_PenjualanRequest.BtnCariClick(Sender: TObject);
var
  i:Integer;
  total:Double;
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := -1;
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    if txtcustomer.Text = '' then begin
      MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
      txtcustomer.SetFocus;
      Exit;
    end;
    i := dbgbarang.SelectedRow;
    dbgbarang.Cell[0,i].AsString := Frm_DataBarang.QData.FieldValues['kodebarang'];
    dbgbarang.Cell[1,i].AsString := Frm_DataBarang.QData.FieldValues['namabarang'];
    dbgbarang.Cell[2,i].AsFloat := 1;
    dbgbarang.Cell[3,i].AsString := Frm_DataBarang.QData.FieldValues['kodesatuan'];
    dbgbarang.Cell[4,i].AsFloat := Frm_DataBarang.QData.FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
    if DM.CekHPP(Frm_DataBarang.QData.FieldValues['nobarang']) > Frm_DataBarang.QData.FieldValues['hargajual'] then begin
      MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
    end;
    total := dbgbarang.Cell[2,i].AsFloat*dbgbarang.Cell[4,i].AsFloat;
    dbgbarang.Cell[5,i].AsFloat := potcust;
    total := total-((total*dbgbarang.Cell[5,i].AsFloat)/100);
    dbgbarang.Cell[6,i].AsFloat := 0;
    total := total-dbgbarang.Cell[6,i].AsFloat;
    dbgbarang.Cell[7,i].AsFloat := total;
    dbgbarang.Cell[10,i].AsInteger := Frm_DataBarang.QData.FieldValues['nobarang'];
    dbgbarang.Cell[11,i].AsInteger := Frm_DataBarang.QData.FieldValues['nosatuan'];
    dbgbarang.Cell[12,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
    dbgbarang.Cell[13,i].AsInteger := DM.CekPajak(dbgbarang.Cell[10,i].AsInteger,'penjualan');
    dbgbarang.Cell[8,i].AsString := dm.CekKodePajak(dbgbarang.Cell[13,i].AsInteger);
    dbgbarang.Cell[14,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[13,i].AsInteger);
    dbgbarang.Cell[15,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[13,i].AsInteger);
    if dbgbarang.Cell[13,i].AsInteger = 0 then begin
      dbgbarang.Cell[16,i].AsFloat := dbgbarang.Cell[7,i].AsFloat;
      dbgbarang.Cell[17,i].AsFloat := 0;
    end else begin
      if dbgbarang.Cell[14,i].AsInteger = 0 then begin
        dbgbarang.Cell[16,i].AsFloat := dbgbarang.Cell[7,i].AsFloat;
        dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[7,i].AsFloat*dbgbarang.Cell[15,i].AsFloat/100)*100)/100;
      end else if dbgbarang.Cell[14,i].AsInteger = 1 then begin
        dbgbarang.Cell[16,i].AsFloat := Int((dbgbarang.Cell[7,i].AsFloat/(1+(dbgbarang.Cell[15,i].AsFloat/100)))*100)/100;
        dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[7,i].AsFloat-dbgbarang.Cell[16,i].AsFloat;
      end;
    end;
    UpdateTotal;
    dbgbarang.SelectCell(2,i);
  end;
end;

procedure TFrm_PenjualanRequest.dbgbarangAfterEdit(Sender: TObject; ACol,
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
    if DM.CekHPP(dbgbarang.Cell[10,ARow].AsInteger) > dbgbarang.Cell[4,ARow].AsFloat/dbgbarang.Cell[12,ARow].AsFloat then begin
      MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
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
  if dbgbarang.Cell[13,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
    dbgbarang.Cell[17,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
      dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat*dbgbarang.Cell[15,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[14,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[16,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat/(1+(dbgbarang.Cell[15,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat-dbgbarang.Cell[16,ARow].AsFloat;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_PenjualanRequest.dbgbarangCellDblClick(Sender: TObject;
  ACol, ARow: Integer);
var
  total,harga:Double;
begin
  if (ACol = 0) or (ACol = 1) then begin
    BtnCariClick(nil);
  end;
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := dbgbarang.Cell[10,ARow].AsInteger;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      harga := dbgbarang.Cell[4,ARow].AsFloat/dbgbarang.Cell[12,ARow].AsFloat;
      dbgbarang.Cell[3,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
      dbgbarang.Cell[11,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[12,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      dbgbarang.Cell[4,ARow].AsFloat := harga*dbgbarang.Cell[12,ARow].AsFloat;

      total := dbgbarang.Cell[2,ARow].AsFloat*dbgbarang.Cell[4,ARow].AsFloat;
      total := total-((total*dbgbarang.Cell[5,ARow].AsFloat)/100);
      total := total-dbgbarang.Cell[6,ARow].AsFloat;
      dbgbarang.Cell[7,ARow].AsFloat := total;
      if dbgbarang.Cell[13,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
        dbgbarang.Cell[17,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat*dbgbarang.Cell[15,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[14,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[16,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat/(1+(dbgbarang.Cell[15,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat-dbgbarang.Cell[16,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
  if ACol = 8 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
    Frm_DataPajak.RefreshQ;
    if Frm_DataPajak.ShowModal = mrok then begin
      dbgbarang.Cell[13,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
      dbgbarang.Cell[8,ARow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
      dbgbarang.Cell[14,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
      dbgbarang.Cell[15,ARow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
      if dbgbarang.Cell[13,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
        dbgbarang.Cell[17,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[16,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat;
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat*dbgbarang.Cell[15,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[14,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[16,ARow].AsFloat := Int((dbgbarang.Cell[7,ARow].AsFloat/(1+(dbgbarang.Cell[15,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[7,ARow].AsFloat-dbgbarang.Cell[16,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_PenjualanRequest.dbgbarangExit(Sender: TObject);
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

procedure TFrm_PenjualanRequest.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
var
  total,harga :Double;
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
      nomorbarang := dbgbarang.Cell[10,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        harga := dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat/dbgbarang.Cell[12,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[3,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
        dbgbarang.Cell[11,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[12,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
        dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat := harga*dbgbarang.Cell[12,dbgbarang.SelectedRow].AsFloat;
        total := dbgbarang.Cell[2,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat;
        total := total-((total*dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat)/100);
        total := total-dbgbarang.Cell[6,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat := total;
        if dbgbarang.Cell[13,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 8 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[0,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
      Frm_DataPajak.RefreshQ;
      if Frm_DataPajak.ShowModal = mrok then begin
        dbgbarang.Cell[13,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
        dbgbarang.Cell[8,dbgbarang.SelectedRow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
        dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
        dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
        if dbgbarang.Cell[13,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[15,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
end;

procedure TFrm_PenjualanRequest.BtnRekamClick(Sender: TObject);
var
  i,notransaksi:Integer;
  jumlahbarang: Double;
begin
  with dbgbarang do begin
    jumlahbarang := 0;
    for i:=0 to RowCount-1 do begin
      jumlahbarang := jumlahbarang+dbgbarang.Cell[2,i].AsFloat;
    end;
    if jumlahbarang <= 0 then begin
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
    end;
  end;
  {if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtpfaktur.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;  }
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        notransaksi := DM.GenerateNoMaster('penjualanrequest');
        txtreferensi.Text := DM.GenerateKodeTransaksi('SQ',Date);
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'SQ';
        ParamByName('b').Value := Date;
        ParamByName('c').Value := txtreferensi.Text;
        ExecSQL;
        Close;
        // masuk ke tabel penjualan request
        SQL.Clear;
        SQL.Text := 'insert into tbl_penjualanrequest values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
        ParamByName('a').Value := notransaksi;
        ParamByName('b').Value := txtreferensi.Text;
        ParamByName('c').Value := LCustomer.Caption;
        ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('e').Value := txtketerangan.Text;
        ParamByName('f').Value := txtsubtotal.Value;
        ParamByName('g').Value := txtpajak.Value;
        ParamByName('h').Value := txtbiayalain.Value;
        ParamByName('i').Value := txttotal.Value;
        ParamByName('j').Value := Frm_Main.txtuser.Caption;
        ExecSQL;
        with dbgbarang do begin
          for i:=0 to RowCount-1 do begin
            Close;
            SQL.Clear;
            //masuk tabel penjualan request detil
            SQL.Text := 'insert into tbl_penjualanrequestdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n)';
            ParamByName('a').Value := notransaksi;
            ParamByName('b').Value := Cell[10,i].AsInteger;
            ParamByName('c').Value := Cell[2,i].AsFloat;
            ParamByName('d').Value := Cell[4,i].AsFloat;
            ParamByName('e').Value := Cell[5,i].AsFloat;
            ParamByName('f').Value := Cell[6,i].AsFloat;
            ParamByName('g').Value := Cell[7,i].AsFloat;
            ParamByName('h').Value := Cell[11,i].AsInteger;
            ParamByName('i').Value := Cell[12,i].AsFloat;
            ParamByName('j').Value := Cell[16,i].AsFloat;
            ParamByName('k').Value := Cell[17,i].AsFloat;
            ParamByName('l').Value := Cell[13,i].AsInteger;
            ParamByName('m').Value := Cell[14,i].AsInteger;
            ParamByName('n').Value := Cell[15,i].AsFloat;
            ExecSQL;
          end;
        end;
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := notransaksi;
          ParamByName('t').Value := 'SQ';
          Open;
          if IsEmpty then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
            ParamByName('a').Value := notransaksi;
            ParamByName('b').Value := 'SQ';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
            ExecSQL;
          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := notransaksi;
            ParamByName('t').Value := 'SQ';
            ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
            ExecSQL;
          end;
          dm.Q_NotaPenjualanSQ.Close;
          DM.Q_NotaPenjualanSQ.ParamByName('np').Value := notransaksi;
          DM.Q_NotaPenjualanSQ.Open;
          dm.Q_NotaTerbilang.Close;
          DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
          DM.Q_NotaTerbilang.ParamByName('t').Value := 'SQ';
          DM.Q_NotaTerbilang.Open;
          DM.Nota_PenjualanSQ.ShowReport(True);
        end;
        ClearText;
        dbgbarang.AddRow();
      end;
    end else begin
      if LOrder.Caption = '0' then begin
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          // update ke tabel penjualan request
          SQL.Text := 'update tbl_penjualanrequest set nokontak=:c,tglpenjualanrequest=:d,keterangan=:e,totaldpp=:k,totalpajak=:l,biayalain=:m,total=:n where nopenjualanrequest=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('c').Value := LCustomer.Caption;
          ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('e').Value := txtketerangan.Text;
          ParamByName('k').Value := txtsubtotal.Value;
          ParamByName('l').Value := txtpajak.Value;
          ParamByName('m').Value := txtbiayalain.Value;
          ParamByName('n').Value := txttotal.Value;
          ExecSQL;
          //hapus detil penjualan request
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penjualanrequestdetail where nopenjualanrequest=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel penjualan request detil
              SQL.Text := 'insert into tbl_penjualanrequestdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := Cell[10,i].AsInteger;
              ParamByName('c').Value := Cell[2,i].AsFloat;
              ParamByName('d').Value := Cell[4,i].AsFloat;
              ParamByName('e').Value := Cell[5,i].AsFloat;
              ParamByName('f').Value := Cell[6,i].AsFloat;
              ParamByName('g').Value := Cell[7,i].AsFloat;
              ParamByName('h').Value := Cell[11,i].AsInteger;
              ParamByName('i').Value := Cell[12,i].AsFloat;
              ParamByName('j').Value := Cell[16,i].AsFloat;
              ParamByName('k').Value := Cell[17,i].AsFloat;
              ParamByName('l').Value := Cell[13,i].AsInteger;
              ParamByName('m').Value := Cell[14,i].AsInteger;
              ParamByName('n').Value := Cell[15,i].AsFloat;
              ExecSQL;
            end;
          end;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'SQ';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := 'SQ';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'SQ';
              ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(txttotal.IntValue));
              ExecSQL;
            end;
            dm.Q_NotaPenjualanSQ.Close;
            DM.Q_NotaPenjualanSQ.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaPenjualanSQ.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'SQ';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PenjualanSQ.ShowReport(True);
          end;
          ClearText;
          dbgbarang.AddRow();
        end;
      end else begin
        MessageDlg('Transaksi Penawaran telah dilakukan order. Data tidak dapat diubah!'#10#13'Hapus data order penjualan atau membuat transaksi penawaran baru.',mtError,[mbOK],0);
      end;
    end;
    Free;
  end;
end;

procedure TFrm_PenjualanRequest.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PenjualanRequest.dbgbarangSelectionChanged(Sender: TObject;
  ACol, ARow: Integer);
var
  i: Integer;
begin
  if ACol = 9 then begin
    if dbgbarang.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgbarang.RowCount-1 then begin
        dbgbarang.AddRow();
        i:= dbgbarang.RowCount;
        dbgbarang.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_PenjualanRequest.dbgbarangCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 9 then begin
    dbgbarang.DeleteRow(ARow);
    if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_PenjualanRequest.txtbiayalainChange(Sender: TObject);
begin
  UpdateTotal;
end;

end.
