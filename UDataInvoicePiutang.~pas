unit UDataInvoicePiutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DataInvoicePiutang = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodepembelian: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1sisahutang: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatanokontak: TLargeintField;
    QDatajumlahretur: TFloatField;
    QDatajumlahbayar: TFloatField;
    DSData: TDataSource;
    QDatatotalpiutang: TFloatField;
    QDatanoakunpiutang: TLargeintField;
    QDatasisapiutang: TFloatField;
    QDatanopenjualaninvoice: TLargeintField;
    QDatakodepenjualaninvoice: TStringField;
    QDatatglpenjualaninvoice: TDateField;
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
  Frm_DataInvoicePiutang: TFrm_DataInvoicePiutang;
  customerid,nomatauang:integer;

implementation

uses UDM;

{$R *.dfm}

{ TFrm_DataInvoicePiutang }

procedure TFrm_DataInvoicePiutang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('isu').Value := customerid;
    Open;
  end;
end;

procedure TFrm_DataInvoicePiutang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;  
end;

procedure TFrm_DataInvoicePiutang.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataInvoicePiutang.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataInvoicePiutang.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

end.
