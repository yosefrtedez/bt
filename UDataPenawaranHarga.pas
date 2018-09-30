unit UDataPenawaranHarga;

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
  TFrm_DataPenawaranHarga = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnOk: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodepembelianrequest: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanopenjualanrequest: TLargeintField;
    QDatakodepenjualanrequest: TStringField;
    QDatanokontak: TLargeintField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    BtnUpdate: TRzToolButton;
    QDatatotaldpp: TFloatField;
    QDatatotalpajak: TFloatField;
    QDatatglpenjualanrequest: TDateField;
    QDatabiayalain: TFloatField;
    QDataketerangan: TMemoField;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1tglpenjualanrequest: TcxGridDBColumn;
    procedure BtnBatalClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataPenawaranHarga: TFrm_DataPenawaranHarga;
  customerpenawaran: Integer;

implementation

{$R *.dfm}

{ TFrm_DataPenawaranHarga }

procedure TFrm_DataPenawaranHarga.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('nk').Value := customerpenawaran;
    Open;
  end;  
end;

procedure TFrm_DataPenawaranHarga.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataPenawaranHarga.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataPenawaranHarga.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

procedure TFrm_DataPenawaranHarga.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataPenawaranHarga.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
