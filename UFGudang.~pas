unit UFGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzRadGrp, RzButton, ExtCtrls;

type
  TFGudang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RBStatus: TRzRadioGroup;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGudang: TFGudang;

implementation

{$R *.dfm}

procedure TFGudang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFGudang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
