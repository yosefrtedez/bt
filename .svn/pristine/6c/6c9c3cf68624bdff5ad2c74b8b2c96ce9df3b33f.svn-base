unit USetAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Mask, RzEdit, RzBtnEdt, RzLabel, RzButton, ExtCtrls, RzPanel;

type
  TFrm_SetAkun = class(TForm)
    RzPanel1: TRzPanel;
    BtnSimpan: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    LNoAkun: TRzLabel;
    txtke: TRzButtonEdit;
    ZQuery1: TZQuery;
    LJudul1: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSimpanClick(Sender: TObject);
    procedure txtkeButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtkeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SetAkun: TFrm_SetAkun;
  JudulAkun: string;

implementation

uses UDataAkun;

{$R *.dfm}

procedure TFrm_SetAkun.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_SetAkun.BtnSimpanClick(Sender: TObject);
begin
  if txtke.Text = '' then begin
    txtke.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrm_SetAkun.txtkeButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    txtke.Text := Frm_DataAkun.QData.FieldValues['kodeakun']+'|'+Frm_DataAkun.QData.FieldValues['namaakun'];
    LNoAkun.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
  end;
end;

procedure TFrm_SetAkun.FormShow(Sender: TObject);
begin
  Frm_SetAkun.Caption := 'Kode Akun '+JudulAkun;
  RzPanel2.Caption := 'Kode Akun '+JudulAkun;
  LJudul1.Caption := 'Pilih Kode Akun untuk posting otomatis "'+JudulAkun+'"';
end;

procedure TFrm_SetAkun.txtkeKeyPress(Sender: TObject; var Key: Char);
begin
  txtkeButtonClick(nil);
end;

end.
