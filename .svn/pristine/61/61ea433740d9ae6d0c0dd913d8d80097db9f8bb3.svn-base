unit USettingWewenang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, StdCtrls, Mask, RzEdit,
  RzButton, RzLabel, ExtCtrls, RzPanel, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzRadChk, RzTabs, RzCmboBx, RzBtnEdt,
  RzRadGrp, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFrm_SettingWewenang = class(TForm)
    RzPanel2: TRzPanel;
    BtnSimpan: TRzBitBtn;
    BtnKeluar: TRzBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    txtNama: TRzEdit;
    txtpassword: TRzEdit;
    RzPanel3: TRzPanel;
    RzLabel5: TRzLabel;
    TabSheet3: TRzTabSheet;
    cbdata: TRzCheckBox;
    GBData: TRzGroupBox;
    Data1: TRzCheckBox;
    Data2: TRzCheckBox;
    Data3: TRzCheckBox;
    TabSheet4: TRzTabSheet;
    cbpembelian: TRzCheckBox;
    GBPembelian: TRzGroupBox;
    Pembelian1: TRzCheckBox;
    Pembelian2: TRzCheckBox;
    Pembelian3: TRzCheckBox;
    Pembelian7: TRzCheckBox;
    Pembelian5: TRzCheckBox;
    Pembelian6: TRzCheckBox;
    TabSheet5: TRzTabSheet;
    cbpenjualan: TRzCheckBox;
    GBPenjualan: TRzGroupBox;
    Penjualan3: TRzCheckBox;
    Penjualan1: TRzCheckBox;
    TabSheet7: TRzTabSheet;
    cbpersediaan: TRzCheckBox;
    GBPersediaan: TRzGroupBox;
    Persediaan1: TRzCheckBox;
    Persediaan2: TRzCheckBox;
    Persediaan3: TRzCheckBox;
    TabSheet8: TRzTabSheet;
    cblaporan: TRzCheckBox;
    GBLaporan: TRzGroupBox;
    Laporan1: TRzCheckBox;
    Laporan2: TRzCheckBox;
    Laporan3: TRzCheckBox;
    Laporan4: TRzCheckBox;
    TabSheet2: TRzTabSheet;
    PnLain: TRzPanel;
    nxGrd: TNextGrid;
    NxIncrementColumn1: TNxIncrementColumn;
    NxTextColumn1: TNxTreeColumn;
    NxTextColumn2: TNxCheckBoxColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    RzPanel1: TRzPanel;
    BtnBaru: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    Laporan5: TRzCheckBox;
    Data4: TRzCheckBox;
    Data5: TRzCheckBox;
    TabSheet6: TRzTabSheet;
    cbkas: TRzCheckBox;
    GBKas: TRzGroupBox;
    Kas3: TRzCheckBox;
    Kas1: TRzCheckBox;
    Kas2: TRzCheckBox;
    Kas4: TRzCheckBox;
    Kas5: TRzCheckBox;
    Penjualan2: TRzCheckBox;
    Data6: TRzCheckBox;
    Penjualan6: TRzCheckBox;
    Penjualan7: TRzCheckBox;
    Penjualan8: TRzCheckBox;
    Data7: TRzCheckBox;
    Data8: TRzCheckBox;
    Pembelian9: TRzCheckBox;
    Pembelian8: TRzCheckBox;
    Penjualan9: TRzCheckBox;
    Persediaan4: TRzCheckBox;
    Persediaan5: TRzCheckBox;
    Kas6: TRzCheckBox;
    Kas7: TRzCheckBox;
    TabSheet9: TRzTabSheet;
    GBBukuBesar: TRzGroupBox;
    BukuBesar1: TRzCheckBox;
    BukuBesar2: TRzCheckBox;
    BukuBesar3: TRzCheckBox;
    cbbukubesar: TRzCheckBox;
    Penjualan4: TRzCheckBox;
    Data9: TRzCheckBox;
    Pembelian4: TRzCheckBox;
    BukuBesar4: TRzCheckBox;
    Penjualan10: TRzCheckBox;
    Data10: TRzCheckBox;
    ZQuery1: TZQuery;
    Persediaan6: TRzCheckBox;
    Penjualan5: TRzCheckBox;
    Penjualan11: TRzCheckBox;
    Penjualan12: TRzCheckBox;
    RzGroupBox1: TRzGroupBox;
    cxGrid1: TcxGrid;
    cxtbGudang: TcxGridTableView;
    cxColPilih: TcxGridColumn;
    cxColNamaGudang: TcxGridColumn;
    cxColNoGudang: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    RzLabel6: TRzLabel;
    cxlCabang: TcxLookupComboBox;
    zqrCabang: TZReadOnlyQuery;
    dsCabang: TDataSource;
    RzLabel7: TRzLabel;
    Data11: TRzCheckBox;
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure nxGrdAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure cbdataClick(Sender: TObject);
    procedure cbpembelianClick(Sender: TObject);
    procedure cbpenjualanClick(Sender: TObject);
    procedure cbpersediaanClick(Sender: TObject);
    procedure cblaporanClick(Sender: TObject);
    procedure cbkasClick(Sender: TObject);
    procedure cbbukubesarClick(Sender: TObject);
    procedure BukuBesar3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function FindRow(sKode: string): Integer;
  public
    { Public declarations }
    procedure ClearText;
    procedure ProsesTree(sKode: string);
  end;

