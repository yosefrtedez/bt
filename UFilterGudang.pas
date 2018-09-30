unit UFilterGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Mask, RzEdit, RzBtnEdt, RzButton, ExtCtrls, RzPanel, RzLabel;

type
  TFrm_FilterGudang = class(TForm)
    RzLabel6: TRzLabel;
    LGudang: TRzLabel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    cbgudang: TRzButtonEdit;
    QBarang: TZQuery;
    procedure cbgudangButtonClick(Sender: TObject);
    procedure cbgudangKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  Frm_FilterGudang: TFrm_FilterGudang;

implementation

uses UDM, UDataGudang;

{$R *.dfm}

procedure TFrm_FilterGudang.cbgudangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    cbgudang.Text := Frm_DataGudang.QData.FieldValues['namagudang'];
    LGudang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFrm_FilterGudang.cbgudangKeyPress(Sender: TObject;
  var Key: Char);
begin
  cbgudangButtonClick(nil);
end;

procedure TFrm_FilterGudang.FormShow(Sender: TObject);
begin
  cbgudang.Clear;
  LGudang.Caption := '0';
end;

procedure TFrm_FilterGudang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_FilterGudang.BtnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
