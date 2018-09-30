unit UPenjualanTunai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, NxColumns6,
  NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6, NxGrid6, RzEdit,
  RzButton, RzBtnEdt, NxEdit, StdCtrls, Mask, RzLabel, RzPanel, ExtCtrls, cxPC;

type
  TFrm_PenjualanTunai = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LID: TRzLabel;
    RzLabel10: TRzLabel;
    LCustomer: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel8: TRzLabel;
    LGudang: TRzLabel;
    txtreferensi: TRzEdit;
    dtptanggal: TNxDatePicker;
    txtcustomer: TRzButtonEdit;
    txtpo: TRzEdit;
    txtgudang: TRzButtonEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnCari: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzLabel27: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel6: TRzLabel;
    BtnBiaya: TRzToolButton;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    LBiayaLain: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    txttotal: TRzNumericEdit;
    txtsubtotal: TRzNumericEdit;
    txtpajak: TRzNumericEdit;
    txtbiaya: TRzNumericEdit;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn65: TNxTextColumn6;
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
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn615: TNxNumberColumn6;
    Q1: TZQuery;
    txtkas: TRzButtonEdit;
    Lkas: TRzLabel;
    NxNumberColumn616: TNxNumberColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    NxNumberColumn618: TNxNumberColumn6;
    RzLabel5: TRzLabel;
    txtsalesman: TRzButtonEdit;
    LSalesman: TRzLabel;
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Text: WideString);
    procedure dbgbarangExit(Sender: TObject);
    procedure dbgbarangSelectionChanged(Sender: TObject; ACol,
      ARow: Integer);
    procedure dbgbarangCellClick(Sender: TObject; ACol, ARow: Integer;
      Button: TMouseButton);
    procedure BtnBiayaClick(Sender: TObject);
    procedure txtbiayaChange(Sender: TObject);
    procedure txtgudangButtonClick(Sender: TObject);
    procedure txtgudangKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
    procedure txtsalesmanButtonClick(Sender: TObject);
    procedure txtsalesmanKeyPress(Sender: TObject; var Key: Char);
    procedure dtptanggalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure UpdateTotal;
  end;

var
  Frm_PenjualanTunai: TFrm_PenjualanTunai;
  potcust: Double;

implementation

uses UDM, UMain, UDataBarang, UDataKontak, UDataSatuan, UDataGudang, UDataPajak,
  NxCells, USetAkun, UDataAkun;

{$R *.dfm}

{ TFrm_PenjualanTunai }

procedure TFrm_PenjualanTunai.ClearText;
begin
  LID.Caption := '0';
  dtptanggal.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('SA',dtptanggal.Date);
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  txtgudang.Text := '';
  LGudang.Caption := '';
  {if DM.CekUserGudang(Frm_Main.txtuser.Caption)= -1 then begin
    txtgudang.ReadOnly := False;
  end else begin
    txtgudang.ReadOnly := True;
    LGUdang.Caption := IntToStr(DM.CekUserGudang(Frm_Main.txtuser.Caption));
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
      ParamByName('a').Value := LGUdang.Caption;
      Open;
      txtgudang.Text := FieldValues['namagudang'];
      Free;
    end;
  end; }
  txtkas.Clear;
  Lkas.Caption := '0';
  dtptanggal.ReadOnly := False;
  txtpo.Clear;
  dbgbarang.ClearRows;
  LBiayaLain.Caption := '0';
  txtbiaya.Value := 0;
  txtsalesman.Clear;
  LSalesman.Caption := '0';
  UpdateTotal;
end;

procedure TFrm_PenjualanTunai.UpdateTotal;
var
  dpp,ppn1:Double;
  i:integer;
begin
  dpp := 0;
  ppn1 := 0;
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      dpp := dpp+Cell[17,i].AsFloat;
      ppn1 := ppn1+cell[18,i].AsFloat;
    end;
    txtsubtotal.Value := dpp;
    txtpajak.Value := ppn1;
    txttotal.Value := dpp+ppn1+txtbiaya.Value;
  end;
end;

procedure TFrm_PenjualanTunai.txtcustomerButtonClick(Sender: TObject);
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

