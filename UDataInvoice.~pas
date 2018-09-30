unit UDataInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TFrm_DataInvoice = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    QData: TZQuery;
    DSData: TDataSource;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    QDatanokontak: TLargeintField;
    QDatatotalhutang: TFloatField;
    QDatajumlahretur: TFloatField;
    QDatajumlahbayar: TFloatField;
    QDatasisahutang: TFloatField;
    QDatanoakunhutang: TLargeintField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1sisahutang: TcxGridDBColumn;
    dbgdataDBTableView1kodepembelian: TcxGridDBColumn;
    QDatanopembelianinvoice: TLargeintField;
    QDatakodepembelianinvoice: TStringField;
    QDatatglpembelianinvoice: TDateField;
    QDatatgltempo: TDateField;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataInvoice: TFrm_DataInvoice;
  pemasokid,nomatauang:integer;

implementation

uses UDM;

{$R *.dfm}

procedure TFrm_DataInvoice.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataInvoice.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('isu').Value := pemasokid;
    Open;
  end;
end;

procedure TFrm_DataInvoice.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataInvoice.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataInvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

end.
