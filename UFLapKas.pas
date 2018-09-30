unit UFLapKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  StdCtrls, Mask, RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzButton, ExtCtrls,
  RzPanel, RzLabel;

type
  TFrm_FilterAkun = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    LAkun: TRzLabel;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    cbakun: TRzButtonEdit;
    QBarang: TZQuery;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure cbakunButtonClick(Sender: TObject);
    procedure cbakunKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterAkun: TFrm_FilterAkun;

implementation

uses UDataAkun, UDM;

{$R *.dfm}

procedure TFrm_FilterAkun.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterAkun.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFrm_FilterAkun.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  LAkun.Caption := '0';
  cbakun.Clear;
end;

procedure TFrm_FilterAkun.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterAkun.cbakunButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LAkun.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    cbakun.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_FilterAkun.cbakunKeyPress(Sender: TObject; var Key: Char);
begin
  cbakunButtonClick(nil);
end;

end.
