unit UInputAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, Mask, RzEdit, RzCmboBx, RzButton, ExtCtrls,
  RzPanel, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrm_InputAkun = class(TForm)
    RzPanel1: TRzPanel;
    Label22: TLabel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtClose: TRzBitBtn;
    Label7: TLabel;
    Label13: TLabel;
    cbklasifikasi: TRzComboBox;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    txtNama: TRzEdit;
    cbkas: TRzCheckBox;
    cbaktif: TRzCheckBox;
    LKlasifikasi: TLabel;
    LID: TLabel;
    LSubKlasifikasi: TLabel;
    QKlasifikasi: TZQuery;
    txtkode: TRzEdit;
    procedure cbklasifikasiExit(Sender: TObject);
    procedure cbklasifikasiSelect(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IsiCBKlasifikasi;
    procedure ClearText;
  end;

var
  Frm_InputAkun: TFrm_InputAkun;

implementation

uses UDM;

{$R *.dfm}

{ TFrm_InputAkun }

procedure TFrm_InputAkun.IsiCBKlasifikasi;
var
  i:integer;
begin
  cbklasifikasi.Clear;
  cbklasifikasi.Items.Clear;
  LKlasifikasi.Caption := '0';
  LSubKlasifikasi.Caption := '0';
  with QKlasifikasi do begin
    Close;
    Open;
    for i:=0 to QKlasifikasi.RecordCount-1 do begin
      cbklasifikasi.Items.Add(FieldValues['namasubklasifikasi']);
      Next;
    end;
  end;
  cbklasifikasi.ItemIndex := 0;
  cbklasifikasiExit(nil);
end;

procedure TFrm_InputAkun.cbklasifikasiExit(Sender: TObject);
begin
  if cbklasifikasi.Text = '' then begin
    LKlasifikasi.Caption := '0';
    LSubKlasifikasi.Caption := '0';
    Exit;
  end;
  with TZQuery.Create(Self) do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select noklasifikasi,nosubklasifikasi from tbl_subklasifikasi where namasubklasifikasi=:ns';
    ParamByName('ns').Value := cbklasifikasi.Text;
    Open;
    if IsEmpty then exit;
    LKlasifikasi.Caption := FieldValues['noklasifikasi'];
    LSubKlasifikasi.Caption := FieldValues['nosubklasifikasi'];
  end;
end;

procedure TFrm_InputAkun.cbklasifikasiSelect(Sender: TObject);
begin
  if cbklasifikasi.Text = '' then begin
    LKlasifikasi.Caption := '0';
    LSubKlasifikasi.Caption := '0';
    Exit;
  end;
  with TZQuery.Create(Self) do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select noklasifikasi,nosubklasifikasi from tbl_subklasifikasi where namasubklasifikasi=:ns';
    ParamByName('ns').Value := cbklasifikasi.Text;
    Open;
    if IsEmpty then exit;
    LKlasifikasi.Caption := FieldValues['noklasifikasi'];
    LSubKlasifikasi.Caption := FieldValues['nosubklasifikasi'];
  end;
end;

procedure TFrm_InputAkun.ClearText;
begin
  IsiCBKlasifikasi;
  txtNama.Clear;
  cbkas.Checked := False;
  cbaktif.Checked := True;
  LID.Caption := '0';
  cbklasifikasi.ReadOnly := False;
  txtkode.ReadOnly := False;
  cbkas.Enabled := True;
  cbaktif.Enabled := True;
end;

procedure TFrm_InputAkun.BtCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputAkun.BtSaveClick(Sender: TObject);
begin
  if LKlasifikasi.Caption = '0' then begin
    MessageDlg('Klasifikasi: harus diisi!!',mtError,[mbOK],0);
    cbklasifikasi.SetFocus;
    Exit;
  end;
  if txtkode.Text = '' then begin
    MessageDlg('Kode: harus diisi !!',mtError,[mbOK],0);
    txtkode.SetFocus;
    Exit;
  end;
  if txtNama.Text = '' then begin
    MessageDlg('Nama: harus diisi!!',mtError,[mbOK],0);
    txtNama.SetFocus;
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_akun where kodeakun=:kb';
    ParamByName('kb').Value := txtkode.Text;
    Open;
    if IsEmpty then begin
      ModalResult := mrOk;
    end else begin
      if LID.Caption = IntToStr(FieldValues['noakun']) then begin
        ModalResult := mrOk;
      end else begin
        MessageDlg('Kode akun sudah dipakai oleh akun lain',mtError,[mbOK],0);
        txtkode.SetFocus;
      end;
    end;
    Free;
  end;
end;

end.