procedure TFrm_PenjualanTunai.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_PenjualanTunai.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  total:Double;
begin
  if (ACol = 0) or (ACol = 1) or (ACol = 2)  then begin
    BtnCariClick(nil);
  end;
  if ACol = 4 then begin
    if dbgbarang.Cell[1,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := dbgbarang.Cell[11,ARow].AsInteger;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      dbgbarang.Cell[4,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
      dbgbarang.Cell[12,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[13,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      dbgbarang.Cell[5,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['hargajual'];

      total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
      total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
      total := total-dbgbarang.Cell[7,ARow].AsFloat;
      dbgbarang.Cell[8,ARow].AsFloat := total;
      if dbgbarang.Cell[12,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
        dbgbarang.Cell[18,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
          dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
  if ACol = 9 then begin
    if dbgbarang.Cell[1,ARow].AsString = '' then Exit;
    Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
    Frm_DataPajak.RefreshQ;
    if Frm_DataPajak.ShowModal = mrok then begin
      dbgbarang.Cell[14,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
      dbgbarang.Cell[9,ARow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
      dbgbarang.Cell[15,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
      dbgbarang.Cell[16,ARow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
      dbgbarang.Cell[22,ARow].AsInteger := Frm_DataPajak.QData.FieldValues['akunpajakpenjualan'];
      if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
        dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
        dbgbarang.Cell[18,ARow].AsFloat := 0;
      end else begin
        if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
          dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
          dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
        end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
          dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
          dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
        end;
      end;
      UpdateTotal;
    end;
  end;
end;

procedure TFrm_PenjualanTunai.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
var
  total :Double;
begin
  if (dbgbarang.SelectedCol = 0) or (dbgbarang.SelectedCol = 1) or (dbgbarang.SelectedCol = 2) then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      BtnCariClick(nil);
    end;
  end;
  if dbgbarang.SelectedCol = 4 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[1,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[11,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        dbgbarang.Cell[4,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan']+'('+FloatToStr(Frm_DataSatuan.QData.FieldValues['faktor'])+')';
        dbgbarang.Cell[12,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[13,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
        dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['hargajual'];

        total := dbgbarang.Cell[3,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat;
        total := total-((total*dbgbarang.Cell[6,dbgbarang.SelectedRow].AsFloat)/100);
        total := total-dbgbarang.Cell[7,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat := total;
        if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
  if dbgbarang.SelectedCol = 9 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[1,dbgbarang.SelectedRow].AsString = '' then Exit;
      Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
      Frm_DataPajak.RefreshQ;
      if Frm_DataPajak.ShowModal = mrok then begin
        dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['nopajak'];
        dbgbarang.Cell[9,dbgbarang.SelectedRow].AsString := Frm_DataPajak.QData.FieldValues['kodepajak'];
        dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['tipepajak'];
        dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat := Frm_DataPajak.QData.FieldValues['persen'];
        dbgbarang.Cell[22,dbgbarang.SelectedRow].AsInteger := Frm_DataPajak.QData.FieldValues['akunpajakpenjualan'];
        if dbgbarang.Cell[14,dbgbarang.SelectedRow].AsInteger = 0 then begin
          dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
          dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := 0;
        end else begin
          if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 0 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)*100)/100;
          end else if dbgbarang.Cell[15,dbgbarang.SelectedRow].AsInteger = 1 then begin
            dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat := Int((dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat/(1+(dbgbarang.Cell[16,dbgbarang.SelectedRow].AsFloat/100)))*100)/100;
            dbgbarang.Cell[18,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[17,dbgbarang.SelectedRow].AsFloat;
          end;
        end;
        UpdateTotal;
      end;
    end;
  end;
end;

procedure TFrm_PenjualanTunai.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PenjualanTunai.BtnCariClick(Sender: TObject);
var
  i,akunpenjualan:Integer;
  total:Double;
  namapenjualan: string;
begin
  if txtcustomer.Text = '' then begin
    MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 4;
  nosubklas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    akunpenjualan := Frm_DataAkun.QData.FieldValues['noakun'];
    namapenjualan := Frm_DataAkun.QData.FieldValues['kodeakun'];
    Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
    //AGudang := -1;
    //Frm_DataBarang.RefreshQ;
    if Frm_DataBarang.ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak,ifnull(b.akunpajakpenjualan,0)as akunpajakpenjualan from ' +
                    '(select a.*,d.kodesatuan from ' +
                    '(select * from tbl_barang where nobarang=:ib) as a ' +
                    'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                    'left join tbl_pajak as b on b.nopajak=a.nopajakpenjualan';
        ParamByName('ib').Value := Frm_DataBarang.QData.FieldValues['nobarang'];
        Open;
        if not IsEmpty then begin
          i := dbgbarang.SelectedRow;
          dbgbarang.Cell[0,i].AsString := namapenjualan;
          dbgbarang.Cell[1,i].AsString := FieldValues['kodebarang'];
          dbgbarang.Cell[2,i].AsString := FieldValues['namabarang'];
          dbgbarang.Cell[3,i].AsFloat := 1;
          dbgbarang.Cell[4,i].AsString := FieldValues['kodesatuan'];
          dbgbarang.Cell[5,i].AsFloat := FieldValues['hargajual']*Frm_DataBarang.QData.FieldValues['faktor'];
          if DM.CekHPP(FieldValues['nobarang']) > FieldValues['hargajual'] then begin
            MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
          end;
          total := dbgbarang.Cell[3,i].AsFloat*dbgbarang.Cell[5,i].AsFloat;
          dbgbarang.Cell[6,i].AsFloat := potcust;
          total := total-((total*dbgbarang.Cell[6,i].AsFloat)/100);
          dbgbarang.Cell[7,i].AsFloat := 0;
          total := total-dbgbarang.Cell[7,i].AsFloat;
          dbgbarang.Cell[8,i].AsFloat := total;
          dbgbarang.Cell[11,i].AsInteger := FieldValues['nobarang'];
          dbgbarang.Cell[12,i].AsInteger := FieldValues['nosatuan'];
          dbgbarang.Cell[13,i].AsInteger := Frm_DataBarang.QData.FieldValues['faktor'];
          dbgbarang.Cell[14,i].AsInteger := DM.CekPajak(dbgbarang.Cell[11,i].AsInteger,'penjualan');
          dbgbarang.Cell[9,i].AsString := dm.CekKodePajak(dbgbarang.Cell[14,i].AsInteger);
          dbgbarang.Cell[15,i].AsInteger := dm.CekTipePajak(dbgbarang.Cell[14,i].AsInteger);
          dbgbarang.Cell[16,i].AsFloat := dm.CekPersenPajak(dbgbarang.Cell[14,i].AsInteger);
          if dbgbarang.Cell[14,i].AsInteger = 0 then begin
            dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
            dbgbarang.Cell[18,i].AsFloat := 0;
          end else begin
            if dbgbarang.Cell[15,i].AsInteger = 0 then begin
              dbgbarang.Cell[17,i].AsFloat := dbgbarang.Cell[8,i].AsFloat;
              dbgbarang.Cell[18,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat*dbgbarang.Cell[16,i].AsFloat/100)*100)/100;
            end else if dbgbarang.Cell[15,i].AsInteger = 1 then begin
              dbgbarang.Cell[17,i].AsFloat := Int((dbgbarang.Cell[8,i].AsFloat/(1+(dbgbarang.Cell[16,i].AsFloat/100)))*100)/100;
              dbgbarang.Cell[18,i].AsFloat := dbgbarang.Cell[8,i].AsFloat-dbgbarang.Cell[17,i].AsFloat;
            end;
          end;
          dbgbarang.Cell[19,i].AsInteger := FieldValues['noakunpersediaan'];
          dbgbarang.Cell[20,i].AsInteger := akunpenjualan;
          dbgbarang.Cell[21,i].AsInteger := FieldValues['noakunhpp'];
          dbgbarang.Cell[22,i].AsInteger := FieldValues['akunpajakpenjualan'];
          dbgbarang.Cell[23,i].AsInteger := FieldValues['tipebarang'];
          UpdateTotal;
          dbgbarang.SelectCell(3,i);
        end;
        Free;
      end;
    end;
  end;
end;

procedure TFrm_PenjualanTunai.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Text: WideString);
var
  total:Double;
begin
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 5 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[5,ARow].AsFloat := 0;
      Exit;
    end;
    if DM.CekHPP(dbgbarang.Cell[11,ARow].AsInteger) > dbgbarang.Cell[5,ARow].AsFloat/dbgbarang.Cell[13,ARow].AsFloat then begin
      MessageDlg('Harga Jual dibawah HPP !', mtWarning, [mbOK],0);
    end;
  end else if ACol = 6 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[6,ARow].AsFloat := 0;
      Exit;
    end;
  end else if ACol = 7 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[7,ARow].AsFloat := 0;
      Exit;
    end;
  end;
  total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
  total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
  total := total-dbgbarang.Cell[7,ARow].AsFloat;
  dbgbarang.Cell[8,ARow].AsFloat := total;
  if dbgbarang.Cell[14,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
    dbgbarang.Cell[18,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[15,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[17,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[18,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat*dbgbarang.Cell[16,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[15,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[17,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[16,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[18,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[17,ARow].AsFloat;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_PenjualanTunai.dbgbarangExit(Sender: TObject);
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

procedure TFrm_PenjualanTunai.dbgbarangSelectionChanged(Sender: TObject;
  ACol, ARow: Integer);
var
  i : Integer;
begin
  if ACol = 10 then begin
    if dbgbarang.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgbarang.RowCount-1 then begin
        dbgbarang.AddRow();
        i:=dbgbarang.RowCount;
        dbgbarang.ScrollToCell(0,i);
      end;
    end;
  end;
end;

procedure TFrm_PenjualanTunai.dbgbarangCellClick(Sender: TObject; ACol,
  ARow: Integer; Button: TMouseButton);
begin
  if ACol = 10 then begin
    dbgbarang.DeleteRow(ARow);
    if dbgbarang.RowCount = 0 then dbgbarang.AddRow();
    UpdateTotal;
  end;
end;

procedure TFrm_PenjualanTunai.BtnBiayaClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_SetAkun, Frm_SetAkun);
  JudulAkun := 'Biaya Lain';
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_akun where noakun=:na';
    ParamByName('na').Value := LBiayaLain.Caption;
    Open;
    if not IsEmpty then begin
      Frm_SetAkun.LNoAkun.Caption := FieldValues['noakun'];
      Frm_SetAkun.txtke.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
    end else begin
      Frm_SetAkun.LNoAkun.Caption := '0';
      Frm_SetAkun.txtke.Clear;
    end;
    if Frm_SetAkun.ShowModal = mrok then begin
      LBiayaLain.Caption := Frm_SetAkun.LNoAkun.Caption;
    end;
    Free;
  end;
end;

procedure TFrm_PenjualanTunai.txtbiayaChange(Sender: TObject);
begin
  UpdateTotal;
end;

procedure TFrm_PenjualanTunai.txtgudangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudang.Text := Frm_DataGudang.QData.FieldValues['namagudang'];
    LGUdang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFrm_PenjualanTunai.txtgudangKeyPress(Sender: TObject;
  var Key: Char);
begin
  if txtgudang.ReadOnly = False then txtgudangButtonClick(nil);
end;

procedure TFrm_PenjualanTunai.BtnRekamClick(Sender: TObject);
var
  i,notransaksi,j:Integer;
  jumlahqty, hpp: Double;
begin
  if txtcustomer.Text = '' then begin
    MessageDlg('Customer : harus diisi !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  if Lkas.Caption = '0' then begin
    MessageDlg('Kas : harus diisi !',mtError,[mbOK],0);
    txtkas.SetFocus;
    Exit;
  end;
  if Lkas.Caption = '' then begin
    MessageDlg('Gudang : belum dipilih !',mtError,[mbOK],0);
    txtgudang.SetFocus;
    Exit;
  end;
  with dbgbarang do begin
    jumlahqty := 0;
    for i:=0 to RowCount-1 do begin
      jumlahqty := jumlahqty+dbgbarang.Cell[3,i].AsFloat;
    end;
    if jumlahqty <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    jumlahqty := 0;
    for i:=0 to RowCount-1 do begin
      jumlahqty := Cell[3,i].AsFloat*Cell[13,i].AsFloat;
      for j:=0 to RowCount-1 do begin
        if i <> j then begin
          if Cell[11,i].AsInteger = Cell[11,j].AsInteger  then begin
            jumlahqty := jumlahqty+(Cell[3,j].AsFloat*Cell[13,j].AsFloat);
          end;
        end;
      end;
      if LID.Caption = '0' then begin
        if DM.CekStok(Cell[11,i].AsInteger,StrToInt(LGUdang.Caption),jumlahqty)=False then begin
          MessageDlg(Cell[2,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
      end else begin
        if DM.CekStok1(Cell[11,i].AsInteger,StrToInt(LGUdang.Caption),StrToInt(LID.Caption),'SP',jumlahqty)=False then begin
          MessageDlg(Cell[2,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
      end;
    end;
  end;
  if LBiayaLain.Caption = '0' then begin
    if txtbiaya.Value > 0 then begin
      MessageDlg('Akun Biaya Lain: harus dipilih !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  {if DM.CekPlafon(StrToInt(LCustomer.Caption),txttotal.Value)=False then begin
    if MessageDlg('Transaksi ini melebihi batas kredit customer. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
      Exit;
    end else begin
      cbapprove.Checked := False;
    end;
  end else cbapprove.Checked := True;
  if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
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
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          notransaksi := DM.GenerateNoMaster('penjualantunai');
          txtreferensi.Text := DM.GenerateKodeTransaksi('SP',dtptanggal.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'SP';
          ParamByName('b').Value := dtptanggal.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          // masuk ke tabel penjualan order
          SQL.Clear;
          SQL.Text := 'insert into tbl_penjualantunai values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LCustomer.Caption;
          ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('e').Value := LGudang.Caption;
          ParamByName('f').Value := Lkas.Caption;
          ParamByName('g').Value := LSalesman.Caption;
          ParamByName('h').Value := txtpo.Text;
          ParamByName('i').Value := txtsubtotal.Value;
          ParamByName('j').Value := txtpajak.Value;
          ParamByName('k').Value := txtbiaya.Value;
          ParamByName('l').Value := LBiayaLain.Caption;
          ParamByName('m').Value := txttotal.Value;
          ParamByName('n').Value := Frm_Main.txtuser.Caption;
          ParamByName('o').Value := '';
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel penjualan order detil
                SQL.Text := 'insert into tbl_penjualantunaidetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := Cell[11,i].AsInteger;
                ParamByName('c').Value := Cell[3,i].AsFloat;
                ParamByName('d').Value := Cell[5,i].AsFloat;
                ParamByName('e').Value := Cell[6,i].AsFloat;
                ParamByName('f').Value := Cell[7,i].AsFloat;
                ParamByName('g').Value := Cell[8,i].AsFloat;
                ParamByName('h').Value := Cell[12,i].AsInteger;
                ParamByName('i').Value := Cell[13,i].AsFloat;
                ParamByName('j').Value := Cell[17,i].AsFloat;
                ParamByName('k').Value := Cell[18,i].AsFloat;
                ParamByName('l').Value := Cell[14,i].AsInteger;
                ParamByName('m').Value := Cell[15,i].AsInteger;
                ParamByName('n').Value := Cell[16,i].AsFloat;
                ParamByName('o').Value := Cell[19,i].AsInteger;
                ParamByName('p').Value := Cell[20,i].AsInteger;
                ParamByName('q').Value := Cell[21,i].AsInteger;
                ParamByName('r').Value := Cell[22,i].AsInteger;
                ParamByName('s').Value := Cell[23,i].AsInteger;
                ExecSQL;
                if Cell[23,i].AsInteger = 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel buku besar barang
                  SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                  //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                  ParamByName('b').Value := Cell[11,i].AsInteger;
                  ParamByName('c').Value := 'SP';
                  ParamByName('d').Value := LGUdang.Caption;
                  ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                  ParamByName('f').Value := notransaksi;
                  ParamByName('g').Value := 'Penjualan Tunai '+txtcustomer.Text+', '+txtreferensi.Text;
                  ParamByName('h').Value := Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                  hpp := DM.HitungHPPPenjualan(Cell[11,i].AsInteger,Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                  ParamByName('i').Value := hpp;
                  ParamByName('j').Value := (Cell[8,i].AsFloat/(Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat));
                  ExecSQL;
                  //masuk buku besar barang detail
                  DM.AmbilNoBuku(Cell[11,i].AsInteger,StrToInt(LGUdang.Caption),Cell[3,i].AsFloat*Cell[13,i].AsFloat,notransaksi,'SP');

                  DM.InsertBukuBesarAkun(Cell[21,i].AsInteger,Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,hpp*Cell[3,i].AsFloat*Cell[13,i].AsFloat,0);
                  DM.InsertBukuBesarAkun(Cell[19,i].AsInteger,Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,0,hpp*Cell[3,i].AsFloat*Cell[13,i].AsFloat);


                end;
                DM.InsertBukuBesarAkun(Cell[20,i].AsInteger,Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,0,Cell[17,i].AsFloat);
                if Cell[18,i].AsFloat > 0 then
                  DM.InsertBukuBesarAkun(Cell[22,i].AsInteger,Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,0,Cell[18,i].AsFloat);
              end;
            end;
          end;
          if txtbiaya.Value > 0 then begin
            DM.InsertBukuBesarAkun(StrToInt(LBiayaLain.Caption),dtptanggal.Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,0,txtbiaya.Value);
          end;
          DM.InsertBukuBesarAkun(StrToInt(Lkas.Caption),Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,txttotal.Value,0);

          DM.InsertBukuBesarKontak(StrToInt(LCustomer.Caption),dtptanggal.Date,'SP',notransaksi,'Penjualan Tunai, No. '+txtreferensi.Text,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := notransaksi;
            ParamByName('t').Value := 'SO';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := notransaksi;
              ParamByName('b').Value := 'SO';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := notransaksi;
              ParamByName('t').Value := 'SO';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end;
            dm.Q_NotaPenjualanTunai.Close;
            DM.Q_NotaPenjualanTunai.ParamByName('np').Value := notransaksi;
            DM.Q_NotaPenjualanTunai.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := notransaksi;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'SO';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PenjualanTunai.ShowReport(True);
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
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:a and tipe=:b';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := 'SP';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:a and tipe=:b';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := 'SP';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:a and tipe=:b';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := 'SP';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'SP';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := LID.Caption;
          ParamByName('t').Value := 'SP';
          ExecSQL;
          Close;
          SQL.Clear;
          // update ke tabel penjualan order
          SQL.Text := 'update tbl_penjualantunai set nokontak=:b, nogudang=:c,nokas=:d,tgltransaksi=:e,pocustomer=:g, ' +
                      'totaldpp=:p,totalpajak=:q,biayalain=:r,noakunbiayalain=:s,total=:t,nosales=:u where nopenjualantunai=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := LCustomer.Caption;
          ParamByName('c').Value := LGudang.Caption;
          ParamByName('d').Value := LKas.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('g').Value := txtpo.Text;
          ParamByName('p').Value := txtsubtotal.Value;
          ParamByName('q').Value := txtpajak.Value;
          ParamByName('r').Value := txtbiaya.Value;
          ParamByName('s').Value := LBiayaLain.Caption;
          ParamByName('t').Value := txttotal.Value;
          ParamByName('u').Value := LSalesman.Caption;
          ExecSQL;
          //hapus detil penjualan order
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penjualantunaidetail where nopenjualantunai=:np';
          ParamByName('np').Value := LID.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel penjualan order detil
                SQL.Text := 'insert into tbl_penjualantunaidetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s)';
                ParamByName('a').Value := LID.Caption;
                ParamByName('b').Value := Cell[11,i].AsInteger;
                ParamByName('c').Value := Cell[3,i].AsFloat;
                ParamByName('d').Value := Cell[5,i].AsFloat;
                ParamByName('e').Value := Cell[6,i].AsFloat;
                ParamByName('f').Value := Cell[7,i].AsFloat;
                ParamByName('g').Value := Cell[8,i].AsFloat;
                ParamByName('h').Value := Cell[12,i].AsInteger;
                ParamByName('i').Value := Cell[13,i].AsFloat;
                ParamByName('j').Value := Cell[17,i].AsFloat;
                ParamByName('k').Value := Cell[18,i].AsFloat;
                ParamByName('l').Value := Cell[14,i].AsInteger;
                ParamByName('m').Value := Cell[15,i].AsInteger;
                ParamByName('n').Value := Cell[16,i].AsFloat;
                ParamByName('o').Value := Cell[19,i].AsInteger;
                ParamByName('p').Value := Cell[20,i].AsInteger;
                ParamByName('q').Value := Cell[21,i].AsInteger;
                ParamByName('r').Value := Cell[22,i].AsInteger;
                ParamByName('s').Value := Cell[23,i].AsInteger;
                ExecSQL;

                if Cell[23,i].AsInteger = 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel buku besar barang
                  SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                  //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                  ParamByName('b').Value := Cell[11,i].AsInteger;
                  ParamByName('c').Value := 'SP';
                  ParamByName('d').Value := LGUdang.Caption;
                  ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
                  ParamByName('f').Value := LID.Caption;
                  ParamByName('g').Value := 'Penjualan Tunai '+txtcustomer.Text+', '+txtreferensi.Text;
                  ParamByName('h').Value := Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat;
                  hpp := DM.HitungHPPPenjualan(Cell[11,i].AsInteger,Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat);
                  ParamByName('i').Value := hpp;
                  ParamByName('j').Value := (Cell[8,i].AsFloat/(Cell[3,i].AsFloat*dbgbarang.Cell[13,i].AsFloat));
                  ExecSQL;
                  //masuk buku besar barang detail
                  DM.AmbilNoBuku(Cell[11,i].AsInteger,StrToInt(LGUdang.Caption),Cell[3,i].AsFloat*Cell[13,i].AsFloat,strtoint(LID.Caption),'SP');

                  DM.InsertBukuBesarAkun(Cell[21,i].AsInteger,Date,'SP',strtoint(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,hpp*Cell[3,i].AsFloat*Cell[13,i].AsFloat,0);
                  DM.InsertBukuBesarAkun(Cell[19,i].AsInteger,Date,'SP',strtoint(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,0,hpp*Cell[3,i].AsFloat*Cell[13,i].AsFloat);

                end;
                DM.InsertBukuBesarAkun(Cell[20,i].AsInteger,Date,'SP',strtoint(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,0,Cell[17,i].AsFloat);
                if Cell[18,i].AsFloat > 0 then
                  DM.InsertBukuBesarAkun(Cell[22,i].AsInteger,Date,'SP',strtoint(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,0,Cell[18,i].AsFloat);
              end;
            end;
          end;
          if txtbiaya.Value > 0 then begin
            DM.InsertBukuBesarAkun(StrToInt(LBiayaLain.Caption),dtptanggal.Date,'SP',StrToInt(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,0,txtbiaya.Value);
          end;
          DM.InsertBukuBesarAkun(StrToInt(Lkas.Caption),Date,'SP',strtoint(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,txttotal.Value,0);

          DM.InsertBukuBesarKontak(StrToInt(LCustomer.Caption),dtptanggal.Date,'SP',StrToInt(LID.Caption),'Penjualan Tunai, No. '+txtreferensi.Text,txttotal.Value);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'SP';
            Open;
            if IsEmpty then begin
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
              ParamByName('a').Value := LID.Caption;
              ParamByName('b').Value := 'SP';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end else begin
              Close;
              SQL.Clear;
              SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
              ParamByName('np').Value := LID.Caption;
              ParamByName('t').Value := 'SP';
              ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(txttotal.Value));
              ExecSQL;
            end;
            dm.Q_NotaPenjualanTunai.Close;
            DM.Q_NotaPenjualanTunai.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaPenjualanTunai.Open;
            dm.Q_NotaTerbilang.Close;
            DM.Q_NotaTerbilang.ParamByName('np').Value := LID.Caption;
            DM.Q_NotaTerbilang.ParamByName('t').Value := 'SP';
            DM.Q_NotaTerbilang.Open;
            DM.Nota_PenjualanTunai.ShowReport(True);
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

procedure TFrm_PenjualanTunai.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_PenjualanTunai.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;

procedure TFrm_PenjualanTunai.txtsalesmanButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 2;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtsalesman.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LSalesman.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_PenjualanTunai.txtsalesmanKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsalesmanButtonClick(nil);
end;

procedure TFrm_PenjualanTunai.dtptanggalChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi('SA',dtptanggal.Date);
end;

end.
