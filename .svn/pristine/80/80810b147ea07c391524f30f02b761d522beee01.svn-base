unit UInputSaldoAwalHutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  ComCtrls, RzDTP, StdCtrls, Mask, RzBtnEdt, RzLabel, RzButton, ExtCtrls,
  RzPanel;

type
  TFrm_InputSaldoAwalHutang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel18: TRzLabel;
    txtpembelian: TRzEdit;
    txtnilai: TRzNumericEdit;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    LKontak: TRzLabel;
    ZQuery1: TZQuery;
    dtpfaktur: TRzDateTimeEdit;
    LID: TRzLabel;
    txtkontak: TRzEdit;
    procedure BtCloseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputSaldoAwalHutang: TFrm_InputSaldoAwalHutang;

implementation

uses UDM;

{$R *.dfm}

{ TFrm_InputSaldoAwalHutang }

procedure TFrm_InputSaldoAwalHutang.ClearText;
begin
  LID.Caption := '0';
  txtkontak.Clear;
  LKontak.Caption := '0';
  txtpembelian.Clear;
  txtnilai.Value := 0;
  dtpfaktur.Date := Date;
end;

procedure TFrm_InputSaldoAwalHutang.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputSaldoAwalHutang.BtSaveClick(Sender: TObject);
begin
  if LKontak.Caption = '0' then begin
    MessageDlg('Supplier : harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if txtpembelian.Text = '' then begin
    MessageDlg('No. Pembelian : harus diisi',mtError,[mbOK],0);
    Exit;
  end;
  if txtnilai.Value = 0 then begin
    MessageDlg('Nilai Hutang tidak boleh nol',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    ModalResult := mrOk;
  end;
end;

end.
