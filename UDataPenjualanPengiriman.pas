unit UDataPenjualanPengiriman;

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
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DataDO = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanopenjualankirim: TLargeintField;
    QDatakodepenjualankirim: TStringField;
    QDatanopenjualanorder: TLargeintField;
    QDatanokontak: TLargeintField;
    QDatatglpenjualankirim: TDateField;
    QDatanogudang: TLargeintField;
    QDatabiayalain: TFloatField;
    QDatanoakunbiayalain: TLargeintField;
    QDatanamauser: TStringField;
    QDataapprove: TSmallintField;
    QDatatglapprove: TDateTimeField;
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
  Frm_DataDO: TFrm_DataDO;
  customerkirim: Integer;

implementation

{$R *.dfm}

{ TFrm_DataDO }

procedure TFrm_DataDO.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('nk').Value := customerkirim;
    Open;
  end;  
end;

procedure TFrm_DataDO.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataDO.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataDO.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataDO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

end.
