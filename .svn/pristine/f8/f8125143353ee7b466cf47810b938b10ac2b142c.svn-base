unit UInputSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzRadChk,
  Grids, DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel,
  ExtCtrls, RzPanel, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, RzTabs;

type
  TFrm_InputSatuan = class(TForm)
    RzPanel1: TRzPanel;
    Label19: TLabel;
    RzPanel2: TRzPanel;
    BtSave: TRzBitBtn;
    BtnExit: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    txtkode: TRzEdit;
    txtnama: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    LID: TRzLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_InputSatuan: TFrm_InputSatuan;

implementation

uses UDM, NxCells, UDaftarSatuan;

{$R *.dfm}

procedure TFrm_InputSatuan.ClearText;
begin
  LID.Caption := '0';
  txtkode.Clear;
  txtnama.Clear;
end;

procedure TFrm_InputSatuan.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_InputSatuan.BtSaveClick(Sender: TObject);
var
  nosatuan,i:Integer;
begin
  if txtkode.Text = '' then begin
    MessageDlg('Kode satuan harus diisi',mtError,[mbOK],0);
    txtkode.SetFocus;
    Exit;
  end;
  if txtnama.Text = '' then begin
    MessageDlg('Nama satuan harus diisi',mtError,[mbOK],0);
    txtnama.SetFocus;
    Exit;
  end;
  ModalResult := mrOk;
end;

end.