var
  Frm_SettingWewenang: TFrm_SettingWewenang;

implementation

uses UDM, UUser, UDataGudang;

{$R *.dfm}

procedure TFrm_SettingWewenang.BtnBaruClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to nxGrd.RowCount - 1 do
  nxGrd.Cell[2,i].AsBoolean := True;
end;

procedure TFrm_SettingWewenang.BtnBatalClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to nxGrd.RowCount - 1 do
  nxGrd.Cell[2,i].AsBoolean := False;
end;

function TFrm_SettingWewenang.FindRow(sKode: string): Integer;
var
  i: Integer;
begin
  for i := 0 to nxGrd.RowCount - 1 do begin
    if nxGrd.Cell[3,i].AsString = sKode then begin
      Break;
    end;
  end;
  Result := i;
end;

procedure TFrm_SettingWewenang.nxGrdAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
var
  RowParent,i,
  iFirstChild : integer;
  bNoCheck: boolean;
begin
  try
    RowParent := nxGrd.GetParent(ARow);
    if (ACol = 2 ) and (RowParent > -1) then begin
      bNoCheck := True;
      for i := RowParent+1 to nxGrd.GetLastChild(RowParent) do begin
        if nxGrd.Cell[2,i].AsBoolean then begin
          bNoCheck := False;
          nxGrd.Cell[2,RowParent].AsBoolean := True;
          Break;
        end;
      end;
      if bNoCheck then nxGrd.Cell[3,RowParent].AsBoolean := False;
    end;

    if (ACol = 2) and (RowParent = -1) then begin
      iFirstChild := nxGrd.GetFirstChild(ARow);
      if nxGrd.Cell[ACol,ARow].AsBoolean then begin
        //nxGrd.Cell[ACol,iFirstChild].AsBoolean := True
        for i := iFirstChild to nxGrd.GetLastChild(ARow) do
          nxGrd.Cell[2,i].AsBoolean := True;
      end
      else begin
        for i := iFirstChild to nxGrd.GetLastChild(ARow) do
          nxGrd.Cell[2,i].AsBoolean := False;
      end;
    end;
  except
  end;

end;

