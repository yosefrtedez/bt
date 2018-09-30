unit UFTanggal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, RzButton, StdCtrls, RzLabel, ExtCtrls, RzPanel,
  NxEdit;

type
  TFTanggal = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzLabel2: TRzLabel;
    BtnSama: TRzButton;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    dtpdari: TNxDatePicker;
    dtpsampai: TNxDatePicker;
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
  FTanggal: TFTanggal;

implementation

uses UDM;

{$R *.dfm}

procedure TFTanggal.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFTanggal.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTanggal.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFTanggal.FormShow(Sender: TObject);
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
end;

end.
