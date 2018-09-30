unit UKonfirmasiPembayaranUM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, RzEdit, StdCtrls, Mask, RzLabel, RzTabs, RzButton,
  ExtCtrls, RzPanel, NxEdit, RzBtnEdt;

type
  TFrm_KonfirmasiPembayaran = class(TForm)
    RzPanel1: TRzPanel;
    RzPageControl1: TRzPageControl;
    RzPanel2: TRzPanel;
    BtnSimpan: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzLabel1: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    txtreferensi: TRzEdit;
    RzLabel4: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel8: TRzLabel;
    txtsebesar: TRzNumericEdit;
    txtkontak: TRzEdit;
    cbgiro: TRzCheckBox;
    dtptanggal: TRzEdit;
    txtnomorgiro: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel10: TRzLabel;
    dtptempo: TNxDatePicker;
    RzLabel9: TRzLabel;
    txtbank: TRzEdit;
    RzLabel12: TRzLabel;
    txtakun: TRzButtonEdit;
    LAkunGiro: TRzLabel;
    RzLabel13: TRzLabel;
    txtkas: TRzButtonEdit;
    LKas: TRzLabel;
    procedure cbgiroClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure txtakunButtonClick(Sender: TObject);
    procedure txtakunKeyPress(Sender: TObject; var Key: Char);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_KonfirmasiPembayaran: TFrm_KonfirmasiPembayaran;

implementation

uses UDataAkun, UDM;

{$R *.dfm}

procedure TFrm_KonfirmasiPembayaran.cbgiroClick(Sender: TObject);
begin
  if cbgiro.Checked = True then begin
    BtnSimpan.Caption := 'Lanjut';
  end else begin
    BtnSimpan.Caption := 'Ok';
  end;
end;

procedure TFrm_KonfirmasiPembayaran.BtnSimpanClick(Sender: TObject);
begin
  if BtnSimpan.Caption = 'Ok' then begin
    if LKas.Caption = '0' then begin
      MessageDlg('Kas: harus diisi!',mtError,[mbOK],0);
      txtkas.SetFocus;
      Exit;
    end;
    if cbgiro.Checked = True then begin
      if txtnomorgiro.Text = '' then begin
        MessageDlg('Nomor Giro: harus diisi!',mtError,[mbOK],0);
        txtnomorgiro.SetFocus;
        Exit;
      end;
      if txtbank.Text = '' then begin
        MessageDlg('Bank: harus diisi!',mtError,[mbOK],0);
        txtbank.SetFocus;
        Exit;
      end;
      if LAkunGiro.Caption = '0' then begin
        MessageDlg('Akun Giro: harus diisi!',mtError,[mbOK],0);
        txtakun.SetFocus;
        Exit;
      end;
    end;
    ModalResult := mrOk;
  end else if BtnSimpan.Caption = 'Lanjut' then begin
    RzPageControl1.ActivePage := TabSheet2;
    BtnBatal.Caption := 'Kembali';
    BtnSimpan.Caption := 'Ok';
  end;
end;

procedure TFrm_KonfirmasiPembayaran.BtnBatalClick(Sender: TObject);
begin
  if BtnBatal.Caption = 'Batal' then begin
    ModalResult := mrCancel;
  end else if BtnBatal.Caption = 'Kembali' then begin
    RzPageControl1.ActivePage := TabSheet1;
    BtnBatal.Caption := 'Batal';
    BtnSimpan.Caption := 'Lanjut';
  end;
end;

procedure TFrm_KonfirmasiPembayaran.ClearText;
begin
  txtkontak.Clear;
  txtreferensi.Clear;
  dtptanggal.Clear;
  txtsebesar.Value := 0;
  dtptempo.Date := Date;
  txtnomorgiro.Clear;
  txtbank.Clear;
  LAkunGiro.Caption := '0';
  txtakun.Clear;
end;

procedure TFrm_KonfirmasiPembayaran.txtakunButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtakun.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LAkunGiro.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_KonfirmasiPembayaran.txtakunKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtakunButtonClick(nil);
end;

procedure TFrm_KonfirmasiPembayaran.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_KonfirmasiPembayaran.txtkasKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtkasButtonClick(nil);
end;

end.
