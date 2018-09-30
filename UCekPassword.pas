unit UCekPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzButton, ExtCtrls, RzPanel;

type
  TFrm_PeriksaPassword = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzLabel1: TRzLabel;
    txtpass: TRzEdit;
    RzLabel2: TRzLabel;
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
  Frm_PeriksaPassword: TFrm_PeriksaPassword;
  pass:string;

implementation

{$R *.dfm}

procedure TFrm_PeriksaPassword.FormShow(Sender: TObject);
begin
  txtpass.Clear;
  txtbaru.Clear;
  txtbaru.SetFocus;
end;

procedure TFrm_PeriksaPassword.BtnOkClick(Sender: TObject);
begin
  if txtpass.Text = pass then begin
    ModalResult := mrOk
  end else begin
    MessageDlg('Password is not valid! Please check again!',mtError,[mbOK],0);
  end;
end;

procedure TFrm_PeriksaPassword.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_PeriksaPassword.txtpassKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end;
end;

end.
