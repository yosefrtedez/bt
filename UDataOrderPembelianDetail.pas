unit UDataOrderPembelianDetail;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, RzButton,
  ExtCtrls, RzPanel;

type
  TFrm_DataOrderPembelianDetail = class(TForm)
    RzPanel2: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanopembelianorder: TLargeintField;
    QDatanobarang: TLargeintField;
    QDataqty: TFloatField;
    QDataharga: TFloatField;
    QDatadiskon1: TFloatField;
    QDatadiskon2: TFloatField;
    QDatasubtotal: TFloatField;
    QDatanosatuan: TLargeintField;
    QDatanilai: TFloatField;
    QDatadppbarang: TFloatField;
    QDatappnbarang: TFloatField;
    QDatanopajak: TLargeintField;
    QDatatipepajak: TSmallintField;
    QDatapersenpajak: TFloatField;
    QDatakodebarang: TStringField;
    QDatanamabarang: TStringField;
    QDatakodesatuan: TStringField;
    QDatakodepajak: TStringField;
    dbgdataDBTableView1qty: TcxGridDBColumn;
    dbgdataDBTableView1harga: TcxGridDBColumn;
    dbgdataDBTableView1diskon1: TcxGridDBColumn;
    dbgdataDBTableView1diskon2: TcxGridDBColumn;
    dbgdataDBTableView1subtotal: TcxGridDBColumn;
    dbgdataDBTableView1kodebarang: TcxGridDBColumn;
    dbgdataDBTableView1namabarang: TcxGridDBColumn;
    dbgdataDBTableView1kodesatuan: TcxGridDBColumn;
    dbgdataDBTableView1kodepajak: TcxGridDBColumn;
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataOrderPembelianDetail: TFrm_DataOrderPembelianDetail;
  ANoOrder: Integer;

implementation

{$R *.dfm}

{ TFrm_DataOrderPembelianDetail }

procedure TFrm_DataOrderPembelianDetail.RefreshQ;
begin
  QData.Close;
  QData.ParamByName('np').Value := ANoOrder;
  QData.Open;
end;

procedure TFrm_DataOrderPembelianDetail.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DataOrderPembelianDetail.BtnOkClick(Sender: TObject);
begin
  Close;
end;

end.
