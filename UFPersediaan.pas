unit UFPersediaan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, RzCmboBx, Mask, RzEdit, RzBtnEdt, RzButton,
  ExtCtrls, RzPanel;

type
  TFBarang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    txtkelompokbarang: TRzButtonEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtkontak: TRzButtonEdit;
    Label9: TLabel;
    Label10: TLabel;
    cbjenis: TRzComboBox;
    cbtipe: TRzComboBox;
    cbstatus: TRzComboBox;
    Label11: TLabel;
    CBKelompokBarang: TRzCheckBox;
    CBSupplier: TRzCheckBox;
    LKelompokBarang: TLabel;
    LKontak: TLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure CBSupplierClick(Sender: TObject);
    procedure txtkontakButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtkontakKeyPress(Sender: TObject; var Key: Char);
    procedure txtkelompokbarangButtonClick(Sender: TObject);
    procedure txtkelompokbarangKeyPress(Sender: TObject; var Key: Char);
    procedure CBKelompokBarangClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarang: TFBarang;

implementation

uses UDataKelompokBarang, UDataKontak;

{$R *.dfm}

procedure TFBarang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFBarang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFBarang.CBSupplierClick(Sender: TObject);
begin
  if CBSupplier.Checked = True then begin
    LKontak.Caption := '0';
    txtkontak.Text := 'Semua';
    CBSupplier.Visible := False;
  end;
end;

procedure TFBarang.txtkontakButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtkontak.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LKontak.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    CBSupplier.Checked := False;
    CBSupplier.Visible := True;
  end;
end;

procedure TFBarang.FormShow(Sender: TObject);
begin
  txtkontak.Text := 'Semua';
  LKontak.Caption := '0';
  CBSupplier.Checked := True;
  CBSupplier.Visible := False;
  txtkelompokbarang.Text := 'Semua';
  LKelompokBarang.Caption := '0';
  CBKelompokBarang.Checked := True;
  CBKelompokBarang.Visible := False;
  cbjenis.ItemIndex := 0;
  cbstatus.ItemIndex := 0;
  cbtipe.ItemIndex := 0;
end;

procedure TFBarang.txtkontakKeyPress(Sender: TObject; var Key: Char);
begin
  txtkontakButtonClick(nil);
end;

procedure TFBarang.txtkelompokbarangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKelompokBarang, Frm_DataKelompokBarang);
  Frm_DataKelompokBarang.RefreshQ;
  if Frm_DataKelompokBarang.ShowModal = mrok then begin
    LKelompokBarang.Caption := Frm_DataKelompokBarang.QData.FieldValues['nokelompokbarang'];
    txtkelompokbarang.Text := Frm_DataKelompokBarang.QData.FieldValues['kelompokbarang'];
    CBKelompokBarang.Checked := False;
    CBKelompokBarang.Visible := True;
  end;
end;

procedure TFBarang.txtkelompokbarangKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkelompokbarangButtonClick(nil);
end;

procedure TFBarang.CBKelompokBarangClick(Sender: TObject);
begin
  if CBKelompokBarang.Checked = True then begin
    LKelompokBarang.Caption := '0';
    txtkelompokbarang.Text := 'Semua';
    CBKelompokBarang.Visible := False;
  end;
end;

end.
