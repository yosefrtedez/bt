unit UReminder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzTabs, RzButton, StdCtrls, ExtCtrls, RzPanel, Menus,DateUtils,
  ComCtrls, RzDTP, cxPC, RzCmboBx, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFrm_Reminder = class(TForm)
    DSStok: TDataSource;
    QHutang: TZQuery;
    DSHutang: TDataSource;
    QPiutang: TZQuery;
    DSPiutang: TDataSource;
    RzPanel5: TRzPanel;
    BtnTutup: TRzBitBtn;
    Pnkiri: TRzPanel;
    RzPanel1: TRzPanel;
    BtnUpdateStok: TRzBitBtn;
    QStok: TZQuery;
    QStoknobarang: TLargeintField;
    QStokkodebarang: TStringField;
    QStoknamabarang: TStringField;
    QStoknosatuan: TLargeintField;
    QStoktotal: TFloatField;
    QStokkodesatuan: TStringField;
    cbtipe: TRzComboBox;
    dbgstok: TcxGrid;
    dbgstokDBTableView1: TcxGridDBTableView;
    dbgstokLevel1: TcxGridLevel;
    QStokminstok: TFloatField;
    dbgstokDBTableView1kodebarang: TcxGridDBColumn;
    dbgstokDBTableView1namabarang: TcxGridDBColumn;
    dbgstokDBTableView1total: TcxGridDBColumn;
    dbgstokDBTableView1kodesatuan: TcxGridDBColumn;
    dbgpiutang: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dbghutang: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    QHutangnopembelianinvoice: TLargeintField;
    QHutangkodepembelianinvoice: TStringField;
    QHutangtglpembelianinvoice: TDateField;
    QHutangnokontak: TLargeintField;
    QHutangtotalhutang: TFloatField;
    QHutangnoakunhutang: TLargeintField;
    QHutangjumlahretur: TFloatField;
    QHutangjumlahbayar: TFloatField;
    QHutangsisahutang: TFloatField;
    QHutangnamakontak: TStringField;
    cxGridDBTableView2kodepembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView2tglpembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView2tgltempo: TcxGridDBColumn;
    cxGridDBTableView2sisahutang: TcxGridDBColumn;
    cxGridDBTableView2namakontak: TcxGridDBColumn;
    QPiutangnopenjualaninvoice: TLargeintField;
    QPiutangkodepenjualaninvoice: TStringField;
    QPiutangtglpenjualaninvoice: TDateField;
    QPiutangtgltempo: TFloatField;
    QPiutangnokontak: TLargeintField;
    QPiutangtotalpiutang: TFloatField;
    QPiutangjumlahretur: TFloatField;
    QPiutangjumlahbayar: TFloatField;
    QPiutangsisapiutang: TFloatField;
    QPiutangnamacustomer: TStringField;
    cxGridDBTableView1kodepenjualaninvoice: TcxGridDBColumn;
    cxGridDBTableView1tglpenjualaninvoice: TcxGridDBColumn;
    cxGridDBTableView1tgltempo: TcxGridDBColumn;
    cxGridDBTableView1sisapiutang: TcxGridDBColumn;
    cxGridDBTableView1namacustomer: TcxGridDBColumn;
    QHutangtgltempo: TDateField;
    dbgorderpembelian: TcxGrid;
    dbgorderpembelianDBTableView1: TcxGridDBTableView;
    dbgorderpembelianDBTableView1kodepembelianorder: TcxGridDBColumn;
    dbgorderpembelianDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgorderpembelianDBTableView1namakontak: TcxGridDBColumn;
    dbgorderpembelianDBTableView1hasilkali: TcxGridDBColumn;
    dbgorderpembelianLevel1: TcxGridLevel;
    QOrderPembelian: TZQuery;
    QOrderPembeliannopembelianorder: TLargeintField;
    QOrderPembeliankodepembelianorder: TStringField;
    QOrderPembeliannokontak: TLargeintField;
    QOrderPembeliannopembelianrequest: TLargeintField;
    QOrderPembeliantgltransaksi: TDateField;
    QOrderPembeliantotal: TFloatField;
    QOrderPembeliannamauser: TStringField;
    QOrderPembelianselesai: TSmallintField;
    QOrderPembeliannamakontak: TStringField;
    QOrderPembeliantotalpajak: TFloatField;
    QOrderPembeliantotaldpp: TFloatField;
    QOrderPembelianketerangan: TMemoField;
    QOrderPembelianbiayalain: TFloatField;
    QOrderPembelianpph: TFloatField;
    QOrderPembelianapprove: TSmallintField;
    QOrderPembeliantglapprove: TDateTimeField;
    QOrderPembeliandiskonday: TIntegerField;
    QOrderPembelianduedate: TIntegerField;
    QOrderPembelianearlydiskon: TFloatField;
    QOrderPembelianlatecharge: TFloatField;
    DS_OrderPembelian: TDataSource;
    PopupMenu1: TPopupMenu;
    Approve1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnTutupClick(Sender: TObject);
    procedure BtnUpdateStokClick(Sender: TObject);
    procedure Approve1Click(Sender: TObject);
    procedure dbgorderpembelianDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_Reminder: TFrm_Reminder;

