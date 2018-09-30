unit UFTglBarangGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  StdCtrls, Mask, RzEdit, RzBtnEdt, ComCtrls, RzDTP, RzButton, ExtCtrls,
  RzPanel, RzLabel;

type
  TFrm_FilterTglBarangGudang = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    LBarang: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dtpdari: TRzDateTimePicker;
    dtpsampai: TRzDateTimePicker;
    BtnSama: TRzButton;
    txtbarang: TRzButtonEdit;
    cbbarang: TRzCheckBox;
    QBarang: TZQuery;
    txtgudang: TRzButtonEdit;
    cbgudang: TRzCheckBox;
    LGudang: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnSamaClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure txtbarangButtonClick(Sender: TObject);
    procedure cbbarangClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbgudangClick(Sender: TObject);
    procedure txtgudangButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FilterTglBarangGudang: TFrm_FilterTglBarangGudang;

implementation

uses UDM, UDataBarang, UDataGudang, UMain;

{$R *.dfm}

procedure TFrm_FilterTglBarangGudang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterTglBarangGudang.BtnSamaClick(Sender: TObject);
begin
  dtpsampai.Date := dtpdari.Date;
end;

procedure TFrm_FilterTglBarangGudang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrm_FilterTglBarangGudang.txtbarangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataBarang, Frm_DataBarang);
  //AGudang := -1;
  //Frm_DataBarang.RefreshQ;
  if Frm_DataBarang.ShowModal = mrok then begin
    txtbarang.Text := Frm_DataBarang.QData.FieldValues['namabarang'];
    LBarang.Caption := Frm_DataBarang.QData.FieldValues['nobarang'];
  end;
end;

procedure TFrm_FilterTglBarangGudang.cbbarangClick(Sender: TObject);
begin
  if cbbarang.Checked = True then
    txtbarang.ReadOnly := False
  else begin
    txtbarang.ReadOnly := True;
    txtbarang.Clear;
    LBarang.Caption := '0';
  end;
end;

procedure TFrm_FilterTglBarangGudang.FormShow(Sender: TObject);
var
  nogud: Integer;
  namgud: string;
begin
  dtpdari.Date := DM.FDOM(Date);
  dtpsampai.Date := DM.LastDayCurrMon(Date);
  cbbarang.Checked := False;
  cbbarangClick(nil);
  //if DM.CekUserGudang(Frm_Main.txtuser.Caption)= -1 then begin
    cbgudang.Enabled := True;
    cbgudang.Checked := False;
    cbgudangClick(nil);
  {end else begin
    LGudang.Caption := IntToStr(DM.CekUserGudang(Frm_Main.txtuser.Caption));
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
      ParamByName('a').Value := nogud;
      Open;
      txtgudang.Text :=FieldValues['namagudang'];
      Free;
    end;
    cbgudang.Checked := True;
    txtgudang.ReadOnly := True;
    cbgudang.Enabled := False;
  end;    }
end;

procedure TFrm_FilterTglBarangGudang.cbgudangClick(Sender: TObject);
begin
  if cbgudang.Enabled = True then begin
    if cbgudang.Checked = True then
      txtgudang.ReadOnly := False
    else begin
      txtgudang.ReadOnly := True;
      txtgudang.Clear;
      LGudang.Caption := '0';
    end;
  end;
end;

procedure TFrm_FilterTglBarangGudang.txtgudangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudang.Text := Frm_DataGudang.QData.FieldValues['namagudang'];
    LGudang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

end.
