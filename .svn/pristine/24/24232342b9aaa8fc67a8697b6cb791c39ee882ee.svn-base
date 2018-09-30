unit ULokasiBarang;

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
  ZDataset, RzButton, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, RzPanel;

type
  TFrm_LokasiBarang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    PnBarang: TRzPanel;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    DSData: TDataSource;
    QData: TZQuery;
    Q1: TZQuery;
    QDatanobarang: TLargeintField;
    QDatatersedia: TFloatField;
    QDatanogudang: TLargeintField;
    QDatanosatuan: TLargeintField;
    QDatakodesatuan: TStringField;
    QDatanamagudang: TStringField;
    dbgdataDBTableView1tersedia: TcxGridDBColumn;
    dbgdataDBTableView1kodesatuan: TcxGridDBColumn;
    dbgdataDBTableView1namagudang: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_LokasiBarang: TFrm_LokasiBarang;
  nobar: Integer;

implementation

Uses UDM;

{$R *.dfm}

procedure TFrm_LokasiBarang.BtnSelesaiClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_LokasiBarang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('nb').Value := nobar;
    Open;
  end;
end;

procedure TFrm_LokasiBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
