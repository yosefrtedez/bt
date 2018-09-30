unit UDaftarPajak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, RzButton,
  ExtCtrls, RzPanel;

type
  TFrm_DaftarPajak = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanopajak: TLargeintField;
    QDatakodepajak: TStringField;
    QDatanamapajak: TStringField;
    QDatapersen: TFloatField;
    dbgdataDBTableView1kodepajak: TcxGridDBColumn;
    dbgdataDBTableView1namapajak: TcxGridDBColumn;
    dbgdataDBTableView1persen: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPajak: TFrm_DaftarPajak;

implementation

uses UDM, UInputPajak, RzEdit, RzCmboBx, UMain;

{$R *.dfm}

procedure TFrm_DaftarPajak.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPajak.RefreshQ;
begin
  with QData do begin
    Close;
    Open;
  end;
end;

procedure TFrm_DaftarPajak.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_InputPajak, Frm_InputPajak);
  Frm_InputPajak.ClearText;
  if Frm_InputPajak.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'insert into tbl_pajak values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
      ParamByName('a').Value := DM.GenerateNoMaster('pajak');
      ParamByName('b').Value := Frm_InputPajak.txtkode.Text;
      ParamByName('c').Value := Frm_InputPajak.txtnama.Text;
      ParamByName('d').Value := Frm_InputPajak.txtpersen.Value;
      ParamByName('e').Value := Frm_InputPajak.cbtipe.ItemIndex;
      ParamByName('f').Value := Frm_InputPajak.LPajakPembelian.Caption;
      ParamByName('g').Value := Frm_InputPajak.LPajakPenjualan.Caption;
      ParamByName('h').Value := Frm_InputPajak.LPajakPembelianblm.Caption;
      ParamByName('i').Value := Frm_InputPajak.LPajakPenjualanblm.Caption;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarPajak.BtnEditClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['nopajak'] = 0 then begin
    MessageDlg('Data pajak ini tidak dapat diubah!',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputPajak, Frm_InputPajak);
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:np';
    ParamByName('np').Value := QData.FieldValues['nopajak'];
    Open;
    with Frm_InputPajak do begin
      LID.Caption := FieldValues['nopajak'];
      txtkode.Text := FieldValues['kodepajak'];
      txtnama.Text := FieldValues['namapajak'];
      txtpersen.Value := FieldValues['persen'];
      cbtipe.ItemIndex := FieldValues['tipepajak'];
      LPajakPenjualan.Caption := FieldValues['akunpajakpenjualan'];
      LPajakPembelian.Caption := FieldValues['akunpajakpembelian'];
      LPajakPenjualanblm.Caption := FieldValues['akunpajakpenjualanblm'];
      LPajakPembelianblm.Caption := FieldValues['akunpajakpembelianblm'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPenjualan.Caption;
      Open;
      if IsEmpty then begin
        LPajakPenjualan.Caption := '0';
        txtpajakpenjualan.Clear;
      end else txtpajakpenjualan.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPembelian.Caption;
      Open;
      if IsEmpty then begin
        LPajakPembelian.Caption := '0';
        txtpajakpembelian.Clear;
      end else txtpajakpembelian.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPenjualanblm.Caption;
      Open;
      if IsEmpty then begin
        LPajakPenjualanblm.Caption := '0';
        txtpajakpenjualanblm.Clear;
      end else txtpajakpenjualanblm.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPembelianblm.Caption;
      Open;
      if IsEmpty then begin
        LPajakPembelianblm.Caption := '0';
        txtpajakpembelianblm.Clear;
      end else txtpajakpembelianblm.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      if Frm_InputPajak.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pajak set kodepajak=:b,namapajak=:c,persen=:d,tipepajak=:e,akunpajakpembelian=:f,akunpajakpenjualan=:g,akunpajakpembelianblm=:h,akunpajakpenjualanblm=:i where nopajak=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ParamByName('d').Value := txtpersen.Value;
        ParamByName('e').Value := cbtipe.ItemIndex;
        ParamByName('f').Value := LPajakPembelian.Caption;
        ParamByName('g').Value := LPajakPenjualan.Caption;
        ParamByName('h').Value := LPajakPembelianblm.Caption;
        ParamByName('i').Value := LPajakPenjualanblm.Caption;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarPajak.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['nopajak'] = 0 then begin
    MessageDlg('Data tidak dapat dihapus!',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Hapus data pajak ini ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pajak where nopajak=:np';
      ParamByName('np').Value := QData.FieldValues['nopajak'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarPajak.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPajak.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnEditClick(nil);
end;

end.
