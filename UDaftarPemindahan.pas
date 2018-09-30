unit UDaftarPemindahan;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DaftarPemindahan = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatatgltransaksi: TDateField;
    QDataketerangan: TStringField;
    QDatanamauser: TStringField;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopemindahan: TLargeintField;
    QDatakodepemindahan: TStringField;
    QDatanogudang: TLargeintField;
    QDataposting: TSmallintField;
    QDataPos: TStringField;
    dbgdataDBTableView1Pos: TcxGridDBColumn;
    QDatatipe: TSmallintField;
    QDatatip: TStringField;
    dbgdataDBTableView1tip: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPemindahan: TFrm_DaftarPemindahan;
  datedari,datesampai:string;

implementation

uses UDM, UMain, UFTanggal, UPemindahanBarang;

{$R *.dfm}

procedure TFrm_DaftarPemindahan.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPemindahan.RefreshQ;
begin
  with QData do begin
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPemindahan.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPemindahan.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPemindahan.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarPemindahan.BtnHapusClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;    }
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
    ParamByName('a').Value := QData.FieldValues['nopemindahan'];
    ParamByName('t').Value := 'MV';
    Open;
    for i:=0 to RecordCount-1 do begin
      if FieldValues['terjual']=0 then begin
        Next;
      end else begin
        MessageDlg('Transaksi tidak dapat diunposting, karena barang telah terpakai oleh transaksi lain'#10#13'Unposting atau hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
        Free;
        Exit;
      end;
    end;
    if MessageDlg('Apakah transaksi akan diunposting ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_pemindahan set posting=0 where nopemindahan=:np';
      ParamByName('np').Value := QData.FieldValues['nopemindahan'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopengambilan'];
      ParamByName('t').Value := 'MV';
      Open;
      for i:=0 to RecordCount-1 do begin
        if FieldValues['masuk'] > 0 then begin
          DM.HitungHPPAverage1(FieldValues['nobarang'],FieldValues['masuk'],FieldValues['hpp']);
          Next;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopemindahan'];
      ParamByName('t').Value := 'MV';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopemindahan'];
      ParamByName('t').Value := 'MV';
      ExecSQL;
      Close;
      SQL.Text := 'delete from tbl_pemindahan where nopemindahan=:np';
      ParamByName('np').Value := QData.FieldValues['nopemindahan'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pemindahandetail where nopemindahan=:np';
      ParamByName('np').Value := QData.FieldValues['nopemindahan'];
      ExecSQL;
      RefreshQ;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarPemindahan.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_Pemindahan;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if not DM.CekTabOpen('Pemindahan Barang') then begin
    f := TFrm_Pemindahan.Create(Self);
    with f do begin
      tipe := QData.FieldValues['tipe'];
      ClearText;
      dbgbarang.AddRow();
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as gudang from ' +
                    '(select * from tbl_pemindahan where nopemindahan=:np)as a ' +
                    'left join tbl_gudang as b on b.nogudang=a.nogudang';
        ParamByName('np').Value := QData.FieldValues['nopemindahan'];
        Open;
        LID.Caption := FieldValues['nopemindahan'];
        txtref.Text := FieldValues['kodepemindahan'];
        txtketerangan.Text := FieldValues['keterangan'];
        dtptanggal.Date := FieldValues['tgltransaksi'];
        txtgudang.Text := FieldValues['gudang'];
        LGudang.Caption := FieldValues['nogudang'];
        if FieldValues['posting']=1 then begin
          cbposting.Checked := True;
          cbposting.Enabled := False;
        end else if FieldValues['posting']=0 then begin
          cbposting.Checked := False;
          cbposting.Enabled := True;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'select c.*,d.kodesatuan from ' +
                    '(select a.*,b.kodebarang,b.namabarang from ' +
                    '(select * from tbl_pemindahandetail where nopemindahan=:np) as a ' +
                    'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                    'left join tbl_satuan as d on d.nosatuan=c.nosatuan';
        ParamByName('np').Value := QData.FieldValues['nopemindahan'];
        Open;
        if not IsEmpty then begin
          dbgbarang.ClearRows;
          First;
          for i:=0 to RecordCount-1 do begin
            with dbgbarang do begin
              AddRow();
              Cell[0,i].AsString := FieldValues['kodebarang'];
              Cell[1,i].AsString := FieldValues['namabarang'];
              Cell[2,i].AsFloat := FieldValues['qty'];
              Cell[3,i].AsString := FieldValues['kodesatuan'];
              Cell[4,i].AsFloat := FieldValues['harga'];
              Cell[5,i].AsFloat := FieldValues['subtotal'];
              Cell[7,i].AsInteger := FieldValues['nobarang'];
              Cell[8,i].AsInteger := FieldValues['noakunpersediaan'];
            end;
            Next;
          end;
        end;
      end;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
