unit UDaftarPPh;

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
  TFrm_DaftarPPh = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodepajak: TcxGridDBColumn;
    dbgdataDBTableView1namapajak: TcxGridDBColumn;
    dbgdataDBTableView1persen: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatapersen: TFloatField;
    DSData: TDataSource;
    QDatanopph: TLargeintField;
    QDatakodepph: TStringField;
    QDatanamapph: TStringField;
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
  Frm_DaftarPPh: TFrm_DaftarPPh;

implementation

uses UDM, UInputPPh, RzEdit, RzCmboBx, UMain;

{$R *.dfm}

procedure TFrm_DaftarPPh.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPPh.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarPPh.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_InputPPh, Frm_InputPPh);
  Frm_InputPPh.ClearText;
  if Frm_InputPPh.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'insert into tbl_pajakpenghasilan values (:a,:b,:c,:d,:e)';
      ParamByName('a').Value := DM.GenerateNoMaster('pph');
      ParamByName('b').Value := Frm_InputPPh.txtkode.Text;
      ParamByName('c').Value := Frm_InputPPh.txtnama.Text;
      ParamByName('d').Value := Frm_InputPPh.txtpersen.Value;
      ParamByName('e').Value := Frm_InputPPh.LPPh.Caption;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarPPh.BtnEditClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['nopph'] = 0 then begin
    MessageDlg('Data pajak ini tidak dapat diubah!',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputPPh, Frm_InputPPh);
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajakpenghasilan where nopph=:np';
    ParamByName('np').Value := QData.FieldValues['nopph'];
    Open;
    with Frm_InputPPh do begin
      LID.Caption := FieldValues['nopph'];
      txtkode.Text := FieldValues['kodepph'];
      txtnama.Text := FieldValues['namapph'];
      txtpersen.Value := FieldValues['persen'];
      LPPh.Caption := FieldValues['akunpph'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPPh.Caption;
      Open;
      if IsEmpty then begin
        LPPh.Caption := '0';
        txtpph.Clear;
      end else txtpph.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      if Frm_InputPPh.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pajakpenghasilan set kodepph=:b,namapph=:c,persen=:d,akunpph=:f where nopph=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ParamByName('d').Value := txtpersen.Value;
        ParamByName('f').Value := LPPh.Caption;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarPPh.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['nopph'] = 0 then begin
    MessageDlg('Data tidak dapat dihapus!',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Hapus data pajak ini ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pajakpenghasilan where nopph=:np';
      ParamByName('np').Value := QData.FieldValues['nopph'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarPPh.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPPh.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnEditClick(nil);
end;

end.
