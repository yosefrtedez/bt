unit UDaftarAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel,
  ExtCtrls, RzPanel, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC,
  cxCheckBox;

type
  TFrm_DaftarAkun = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    BtnEdit: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    QDatanoakun: TLargeintField;
    QDatanoklasifikasi: TLargeintField;
    QDatanosubklasifikasi: TLargeintField;
    QDatanamaakun: TStringField;
    QDatakas: TSmallintField;
    QDataaktif: TSmallintField;
    QDatanamasubklasifikasi: TStringField;
    BtnBukuBesar: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1namaakun: TcxGridDBColumn;
    dbgdataDBTableView1namasubklasifikasi: TcxGridDBColumn;
    dbgdataDBTableView1kodeakun: TcxGridDBColumn;
    QDatakodeakun: TStringField;
    BtnUpdate: TRzToolButton;
    QDatanilai: TFloatField;
    dbgdataDBTableView1nilai: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnBukuBesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarAkun: TFrm_DaftarAkun;

implementation

uses UInputAkun, UDM, UMain, UBukuBesar;

{$R *.dfm}

{ TFrm_DaftarAkun }

procedure TFrm_DaftarAkun.RefreshQ;
begin
  with QData do begin
    Close;
    Open;
  end;
end;

procedure TFrm_DaftarAkun.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarAkun.BtnSelesaiClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;    

procedure TFrm_DaftarAkun.BtnBaruClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_InputAkun, Frm_InputAkun);
  with Frm_InputAkun do begin
    ClearText;
    if ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'insert into tbl_akun values (:a,:b,:c,:d,:e,:f,:h)';
        ParamByName('a').Value := DM.GenerateNoMaster('akun');
        ParamByName('b').Value := LKlasifikasi.Caption;
        ParamByName('c').Value := LSubKlasifikasi.Caption;
        ParamByName('d').Value := txtkode.Text;
        ParamByName('e').Value := txtNama.Text;
        if cbkas.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        if cbaktif.Checked = True then
          ParamByName('h').Value := 1
        else ParamByName('h').Value := 0;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarAkun.BtnEditClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputAkun, Frm_InputAkun);
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Text := 'select * from tbl_akundefault where noakun=:na';
    ParamByName('na').Value := QData.FieldValues['noakun'];
    Open;
    if not IsEmpty then begin
      MessageDlg('Rekening ini tidak disarankan untuk Anda rubah peruntukannya, karena telah digunakan sebagai Akun Default.'#10#13'Pastikan Anda menyadari resiko yang dapat terjadi sebelum mengedit rekening ini',mtWarning,[mbOK],0);
      Frm_InputAkun.cbklasifikasi.ReadOnly := True;
      Frm_InputAkun.txtkode.ReadOnly := True;
      Frm_InputAkun.cbkas.Enabled := False;
      Frm_InputAkun.cbaktif.Enabled := False;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarakun where noakun=:a';
      ParamByName('a').Value := QData.FieldValues['noakun'];
      Open;
      if not IsEmpty then begin
        MessageDlg('Rekening ini tidak disarankan untuk Anda rubah peruntukannya, karena telah digunakan dalam transaksi.'#10#13'Pastikan Anda menyadari resiko yang dapat terjadi sebelum mengedit rekening ini',mtWarning,[mbOK],0);
        Frm_InputAkun.cbklasifikasi.ReadOnly := True;
        Frm_InputAkun.txtkode.ReadOnly := True;
        Frm_InputAkun.cbkas.Enabled := False;
        Frm_InputAkun.cbaktif.Enabled := False;
      end;
    end;
    with Frm_InputAkun do begin
      ClearText;
      LID.Caption := QData.FieldValues['noakun'];
      LKlasifikasi.Caption := QData.FieldValues['noklasifikasi'];
      LSubKlasifikasi.Caption := QData.FieldValues['nosubklasifikasi'];
      txtkode.Text := QData.FieldValues['kodeakun'];
      txtNama.Text := QData.FieldValues['namaakun'];
      cbklasifikasi.Text := QData.FieldValues['namasubklasifikasi'];
      if QData.FieldValues['kas'] = 1 then
        cbkas.Checked := True
      else cbkas.Checked := False;
      if QData.FieldValues['aktif'] = 1 then
        cbaktif.Checked := True
      else cbaktif.Checked := False;
      if Frm_InputAkun.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_akun set noklasifikasi=:a,nosubklasifikasi=:b,kodeakun=:c,namaakun=:d,kas=:e,aktif=:f where noakun=:na';
        ParamByName('na').Value := LID.Caption;
        ParamByName('a').Value := LKlasifikasi.Caption;
        ParamByName('b').Value := LSubKlasifikasi.Caption;
        ParamByName('c').Value := txtkode.Text;
        ParamByName('d').Value := txtNama.Text;
        if cbkas.Checked = True then
          ParamByName('e').Value := 1
        else ParamByName('e').Value := 0;
        if cbaktif.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarAkun.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Anda yakin data Akun ini akan dihapus ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Text := 'select * from tbl_akundefault where noakun=:na';
      ParamByName('na').Value := QData.FieldValues['noakun'];
      Open;
      if not IsEmpty then begin
        MessageDlg('Akun ini tidak dapat diubah karena digunakan sebagai Akun Default',mtError,[mbOK],0);
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_bukubesarakun where noakun=:a';
        ParamByName('a').Value := QData.FieldValues['noakun'];
        Open;
        if IsEmpty then begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_akun where noakun=:na';
          ParamByName('na').Value := QData.FieldValues['noakun'];
          ExecSQL;
        end else begin
          MessageDlg('Data ini telah digunakan oleh data lain atau transaksi. Data tidak dapat dihapus',mtError,[mbOK],0);
        end;
      end;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarAkun.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnEditClick(nil);
end;

procedure TFrm_DaftarAkun.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarAkun.BtnBukuBesarClick(Sender: TObject);
var
  f: TFrm_BukuBesar;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'BukuBesar2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Buku Besar') then begin
    f := TFrm_BukuBesar.Create(Self);
    akunbuku := QData.FieldValues['noakun'];
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