procedure TFrm_SettingWewenang.ProsesTree(sKode: string);
var
  i: Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM tbl_tpl_wewenang WHERE parent = ''' + sKode + '''';
    Open;
    while not Eof do begin
      if sKode = '0' then
        nxGrd.AddRow()
      else begin
        i := FindRow(FieldByName('parent').AsString);
        nxGrd.AddChildRow(i, crLast);
      end;

      nxGrd.Cell[3,nxGrd.LastAddedRow].AsString := FieldByName('kode').AsString;
      nxGrd.Cell[2,nxGrd.LastAddedRow].AsBoolean := True;
      nxGrd.Cell[1,nxGrd.LastAddedRow].AsString := FieldByName('keterangan').AsString;
      nxGrd.Cell[4,nxGrd.LastAddedRow].AsString := FieldByName('nm_comp').AsString;

      ProsesTree(FieldByName('kode').AsString);

      Next;
    end;
    Free;
  end;
end;

procedure TFrm_SettingWewenang.BtnSimpanClick(Sender: TObject);
begin
  if txtNama.Text = '' then begin
    txtNama.SetFocus;
    Exit;
  end;
  if txtpassword.Text = '' then begin
    txtpassword.SetFocus;
    Exit;
  end;
  if txtNama.Enabled = True then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_user where namauser =:nu';
      ParamByName('nu').Value := txtNama.Text;
      ExecSQL;
      if not IsEmpty then begin
        MessageDlg('Nama telah digunakan. Gunakan nama lain!',mtError,[mbOK],0);
        Free;
        Exit;
      end;
      Free;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_SettingWewenang.BtnKeluarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_SettingWewenang.ClearText;
begin
  txtNama.Clear;
  txtNama.Enabled := True;
  txtpassword.Clear;
  txtpassword.Enabled := True;
  cbdata.Checked := True;
  cbdataClick(nil);
  cbbukubesar.Checked := True;
  cbbukubesarClick(nil);
  cbpenjualan.Checked := True;
  cbpenjualanClick(nil);
  cbpembelian.Checked := True;
  cbpembelianClick(nil);
  cbkas.Checked := True;
  cbkasClick(nil);
  cbpersediaan.Checked := True;
  cbpersediaanClick(nil);
  cblaporan.Checked := True;
  cblaporanClick(nil);
  nxGrd.ClearRows;
  RzPageControl1.ActivePage := TabSheet1;
end;

procedure TFrm_SettingWewenang.cbdataClick(Sender: TObject);
begin
  if cbdata.Checked = True then begin
    GBData.Enabled := True;
    Data1.Checked := True;
    Data2.Checked := True;
    Data3.Checked := True;
    Data4.Checked := True;
    Data5.Checked := True;
    Data6.Checked := True;
    Data7.Checked := True;
    Data8.Checked := True;
    Data9.Checked := True;
    Data10.Checked := True;
    Data11.Checked := True;
  end else begin
    GBData.Enabled := False;
    Data1.Checked := False;
    Data2.Checked := False;
    Data3.Checked := False;
    Data4.Checked := False;
    Data5.Checked := False;
    Data6.Checked := False;
    Data7.Checked := False;
    Data8.Checked := False;
    Data9.Checked := False;
    Data10.Checked := False;
    Data11.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cbpembelianClick(Sender: TObject);
begin
  if cbpembelian.Checked = True then begin
    GBPembelian.Enabled := True;
    Pembelian1.Checked := True;
    Pembelian2.Checked := True;
    Pembelian3.Checked := True;
    Pembelian4.Checked := True;
    Pembelian5.Checked := True;
    Pembelian6.Checked := True;
    Pembelian7.Checked := True;
    Pembelian8.Checked := True;
    Pembelian9.Checked := True;
  end else begin
    GBPembelian.Enabled := False;
    Pembelian1.Checked := False;
    Pembelian2.Checked := False;
    Pembelian3.Checked := False;
    Pembelian4.Checked := False;
    Pembelian5.Checked := False;
    Pembelian6.Checked := False;
    Pembelian7.Checked := False;
    Pembelian8.Checked := False;
    Pembelian9.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cbpenjualanClick(Sender: TObject);
