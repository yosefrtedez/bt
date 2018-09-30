unit UCetakPenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLstBox, RzButton, ExtCtrls, RzPanel, RzLabel,
  frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrm_CetakPenjualan = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnPreview: TRzBitBtn;
    cbpreview: TRzListBox;
    LNoPenjualan: TRzLabel;
    BtnTutup: TRzBitBtn;
    ZQuery1: TZQuery;
    procedure BtnTutupClick(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure cbpreviewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CetakPenjualan: TFrm_CetakPenjualan;

implementation

uses UDM, RzEdit;

{$R *.dfm}

procedure TFrm_CetakPenjualan.BtnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CetakPenjualan.BtnPreviewClick(Sender: TObject);
begin
  {DM.QPerusahaan.Close;
  DM.Q_NotaPenjualan.Close;
  DM.Q_NotaPenjualan.ParamByName('np').Value := LNoPenjualan.Caption;
  DM.QPerusahaan.Open;
  DM.Q_NotaPenjualan.Open;
  if cbpreview.ItemIndex = 0 then begin
    DM.Rpt_SuratJalan.ShowReport(True);
  end else if cbpreview.ItemIndex = 1 then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_penjualan where nopenjualan=:np';
      ParamByName('np').Value := LNoPenjualan.Caption;
      Open;
      if FieldValues['posting']=1 then begin
        DM.Rpt_PenjualanInvoice.ShowReport(True);
      end else begin
        MessageDlg('Invoice tidak dapat dicetak. Posting penjualan terlebih dahulu!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end;   }
end;

procedure TFrm_CetakPenjualan.cbpreviewDblClick(Sender: TObject);
begin
  BtnPreviewClick(nil);
end;

end.
