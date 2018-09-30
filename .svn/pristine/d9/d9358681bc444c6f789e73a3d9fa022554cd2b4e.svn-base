unit UTermOfPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, RzButton, ExtCtrls, RzPanel;

type
  TFrm_TermOfPayment = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    txtdiskonday: TRzNumericEdit;
    txtduedate: TRzNumericEdit;
    txtearlydiskon: TRzNumericEdit;
    txtlatecharge: TRzNumericEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_TermOfPayment: TFrm_TermOfPayment;

implementation

{$R *.dfm}

procedure TFrm_TermOfPayment.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_TermOfPayment.BtSaveClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_TermOfPayment.ClearText;
begin
  txtdiskonday.Value := 0;
  txtduedate.Value := 0;
  txtlatecharge.Value := 0;
  txtearlydiskon.Value := 0;
end;

end.
