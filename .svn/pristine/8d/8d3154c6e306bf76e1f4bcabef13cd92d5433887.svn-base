unit UInputFakturPajak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzEdit, ComCtrls, RzDTP, StdCtrls, Mask, RzLabel,
  RzPanel, ExtCtrls, RzBtnEdt, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFrm_Variabel = class(TForm)
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzPanel2: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOK: TRzBitBtn;
    ZQuery1: TZQuery;
    txtkode: TRzEdit;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_Variabel: TFrm_Variabel;

implementation

uses UDM;

{$R *.dfm}

procedure TFrm_Variabel.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_Variabel.BtnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_Variabel.ClearText;
begin
  txtkode.Clear;
end;

end.
