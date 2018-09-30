unit UInputBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  Grids, DBGrids, SMDBGrid, RzButton, RzPanel, RzTabs, StdCtrls, RzCmboBx,
  Mask, ExtCtrls, RzLabel, RzRadChk, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, ImgList,
  ComCtrls, RzDTP, frxExportXLS, frxExportMail, frxClass, frxExportPDF,
  frxDBSet, NxDBColumns, NxDBGrid, RzBtnEdt, RzRadGrp;

type
  TFrm_InputBarang = class(TForm)
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    RzPanel1: TRzPanel;
    RzPageControl1: TRzPageControl;
    RzPanel3: TRzPanel;
    LSatuan: TRzLabel;
    LID: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label13: TLabel;
    Label27: TLabel;
    txtkode: TRzEdit;
    txtnama: TRzEdit;
    TabSheet1: TRzTabSheet;
    Label6: TLabel;
    Label4: TLabel;
    Label28: TLabel;
    txtStok: TRzNumericEdit;
    txtMin: TRzNumericEdit;
    Label20: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    txtbeli: TRzNumericEdit;
    txtjual: TRzNumericEdit;
    Label5: TLabel;
    txthpp: TRzNumericEdit;
    Label11: TLabel;
    QSatuan: TZQuery;
    TabSheet2: TRzTabSheet;
    GBAkun: TRzGroupBox;
    RzLabel11: TRzLabel;
    txtakunhpp: TRzButtonEdit;
    txtakunpersediaan: TRzButtonEdit;
    RzLabel15: TRzLabel;
    LAkunHpp: TRzLabel;
    LAkunPersediaan: TRzLabel;
    TabSheet3: TRzTabSheet;
    DBGHarga: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn3: TNxNumberColumn;
    NxImageColumn1: TNxImageColumn;
    NxNumberColumn1: TNxNumberColumn;
    Label1: TLabel;
    Label3: TLabel;
    LKelompokBarang: TRzLabel;
    QKategori: TZQuery;
    RzPanel4: TRzPanel;
    GBTipe: TRzRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    txtpo: TRzNumericEdit;
    Label9: TLabel;
    Label16: TLabel;
    txtso: TRzNumericEdit;
    txtsatuan: TRzButtonEdit;
    txtkelompokbarang: TRzButtonEdit;
    Label22: TLabel;
    txtpajakbeli: TRzButtonEdit;
    Label24: TLabel;
    txtpajakjual: TRzButtonEdit;
    LPajakPembelian: TRzLabel;
    LPajakPenjualan: TRzLabel;
    Label29: TLabel;
    Label30: TLabel;
    txtfield1: TRzEdit;
    Label31: TLabel;
    Label32: TLabel;
    txtfield2: TRzEdit;
    cbaktif: TRzCheckBox;
    procedure BtCloseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure txtakunhppButtonClick(Sender: TObject);
    procedure txtakunpersediaanButtonClick(Sender: TObject);
    procedure DBGHargaCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure DBGHargaCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure DBGHargaExit(Sender: TObject);
    procedure DBGHargaSelectionMove(Sender: TObject; var ACol: Integer;
      ARow: Integer; Key: TMoveSelectionKey);
    procedure txtsatuanButtonClick(Sender: TObject);
    procedure txtsatuanKeyPress(Sender: TObject; var Key: Char);
    procedure txtakunpersediaanKeyPress(Sender: TObject; var Key: Char);
    procedure txtakunhppKeyPress(Sender: TObject; var Key: Char);
    procedure txtkelompokbarangButtonClick(Sender: TObject);
    procedure txtkelompokbarangKeyPress(Sender: TObject; var Key: Char);
    procedure txtpajakbeliButtonClick(Sender: TObject);
    procedure txtpajakbeliKeyPress(Sender: TObject; var Key: Char);
    procedure txtpajakjualButtonClick(Sender: TObject);
    procedure txtpajakjualKeyPress(Sender: TObject; var Key: Char);
    procedure GBTipeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure CekSO;
    procedure CekPO;
  end;

var
  Frm_InputBarang: TFrm_InputBarang;

implementation

uses UDM, NxCells, UDataSatuan, UDataAkun, UDataKelompokBarang, UDataPajak;

{$R *.dfm}

{ TFrm_InputBarang }

