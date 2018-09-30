unit UDaftarSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, SMDBGrid, ExtCtrls, RzPanel,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxPC;

type
  TFrm_DaftarSatuan = class(TForm)
    PnBarang: TRzPanel;
    DSData: TDataSource;
    QData: TZQuery;
    RzPanel3: TRzPanel;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    RzPanel2: TRzPanel;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodesatuan: TcxGridDBColumn;
    dbgdataDBTableView1namasatuan: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    BtnSelesai: TRzBitBtn;
    BtnUpdate: TRzToolButton;
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarSatuan: TFrm_DaftarSatuan;

implementation

uses UDM, UInputSatuan, UMain;

{$R *.dfm}

procedure TFrm_DaftarSatuan.BtnBaruClick(Sender: TObject);
var
  nosatuan:Integer;
begin
  Application.CreateForm(TFrm_InputSatuan, Frm_InputSatuan);
  Frm_InputSatuan.ClearText;
  if Frm_InputSatuan.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      nosatuan := DM.GenerateNoMaster('satuan');
      Close;
      SQL.Text := 'insert into tbl_satuan values (:a,:b,:c)';
      ParamByName('a').Value := nosatuan;
      ParamByName('b').Value := Frm_InputSatuan.txtkode.Text;
      ParamByName('c').Value := Frm_InputSatuan.txtnama.Text;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;


procedure TFrm_DaftarSatuan.BtnUbahClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputSatuan, Frm_InputSatuan);
  with Frm_InputSatuan do begin
    ClearText;
    LID.Caption := QData.FieldValues['nosatuan'];
    txtkode.Text := QData.FieldValues['kodesatuan'];
    txtnama.Text := QData.FieldValues['namasatuan'];
    if Frm_InputSatuan.ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.Con;
        Close;
        SQL.Text := 'update tbl_satuan set kodesatuan=:b,namasatuan=:c where nosatuan=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarSatuan.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Anda yakin data unit pengukuran ini akan dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_barang where nosatuan=:ib';
      ParamByName('ib').Value := QData.FieldValues['nosatuan'];
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_satuan where nosatuan=:np';
        ParamByName('np').Value := QData.FieldValues['nosatuan'];
        ExecSQL;
      end else begin
        MessageDlg('Data unit tersebut telah digunakan dalam data barang, sehingga tidak dapat dihapus !',mtError,[mbOK],0);
      end;
      Free;
    end;    
    RefreshQ;
  end;
end;

procedure TFrm_DaftarSatuan.RefreshQ;
begin
  QData.Close;
  QData.SQL.Text := 'select * from tbl_satuan order by namasatuan';
  QData.Open;
end;

procedure TFrm_DaftarSatuan.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnUbahClick(nil);
end;

procedure TFrm_DaftarSatuan.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarSatuan.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
