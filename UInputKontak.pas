unit UInputKontak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBtnEdt, RzEdit, StdCtrls, RzCmboBx, Mask, RzLabel, RzTabs,
  RzButton, ExtCtrls, RzPanel, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RzRadChk, DSPack, Menus, DSUtil, DirectShow9, jpeg,
  NxColumnClasses, NxColumns, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, RzShellDialogs;

type
  TFrm_InputKontak = class(TForm)
    RzPanel1: TRzPanel;
    RzPageControl1: TRzPageControl;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    LNama: TRzLabel;
    txtkode: TRzEdit;
    txtnama: TRzEdit;
    RzLabel2: TRzLabel;
    RzPanel5: TRzPanel;
    txttelpon1: TRzEdit;
    RzLabel4: TRzLabel;
    txttelpon2: TRzEdit;
    RzLabel6: TRzLabel;
    txtfax: TRzEdit;
    RzLabel8: TRzLabel;
    txthp: TRzEdit;
    RzLabel10: TRzLabel;
    txtemail: TRzEdit;
    RzLabel11: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    txtalamat1: TRzEdit;
    txtalamat2: TRzEdit;
    RzLabel21: TRzLabel;
    txtkota: TRzEdit;
    RzLabel20: TRzLabel;
    txtzip: TRzEdit;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    ZQuery1: TZQuery;
    LID: TRzLabel;
    RzPanel4: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel7: TRzLabel;
    cbtipe: TRzComboBox;
    RzLabel32: TRzLabel;
    txtcatatan: TRzMemo;
    TabSheet3: TRzTabSheet;
    LPlafon: TRzLabel;
    txtplafon: TRzNumericEdit;
    RzLabel9: TRzLabel;
    txtnegara: TRzEdit;
    txtsaldo: TRzNumericEdit;
    RzPanel6: TRzPanel;
    BtnPilih: TRzMenuButton;
    BtnHapusGambar: TRzBitBtn;
    PopupMenu1: TPopupMenu;
    Galeri1: TMenuItem;
    Webcam1: TMenuItem;
    FilterGraph1: TFilterGraph;
    SampleGrabber1: TSampleGrabber;
    Filter1: TFilter;
    Image1: TImage;
    VideoWindow1: TVideoWindow;
    ComboBox1: TComboBox;
    LFoto: TRzLabel;
    BtnCapture: TRzBitBtn;
    dbgkontak: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    NxImageColumn1: TNxImageColumn;
    LSaldoAwal: TRzLabel;
    RzOpenDialog1: TRzOpenDialog;
    GBTerm: TGroupBox;
    RzLabel12: TRzLabel;
    txtdiskondays: TRzNumericEdit;
    RzLabel22: TRzLabel;
    txtduedate: TRzNumericEdit;
    RzLabel23: TRzLabel;
    txtearlydiscount: TRzNumericEdit;
    RzLabel24: TRzLabel;
    txtlatecharge: TRzNumericEdit;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    txtfield2: TRzEdit;
    RzLabel30: TRzLabel;
    LAkun: TRzLabel;
    txtakun: TRzButtonEdit;
    LNoAkun: TRzLabel;
    txtakunpotongan: TRzButtonEdit;
    LAkunPotongan: TRzLabel;
    LNoAkunPotongan: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel31: TRzLabel;
    txtpembayaran: TRzEdit;
    RzLabel33: TRzLabel;
    RzLabel35: TRzLabel;
    txtnamanpwp: TRzEdit;
    txtalamat2npwp: TRzEdit;
    txtalamat1npwp: TRzEdit;
    RzLabel36: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel34: TRzLabel;
    txtnpwp: TRzEdit;
    RzLabel27: TRzLabel;
    txtfield1: TRzEdit;
    RzLabel37: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure cbtipeSelect(Sender: TObject);
    procedure cbtipeExit(Sender: TObject);
    procedure Webcam1Click(Sender: TObject);
    procedure BtnCaptureClick(Sender: TObject);
    procedure BtnHapusGambarClick(Sender: TObject);
    procedure Galeri1Click(Sender: TObject);
    procedure dbgkontakCellClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgkontakExit(Sender: TObject);
    procedure dbgkontakSelectionMove(Sender: TObject; var ACol: Integer;
      ARow: Integer; Key: TMoveSelectionKey);
    procedure FormShow(Sender: TObject);
    procedure txtakunButtonClick(Sender: TObject);
    procedure txtakunKeyPress(Sender: TObject; var Key: Char);
    procedure txtakunpotonganButtonClick(Sender: TObject);
    procedure txtakunpotonganKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure BMP_To_JPEG(BMPFName,JPEGFName : string);
  end;