procedure TFrm_InputBarang.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtsatuan.ReadOnly := False;
  txtsatuan.Clear;
  lSatuan.Caption := '0';
  txtnama.Clear;
  txtkelompokbarang.Clear;
  LKelompokBarang.Caption := '0';
  txtfield1.Clear;
  txtfield2.Clear;
  GBTipe.Enabled := True;
  GBAkun.Enabled := True;
  GBTipe.ItemIndex := 0;
  GBTipeClick(nil);
  txtakunhpp.Clear;
  txtakunpersediaan.Clear;
  LAkunHpp.Caption := '0';
  LAkunPersediaan.Caption := '0';
  cbaktif.Checked := True;
  txtMin.Value := 0;
  txtStok.Value := 0;
  txtPO.Value := 0;
  txtSO.Value := 0;
  txtbeli.Value := 0;
  txtpajakbeli.Text := '-';
  LPajakPembelian.Caption := '0';
  txtjual.Value := 0;
  txtpajakjual.Text := '-';
  LPajakPenjualan.Caption := '0';
  txthpp.Value := 0;    
  DBGHarga.ClearRows;
end;

procedure TFrm_InputBarang.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputBarang.BtSaveClick(Sender: TObject);
begin
  if txtNama.Text = '' then begin
    MessageDlg('Nama : harus diisi',mtError,[mbOK],0);
    txtNama.SetFocus;
    Exit;
  end;
  if LSatuan.Caption = '0' then begin
    MessageDlg('Satuan : harus diisi',mtError,[mbOK],0);
    txtsatuan.SetFocus;
    Exit;
  end;
  if LAkunPersediaan.Caption = '0' then begin
    MessageDlg('Kode Akun untuk '+RzLabel15.Caption+' Tidak ada atau tidak benar !!'#10#13'Mohon periksa kembali kode akun yang diperlukan.',mtError,[mbOK],0);
    Exit;
  end;
  if GBTipe.ItemIndex = 0 then begin
    if LAkunHpp.Caption = '0' then begin
      MessageDlg('Kode Akun untuk '+RzLabel11.Caption+' Tidak ada atau tidak benar !!'#10#13'Mohon periksa kembali kode akun yang diperlukan.',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_barang where kodebarang=:kb';
    ParamByName('kb').Value := txtkode.Text;
    Open;
    if not IsEmpty then begin
      if LID.Caption <> IntToStr(FieldValues['nobarang']) then begin
        MessageDlg('Kode barang sudah terdaftar',mtError,[mbOK],0);
        txtkode.SetFocus;
      end;
    end;
    Free;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_InputBarang.txtakunhppButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtakunhpp.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LAkunHpp.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputBarang.txtakunpersediaanButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtakunpersediaan.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LAkunPersediaan.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputBarang.DBGHargaCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 2 then begin
    DBGHarga.DeleteRow(ARow);
    if DBGHarga.RowCount = 0 then DBGHarga.AddRow();
  end;
end;

procedure TFrm_InputBarang.DBGHargaCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 0 then begin
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := 0;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      if Frm_DataSatuan.QData.FieldValues['nosatuan'] = LSatuan.Caption then begin
        MessageDlg('Satuan telah dipakai sebagai satuan dasar',mtError,[mbOK],0);
      end else begin
        DBGHarga.Cell[0,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
        DBGHarga.Cell[3,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      end;
    end;
  end;
end;

procedure TFrm_InputBarang.DBGHargaExit(Sender: TObject);
var
  i : integer;
begin
  for i:=0 to DBGHarga.RowCount-1 do begin
    if DBGHarga.Cell[0,i].AsString = '' then begin
      DBGHarga.DeleteRow(i);
      if DBGHarga.RowCount = 0 then DBGHarga.AddRow();
    end;
  end;
end;

procedure TFrm_InputBarang.DBGHargaSelectionMove(Sender: TObject;
  var ACol: Integer; ARow: Integer; Key: TMoveSelectionKey);
var
  i:Integer;
begin
  if ACol = 2 then begin
    if (DBGHarga.Cell[0,ARow].AsString <> '') and (DBGHarga.Cell[1,ARow].AsFloat <> 0) then begin
      if ARow = DBGHarga.RowCount-1 then begin
        i:=DBGHarga.AddRow();
        DBGHarga.ScrollToRow(i);
      end;
    end;
  end;
end;

procedure TFrm_InputBarang.txtsatuanButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
  nomorbarang := 0;
  Frm_DataSatuan.RefreshQ;
  if Frm_DataSatuan.ShowModal = mrok then begin
    txtsatuan.Text := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
    LSatuan.Caption := Frm_DataSatuan.QData.FieldValues['nosatuan'];
    DBGHarga.ClearRows;
    DBGHarga.AddRow();
  end;
end;

procedure TFrm_InputBarang.txtsatuanKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsatuanButtonClick(nil);
end;

procedure TFrm_InputBarang.txtakunpersediaanKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtakunpersediaanButtonClick(nil);
end;

procedure TFrm_InputBarang.txtakunhppKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtakunhppButtonClick(nil);
end;

procedure TFrm_InputBarang.txtkelompokbarangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKelompokBarang, Frm_DataKelompokBarang);
  Frm_DataKelompokBarang.RefreshQ;
  if Frm_DataKelompokBarang.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      LKelompokBarang.Caption := Frm_DataKelompokBarang.QData.FieldValues['nokelompokbarang'];
      txtkelompokbarang.Text := Frm_DataKelompokBarang.QData.FieldValues['kelompokbarang'];
      LAkunHpp.Caption := Frm_DataKelompokBarang.QData.FieldValues['noakunhpp'];
      LAkunPersediaan.Caption := Frm_DataKelompokBarang.QData.FieldValues['noakunpersediaan'];
      GBTipe.ItemIndex := Frm_DataKelompokBarang.QData.FieldValues['tipebarang'];
      GBTipeClick(nil);
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunHpp.Caption;
      Open;
      if IsEmpty then begin
        LAkunHpp.Caption := '0';
        txtakunhpp.Clear;
      end else txtakunhpp.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunPersediaan.Caption;
      Open;
      if IsEmpty then begin
        LAkunPersediaan.Caption := '0';
        txtakunpersediaan.Clear;
      end else txtakunpersediaan.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];    
      Free;
    end;
  end;
end;

procedure TFrm_InputBarang.txtkelompokbarangKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkelompokbarangButtonClick(nil);
end;

procedure TFrm_InputBarang.txtpajakbeliButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
  Frm_DataPajak.RefreshQ;
  if Frm_DataPajak.ShowModal = mrok then begin
    txtpajakbeli.Text := Frm_DataPajak.QData.FieldValues['kodepajak'];
    LPajakPembelian.Caption := Frm_DataPajak.QData.FieldValues['nopajak'];
  end;
end;

procedure TFrm_InputBarang.txtpajakbeliKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtpajakbeliButtonClick(nil);
end;

procedure TFrm_InputBarang.txtpajakjualButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataPajak, Frm_DataPajak);
  Frm_DataPajak.RefreshQ;
  if Frm_DataPajak.ShowModal = mrok then begin
    txtpajakjual.Text := Frm_DataPajak.QData.FieldValues['kodepajak'];
    LPajakPenjualan.Caption := Frm_DataPajak.QData.FieldValues['nopajak'];
  end;
end;

procedure TFrm_InputBarang.txtpajakjualKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtpajakjualButtonClick(nil);
end;

procedure TFrm_InputBarang.GBTipeClick(Sender: TObject);
begin
  if GBTipe.ItemIndex = 0 then begin
    RzLabel15.Caption := 'Persediaan :';
    RzLabel11.Visible := True;
    txtakunhpp.Visible := True;
  end else if GBTipe.ItemIndex = 1 then begin
    RzLabel15.Caption := 'Beban :';
    RzLabel11.Visible := False;
    txtakunhpp.Visible := False;
  end;
end;

procedure TFrm_InputBarang.CekPO;
begin
  if LID.Caption = '0' then begin
    txtpo.Value := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'SELECT ifnull(a.qty-b.qty,0) AS sisa FROM ' +
                  '(SELECT nopembelianorder,nobarang,qty*nilai as qty FROM tbl_pembelianorderdetail WHERE nobarang=:aa)AS a ' +
                  'LEFT JOIN (SELECT a.nopembelianorder,b.nobarang,b.qty*b.nilai as qty FROM ' +
                  '(SELECT nopembelianterima,nopembelianorder FROM tbl_pembelianterima)AS a ' +
                  'LEFT JOIN tbl_pembelianterimadetail AS b ON b.nopembelianterima=a.nopembelianterima)AS b ON b.nopembelianorder=a.nopembelianorder AND b.nobarang=a.nobarang';
      ParamByName('aa').Value := LID.Caption;
      Open;
      if IsEmpty then
        txtpo.Value := 0
      else txtpo.Value := FieldValues['sisa'];
      Free;
    end;
  end;
end;

procedure TFrm_InputBarang.CekSO;
begin
  if LID.Caption = '0' then begin
    txtso.Value := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'SELECT ifnull(a.qty-b.qty,0) AS sisa FROM ' +
                  '(SELECT nopenjualanorder,nobarang,qty,nodetailpenjualanorder FROM tbl_penjualanorderdetail WHERE nobarang=:aa)AS a ' +
                  'LEFT JOIN (SELECT a.nopenjualanorder,b.nobarang,b.qty,b.nourutso FROM ' +
                  '(SELECT nopenjualankirim,nopenjualanorder FROM tbl_penjualankirim)AS a ' +
                  'LEFT JOIN tbl_penjualankirimdetail AS b ON b.nopenjualankirim=a.nopenjualankirim)AS b ON b.nopenjualanorder=a.nopenjualanorder AND b.nobarang=a.nobarang AND b.nourutso=a.nodetailpenjualanorder';
      ParamByName('aa').Value := LID.Caption;
      Open;
      if IsEmpty then
        txtso.Value := 0
      else txtso.Value := FieldValues['sisa'];
      Free;
    end;
  end;
end;

end.
