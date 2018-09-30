unit UInputGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, RzEdit, Mask, RzLabel, RzButton, ExtCtrls,
  RzPanel;

type
  TFrm_InputGudang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    txtkode: TRzEdit;
    LID: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    txtnama: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    txtalamat1: TRzEdit;
    txtalamat2: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    txtkota: TRzEdit;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    txtnegara: TRzEdit;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    txtketerangan: TRzMemo;
    cbaktif: TRzCheckBox;
    txtkodepos: TRzEdit;
    RzLabel7: TRzLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputGudang: TFrm_InputGudang;

implementation

{$R *.dfm}

procedure TFrm_InputGudang.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputGudang.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtnama.Clear;
  txtalamat1.Clear;
  txtalamat2.Clear;
  txtkota.Clear;
  txtkodepos.Clear;
  txtnegara.Clear;
  txtketerangan.Clear;
  cbaktif.Checked := False;
end;

procedure TFrm_InputGudang.BtSaveClick(Sender: TObject);
begin
  if txtkode.Text = '' then begin
    MessageDlg('Kode: harus diisi!',mtError,[mbOK],0);
    Exit;
  end;
  if txtnama.Text = '' then begin
    MessageDlg('Nama: harus diisi!',mtError,[mbOK],0);
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
