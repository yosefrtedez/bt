unit UFLapKontak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Mask, RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzButton, ExtCtrls, RzPanel,
  RzLabel, RzRadChk;

type
  TFrm_FilterKontak = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    LKontak: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    txtkontak: TRzButtonEdit;
    QCustomer: TZQuery;
    cbkontak: TRzCheckBox;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure txtkontakButtonClick(Sender: TObject);
    procedure cbkontakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterKontak: TFrm_FilterKontak;
  tipe: Integer;

implementation

uses UDM, UDataKontak;

{$R *.dfm}

procedure TFrm_FilterKontak.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterKontak.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFrm_FilterKontak.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  if tipe = 0 then begin
    cbkontak.Caption := 'Customer :';
  end else if tipe = 1 then begin
    cbkontak.Caption := 'Supplier :';
  end else if tipe = 2 then begin
    cbkontak.Caption := 'Sales :';
  end;
  cbkontak.Checked := False;
  cbkontakClick(nil);
end;

procedure TFrm_FilterKontak.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterKontak.txtkontakButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := tipe;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtkontak.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LKontak.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_FilterKontak.cbkontakClick(Sender: TObject);
begin
  if cbkontak.Checked = True then
    txtkontak.ReadOnly := False
  else begin
    txtkontak.ReadOnly := True;
    txtkontak.Clear;
    LKontak.Caption := '0';
  end;
end;

end.