begin
  if cbpenjualan.Checked = True then begin
    GBPenjualan.Enabled := True;
    Penjualan1.Checked := True;
    Penjualan2.Checked := True;
    Penjualan3.Checked := True;
    Penjualan4.Checked := True;
    Penjualan5.Checked := True;
    Penjualan6.Checked := True;
    Penjualan7.Checked := True;
    Penjualan8.Checked := True;
    Penjualan9.Checked := True;
    Penjualan10.Checked := True;
    Penjualan11.Checked := True;
    Penjualan12.Checked := True;
  end else begin
    GBPenjualan.Enabled := False;
    Penjualan1.Checked := False;
    Penjualan2.Checked := False;
    Penjualan3.Checked := False;
    Penjualan4.Checked := False;
    Penjualan5.Checked := False;
    Penjualan6.Checked := False;
    Penjualan7.Checked := False;
    Penjualan8.Checked := False;
    Penjualan9.Checked := False;
    Penjualan10.Checked := False;
    Penjualan11.Checked := False;
    Penjualan12.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cbpersediaanClick(Sender: TObject);
begin
  if cbpersediaan.Checked = True then begin
    GBPersediaan.Enabled := True;
    Persediaan1.Checked := True;
    Persediaan2.Checked := True;
    Persediaan3.Checked := True;
    Persediaan4.Checked := True;
    Persediaan5.Checked := True;
    Persediaan6.Checked := True;
  end else begin
    GBPersediaan.Enabled := False;
    Persediaan1.Checked := False;
    Persediaan2.Checked := False;
    Persediaan3.Checked := False;
    Persediaan4.Checked := False;
    Persediaan5.Checked := False;
    Persediaan6.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cblaporanClick(Sender: TObject);
begin
  if cblaporan.Checked = True then begin
    GBLaporan.Enabled := True;
    Laporan1.Checked := True;
    Laporan2.Checked := True;
    Laporan3.Checked := True;
    Laporan4.Checked := True;
    Laporan5.Checked := True;
  end else begin
    GBLaporan.Enabled := False;
    Laporan1.Checked := False;
    Laporan2.Checked := False;
    Laporan3.Checked := False;
    Laporan4.Checked := False;
    Laporan5.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cbkasClick(Sender: TObject);
begin
  if cbkas.Checked = True then begin
    GBKas.Enabled := True;
    Kas1.Checked := True;
    Kas2.Checked := True;
    Kas3.Checked := True;
    Kas4.Checked := True;
    Kas5.Checked := True;
    Kas6.Checked := True;
    Kas7.Checked := True;
  end else begin
    GBKas.Enabled := False;
    Kas1.Checked := False;
    Kas2.Checked := False;
    Kas3.Checked := False;
    Kas4.Checked := False;
    Kas5.Checked := False;
    Kas6.Checked := False;
    Kas7.Checked := False;
  end;
end;

procedure TFrm_SettingWewenang.cbbukubesarClick(Sender: TObject);
begin
  if cbbukubesar.Checked = True then begin
    GBBukuBesar.Enabled := True;
    BukuBesar1.Checked := True;
    BukuBesar2.Checked := True;
    BukuBesar3.Checked := True;
    BukuBesar4.Checked := True;
  end else begin
    GBBukuBesar.Enabled := False;
    BukuBesar1.Checked := False;
    BukuBesar2.Checked := False;
    BukuBesar3.Checked := False;
    BukuBesar3Click(nil);
  end;
end;

procedure TFrm_SettingWewenang.BukuBesar3Click(Sender: TObject);
begin
  if BukuBesar3.Checked = True then
    BukuBesar4.Enabled := True
  else BukuBesar4.Enabled := False;
  BukuBesar4.Checked := False;
end;

procedure TFrm_SettingWewenang.FormCreate(Sender: TObject);
begin
  zqrCabang.Open;
end;

end.