implementation

uses UDM, UMain, UDataOrderPembelianDetail;

{$R *.dfm}

procedure TFrm_Reminder.FormShow(Sender: TObject);
begin
  cbtipe.ItemIndex := 0;
  RefreshQ;
end;

procedure TFrm_Reminder.RefreshQ;
begin
  dbgstok.Visible := False;
  dbgstok.Align := alNone;
  dbgpiutang.Visible := False;
  dbgpiutang.Align := alNone;
  dbghutang.Visible := False;
  dbghutang.Align := alNone;
  dbgorderpembelian.Visible := False;
  dbgorderpembelian.Align := alNone;
  if cbtipe.ItemIndex = 0 then begin
    dbgstok.Visible := True;
    dbgstok.Align := alClient;
    QStok.Close;
    QStok.Open;
  end else if cbtipe.ItemIndex = 1 then begin
    dbghutang.Visible := True;
    dbghutang.Align := alClient;
    QHutang.Close;
    QHutang.Open;
  end else if cbtipe.ItemIndex = 2 then begin
    dbgpiutang.Visible := True;
    dbgpiutang.Align := alClient;
    QPiutang.Close;
    QPiutang.Open;
  end else if cbtipe.ItemIndex = 3 then begin
    dbgorderpembelian.Visible := True;
    dbgorderpembelian.Align := alClient;
    QOrderPembelian.Close;
    QOrderPembelian.Open;
  end;
end;

procedure TFrm_Reminder.BtnTutupClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_Reminder.BtnUpdateStokClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_Reminder.Approve1Click(Sender: TObject);
begin
  if QOrderPembelian.IsEmpty then Exit;
  if QOrderPembelian.FieldValues['approve']=0 then begin
    {if DM.CekPlafon(StrToInt(LSupplier.Caption),txttotal.Value)=False then begin
      if MessageDlg('Transaksi ini melebihi batas kredit supplier. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
        Exit;
      end else cbapprove.Checked := False;
    end else cbapprove.Checked := True; }
    if MessageDlg('Apakah data order pembelian, No. '+QOrderPembelian.FieldValues['kodepembelianorder']+' disetujui ?',mtConfirmation,[mbYes,mbNo],0)= mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'update tbl_pembelianorder set approve=:ab, tglapprove=:aa where nopembelianorder=:np';
        ParamByName('np').Value := QOrderPembelian.FieldValues['nopembelianorder'];
        ParamByName('aa').Value := Now;
        ParamByName('ab').Value := 1;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end else begin
    MessageDlg('Transaksi Order Pembelian telah disetujui!',mtError,[mbOK],0);
  end;
end;

procedure TFrm_Reminder.dbgorderpembelianDBTableView1DblClick(
  Sender: TObject);
begin
  if QOrderPembelian.IsEmpty then Exit;
  Application.CreateForm(TFrm_DataOrderPembelianDetail, Frm_DataOrderPembelianDetail);
  ANoOrder := QOrderPembelian.FieldValues['nopembelianorder'];
  Frm_DataOrderPembelianDetail.RefreshQ;
  Frm_DataOrderPembelianDetail.ShowModal;
end;

end.
