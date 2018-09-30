unit UDaftarHutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, Mask, RzEdit, ExtCtrls, RzPanel,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  SMDBGrid, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxPC,
  cxTextEdit;

type
  TFrm_DaftarHutang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    QDatatotalhutang: TFloatField;
    QDatajumlahbayar: TFloatField;
    QDatasisahutang: TFloatField;
    QDatanokontak: TLargeintField;
    QDatanamakontak: TStringField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1totalhutang: TcxGridDBColumn;
    dbgdataDBTableView1jumlahbayar: TcxGridDBColumn;
    dbgdataDBTableView1sisahutang: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    BtnUpdate: TRzToolButton;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarHutang: TFrm_DaftarHutang;

implementation

uses UDM, URincianHutang, UMain;

{$R *.dfm}

procedure TFrm_DaftarHutang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarHutang.RefreshQ;
begin
  with QData do begin
    Close;
    Open;
  end;
end;

procedure TFrm_DaftarHutang.BtnPerincianClick(Sender: TObject);
var
  f: TFrm_RincianHutang;
  ts: TcxTabSheet;
  nomor:Integer;
  textpanel: string;
begin
  if QData.IsEmpty then Exit;
  if not DM.CekTabOpen('Perincian Hutang Usaha') then begin
    f := TFrm_RincianHutang.Create(Self);
    nomor := QData.FieldValues['nokontak'];
    textpanel := '             Perincian Hutang Usaha '+QData.FieldValues['namakontak'];
    with f do begin
      supplierid := nomor;
      f.RzPanel1.Caption := textpanel;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarHutang.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarHutang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
