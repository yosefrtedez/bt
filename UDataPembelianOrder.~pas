unit UDataPembelianOrder;

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
  cxDataStorage, cxEdit, DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel, cxCheckBox;

type
  TFrm_DataPembelianOrder = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
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
    BtnUpdate: TRzToolButton;
    QDatabiayalain: TFloatField;
    QDatapph: TFloatField;
    QDataapprove: TSmallintField;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    QDatatglapprove: TDateTimeField;
    QDatadiskonday: TIntegerField;
    QDataduedate: TIntegerField;
    QDataearlydiskon: TFloatField;
    QDatalatecharge: TFloatField;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataPembelianOrder: TFrm_DataPembelianOrder;
  supplierorder: Integer;

implementation

{$R *.dfm}

procedure TFrm_DataPembelianOrder.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataPembelianOrder.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('nk').Value := supplierorder;
    Open;
  end;
end;

procedure TFrm_DataPembelianOrder.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataPembelianOrder.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataPembelianOrder.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

procedure TFrm_DataPembelianOrder.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
