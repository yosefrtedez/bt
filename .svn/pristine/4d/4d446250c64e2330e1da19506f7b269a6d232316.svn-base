unit UFLapBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, ComCtrls, RzDTP, RzButton, ExtCtrls,
  RzPanel, RzLabel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Mask, RzEdit, RzBtnEdt, RzRadChk;

type
  TFrm_FilterBarang = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    LBarang: TRzLabel;
    QBarang: TZQuery;
    txtbarang: TRzButtonEdit;
    cbbarang: TRzCheckBox;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure txtbarangButtonClick(Sender: TObject);
    procedure cbbarangClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterBarang: TFrm_FilterBarang;

implementation

uses UDM, UDataBarang;

{$R *.dfm}

procedure TFrm_FilterBarang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterBarang.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFrm_FilterBarang.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  cbbarang.Checked := False;
  cbbarangClick(nil);
end;

procedure TFrm_FilterBarang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterBarang.txtbarangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := -1;
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    txtbarang.Text := Frm_DataBarang.QData.FieldValues['namabarang'];
    LBarang.Caption := Frm_DataBarang.QData.FieldValues['nobarang'];
  end;
end;

procedure TFrm_FilterBarang.cbbarangClick(Sender: TObject);
begin
  if cbbarang.Checked = True then
    txtbarang.ReadOnly := False
  else begin
    txtbarang.ReadOnly := True;
    txtbarang.Clear;
    LBarang.Caption := '0';
  end;
end;

end.
