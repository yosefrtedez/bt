unit USetupPerusahaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzEdit, Mask, RzLabel, frxpngimage, ExtCtrls,
  RzButton, RzPanel, ComCtrls, RzDTP, RzTabs, RzCmboBx, RzShellDialogs;

type
  TFrm_InfoPerusahaan = class(TForm)
    RzPanel1: TRzPanel;
    BtnSimpan: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzPanel8: TRzPanel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    txtperusahaan: TRzEdit;
    txtalamat: TRzMemo;
    txtkota: TRzEdit;
    txtkodepos: TRzEdit;
    txttelp: TRzEdit;
    RzGroupBox1: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel14: TRzLabel;
    txtnpwp: TRzEdit;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    txtpkp: TRzEdit;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel31: TRzLabel;
    txtkotapkp: TRzEdit;
    txtkodepospkp: TRzEdit;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    dtppkp: TRzDateTimePicker;
    TabSheet3: TRzTabSheet;
    txtalamatpkp: TRzMemo;
    RzLabel17: TRzLabel;
    RzLabel22: TRzLabel;
    txtnamapkp: TRzEdit;
    RzLabel23: TRzLabel;
    RzLabel25: TRzLabel;
    cbhpp: TRzComboBox;
    RzLabel6: TRzLabel;
    RzLabel9: TRzLabel;
    txtkode: TRzEdit;
    RzPanel2: TRzPanel;
    RzPanel5: TRzPanel;
    Image1: TImage;
    BtnHapusGambar: TRzBitBtn;
    BtnCari: TRzBitBtn;
    LFoto: TRzLabel;
    RzOpenDialog1: TRzOpenDialog;
    TabSheet4: TRzTabSheet;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    txtfooterpenjualan: TRzMemo;
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnHapusGambarClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Cleartext;
  end;

var
  Frm_InfoPerusahaan: TFrm_InfoPerusahaan;

implementation

{$R *.dfm}

{ TFrm_InfoPerusahaan }

procedure TFrm_InfoPerusahaan.Cleartext;
begin
  txtkode.Clear;
  txtperusahaan.Clear;
  txtalamat.Clear;
  txtkota.Clear;
  txtkodepos.Clear;
  txttelp.Clear;
  cbhpp.ItemIndex := 0;
  cbhpp.Enabled := True;
  txtnpwp.Clear;
  txtpkp.Clear;
  dtppkp.Date := Date;
  txtnamapkp.Clear;
  txtalamatpkp.Clear;
  txtkotapkp.Clear;
  txtkodepospkp.Clear;
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  LFoto.Caption := '';
  txtfooterpenjualan.Clear;
end;

procedure TFrm_InfoPerusahaan.BtnSimpanClick(Sender: TObject);
begin
  if txtperusahaan.Text = '' then begin
    txtperusahaan.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_InfoPerusahaan.BtnHapusGambarClick(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\images\no-image.jpg');
  LFoto.Caption := '';
end;

procedure TFrm_InfoPerusahaan.BtnCariClick(Sender: TObject);
begin
  if RzOpenDialog1.Execute then begin
    Image1.Picture.LoadFromFile(RzOpenDialog1.FileName);
    LFoto.Caption := RzOpenDialog1.FileName;
  end;
end;

end.