var
  Frm_InputKontak: TFrm_InputKontak;
  CapEnum: TSysDevEnum;

implementation

uses UDM, UDataAkun;

{$R *.dfm}

procedure TFrm_InputKontak.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputKontak.BtnRekamClick(Sender: TObject);
begin
  if txtkode.Text = '' then begin
    MessageDlg('Kode: harus diisi!',mtError,[mbOK],0);
    txtkode.SetFocus;
    Exit;
  end;
  if txtnama.Text = '' then begin
    MessageDlg('Nama: harus diisi!',mtError,[mbOK],0);
    txtnama.SetFocus;
    Exit;
  end;
  if txtnamanpwp.Text = '' then begin
    MessageDlg('Nama NPWP/KTP: harus diisi!',mtError,[mbOK],0);
    txtnamanpwp.SetFocus;
    Exit;
  end;
  if (txtalamat1npwp.Text = '') and (txtalamat2npwp.Text = '')then begin
    MessageDlg('Alamat NPWP/KTP: harus diisi!',mtError,[mbOK],0);
    txtalamat1npwp.SetFocus;
    Exit;
  end;
  if LAkun.Caption = '0' then begin
    if cbtipe.ItemIndex = 0 then begin
      MessageDlg('Akun Piutang: harus diisi!',mtError,[mbOK],0);
      txtakun.SetFocus;
      Exit;
    end else if cbtipe.ItemIndex = 1 then begin
      MessageDlg('Akun Hutang: harus diisi!',mtError,[mbOK],0);
      txtakun.SetFocus;
      Exit;
    end else if cbtipe.ItemIndex = 2 then begin
      MessageDlg('Akun Cash Advance: harus diisi!',mtError,[mbOK],0);
      txtakun.SetFocus;
      Exit;
    end
  end;
  if LAkunPotongan.Caption = '0' then begin
    if cbtipe.ItemIndex <> 2 then begin
      MessageDlg('Akun Potongan: harus diisi!',mtError,[mbOK],0);
      txtakunpotongan.SetFocus;
      Exit;
    end
  end;
  if dbgkontak.RowCount <=1 then begin
    if dbgkontak.RowCount =1 then begin
      if dbgkontak.Cell[0,0].AsString = '' then begin
        dbgkontak.ClearRows;
      end;
    end else begin
      dbgkontak.ClearRows;
    end;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_kontak where kodekontak=:kb and tipekontak=:tk';
    ParamByName('kb').Value := txtkode.Text;
    ParamByName('tk').Value := cbtipe.ItemIndex;
    Open;
    if IsEmpty then begin
      ModalResult := mrOk;
    end else begin
      if LID.Caption = IntToStr(FieldValues['nokontak']) then begin
        ModalResult := mrOk;
      end else begin
        MessageDlg('Kode kontak sudah dipakai!',mtError,[mbOK],0);
        txtkode.SetFocus;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_InputKontak.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtnama.Clear;
  txtnamanpwp.Clear;
  cbtipe.ItemIndex := 0;
  cbtipe.ReadOnly := False;
  cbtipeExit(nil);
  txtdiskondays.Value := 0;
  txtduedate.Value := 0;
  txtearlydiscount.Value := 0;
  txtlatecharge.Value := 0;
  txtsaldo.ReadOnly := False;
  txtnpwp.Clear;
  txttelpon1.Clear;
  txttelpon2.Clear;
  txtfax.Clear;
  txthp.Clear;
  txtemail.Clear;
  txtalamat1.Clear;
  txtalamat2.Clear;
  txtalamat1npwp.Clear;
  txtalamat2npwp.Clear;
  txtkota.Clear;
  txtzip.Clear;
  txtnegara.Clear;
  txtcatatan.Clear;
  LFoto.Caption := '';
  BtnCapture.Visible := False;
  BtnHapusGambar.Enabled := True;
  VideoWindow1.Visible := False;
  Image1.Visible := True;
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  dbgkontak.ClearRows;
  BtnRekam.Enabled := True;
  BtnBatal.Enabled := True;
  txtfield1.Clear;
  txtfield2.Clear;
  txtpembayaran.Clear;
