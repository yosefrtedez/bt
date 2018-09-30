unit UDaftarKelompokBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  Mask, RzEdit, RzButton, Grids, DBGrids, SMDBGrid, ExtCtrls, RzPanel,
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
  TFrm_DaftarKelompokBarang = class(TForm)
    PnBarang: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    RzPanel2: TRzPanel;
    DSData: TDataSource;
    QData: TZQuery;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kelompokbarang: TcxGridDBColumn;
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
  Frm_DaftarKelompokBarang: TFrm_DaftarKelompokBarang;

implementation

uses UDM, UInputKelompokBarang, UMain;

{$R *.dfm}

procedure TFrm_DaftarKelompokBarang.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_InputKelompokBarang, Frm_InputKelompokBarang);
  Frm_InputKelompokBarang.ClearText;
  if Frm_InputKelompokBarang.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      Close;
      SQL.Text := 'insert into tbl_kelompokbarang values (:a,:b,:d,:f,:k)';
      ParamByName('a').Value := dm.GenerateNoMaster('kelompokbarang');
      ParamByName('b').Value := Frm_InputKelompokBarang.txtnama.Text;
      if Frm_InputKelompokBarang.GBTipe.ItemIndex = 0 then
        ParamByName('d').Value := Frm_InputKelompokBarang.LAkunHpp.Caption
      else ParamByName('d').Value := 0;
      ParamByName('f').Value := Frm_InputKelompokBarang.LAkunPersediaan.Caption;
      ParamByName('k').Value := Frm_InputKelompokBarang.GBTipe.ItemIndex;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarKelompokBarang.BtnUbahClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputKelompokBarang, Frm_InputKelompokBarang);
  with Frm_InputKelompokBarang do begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;   
      ClearText;
      LID.Caption := QData.FieldValues['nokelompokbarang'];
      txtnama.Text := QData.FieldValues['kelompokbarang'];
      LAkunHpp.Caption := QData.FieldValues['noakunhpp'];
      LAkunPersediaan.Caption := QData.FieldValues['noakunpersediaan'];
      GBTipe.ItemIndex := QData.FieldValues['tipebarang'];
      GBTipeClick(nil);
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunHpp.Caption;
      Open;
      if IsEmpty then begin
        LAkunHpp.Caption := '0';
        txtakunhpp.Clear;
      end else txtakunhpp.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunPersediaan.Caption;
      Open;
      if IsEmpty then begin
        LAkunPersediaan.Caption := '0';
        txtakunpersediaan.Clear;
      end else txtakunpersediaan.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];

      if Frm_InputKelompokBarang.ShowModal = mrok then begin
        Connection := dm.Con;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_kelompokbarang set kelompokbarang=:b,noakunhpp=:d,noakunpersediaan=:f,tipebarang=:k where nokelompokbarang=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := Frm_InputKelompokBarang.txtnama.Text;
        if Frm_InputKelompokBarang.GBTipe.ItemIndex = 0 then
          ParamByName('d').Value := Frm_InputKelompokBarang.LAkunHpp.Caption
        else ParamByName('d').Value := 0;
        ParamByName('f').Value := Frm_InputKelompokBarang.LAkunPersediaan.Caption;
        ParamByName('k').Value := Frm_InputKelompokBarang.GBTipe.ItemIndex;
        ExecSQL;
        RefreshQ;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_DaftarKelompokBarang.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Anda yakin data akan dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select * from tbl_barang where nokelompokbarang=:a';
      ParamByName('a').Value := QData.FieldValues['nokelompokbarang'];
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_kelompokbarang where nokelompokbarang=:np';
        ParamByName('np').Value := QData.FieldValues['nokelompokbarang'];
        ExecSQL;
      end else MessageDlg('Data kelompok barang masih terpakai dalam data barang. Data tidak dapat dihapus!',mtError,[mbOK],0);
      Free;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarKelompokBarang.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarKelompokBarang.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnUbahClick(nil);
end;

procedure TFrm_DaftarKelompokBarang.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarKelompokBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
