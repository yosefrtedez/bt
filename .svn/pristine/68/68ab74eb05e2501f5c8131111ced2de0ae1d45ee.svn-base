unit UFTanggalCSV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, NxEdit, RzButton, ExtCtrls, RzPanel, RzLabel;

type
  TFTanggalCSV = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    BtnSama: TRzButton;
    dtpdari: TNxDatePicker;
    dtpsampai: TNxDatePicker;
    cbstatus: TRzComboBox;
    RzLabel1: TRzLabel;
    procedure BtnSamaClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTanggalCSV: TFTanggalCSV;

implementation

uses UDM;

{$R *.dfm}

procedure TFTanggalCSV.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFTanggalCSV.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTanggalCSV.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFTanggalCSV.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  cbstatus.ItemIndex := 0;
end;

end.