end;

procedure TFrm_InputKontak.cbtipeSelect(Sender: TObject);
begin
  cbtipeExit(nil);
end;

procedure TFrm_InputKontak.cbtipeExit(Sender: TObject);
begin
  if cbtipe.ItemIndex = 0 then begin
    LPlafon.Caption := 'Batas Kredit :';
    LSaldoAwal.Caption := 'Pot. Penjualan (%):';
    txtsaldo.Visible := True;
    LSaldoAwal.Visible := True;
    LPlafon.Visible := True;
    txtplafon.Visible := True;
    TabSheet3.TabVisible := True;
    GBTerm.Visible := True;
    LAkun.Visible := True;
    LAkun.Caption := 'Akun Piutang :';
    txtakun.Visible := True;
    LAkunPotongan.Visible := True;
    txtakunpotongan.Visible := True;
    RzLabel5.Visible := True;
    RzLabel31.Visible := True;
    txtpembayaran.Visible := True;
  end else if cbtipe.ItemIndex = 1 then begin
    LPlafon.Caption := 'Batas Kredit :';
    LSaldoAwal.Caption := 'Pot. Pembelian (%):';
    txtsaldo.Visible := True;
    LSaldoAwal.Visible := True;
    LPlafon.Visible := True;
    txtplafon.Visible := True;
    TabSheet3.TabVisible := True;
    GBTerm.Visible := True;
    LAkun.Visible := True;
    LAkun.Caption := 'Akun Hutang :';
    txtakun.Visible := True;
    LAkunPotongan.Visible := True;
    txtakunpotongan.Visible := True;
    RzLabel5.Visible := True;
    RzLabel31.Visible := True;
    txtpembayaran.Visible := True;
  end else if cbtipe.ItemIndex = 2 then begin
    LPlafon.Caption := 'Komisi Penjualan :';
    LSaldoAwal.Caption := '> Nilai Penjualan :';
    txtsaldo.Visible := False;
    LSaldoAwal.Visible := False;
    LPlafon.Visible := False;
    txtplafon.Visible := False;
    TabSheet3.TabVisible := False;
    GBTerm.Visible := False;
    LAkun.Visible := True;
    LAkun.Caption := 'Akun Cash Advance :';
    txtakun.Visible := True;
    LAkunPotongan.Visible := False;
    txtakunpotongan.Visible := False;
    RzLabel5.Visible := False;
    RzLabel31.Visible := False;
    txtpembayaran.Visible := False;
  end;
  txtplafon.Value := 0;
  txtsaldo.Value := 0;
  txtakun.Clear;
  LNoAkun.Caption := '0';
  txtakunpotongan.Clear;
  LNoAkunPotongan.Caption := '0';
end;

procedure TFrm_InputKontak.Webcam1Click(Sender: TObject);
var
  i:Integer;
begin
  if CapEnum.CountFilters = 0 then begin
    MessageDlg('Tidak ada kamera!',mtError,[mbOK],0);
    Exit;
  end;
  BtnCapture.Visible := True;
  BtnPilih.Visible := False;
  BtnHapusGambar.Enabled := False;
  VideoWindow1.Visible := True;
  Image1.Visible := False;
  BtnRekam.Enabled := False;
  BtnBatal.Enabled := False;

  CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  ComboBox1.Items.Clear;
  For i:=0 to CapEnum.CountFilters-1 do begin
    combobox1.Items.Add(CapEnum.Filters[i].FriendlyName);
  end;
  ComboBox1.ItemIndex := 0;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  Filter1.BaseFilter.Moniker:=capenum.GetMoniker(combobox1.ItemIndex);
  FilterGraph1.Active := true;
  with FilterGraph1 as iCaptureGraphBuilder2 do begin
    RenderStream(@PIN_CATEGORY_PREVIEW, nil, Filter1 as IBaseFilter, SampleGrabber1 as IBaseFilter, VideoWindow1 as IbaseFilter);
    FilterGraph1.Play;
  end;
