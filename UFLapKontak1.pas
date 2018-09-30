unit UFLapKontak1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  StdCtrls, Mask, RzEdit, RzBtnEdt, RzButton, ExtCtrls, RzPanel, RzLabel;

type
  TFrm_FilterKontak1 = class(TForm)
    LKontak: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    txtkontak: TRzButtonEdit;
    cbkontak: TRzCheckBox;
    QCustomer: TZQuery;
    procedure BtnBatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure txtkontakButtonClick(Sender: TObject);
    procedure cbkontakClick(Sender: TObject);
    procedure txtkontakKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterKontak1: TFrm_FilterKontak1;
  tipe22: Integer;

implementation

uses UDM, UDataKontak;

{$R *.dfm}

procedure TFrm_FilterKontak1.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterKontak1.FormShow(Sender: TObject);
begin
  if tipe22 = 0 then begin
    cbkontak.Caption := 'Customer :';
  end else if tipe22 = 1 then begin
    cbkontak.Caption := 'Supplier :';
  end;
  cbkontak.Checked := False;
  cbkontakClick(nil);
end;

procedure TFrm_FilterKontak1.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterKontak1.txtkontakButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := tipe22;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtkontak.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LKontak.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_FilterKontak1.cbkontakClick(Sender: TObject);
begin
  if cbkontak.Checked = True then
    txtkontak.ReadOnly := False
  else begin
    txtkontak.ReadOnly := True;
    txtkontak.Clear;
    LKontak.Caption := '0';
  end;
end;

procedure TFrm_FilterKontak1.txtkontakKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkontakButtonClick(nil);
end;

end.
