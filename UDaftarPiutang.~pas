unit UDaftarPiutang;

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
  RzButton, ExtCtrls, RzPanel, cxPC;

type
  TFrm_DaftarPiutang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1totalhutang: TcxGridDBColumn;
    dbgdataDBTableView1jumlahbayar: TcxGridDBColumn;
    dbgdataDBTableView1sisahutang: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatajumlahbayar: TFloatField;
    QDatanokontak: TLargeintField;
    QDatanamakontak: TStringField;
    DSData: TDataSource;
    QDatatotalpiutang: TFloatField;
    QDatasisapiutang: TFloatField;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPiutang: TFrm_DaftarPiutang;

implementation

uses UMain, UDM, URincianPiutang;

{$R *.dfm}

procedure TFrm_DaftarPiutang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPiutang.RefreshQ;
begin
  with QData do begin
    Close;
    Open;
  end;
end;

procedure TFrm_DaftarPiutang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPiutang.BtnPerincianClick(Sender: TObject);
var
  f: TFrm_RincianPiutang;
  ts: TcxTabSheet;
  nomor:Integer;
  textpanel: string;
begin
  if QData.IsEmpty then Exit;
  if not DM.CekTabOpen('Perincian Piutang Usaha') then begin
    f := TFrm_RincianPiutang.Create(Self);
    nomor := QData.FieldValues['nokontak'];
    textpanel := '             Perincian Piutang Usaha '+QData.FieldValues['namakontak'];
    with f do begin
      customerid := nomor;
      f.RzPanel1.Caption := textpanel;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarPiutang.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  BtnPerincianClick(nil);
end;

end.
