unit UInputPassBaru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzButton, ExtCtrls, RzPanel;

type
  TFrm_InputPassBaru = class(TForm)
    RzPanel1: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    txtpass: TRzEdit;
    txtbaru: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure txtpassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_InputPassBaru: TFrm_InputPassBaru;
  pass:string;

implementation

{$R *.dfm}

procedure TFrm_InputPassBaru.FormShow(Sender: TObject);
begin
  txtpass.Clear;
  txtbaru.Clear;
  txtbaru.SetFocus;
end;

procedure TFrm_InputPassBaru.BtnOkClick(Sender: TObject);
begin
  if txtpass.Text = txtbaru.Text then begin
    ModalResult := mrOk
  end else begin
    MessageDlg('Password tidak sama. Coba diulang kembali',mtError,[mbOK],0);
  end;
end;

procedure TFrm_InputPassBaru.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputPassBaru.txtpassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end;
end;

end.
