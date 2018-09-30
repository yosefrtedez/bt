unit UInputPPh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  RzBtnEdt, StdCtrls, Mask, RzButton, ExtCtrls, RzPanel;

type
  TFrm_InputPPh = class(TForm)
    Label7: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    LPPh: TLabel;
    LID: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    txtnama: TRzEdit;
    txtkode: TRzEdit;
    txtpersen: TRzNumericEdit;
    txtpph: TRzButtonEdit;
    QKlasifikasi: TZQuery;
    procedure BtCloseClick(Sender: TObject);
    procedure txtpphButtonClick(Sender: TObject);
    procedure txtpphKeyPress(Sender: TObject; var Key: Char);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputPPh: TFrm_InputPPh;

implementation

uses UDM, UDataAkun;

{$R *.dfm}

{ TFrm_InputPPh }

procedure TFrm_InputPPh.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtnama.Clear;
  txtpersen.Value := 0;
  txtpph.Clear;
  LPPh.Caption := '0';
end;

procedure TFrm_InputPPh.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputPPh.txtpphButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtpph.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LPPh.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputPPh.txtpphKeyPress(Sender: TObject; var Key: Char);
begin
  txtpphButtonClick(nil);
end;

procedure TFrm_InputPPh.BtSaveClick(Sender: TObject);
begin
  if txtkode.Text = '' then begin
    MessageDlg('Kode:  harus diisi!',mtError,[mbOK],0);
    txtkode.SetFocus;
    Exit;
  end;
  if txtnama.Text = '' then begin
    MessageDlg('Nama:  harus diisi!',mtError,[mbOK],0);
    txtnama.SetFocus;
    Exit;
  end;
  if txtpersen.Value <= 0 then begin
    MessageDlg('Nilai:  harus diisi!',mtError,[mbOK],0);
    txtpersen.SetFocus;
    Exit;
  end;
  if LPPh.Caption = '0' then begin
    MessageDlg('Kode Akun untuk PPh belum terisi!!',mtError,[mbOK],0);
    txtpph.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
