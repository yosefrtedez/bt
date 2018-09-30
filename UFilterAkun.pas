unit UFilterAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Mask, RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzButton, ExtCtrls, RzPanel,
  RzLabel;

type
  TFrm_FilterTglAkun = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    LAkun: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    cbakun: TRzButtonEdit;
    QBarang: TZQuery;
    procedure cbakunButtonClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterTglAkun: TFrm_FilterTglAkun;

implementation

uses UDataAkun, UDM;

{$R *.dfm}

procedure TFrm_FilterTglAkun.cbakunButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    cbakun.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
    LAkun.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_FilterTglAkun.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterTglAkun.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterTglAkun.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  LAkun.Caption := '0';
  cbakun.Clear;
end;

procedure TFrm_FilterTglAkun.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

end.
