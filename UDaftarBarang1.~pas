unit UDaftarBarang1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzButton, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, RzPanel;

type
  TFrm_DaftarBarang1 = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    PnBarang: TRzPanel;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodebarang: TcxGridDBColumn;
    dbgdataDBTableView1namabarang: TcxGridDBColumn;
    dbgdataDBTableView1kelompokbarang: TcxGridDBColumn;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    dbgdataDBTableView1tersedia: TcxGridDBColumn;
    dbgdataDBTableView1kodesatuan: TcxGridDBColumn;
    dbgdataDBTableView1hargajual: TcxGridDBColumn;
    dbgdataDBTableView1Column2: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    DSData: TDataSource;
    QData: TZQuery;
    QDatanobarang: TLargeintField;
    QDatakodebarang: TStringField;
    QDatanamabarang: TStringField;
    QDatanokelompokbarang: TLargeintField;
    QDatanosatuan: TLargeintField;
    QDatahargajual: TFloatField;
    QDatafaktor: TFloatField;
    QDatatersedia: TFloatField;
    QDatatotal: TLargeintField;
    QDatakodesatuan: TStringField;
    QDatakelompokbarang: TStringField;
    QDatatipe: TStringField;
    QDataaktif: TSmallintField;
    Q1: TZQuery;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarBarang1: TFrm_DaftarBarang1;

implementation

uses UDM, UMain, ULokasiBarang;

{$R *.dfm}

procedure TFrm_DaftarBarang1.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarBarang1.RefreshQ;
begin
  qdata.Close;
  QData.Open;
end;

procedure TFrm_DaftarBarang1.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarBarang1.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_LokasiBarang, Frm_LokasiBarang);
  nobar := QData.FieldValues['nobarang'];
  Frm_LokasiBarang.RefreshQ;
  Frm_LokasiBarang.ShowModal;
end;

end.