end;

procedure TFrm_InputKontak.BtnCaptureClick(Sender: TObject);
begin
  BtnCapture.Visible := False;
  BtnPilih.Visible := True;
  BtnHapusGambar.Enabled := True;
  VideoWindow1.Visible := False;
  Image1.Visible := True;
  samplegrabber1.GetBitmap(Image1.Picture.Bitmap);
  Image1.Picture.SaveToFile(ExtractFilePath(Application.ExeName) + '\images\webcambmp.bmp');
  BMP_To_JPEG(ExtractFilePath(Application.ExeName) + '\images\webcambmp.bmp',ExtractFilePath(Application.ExeName) + '\images\webcam.jpg');
  LFoto.Caption := ExtractFilePath(Application.ExeName) + '\images\webcam.jpg';
  capenum.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  BtnRekam.Enabled := True;
  BtnBatal.Enabled := True;
end;

procedure TFrm_InputKontak.BMP_To_JPEG(BMPFName, JPEGFName: string);
var
  MyJPEG : TJPEGImage;
  MyBitmap : TBitmap;
begin
  MyJPEG := TJPEGImage.Create;
  try
    MyBitmap := TBitmap.Create;
    try
      MyBitmap.LoadFromFile(BMPFName);
      MyJPEG.Assign(MyBitmap);
      MyJPEG.SaveToFile(JPEGFName);
    finally
      MyBitmap.Free;
    end;
  finally
    MyJPEG.Free;
  end;
end;

procedure TFrm_InputKontak.BtnHapusGambarClick(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  LFoto.Caption := '';
end;

procedure TFrm_InputKontak.Galeri1Click(Sender: TObject);
begin
  if RzOpenDialog1.Execute then begin
    Image1.Picture.LoadFromFile(RzOpenDialog1.FileName);
    LFoto.Caption := RzOpenDialog1.FileName;
  end;
end;

procedure TFrm_InputKontak.dbgkontakCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 4 then begin
    dbgkontak.DeleteRow(ARow);
    if dbgkontak.RowCount = 0 then dbgkontak.AddRow();
  end;
end;

procedure TFrm_InputKontak.dbgkontakExit(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to dbgkontak.RowCount-1 do begin
    if dbgkontak.Cell[0,i].AsString = '' then begin
      dbgkontak.DeleteRow(i);
      if dbgkontak.RowCount = 0 then dbgkontak.AddRow();
    end;
  end;
end;

procedure TFrm_InputKontak.dbgkontakSelectionMove(Sender: TObject;
  var ACol: Integer; ARow: Integer; Key: TMoveSelectionKey);
var
  i:Integer;
begin
  if ACol = 4 then begin
    if dbgkontak.Cell[0,ARow].AsString <> '' then begin
      if ARow = dbgkontak.RowCount-1 then begin
        i:=dbgkontak.AddRow();
        dbgkontak.ScrollToRow(i);
      end;
    end;
  end;
end;

procedure TFrm_InputKontak.FormShow(Sender: TObject);
var
  i: Integer;
begin
  CapEnum:=TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  For i:=0 to CapEnum.CountFilters-1 do begin
    combobox1.Items.Add(CapEnum.Filters[i].FriendlyName);
  end;
  ComboBox1.ItemIndex := 0;
end;

procedure TFrm_InputKontak.txtakunButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtakun.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LNoAkun.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputKontak.txtakunKeyPress(Sender: TObject; var Key: Char);
begin
  txtakunButtonClick(nil);
end;

procedure TFrm_InputKontak.txtakunpotonganButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtakunpotongan.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LNoAkunPotongan.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputKontak.txtakunpotonganKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtakunpotonganButtonClick(nil);
end;

end.
