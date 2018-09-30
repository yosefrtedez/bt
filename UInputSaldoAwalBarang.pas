unit UInputSaldoAwalBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RzButton, ExtCtrls, RzPanel, StdCtrls, Mask, RzBtnEdt, ComCtrls, RzDTP,
  RzCmboBx;

type
  TFrm_EntriSaldoAwal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    txtstok: TRzNumericEdit;
    ZQuery1: TZQuery;
    LBarang: TLabel;
    LSatuan: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txthpp: TRzNumericEdit;
    Label5: TLabel;
    Label6: TLabel;
    dtptanggal: TRzDateTimePicker;
    txtnama: TRzEdit;
    LID: TLabel;
    txtsatuan: TRzButtonEdit;
    txtfaktor: TRzNumericEdit;
    LGudang: TLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure txtsatuanButtonClick(Sender: TObject);
    procedure txtsatuanKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_EntriSaldoAwal: TFrm_EntriSaldoAwal;

implementation

uses UDataBarang, UDM, UDataGudang, UDataSatuan;

{$R *.dfm}

{ TFrm_EntriSaldoAwal }

procedure TFrm_EntriSaldoAwal.ClearText;
begin
  LID.Caption := '0';
  LBarang.Caption := '0';
  LGudang.Caption := '0';
  txtnama.Clear;
  txtstok.Value := 0;
  txtsatuan.Clear;
  LSatuan.Caption := '0';
  txthpp.Value := 0;
  txthpp.ReadOnly := False;
  dtptanggal.Date := Date;
end;

procedure TFrm_EntriSaldoAwal.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_EntriSaldoAwal.BtSaveClick(Sender: TObject);
begin
  if LID.Caption = '0' then begin
    if txtstok.Value = 0 then begin
      txtstok.SetFocus;
      Exit;
    end;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where nobuku=:a)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
      ParamByName('a').Value := LID.Caption;
      Open;
      First;
      if FieldValues['terjual']>0 then begin
        MessageDlg('Saldo awal barang tidak bisa diubah, karena barang telah terpakai oleh transaksi ',mtError,[mbOK],0);
        Free;
        Exit;
      end;
      Free;
    end;
  end;
  if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    ModalResult := mrOk;
  end;
end;

procedure TFrm_EntriSaldoAwal.txtsatuanButtonClick(Sender: TObject);
begin
  if LBarang.Caption = '0' then Exit;
  Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
  nomorbarang := StrToInt(LBarang.Caption);
  Frm_DataSatuan.RefreshQ;
  if Frm_DataSatuan.ShowModal = mrok then begin
    txtsatuan.Text := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
    LSatuan.Caption := Frm_DataSatuan.QData.FieldValues['nosatuan'];
    txtfaktor.Value := Frm_DataSatuan.QData.FieldValues['faktor'];
  end;
end;

procedure TFrm_EntriSaldoAwal.txtsatuanKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsatuanButtonClick(nil);
end;

procedure TFrm_EntriSaldoAwal.FormShow(Sender: TObject);
begin
  //LGudang.Caption := '0';
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Text := 'select * from tbl_bukubesarbarang where tipe=:t and nobarang=:nb and nogudang=:ng';
    ParamByName('t').Value := 'OB';
    ParamByName('nb').Value := LBarang.Caption;
    ParamByName('ng').Value := LGudang.Caption;
    Open;
    if IsEmpty then begin
      LID.Caption := '0';
    end else begin
      LID.Caption := FieldValues['nobuku'];
      txtstok.Value := FieldValues['masuk'];
      txthpp.Value := FieldValues['hpp'];
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.kodesatuan from ' +
                  '(select * from tbl_barang where nobarang=:nb)as a ' +
                  'left join tbl_satuan as b on b.nosatuan=a.nosatuan';
      ParamByName('nb').Value := LBarang.Caption;
      Open;
      LSatuan.Caption := FieldValues['nosatuan'];
      txtsatuan.Text := FieldValues['kodesatuan'];
      txtfaktor.Value := 1;
    end;
    Free;
  end;
end;

end.
