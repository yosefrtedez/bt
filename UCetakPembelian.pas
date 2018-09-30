unit UCetakPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLstBox, RzButton, ExtCtrls, RzPanel, RzLabel,
  frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrm_CetakPembelian = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnPreview: TRzBitBtn;
    cbpreview: TRzListBox;
    LNoPembelian: TRzLabel;
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
  Frm_CetakPembelian: TFrm_CetakPembelian;

implementation

uses UDM, RzEdit;

{$R *.dfm}

procedure TFrm_CetakPembelian.BtnTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CetakPembelian.BtnPreviewClick(Sender: TObject);
begin
  DM.QPerusahaan.Close;
  //DM.Q_NotaTO.Close;
  //DM.Q_NotaTO.ParamByName('np').Value := LNoPembelian.Caption;
  DM.QPerusahaan.Open;
  //DM.Q_NotaTO.Open;
  if cbpreview.ItemIndex = 0 then begin
    //DM.Rpt_NotaTO.ShowReport(True);
  end else if cbpreview.ItemIndex = 1 then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_pembelian where nopembelian=:np';
      ParamByName('np').Value := LNoPembelian.Caption;
      Open;
      if FieldValues['posting']=1 then begin
        //DM.Rpt_APInvoice.ShowReport(True);
      end else begin
        MessageDlg('Invoice tidak dapat dicetak. Posting penjualan terlebih dahulu!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end;
end;

procedure TFrm_CetakPembelian.cbpreviewDblClick(Sender: TObject);
begin
  BtnPreviewClick(nil);
end;

end.
