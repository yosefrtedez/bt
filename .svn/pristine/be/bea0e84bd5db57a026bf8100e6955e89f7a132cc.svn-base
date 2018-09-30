unit UDaftarCA;

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
  RzButton, ExtCtrls, RzPanel, cxPC;

type
  TFrm_DaftarCA = class(TForm)
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
    QDatatotalloan: TFloatField;
    QDatasisaloan: TFloatField;
    BtnNew: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarCA: TFrm_DaftarCA;

implementation

uses UDM, UMain, UDaftarLoan, UInputLoan;

{$R *.dfm}

procedure TFrm_DaftarCA.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarCA.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarCA.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarCA.BtnPerincianClick(Sender: TObject);
var
  f: TFrm_DaftarKasbon;
  ts: TcxTabSheet;
  nomor:Integer;
  textpanel: string;
begin
  if QData.IsEmpty then Exit;
  if not DM.CekTabOpen('Rincian Cash Advance') then begin
    f := TFrm_DaftarKasbon.Create(Self);
    nomor := QData.FieldValues['nokontak'];
    textpanel := '             Rincian Cash Advance '+QData.FieldValues['namakontak'];
    with f do begin
      staffid := nomor;
      f.RzPanel1.Caption := textpanel;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarCA.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarCA.BtnNewClick(Sender: TObject);
var
  refloan: string;
  noloan: Integer;
begin
  {if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
  MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
  Exit;
  end;                   }
  Application.CreateForm(TFrm_InputLoan, Frm_InputLoan);
  Frm_InputLoan.ClearText;
  if Frm_InputLoan.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      refloan := DM.GenerateKodeTransaksi('CA',Date);
      noloan := DM.GenerateNoMaster('cashadvance');
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
      ParamByName('a').Value := 'CA';
      ParamByName('b').Value := Date;
      ParamByName('c').Value := refloan;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_loan values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m)';
      ParamByName('a').Value := noloan;
      ParamByName('b').Value := refloan;
      ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',Frm_InputLoan.dtptanggal.Date);
      ParamByName('d').Value := Frm_InputLoan.LKontak.Caption;
      ParamByName('e').Value := Frm_InputLoan.LAkunCA.Caption;
      ParamByName('f').Value := Frm_Main.txtuser.Caption;
      ParamByName('g').Value := Frm_InputLoan.LKas.Caption;
      ParamByName('h').Value := Frm_InputLoan.LKasTransir.Caption;
      ParamByName('i').Value := Frm_InputLoan.txtsebesar.Value;
      ParamByName('j').Value := 0;
      ParamByName('k').Value := 0;
      ParamByName('l').Value := 0;
      ParamByName('m').Value := Frm_InputLoan.txtkeperluan.Text;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

end.
