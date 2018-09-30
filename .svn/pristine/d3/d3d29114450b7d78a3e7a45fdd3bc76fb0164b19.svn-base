unit UFTglGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  StdCtrls, Mask, RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzButton, ExtCtrls,
  RzPanel, RzLabel;

type
  TFTglGudang = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    LGudang: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    txtgudang: TRzButtonEdit;
    cbgudang: TRzCheckBox;
    QCustomer: TZQuery;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure txtgudangButtonClick(Sender: TObject);
    procedure cbgudangClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTglGudang: TFTglGudang;

implementation

uses UDM, UDataGudang;

{$R *.dfm}

procedure TFTglGudang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTglGudang.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFTglGudang.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  cbgudang.Checked := False;
  cbgudangClick(nil);
end;

procedure TFTglGudang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFTglGudang.txtgudangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudang.Text := Frm_DataGudang.QData.FieldValues['namagudang'];
    LGudang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFTglGudang.cbgudangClick(Sender: TObject);
begin
  if cbgudang.Checked = True then
    txtgudang.ReadOnly := False
  else begin
    txtgudang.ReadOnly := True;
    txtgudang.Text := 'Gudang Utama';
    LGudang.Caption := '0';
  end;
end;

end.
