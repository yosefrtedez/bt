unit UDaftarJurnalUmum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TFrm_DaftarJurnalUmum = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatatgltransaksi: TDateField;
    QDataketerangan: TStringField;
    QDatanilai: TFloatField;
    QDatanamauser: TStringField;
    QDatanojurnalumum: TLargeintField;
    QDatakodejurnalumum: TStringField;
    BtnUpdate: TRzToolButton;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    dbgdataDBTableView1kodejurnalumum: TcxGridDBColumn;
    dbgdataDBTableView1hasilkali: TcxGridDBColumn;
    BtnCetak: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarJurnalUmum: TFrm_DaftarJurnalUmum;
  datedari,datesampai:string;

implementation

uses UDM, UMenuBukuBesar, UFTanggal, UMain, UInputJurnalUmum;

{$R *.dfm}

procedure TFrm_DaftarJurnalUmum.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarJurnalUmum.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarJurnalUmum.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarJurnalUmum.BtnFilterClick(Sender: TObject);
begin
  Application.CreateForm(TFTanggal, FTanggal);
  with FTanggal do begin
    if ShowModal=mrok then begin
      datedari := FormatDateTime('yyyy-mm-dd',FTanggal.dtpdari.Date);
      datesampai := FormatDateTime('yyyy-mm-dd',FTanggal.dtpsampai.Date);
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarJurnalUmum.BtnPerincianClick(
  Sender: TObject);
var
  i:Integer;
  f: TFrm_InputJurnalUmum;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;       }
  if not DM.CekTabOpen('Jurnal Umum') then begin
    f := TFrm_InputJurnalUmum.Create(Self);
    with f do begin
      ClearText;
      dbgpembayaran.AddRow();
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        txtreferensi.Text := QData.FieldValues['kodejurnalumum'];
        LID.Caption := QData.FieldValues['nojurnalumum'];
        dtptanggal.Date := QData.FieldValues['tgltransaksi'];
        txtketerangan.Text := QData.FieldValues['keterangan'];
        Close;
        SQL.Text := 'select a.*,b.kodeakun,b.namaakun from ' +
                    '(select * from tbl_jurnalumumdetail where nojurnalumum=:np) as a ' +
                    'left join tbl_akun as b on b.noakun=a.noakun';
        ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
        Open;
        First;
        if not IsEmpty then begin
          dbgpembayaran.ClearRows;
          for i:=0 to RecordCount-1 do begin
            with dbgpembayaran do begin
              AddRow();
              Cell[0,i].AsString := FieldValues['kodeakun'];
              Cell[1,i].AsString := FieldValues['namaakun'];
              Cell[2,i].AsFloat := FieldValues['debit'];
              Cell[3,i].AsFloat := FieldValues['kredit'];
              Cell[5,i].AsInteger := FieldValues['noakun'];
            end;
            Next;
          end;
          UpdateTotal;
        end;
        Free;
      end;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarJurnalUmum.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;  }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'BukuBesar4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
      ParamByName('t').Value := 'GJ';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
      ParamByName('t').Value := 'GJ';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_jurnalumum where nojurnalumum=:np';
      ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_jurnalumumdetail where nojurnalumum=:np';
      ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarJurnalUmum.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarJurnalUmum.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarJurnalUmum.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
    ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
    ParamByName('t').Value := 'GJ';
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
      ParamByName('a').Value := QData.FieldValues['nojurnalumum'];
      ParamByName('b').Value := 'GJ';
      ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['nilai']));
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
      ParamByName('t').Value := 'GJ';
      ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['nilai']));
      ExecSQL;
    end;
    dm.Q_NotaJurnalUmum.Close;
    DM.Q_NotaJurnalUmum.ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
    DM.Q_NotaJurnalUmum.Open;
    dm.Q_NotaTerbilang.Close;
    DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nojurnalumum'];
    DM.Q_NotaTerbilang.ParamByName('t').Value := 'GJ';
    DM.Q_NotaTerbilang.Open;
    DM.Nota_JurnalUmum.ShowReport(True);
    Free;
  end;
end;

end.
