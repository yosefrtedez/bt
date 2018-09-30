unit UDataPenjualanOrder;

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
  TFrm_DataPenjualanOrder = class(TForm)
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
    BtnUpdate: TRzToolButton;
    QDatanopenjualanorder: TLargeintField;
    QDatakodepenjualanorder: TStringField;
    QDatanokontak: TLargeintField;
    QDatanopenjualanrequest: TLargeintField;
    QDatatglkirim: TDateField;
    QDatatgltransaksi: TDateField;
    QDatanosales: TLargeintField;
    QDatapocustomer: TStringField;
    QDataapprove: TSmallintField;
    QDataselesai: TSmallintField;
    QDatadiskonday: TIntegerField;
    QDataduedate: TIntegerField;
    QDataearlydiskon: TFloatField;
    QDatalatecharge: TFloatField;
    QDatatotaldpp: TFloatField;
    QDatatotalpajak: TFloatField;
    QDatabiayalain: TFloatField;
    QDatanoakunbiayalain: TLargeintField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDatanamakontak: TStringField;
    QDatatglapprove: TDateTimeField;
    QDataiscancel: TSmallintField;
    QDatakodepenjualando: TStringField;
    QDatatgldo: TDateField;
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
  Frm_DataPenjualanOrder: TFrm_DataPenjualanOrder;
  customerorder,statusdo: Integer;

implementation

{$R *.dfm}

{ TFrm_DataPenjualanOrder }

procedure TFrm_DataPenjualanOrder.RefreshQ;
begin
  with QData do begin
    Close;
    SQL.Clear;
    if statusdo = 0 then begin
      SQL.Text := 'select a.*,ifnull(b.namakontak,'+QuotedStr('')+')as namakontak from ' +
                  '(SELECT * FROM tbl_penjualanorder WHERE nokontak=:nk and selesai=0 and iscancel=0 and approve=1 and kodepenjualando='+QuotedStr('')+')as a ' +
                  'left join tbl_kontak as b on b.nokontak=a.nokontak ORDER BY a.tgltransaksi';
    end else begin
      SQL.Text := 'select a.*,ifnull(b.namakontak,'+QuotedStr('')+')as namakontak from ' +
                  '(SELECT * FROM tbl_penjualanorder WHERE nokontak=:nk and selesai=0 and iscancel=0 and approve=1 and kodepenjualando<>'+QuotedStr('')+')as a ' +
                  'left join tbl_kontak as b on b.nokontak=a.nokontak ORDER BY a.tgltransaksi';
    end;
    ParamByName('nk').Value := customerorder;
    Open;
  end;  
end;

procedure TFrm_DataPenjualanOrder.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataPenjualanOrder.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataPenjualanOrder.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataPenjualanOrder.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

procedure TFrm_DataPenjualanOrder.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
