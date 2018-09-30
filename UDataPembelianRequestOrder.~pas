unit UDataPembelianRequestOrder;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DataPembelianRequestOrder = class(TForm)
    RzPanel2: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatanopembelianorder: TLargeintField;
    QDatakodepembelianorder: TStringField;
    QDatanokontak: TLargeintField;
    QDatanopembelianrequest: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDataselesai: TSmallintField;
    QDatanamakontak: TStringField;
    QDatatotalpajak: TFloatField;
    QDatatotaldpp: TFloatField;
    QDatabiayalain: TFloatField;
    QDatapph: TFloatField;
    QDataapprove: TSmallintField;
    QDatatglapprove: TDateTimeField;
    QDatadiskonday: TIntegerField;
    QDataduedate: TIntegerField;
    QDataearlydiskon: TFloatField;
    QDatalatecharge: TFloatField;
    DSData: TDataSource;
    QDatanoakunbiayalain: TLargeintField;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataPembelianRequestOrder: TFrm_DataPembelianRequestOrder;
  norequest: Integer;

implementation

uses UDM;

{$R *.dfm}

procedure TFrm_DataPembelianRequestOrder.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataPembelianRequestOrder.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataPembelianRequestOrder.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

procedure TFrm_DataPembelianRequestOrder.RefreshQ;
begin
  QData.Close;
  QData.ParamByName('np').Value := norequest;
  QData.Open;
end;

procedure TFrm_DataPembelianRequestOrder.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DataPembelianRequestOrder.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnOkClick(nil);
end;

end.
