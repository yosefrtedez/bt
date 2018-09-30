unit UInputLoan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, NxColumnClasses, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, NxColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxGrid, RzButton, NxEdit, StdCtrls, RzEdit, RzBtnEdt, Mask, RzLabel,
  RzPanel, ExtCtrls, RzRadChk, NxColumns6, NxGridView6, NxControls6,
  NxCustomGrid6, NxVirtualGrid6, NxGrid6;

type
  TFrm_InputLoan = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    LKas: TRzLabel;
    LID: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel6: TRzLabel;
    LKontak: TRzLabel;
    txtsebesar: TRzNumericEdit;
    txtreferensi: TRzEdit;
    txtkas: TRzButtonEdit;
    txtkontak: TRzButtonEdit;
    txtterbilang: TRzMemo;
    dtptanggal: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    Q1: TZQuery;
    cbapprove: TRzCheckBox;
    cbcair: TRzCheckBox;
    cbcancel: TRzCheckBox;
    LKasTransir: TRzLabel;
    LAkunCA: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel9: TRzLabel;
    txtkeperluan: TRzEdit;
    procedure BtnBatalClick(Sender: TObject);
    procedure txtkasButtonClick(Sender: TObject);
    procedure txtkontakButtonClick(Sender: TObject);
    procedure txtkontakKeyPress(Sender: TObject; var Key: Char);
    procedure txtkasKeyPress(Sender: TObject; var Key: Char);
    procedure txtsebesarExit(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputLoan: TFrm_InputLoan;

implementation

uses UDM, UDataAkun, UDataKontak, UMain, NxCells, NxIntf6;

{$R *.dfm}

procedure TFrm_InputLoan.BtnBatalClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_InputLoan.ClearText;
begin
  txtreferensi.Text := DM.GenerateKodeTransaksi('CA',Date);
  dtptanggal.Date := Date;
  txtsebesar.Value := 0;
  txtterbilang.Clear;
  LKas.Caption := '0';
  LKasTransir.Caption := IntToStr(depositintransit);
  txtkas.Clear;
  LKontak.Caption := '0';
  LAkunCA.Caption := '0';
  txtkontak.Clear;
  LID.Caption := '0';
  txtsebesar.ReadOnly := False;
  cbapprove.Checked := False;
  cbcair.Checked := False;
  cbcancel.Checked := False;
end;

procedure TFrm_InputLoan.txtkasButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := 1;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    LKas.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    txtkas.Text := Frm_DataAkun.QData.FieldValues['namaakun'];
  end;
end;

procedure TFrm_InputLoan.txtkontakButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 2;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    txtkontak.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LKontak.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
    LAkunCA.Caption := Frm_DataKontak.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_InputLoan.txtkontakKeyPress(Sender: TObject; var Key: Char);
begin
  txtkontakButtonClick(nil);
end;

procedure TFrm_InputLoan.txtkasKeyPress(Sender: TObject; var Key: Char);
begin
  txtkasButtonClick(nil);
end;

procedure TFrm_InputLoan.txtsebesarExit(Sender: TObject);
begin
  if txtsebesar.Value <= 0 then
    txtterbilang.Clear
  else txtterbilang.Text := DM.ConvKeHuruf(IntToStr(txtsebesar.IntValue));
end;

procedure TFrm_InputLoan.BtnRekamClick(Sender: TObject);
var
  noloan,i: Integer;
  bayarref: string;
begin
  if LKontak.Caption = '0' then begin
    MessageDlg('Nama: harus diisi!',mtError,[mbOK],0);
    txtkontak.SetFocus;
    Exit;
  end;
  if txtsebesar.Value <= 0 then begin
    MessageDlg('Nilai: tidak boleh nol!',mtError,[mbOK],0);
    txtsebesar.SetFocus;
    Exit;
  end;
  {if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtptanggal.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;   }
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        ModalResult := mrOk;
      end;
    end else begin
      if cbcancel.Checked = False then begin
        if cbapprove.Checked = False then begin
          if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            ModalResult := mrOk;  
          end;
        end;
      end;
    end;
    Free;
  end;
end;

end.
