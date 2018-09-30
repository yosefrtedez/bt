unit UDM;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, ImgList, Controls, cxPC, IniFiles, Forms, Variants, DateUtils, Dialogs, Windows, ComObj,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass, frxDBSet,
  frxExportXLS, frxExportPDF, frxDesgn, frxExportCSV;

type
  TDM = class(TDataModule)
    con: TZConnection;
    I48: TImageList;
    I64: TImageList;
    Q1: TZQuery;
    IL16: TImageList;
    PicDel: TImageList;
    Q_NotaPenjualanSO: TZQuery;
    DS_NotaPenjualanSO: TfrxDBDataset;
    QPerusahaan: TZQuery;
    DSPerusahaan: TfrxDBDataset;
    Q_NotaPembelianPO: TZQuery;
    DS_NotaPembelianPO: TfrxDBDataset;
    QPenjualanRangkuman: TZQuery;
    DSPenjualanRangkuman: TfrxDBDataset;
    Rpt_PenjualanRangkuman: TfrxReport;
    QPembelianRangkuman: TZQuery;
    DSPembelianRangkuman: TfrxDBDataset;
    QRangkumanHutang: TZQuery;
    DSRangkumanHutang: TfrxDBDataset;
    QRincianHutang: TZQuery;
    DSRincianHutang: TfrxDBDataset;
    DS_PembelianRincian: TfrxDBDataset;
    Q_PembelianRincian: TZQuery;
    Rpt_PenjualanRincian: TfrxReport;
    DS_PenjualanRincian: TfrxDBDataset;
    Q_PenjualanRincian: TZQuery;
    Q_PenjualanRincianTotal: TZQuery;
    DS_PenjualanRincianTotal: TfrxDBDataset;
    Q_PembelianRincianTotal: TZQuery;
    DS_PembelianRincianTotal: TfrxDBDataset;
    Rpt_DaftarPiutang: TfrxReport;
    DS_RptDaftarPiutang: TfrxDBDataset;
    Q_RptDaftarPiutang: TZQuery;
    Q_RincianPiutang: TZQuery;
    Rpt_RincianPiutang: TfrxReport;
    DS_RincianPiutang: TfrxDBDataset;
    Rpt_RincianPiutang1: TfrxReport;
    Q_RincianPiutang1: TZQuery;
    DS_RincianPiutang1: TfrxDBDataset;
    Rpt_RangkumanHutang: TfrxReport;
    QRincianHutang1: TZQuery;
    DSRincianHutang1: TfrxDBDataset;
    Rpt_RincianHutang: TfrxReport;
    Rpt_RincianHutang1: TfrxReport;
    DSPembayaranPiutang: TfrxDBDataset;
    QPembayaranPiutang: TZQuery;
    Rpt_PembayaranPiutang: TfrxReport;
    Rpt_KartuPiutang: TfrxReport;
    DS_KartuPiutang: TfrxDBDataset;
    Q_KartuPiutang: TZQuery;
    Rpt_KartuPiutang1: TfrxReport;
    DS_KartuPiutang1: TfrxDBDataset;
    Q_KartuPiutang1: TZQuery;
    QKartuStokUmumAwal: TZQuery;
    QKartuStokUmum: TZQuery;
    DSKartuStokAwal: TDataSource;
    DSKartuStokUmumAwal: TfrxDBDataset;
    DSKartuStokUmum: TfrxDBDataset;
    Rpt_KartuStokUmum: TfrxReport;
    Q_DaftarStok: TZQuery;
    DS_DaftarStok: TfrxDBDataset;
    Rpt_DaftarStok: TfrxReport;
    QKas: TZQuery;
    QKasAwal: TZQuery;
    Q_KasKeluar: TZQuery;
    DS_KasKeluar: TfrxDBDataset;
    DSKasAwal: TfrxDBDataset;
    DSKas: TfrxDBDataset;
    DSSKasAwal: TDataSource;
    Rpt_BukuKas: TfrxReport;
    Q_KasMasuk: TZQuery;
    DS_KasMasuk: TfrxDBDataset;
    Rpt_KasMasuk: TfrxReport;
    Rpt_HargaJualBarang: TfrxReport;
    Q_ItemDibeli: TZQuery;
    DS_ItemDiBeli: TfrxDBDataset;
    Rpt_ItemDibeli: TfrxReport;
    Q_ItemDijual: TZQuery;
    DS_ItemDiJual: TfrxDBDataset;
    Rpt_ItemDijual: TfrxReport;
    Q_NotaPenjualanDO: TZQuery;
    DS_NotaPenjualanDO: TfrxDBDataset;
    Q_NotaPembelianTO: TZQuery;
    DS_NotaPembelianTO: TfrxDBDataset;
    QDaftarJurnal: TZQuery;
    frxDBDataset65: TfrxDBDataset;
    Rpt_DaftarJurnal: TfrxReport;
    Rpt_JurnalUmum: TfrxReport;
    DSJurnalUmum: TfrxDBDataset;
    QJurnalUmum: TZQuery;
    Rpt_DaftarRekening: TfrxReport;
    DSDaftarRekening: TfrxDBDataset;
    QDaftarRekening: TZQuery;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    Q_NotaPembelianPR: TZQuery;
    DS_NotaPembelianPR: TfrxDBDataset;
    Nota_PembelianPR: TfrxReport;
    Nota_PembelianPO: TfrxReport;
    Q_NotaTerbilang: TZQuery;
    DS_NotaTerbilang: TfrxDBDataset;
    Nota_PembelianTO: TfrxReport;
    Q_NotaPembelianInv: TZQuery;
    DS_NotaPembelianInv: TfrxDBDataset;
    Nota_PembelianInv: TfrxReport;
    Q_NotaPembayaranHutang: TZQuery;
    DS_NotaPembayaranHutang: TfrxDBDataset;
    Nota_PembayaranHutang: TfrxReport;
    Q_NotaPengeluaranKas: TZQuery;
    DS_NotaPengeluaranKas: TfrxDBDataset;
    Nota_PengeluaranKas: TfrxReport;
    Q_NotaPenerimaanKas: TZQuery;
    DS_NotaPenerimaanKas: TfrxDBDataset;
    Nota_PenerimaanKas: TfrxReport;
    Q_NotaPenjualanSQ: TZQuery;
    DS_NotaPenjualanSQ: TfrxDBDataset;
    Nota_PenjualanSQ: TfrxReport;
    Nota_PenjualanSO: TfrxReport;
    Nota_PenjualanDO: TfrxReport;
    Q_NotaPenjualanInv: TZQuery;
    DS_NotaPenjualanInv: TfrxDBDataset;
    Nota_PenjualanInv: TfrxReport;
    Q_NotaPembayaranPiutang: TZQuery;
    DS_NotaPembayaranPiutang: TfrxDBDataset;
    Nota_PembayaranPiutang: TfrxReport;
    Q_NotaPembayaranPiutangSisa: TZQuery;
    DS_NotaPembayaranPiutangSisa: TDataSource;
    DS_NotaPembayaranPiutangSisa1: TfrxDBDataset;
    Q_NotaJurnalUmum: TZQuery;
    DS_NotaJurnalUmum: TfrxDBDataset;
    Nota_JurnalUmum: TfrxReport;
    Q_JurnalVoucher: TZQuery;
    DS_JurnalVoucher: TfrxDBDataset;
    Rpt_JurnalVoucher: TfrxReport;
    Q_NotaReturPembelian: TZQuery;
    frxDBDataset1: TfrxDBDataset;
    Nota_ReturPembelian: TfrxReport;
    Nota_DO: TfrxReport;
    Q_NotaDO: TZQuery;
    DS_NotaDO: TfrxDBDataset;
    Nota_SJ: TfrxReport;
    Q_NotaReturPenjualan: TZQuery;
    DS_NotaReturPenjualan: TfrxDBDataset;
    Nota_ReturPenjualan: TfrxReport;
    Rpt_LabaRugi: TfrxReport;
    DSLabaRugi4: TfrxDBDataset;
    QLabaRugi4: TZQuery;
    QLabaRugi5: TZQuery;
    DSLabaRugi5: TfrxDBDataset;
    DSLabaRugi6: TfrxDBDataset;
    QLabaRugi6: TZQuery;
    QLabaRugi7: TZQuery;
    DSLabaRugi7: TfrxDBDataset;
    DSLabaRugi8: TfrxDBDataset;
    QLabaRugi8: TZQuery;
    QLabaRugi9: TZQuery;
    DSLabaRugi9: TfrxDBDataset;
    QNeracaStandart1: TZQuery;
    DSNeracaStandart1: TfrxDBDataset;
    Rpt_NeracaStandart: TfrxReport;
    DSNeracaStandart2: TfrxDBDataset;
    QNeracaStandart2: TZQuery;
    QNeracaStandart3: TZQuery;
    DSNeracaStandart3: TfrxDBDataset;
    QNeracaSaldo: TZQuery;
    DSNeracaSaldo: TfrxDBDataset;
    Rpt_NeracaSaldo: TfrxReport;
    Q_NotaTransferKas: TZQuery;
    DS_NotaTransferKas: TfrxDBDataset;
    Nota_TransferKas: TfrxReport;
    Rpt_BukuBesarStandart: TfrxReport;
    DSBukuBesarStandart: TfrxDBDataset;
    QBukuBesarStandart: TZQuery;
    DataSource1: TDataSource;
    QBukuBesarAwal: TZQuery;
    DSBukuBesarAwal: TfrxDBDataset;
    Nota_PembelianTO1: TfrxReport;
    Q_NotaSJTransfer: TZQuery;
    DS_NotaSJTransfer: TfrxDBDataset;
    Nota_SJTransfer: TfrxReport;
    ZQuery1: TZQuery;
    Q_NotaPenjualanTunai: TZQuery;
    DS_NotaPenjualanTunai: TfrxDBDataset;
    Nota_PenjualanTunai: TfrxReport;
    QPenjualanRangkuman1: TZQuery;
    DSPenjualanRangkuman1: TfrxDBDataset;
    Rpt_PenjualanRangkuman1: TfrxReport;
    QPenjualanRangkuman2: TZQuery;
    DSPenjualanRangkuman2: TfrxDBDataset;
    Rpt_PenjualanRangkuman2: TfrxReport;
    Rpt_PenjualanRincian1: TfrxReport;
    DS_PenjualanRincian1: TfrxDBDataset;
    Q_PenjualanRincian1: TZQuery;
    Q_PenjualanRincian1Total: TZQuery;
    DS_PenjualanRincian1Total: TfrxDBDataset;
    Rpt_PenjualanRincian2: TfrxReport;
    DS_PenjualanRincian2: TfrxDBDataset;
    Q_PenjualanRincian2: TZQuery;
    Q_PenjualanRincian2Total: TZQuery;
    DS_PenjualanRincian2Total: TfrxDBDataset;
    Rpt_PembelianRangkuman: TfrxReport;
    Rpt_PembelianRincian: TfrxReport;
    Rpt_KartuStokTotal: TfrxReport;
    Q_KartuStokTotalAwal: TZQuery;
    DSKartuStokTotalAwal: TDataSource;
    DS_KartuStokTotalAwal: TfrxDBDataset;
    Q_KartuStokTotal: TZQuery;
    DS_KartuStokTotal: TfrxDBDataset;
    Rpt_KartuStokTotalGudang: TfrxReport;
    Q_KartuStokTotalAwalGudang: TZQuery;
    DSKartuStokTotalAwalGudang: TDataSource;
    DS_KartuStokTotalAwalGudang: TfrxDBDataset;
    Q_KartuStokTotalGudang: TZQuery;
    DS_KartuStokTotalGudang: TfrxDBDataset;
    Rpt_SupplierSederhana: TfrxReport;
    Rpt_SupplierLengkap: TfrxReport;
    QSupplier: TZQuery;
    DSSupplier: TfrxDBDataset;
    Rpt_CustomerLengkap: TfrxReport;
    Rpt_CustomerSederhana: TfrxReport;
    QCustomer: TZQuery;
    DSCustomer: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    QFakturKeluar: TZQuery;
    DSFakturKeluar: TfrxDBDataset;
    Rpt_FakturKeluar: TfrxReport;
    frxCSVExport1: TfrxCSVExport;
    Rpt_PenjualanRincian3: TfrxReport;
    DS_PenjualanRincian3: TfrxDBDataset;
    Q_PenjualanRincian3: TZQuery;
    QPenjualanRangkuman3: TZQuery;
    DSPenjualanRangkuman3: TfrxDBDataset;
    Rpt_PenjualanRangkuman3: TfrxReport;
    DSPenjualanRangkuman3Retur: TfrxDBDataset;
    QPenjualanRangkuman3Retur: TZQuery;
    Rpt_PenjualanRincian4: TfrxReport;
    DS_PenjualanRincian4: TfrxDBDataset;
    Q_PenjualanRincian4: TZQuery;
    Rpt_KartuStokBarang: TfrxReport;
    Q_KartuStokBarang: TZQuery;
    DS_KartuStokBarang: TfrxDBDataset;
    Rpt_KasKeluar: TfrxReport;
    Q_KartuStokBarangAwal: TZQuery;
    DSKartuStokBarangAwal: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    Rpt_PenjualanRincian5: TfrxReport;
    DS_PenjualanRincian5: TfrxDBDataset;
    Q_PenjualanRincian5: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CekTabOpen(sCaption: string): Boolean;
    function CekKurs(ANoMataUang:Integer):Double;
    function CekHargaBeli(ANoBarang:Integer):Double;
    function HargaBeli(ANoBarang:Integer):Double;
    function CekHPP(ANoBarang:Integer):Double;
    function CekBarang(ANoBarang:Integer):Boolean;
    function CekAkunPenting:Boolean;
    function CekAkunPentingTerpakai(ANoAkun:Integer):Boolean;
    function CekMataUangAkun(ANoAkun:Integer):Integer;
    function CekStok(ANoBarang,ANoGudang:Integer;AJumlah:Double):Boolean;
    function CekStok1(ANoBarang,ANoGudang,AID:Integer;ATipe:string;AJumlah:Double):Boolean;
    function CekKomisi(ANoKontak:Integer;ATotalPenjualan:Double):Double;
    function HitungHPPPenjualan(ANoBarang:Integer;AJumlah:Double):Double;
    procedure AmbilNoBuku(ANoBarang,ANoGudang:Integer;AJumlah:Double;ARef:Integer;ATipe:string);
    function GetKodeMataUang(ANoMataUang:Integer):string;
    function CekPlafon(ANoKontak:Integer;ANilai:Double):Boolean;
    procedure HitungHPPAverage(ANoBarang:Integer;AQty,AHarga:Double);
    procedure HitungHPPAverage1(ANoBarang:Integer;AQty,AHarga:Double);
    function FDOM(Date: TDate): TDate;
    function LastDayCurrMon(Date: TDate): TDate;
    function terbilang(sValue:string):string;
    procedure InsertBukuBesarAkun(anoakun:Integer;atgltransaksi:TDate;atipe:string;areferensi:Integer;aketerangan:string;adebit,akredit:Double);
    procedure InsertBukuBesarKontak(anokontak:Integer;atgltransaksi:TDate;atipe:string;areferensi:Integer;aketerangan:string;anilai:Double);
    function ConvKeHuruf(inp: string): string;

    function GenerateNoMaster(AJenis:string): Integer;
    function GenerateKodeTransaksi(AJenis:string;DateLD: TDateTime): string;
    function GenerateTransaksiDetil(ATipe: string;ANoRef:Integer): Integer;
    function GenerateKodeFaktur(kodefaktur: Double): string;

    procedure CekUpdate;
    function CekAkses(AUser,AAkses:string):Boolean;
    function GetSalesTerm(ADiskonDay,ADueDate,AEarlyDiskon,ALateCharge:Double):string;
    function GetTerm(ADiskonDay,ADueDate,AEarlyDiskon,ALateCharge:Double):string;
    function CekPajak(ANoBarang: Integer;ATipe:string):Integer;
    function CekTipePajak(ANoPajak: Integer):Integer;
    function CekKodePajak(ANoPajak: Integer):string;
    function CekPersenPajak(ANoPajak: Integer):Double;
    function CekAkunPajak(ANoPajak: Integer;ATipe:string):Integer;
    function CekUserGudang(AUser:string):Boolean;
    function CekUserHargaJual(AUser:string):Boolean;
    function periodeberjalan: Integer;
    function GetNoPeriode(ABulan:Integer; ATahun:string):Integer;
  end;

var
  DM: TDM;
  FileIni, host, lokasibackup, namaperusahaan,koneksi, user, password, dba, konek, sourcepath, portdb:string;



function akunlababerjalan:Integer;
function matauangdefault:string;
function nomatauangdefault:integer;
function nominalpajak: Double;
function depositintransit: Integer;
function kasintransit: Integer;
function piutangbelum: Integer;
function hutangbelum: Integer;
function tanggalserver: TDate;
function kodeperusahaan: string;


implementation

uses UMain, USettingDatabase;

{$R *.dfm}

{ TDM }

function akunlababerjalan: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_akundefault where jenis=:j';
    ParamByName('j').Value := 'lababerjalan';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['noakun'];
    Free;
  end;
end;

function TDM.periodeberjalan: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.text:='select * from tbl_periode where statusperiode=:t';
    ParamByName('t').Value := 1;
    Open;

    Result := FieldValues['noperiode'];
    //Result:= longmonthnames[strtoint(FieldValues['bulan'])]+' '+FieldValues['tahun'];
    Free;
  end;
end;

function piutangbelum: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_akundefault where jenis=:j';
    ParamByName('j').Value := 'piutangbelum';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['noakun'];
    Free;
  end;
end;

function hutangbelum: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_akundefault where jenis=:j';
    ParamByName('j').Value := 'hutangbelum';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['noakun'];
    Free;
  end;
end;

function tanggalserver: TDate;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='SELECT CURDATE() AS tanggal';
    Open;
    Result := FieldValues['tanggal'];
    Free;
  end;
end;

function kodeperusahaan: string;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_setupperusahaan';
    Open;
    First;
    if IsEmpty then Result := '' else Result := FieldValues['kode'];
    Free;
  end;
end;

function depositintransit: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_akundefault where jenis=:j';
    ParamByName('j').Value := 'depositintransit';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['noakun'];
    Free;
  end;
end;

function kasintransit: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_akundefault where jenis=:j';
    ParamByName('j').Value := 'kasintransit';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['noakun'];
    Free;
  end;
end;

function matauangdefault: string;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_matauang where utama=1';
    Open;
    if IsEmpty then Result := '' else Result := FieldValues['kodematauang'];
    Free;
  end;
end;

function nomatauangdefault: Integer;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_matauang where utama=1';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['nomatauang'];
    Free;
  end;
end;

function nominalpajak: Double;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_setupperusahaan';
    Open;
    if IsEmpty then Result := 0 else Result := FieldValues['ppn'];
    Free;
  end;
end;

function TDM.CekKurs(ANoMataUang: Integer): Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := dm.Con;
    Close;
    SQL.Text := 'select * from tbl_matauanglog where nomatauang=:km order by tanggal desc,nolog desc';
    ParamByName('km').Value := ANoMataUang;
    Open;
    First;
    Result := FieldValues['kurs'];
    Free;
  end;
end;

function TDM.CekTabOpen(sCaption: string): Boolean;
var
  i: Integer;
  f: boolean;
  ts: TcxTabSheet;
begin
  f := False;
  for i := 0 to Frm_Main.PGMain.TabCount - 1 do begin
    if sCaption = Frm_Main.PGMain.Tabs[i].Caption then begin
      ts := Frm_Main.pgMain.Pages[i];
      ts.Destroy;
      //f := True;
      Break;
    end;
  end;

  if f then begin
    Frm_Main.pgMain.ActivePage := ts;
  end;

  Result := f;
end;

function TDM.FDOM(Date: TDate): TDate;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function TDM.GenerateKodeTransaksi(AJenis: string;
  DateLD: TDateTime): string;
var
  m,y:string;
begin
  y:=IntToStr(YearOf(DateLD));
  m:=IntToStr(MonthOf(DateLD));
  if Length(m)=1 then m:='0'+m;
  y:= copy(y,3,2);

  with TZQuery.Create(Self)do begin
    Connection := con;
    Close;
    SQL.Text:='select count(*) as total from tbl_referensikodetransaksi where month(tglfaktur)=:m and year(tglfaktur)=:y and jenis=:j';
    ParamByName('m').Value:=MonthOf(DateLD);
    ParamByName('y').Value:=YearOf(DateLD);
    ParamByName('j').Value:=AJenis;
    Open;
    if FieldValues['total']=NULL then begin
      Result:=AJenis+'-'+y+m+'0001';
    end else begin
      Result:= FieldValues['total']+1;
      if Length(Result)=1 then Result:='000'+Result;
      if Length(Result)=2 then Result:='00'+Result;
      if Length(Result)=3 then Result:='0'+Result;
      if Length(Result)=4 then Result:=Result;
      Result:=AJenis+'-'+kodeperusahaan+y+m+Result;
    end;
    Free;
  end;
end;

function TDM.GenerateNoMaster(AJenis: string): Integer;
var
  noid:Integer;
begin
  con.ExecuteDirect(Format('call update_notransaksi(''%s'')',[AJenis]));
  with TZQuery.Create(Self) do begin
    Connection := con;
    Close;
    SQL.Clear;
    SQL.Text := 'select nomor from _tblnomor';
    Open;
    noid := FieldValues['nomor'];
    Result := noid;
    Close;
  end;
  {with TZQuery.Create(Self) do begin
    Connection := con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_referensinomaster where jenis=:a';
    ParamByName('a').Value := AJenis;
    Open;
    First;
    if IsEmpty then begin
      noid := 1;
      Result := noid;
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_referensinomaster values (:a,:c)';
      ParamByName('a').Value := AJenis;
      ParamByName('c').Value := noid;
      ExecSQL;
    end else begin
      noid := FieldValues['nomor']+1;
      Result := noid;
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_referensinomaster set nomor=:np where jenis=:a';
      ParamByName('a').Value := AJenis;
      ParamByName('np').Value := noid;
      ExecSQL;
    end;
    Free;
  end;  }
end;

procedure TDM.InsertBukuBesarAkun(anoakun: Integer; atgltransaksi: TDate;
  atipe: string; areferensi: Integer; aketerangan: string;
  adebit, akredit: Double);
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'insert into tbl_bukubesarakun(nobuku,noakun,tgltransaksi,tipe,noreferensi,keterangan,debit,kredit) values (:a,:b,:d,:e,:f,:g,:h,:i)';
    //ParamByName('a').Value := GenerateNoMaster('bukuakun');
    ParamByName('b').Value := anoakun;
    ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',atgltransaksi);
    ParamByName('e').Value := atipe;
    ParamByName('f').Value := areferensi;
    ParamByName('g').Value := aketerangan;
    ParamByName('h').Value := adebit;
    ParamByName('i').Value := akredit;
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_akun where noakun=:na';
    ParamByName('na').Value := anoakun;
    Open;
    if (FieldValues['noklasifikasi']=4) or (FieldValues['noklasifikasi']=5) or (FieldValues['noklasifikasi']=6) or (FieldValues['noklasifikasi']=7) or (FieldValues['noklasifikasi']=8) or (FieldValues['noklasifikasi']=9) then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_laba(nolaba,noakun,noreferensi,tipe,tgltransaksi,debit,kredit) values (:a,:b,:d,:e,:f,:g,:h)';
      //ParamByName('a').Value := GenerateNoMaster('laba');
      ParamByName('b').Value := akunlababerjalan;
      ParamByName('d').Value := areferensi;
      ParamByName('e').Value := atipe;
      ParamByName('f').Value := FormatDateTime('yyyy-mm-dd',atgltransaksi);
      ParamByName('g').Value := adebit;
      ParamByName('h').Value := akredit;
      ExecSQL;
    end;
    Free;
  end;
end;

function TDM.LastDayCurrMon(Date: TDate): TDate;
begin
  result := EncodeDate(YearOf(Date),MonthOf(Date), DaysInMonth(Date)) ;
end;

function TDM.terbilang(sValue: string): string;
const
  Angka : array [1..20] of string =
                                    ('', 'Satu', 'Dua', 'Tiga', 'Empat',
                                    'Lima', 'Enam', 'Tujuh', 'Delapan',
                                    'Sembilan', 'Sepuluh', 'Sebelas',
                                    'Duabelas', 'Tigabelas', 'Empatbelas',
                                    'Limabelas', 'Enambelas', 'Tujuhbelas',
                                    'Delapanbelas', 'Sembilanbelas');
                                    sPattern: string = '000000000000000';

var
  S,kata : string;
  Satu, Dua, Tiga, Belas, Gabung: string;
  Sen, Sen1, Sen2: string;
  Hitung : integer;
  one, two, three: integer;

begin
  One := 4;
  Two := 5;
  Three := 6;
  Hitung := 1;
  Kata := '';
  S := copy(sPattern, 1, length(sPattern) - length(trim(sValue))) + sValue;
  Sen1 := Copy(S, 14, 1);
  Sen2 := Copy(S, 15, 1);
  Sen := Sen1 + Sen2;
  while Hitung < 5 do begin
    Satu := Copy(S, One, 1);
    Dua := Copy(S, Two, 1);
    Tiga := Copy(S, Three, 1);
    Gabung := Satu + Dua + Tiga;

    if StrToInt(Satu) = 1 then
      Kata := Kata + 'Seratus '
    else
    if StrToInt(Satu) > 1 Then
      Kata := Kata + Angka[StrToInt(satu)+1] + ' Ratus ';

    if StrToInt(Dua) = 1 then begin
      Belas := Dua + Tiga;
      Kata := Kata + Angka[StrToInt(Belas)+1];
    end else if StrToInt(Dua) > 1 Then
      Kata := Kata + Angka[StrToInt(Dua)+1] + ' Puluh ' +
      Angka[StrToInt(Tiga)+1]
    else if (StrToInt(Dua) = 0) and (StrToInt(Tiga) > 0) Then begin
      if ((Hitung = 3) and (Gabung = '001')) or ((Hitung = 3) and (Gabung = ' 1')) then
        Kata := Kata + 'Seribu '
      else Kata := Kata + Angka[StrToInt(Tiga)+1];
    end;

    if (hitung = 1) and (StrToInt(Gabung) > 0) then
      Kata := Kata + ' Milyar '
    else if (Hitung = 2) and (StrToInt(Gabung) > 0) then
      Kata := Kata + ' Juta '
    else if (Hitung = 3) and (StrToInt(Gabung) > 0) then begin
      if (Gabung = '001') or (Gabung = ' 1') then
        Kata := Kata + ''
      else Kata := Kata + ' Ribu ';
    end;
    Hitung := Hitung + 1;
    One := One + 3;
    Two := Two + 3;
    Three := Three + 3;
  end;
  if length(Kata) > 1 then Kata := Kata;
  Result := Kata;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FileIni := ExtractFilePath(Application.ExeName) + 'setting.ini';
  if (FileExists(FileIni)) then begin
    Ini := TIniFile.Create(FileIni);
    host := Ini.ReadString('database','host','');
    konek := Ini.ReadString('database','konek','');
    portdb := Ini.ReadString('database','port','');
    dba := Ini.ReadString('database','db','');
    user := Ini.ReadString('database','userlogin','');
    password := Ini.ReadString('database','passwordlogin','');
    lokasibackup := Ini.ReadString('database','backup','');
    sourcepath := Ini.ReadString('update','source','');
    CekUpdate;
    koneksi := '';
    Application.CreateForm(TFrm_Main, Frm_Main);
    Frm_Main.Show;
    Application.CreateForm(TFrm_SettingDatabase, Frm_SettingDatabase);
    Frm_SettingDatabase.ShowModal;
  end else begin
    MessageDlg('File setting.ini tidak ditemukan. Hubungi administrator.',mtInformation,[mbOK],0);
    Application.Terminate;
  end;
end;

function TDM.GetKodeMataUang(ANoMataUang: Integer): string;
begin
  with TZQuery.Create(DM) do begin
    Connection := DM.Con;
    Close;
    SQL.text:='select * from tbl_matauang where nomatauang=:a';
    ParamByName('a').Value := ANoMataUang;
    Open;
    if IsEmpty then Result := '' else Result := FieldValues['kodematauang'];
    Free;
  end;
end;

procedure TDM.CekUpdate;
var
   mSourcePath, mTargetPath, BackName: string;
   lstIP: TStringList;
begin

   if sourcepath = '' then
     Exit
   else
     mSourcePath := sourcepath;
   BackName := ExtractFilePath(Application.ExeName) + 'tancorp.old';
   mTargetPath := ExtractFilePath(Application.ExeName) + '\tancorp.exe';

   if DirectoryExists(mSourcePath) then begin

     if FileExists(mSourcePath+'\tancorp.exe') then begin

       if FileExists(BackName) then begin
         DeleteFile(PChar(BackName));
       end;

       Con.Disconnect;
       if FileAge(mSourcePath + '\tancorp.exe') <> FileAge(mTargetPath) then begin


         RenameFile(Application.ExeName, BackName);
         try
           CopyFile(PChar(mSourcePath + '\tancorp.exe'),PChar(mTargetPath), False);
           MessageDlg('Update berhasil, silahkan jalankan program kembali.',mtInformation,[mbOK],0);
           Application.Terminate;
         except
           on E: Exception do begin
             MessageDlg('Update gagal, silahkan jalankan program kembali.',mtError,[mbOK],0);
             Application.Terminate;
           end;
         end;
       end;
     end;
   end;
end;

procedure TDM.InsertBukuBesarKontak(anokontak: Integer;
  atgltransaksi: TDate; atipe: string; areferensi: Integer;
  aketerangan: string; anilai: Double);
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'insert into tbl_bukubesarkontak values (:a,:b,:d,:e,:f,:g,:h)';
    ParamByName('a').Value := GenerateNoMaster('bukukontak');
    ParamByName('b').Value := anokontak;
    ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',atgltransaksi);
    ParamByName('e').Value := atipe;
    ParamByName('f').Value := areferensi;
    ParamByName('g').Value := aketerangan;
    ParamByName('h').Value := anilai;
    ExecSQL;
    Free;
  end;        
end;

function TDM.CekHargaBeli(ANoBarang: Integer): Double;
begin
  {with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select hpp from tbl_bukubesarbarang where nobarang=:nb and masuk>0 order by tgltransaksi';
    ParamByName('nb').Value := ANoBarang;
    Open;
    if IsEmpty then begin
      Result := 0;
    end else begin
      Last;
      Result := FieldValues['hpp'];
    end;
    Free;
  end;  }
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select a.*,b.nobarang,b.harga from ' +
                '(select nopembelianorder,tgltransaksi from tbl_pembelianorder)as a ' +
                'left join tbl_pembelianorderdetail as b on b.nopembelianorder=a.nopembelianorder having nobarang=:nb order by tgltransaksi';
    ParamByName('nb').Value := ANoBarang;
    Open;
    if IsEmpty then begin
      Result := 0;
    end else begin
      Last;
      Result := FieldValues['harga'];
    end;
    Free;
  end;
end;

function TDM.CekHPP(ANoBarang: Integer): Double;
var
  hpp : Double;
begin
  hpp := 0;
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_setupperusahaan';
    Open;
    First;
    if FieldValues['tipehpp'] = 0 then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select ifnull(average,0)as average from tbl_barangaverage where nobarang=:a';
      ParamByName('a').Value := ANoBarang;
      Open;
      if not IsEmpty then begin
        hpp := FieldValues['average'];
      end;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'select c.* from ' +
                  '(select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where nobarang=:a)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku)as c where c.masuk-c.terjual>0';
      ParamByName('a').Value := ANoBarang;
      Open;
      if not IsEmpty then begin
        First;
        hpp := FieldValues['hpp'];
      end;
    end;
    Free;
  end;
  Result := hpp;
end;

function TDM.CekBarang(ANoBarang: Integer): Boolean;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select * from tbl_barang where nobarang=:nb';
    ParamByName('nb').Value := ANoBarang;
    Open;
    if FieldValues['disimpan']=1 then
      Result := True
    else Result := False;
    Free;
  end;
end;

function TDM.CekAkunPenting: Boolean;
begin
  with TZQuery.Create(Self)do begin
    Connection := con;
    Close;
    SQL.Text := 'select * from tbl_akundefault where noakun=0';
    Open;
    if IsEmpty then
      Result := True
    else Result := False;
    Free;
  end;
end;

procedure TDM.HitungHPPAverage(ANoBarang: Integer;AQty,AHarga: Double);
var
  stokterakir,hppterakir,hppbaru: Double;
begin
  stokterakir:=0;
  hppterakir:=0;
  hppbaru:= 0;
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select ifnull(sum(masuk)-sum(keluar),0)as total from tbl_bukubesarbarang where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    stokterakir := FieldValues['total'];
    Close;
    SQL.Clear;
    SQL.Text := 'select ifnull(average,0)as average from tbl_barangaverage where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    if not IsEmpty then begin
      hppterakir := FieldValues['average'];
    end;
    if AQty+stokterakir = 0 then begin
      hppbaru := 0;
    end else begin
      hppbaru :=((stokterakir*hppterakir)+(AQty*AHarga))/(stokterakir+AQty);
    end;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_barangaverage where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_barangaverage values (:a,:b)';
      ParamByName('a').Value := ANoBarang;
      ParamByName('b').Value := hppbaru;
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_barangaverage set average=:b where nobarang=:a';
      ParamByName('a').Value := ANoBarang;
      ParamByName('b').Value := hppbaru;
      ExecSQL;
    end;
    Free;
  end;
end;

procedure TDM.HitungHPPAverage1(ANoBarang: Integer; AQty, AHarga: Double);
var
  stokterakir,hppterakir,hppbaru: Double;
begin
  stokterakir:=0;
  hppterakir:=0;
  hppbaru:= 0;
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select ifnull(sum(masuk)-sum(keluar),0)as total from tbl_bukubesarbarang where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    stokterakir := FieldValues['total'];
    Close;
    SQL.Clear;
    SQL.Text := 'select ifnull(average,0)as average from tbl_barangaverage where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    if not IsEmpty then begin
      hppterakir := FieldValues['average'];
    end;
    if AQty-stokterakir = 0 then begin
      hppbaru := 0;
    end else begin
      hppbaru :=((stokterakir*hppterakir)-(AQty*AHarga))/(stokterakir-AQty);
    end;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_barangaverage where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_barangaverage values (:a,:b)';
      ParamByName('a').Value := ANoBarang;
      ParamByName('b').Value := hppbaru;
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_barangaverage set average=:b where nobarang=:a';
      ParamByName('a').Value := ANoBarang;
      ParamByName('b').Value := hppbaru;
      ExecSQL;
    end;
    Free;
  end;
end;

function TDM.CekMataUangAkun(ANoAkun: Integer): Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_akun where noakun=:a';
    ParamByName('a').Value := ANoAkun;
    Open;
    Result := FieldValues['nomatauang'];
    Free;
  end;
end;

function TDM.CekPlafon(ANoKontak: Integer;ANilai: Double): Boolean;
var
  plafon: Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Text := 'select * from tbl_kontak where nokontak=:nk';
    ParamByName('nk').Value := ANoKontak;
    Open;
    plafon := FieldValues['plafon'];
    if plafon = 0 then begin
      Result := True;
    end else begin
      if FieldValues['tipekontak'] = 0 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT e.nokontak,SUM(e.totalpiutang)AS totalpiutang,(SUM(e.jumlahretur)+SUM(e.jumlahbayar))AS jumlahbayar,SUM(e.totalpiutang)-SUM(e.jumlahretur)-SUM(e.jumlahbayar) AS sisapiutang FROM ' +
                    '(SELECT gg.* FROM ' +
                    '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0) AS jumlahbayar FROM ' +
                    '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM ' +
                    '(SELECT nopenjualaninvoice,nokontak,total AS totalpiutang FROM tbl_penjualaninvoice WHERE nokontak=:nk)AS a ' +
                    'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nopenjualaninvoice GROUP BY a.nopenjualaninvoice)AS c ' +
                    'LEFT JOIN (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih FROM ' +
                    '(SELECT * FROM tbl_pembayaranpiutang)AS a ' +
                    'LEFT JOIN tbl_pembayaranpiutangdetail AS b ON b.nopembayaranpiutang=a.nopembayaranpiutang) AS d ON d.nopenjualaninvoice=c.nopenjualaninvoice GROUP BY c.nopenjualaninvoice)AS gg WHERE gg.totalpiutang-gg.jumlahretur-gg.jumlahbayar>0)AS e ' +
                    'GROUP BY e.nokontak';   
        ParamByName('nk').Value := ANoKontak;
        Open;
        if IsEmpty then begin
          Result := True;
        end else begin
          if FieldValues['sisapiutang']+ANilai <= plafon then begin
            Result := True;
          end else begin
            Result := False;
          end;
        end;
      end else if FieldValues['tipekontak'] = 1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT e.nokontak,SUM(e.totalhutang)AS totalhutang,(SUM(e.jumlahretur)+SUM(e.jumlahbayar))AS jumlahbayar,SUM(e.totalhutang)-SUM(e.jumlahretur)-SUM(e.jumlahbayar) AS sisahutang FROM ' +
                    '(SELECT gg.* FROM ' +
                    '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0) AS jumlahbayar FROM ' +
                    '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM ' +
                    '(SELECT nopembelianinvoice,nokontak,total AS totalhutang FROM tbl_pembelianinvoice WHERE nokontak=:nk)AS a ' +
                    'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nopembelianinvoice GROUP BY a.nopembelianinvoice)AS c ' +
                    'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih FROM ' +
                    '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a ' +
                    'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutang=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembelianinvoice GROUP BY c.nopembelianinvoice)AS gg WHERE gg.totalhutang-gg.jumlahretur-gg.jumlahbayar>0)AS e ' +
                    'GROUP BY e.nokontak';
        ParamByName('nk').Value := ANoKontak;
        Open;
        if IsEmpty then begin
          Result := True;
        end else begin
          if FieldValues['sisahutang']+ANilai <= plafon then begin
            Result := True;
          end else begin
            Result := False;
          end;
        end;
      end;
    end;
    Free;
  end;
end;

procedure TDM.AmbilNoBuku(ANoBarang,ANoGudang: Integer; AJumlah: Double;
  ARef: Integer; ATipe: string);
var
  qty,sisa : Double;
  nobuku:Integer;
begin
  {qty := AJumlah;
  while (qty>0)do begin
    with Q1 do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select c.* from ' +
                  '(select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where nobarang=:a and nogudang=:b)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku)as c where c.masuk-c.terjual>0';
      ParamByName('a').Value := ANoBarang;
      ParamByName('b').Value := ANoGudang;
      Open;
      if not IsEmpty then begin
        First;
        sisa := FieldValues['masuk']-FieldValues['terjual'];
        nobuku := FieldValues['nobuku'];
        if qty-sisa>0 then begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_bukubesarbarangdetail values (:a,:b,:c,:d)';
          ParamByName('a').Value := nobuku;
          ParamByName('b').Value := ARef;
          ParamByName('c').Value := sisa;
          ParamByName('d').Value := ATipe;
          ExecSQL;
        end else begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_bukubesarbarangdetail values (:a,:b,:c,:d)';
          ParamByName('a').Value := nobuku;
          ParamByName('b').Value := ARef;
          ParamByName('c').Value := qty;
          ParamByName('d').Value := ATipe;
          ExecSQL;
        end;
        qty := qty-sisa; 
      end;
    end;
  end;        }
end;

function TDM.CekStok(ANoBarang,ANoGudang: Integer; AJumlah: Double): Boolean;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select ifnull(sum(masuk)-sum(keluar),0)as total from tbl_bukubesarbarang where nobarang=:a and nogudang=:b';
    ParamByName('a').Value := ANoBarang;
    ParamByName('b').Value := ANoGudang;
    Open;
    if FieldValues['total']<AJumlah then
      Result := False
    else Result := True;
    Free;
  end;
end;

function TDM.HitungHPPPenjualan(ANoBarang: Integer;
  AJumlah: Double): Double;
var
  qty,sisa,hpp : Double;
begin
  qty := AJumlah;
  hpp := 0;
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_setupperusahaan';
    Open;
    First;
    if FieldValues['tipehpp'] = 0 then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select average from tbl_barangaverage where nobarang=:a';
      ParamByName('a').Value := ANoBarang;
      Open;
      if IsEmpty then
        Result := 0
      else Result := FieldValues['average'];
    end else if FieldValues['tipehpp'] = 1 then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select c.* from ' +
                  '(select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where nobarang=:a)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku)as c where c.masuk-c.terjual>0';
      ParamByName('a').Value := ANoBarang;
      Open;
      First;
      if not IsEmpty then begin
        while (qty>0)do begin
          sisa := FieldValues['masuk']-FieldValues['terjual'];
          if qty<sisa then begin
            hpp := hpp+FieldValues['hpp']*qty;
            qty := 0;
          end else begin
            hpp := hpp+FieldValues['hpp']*sisa;
            qty := qty-sisa;
            Next;
          end;
        end;
      end;
      Result := hpp/AJumlah;
    end;
    Free;
  end;       
end;

function TDM.CekKomisi(ANoKontak: Integer;ATotalPenjualan: Double): Double;
var
  komisipersen,nilaipenjualan:Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_kontak where nokontak=:a';
    ParamByName('a').Value := ANoKontak;
    Open;
    komisipersen := FieldValues['komisipenjualan'];
    nilaipenjualan := FieldValues['nilaipenjualan'];
    if komisipersen > 0 then begin
      if nilaipenjualan > 0 then begin
        if ATotalPenjualan > nilaipenjualan then begin
          Result := ATotalPenjualan*komisipersen/100;
        end else begin
          Result := 0;
        end;
      end else begin
        Result := ATotalPenjualan*komisipersen/100;
      end;
    end else begin
      Result := 0;
    end;
    Free;
  end;
end;

function TDM.CekAkunPentingTerpakai(ANoAkun: Integer): Boolean;
begin
  with TZQuery.Create(Self)do begin
    Connection := con;
    Close;
    SQL.Text := 'select * from tbl_akundefault where noakun=:na';
    ParamByName('na').Value := ANoAkun;
    Open;
    if IsEmpty then
      Result := True
    else Result := False;
    Free;
  end;
end;

function TDM.CekAkses(AUser, AAkses: string): Boolean;
begin
  if AUser <> '' then begin
    with TZQuery.Create(Self)do begin
      Connection := con;
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:nu';
      ParamByName('nu').Value := AUser;
      Open;
      if FieldValues['induk']=1 then begin
        Result := True;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_userwewenang where namauser=:nu and wewenang=:w';
        ParamByName('nu').Value := AUser;
        ParamByName('w').Value := AAkses;
        Open;
        if IsEmpty then
          Result := False
        else Result := True;
        Free;
      end;
    end;
  end else begin
    Result := True;
  end;
end;

function TDM.GetSalesTerm(ADiskonDay, ADueDate, AEarlyDiskon,
  ALateCharge: Double): string;
begin
  if (ADiskonDay = 0) and (ADueDate = 0) and (AEarlyDiskon = 0) and (ALateCharge = 0) then
    Result := ''
  else
    Result := FloatToStr(AEarlyDiskon)+'% '+FloatToStr(ADiskonDay)+' Net '+FloatToStr(ADueDate);
end;


function TDM.CekStok1(ANoBarang, ANoGudang, AID: Integer; ATipe:string;
  AJumlah: Double): Boolean;
var
  stoksekarang: Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_bukubesarbarang where nobarang=:a and noreferensi=:b and tipe=:c and nogudang=:d';
    ParamByName('a').Value := ANoBarang;
    ParamByName('b').Value := AID;
    ParamByName('c').Value := ATipe;
    ParamByName('d').Value := ANoGudang;
    Open;
    if IsEmpty then
      stoksekarang := 0
    else stoksekarang := FieldValues['keluar'];
    Close;
    SQL.Clear;
    SQL.Text := 'select ifnull(sum(masuk)-sum(keluar),0)as total from tbl_bukubesarbarang where nobarang=:a and nogudang=:b';
    ParamByName('a').Value := ANoBarang;
    ParamByName('b').Value := ANoGudang;
    Open;
    if IsEmpty then
      stoksekarang := stoksekarang+0
    else stoksekarang := stoksekarang+FieldValues['total'];
    if stoksekarang<AJumlah then
      Result := False
    else Result := True;
    Free;
  end;
end;

function TDM.CekPajak(ANoBarang: Integer;ATipe: string): Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_barang where nobarang=:a';
    ParamByName('a').Value := ANoBarang;
    Open;
    if IsEmpty then
      Result := 0
    else begin
      if ATipe = 'pembelian' then begin
        Result := FieldValues['nopajakpembelian'];
      end else if ATipe = 'penjualan' then begin
        Result := FieldValues['nopajakpenjualan'];
      end;
    end;
    Free;
  end;
end;

function TDM.CekTipePajak(ANoPajak: Integer): Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:a';
    ParamByName('a').Value := ANoPajak;
    Open;
    if IsEmpty then
      Result := 0
    else Result := FieldValues['tipepajak'];
    Free;
  end;
end;

function TDM.CekAkunPajak(ANoPajak: Integer; ATipe: string): Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:a';
    ParamByName('a').Value := ANoPajak;
    Open;
    if IsEmpty then
      Result := 0
    else begin
      if ATipe = 'pembelian' then begin
        Result := FieldValues['akunpajakpembelian'];
      end else if ATipe = 'penjualan' then begin
        Result := FieldValues['akunpajakpenjualan'];
      end;
    end;
    Free;
  end;
end;

function TDM.CekPersenPajak(ANoPajak: Integer): Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:a';
    ParamByName('a').Value := ANoPajak;
    Open;
    if IsEmpty then
      Result := 0
    else Result := FieldValues['persen'];
    Free;
  end;
end;

function TDM.CekKodePajak(ANoPajak: Integer): string;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:a';
    ParamByName('a').Value := ANoPajak;
    Open;
    if IsEmpty then
      Result := '-'
    else Result := FieldValues['kodepajak'];
    Free;
  end;
end;

function TDM.GenerateTransaksiDetil(ATipe: string;
  ANoRef: Integer): Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    if ATipe = 'SO' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(nopenjualanorder)as urutan from tbl_penjualanorderdetail where nopenjualanorder=:a';
      ParamByName('a').Value := ANoRef;
      Open;
      if IsEmpty then
        Result := 1
      else Result := FieldValues['urutan']+1;
    end else if ATipe = 'PO' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(nopembelianorder)as urutan from tbl_pembelianorderdetail where nopembelianorder=:a';
      ParamByName('a').Value := ANoRef;
      Open;
      if IsEmpty then
        Result := 1
      else Result := FieldValues['urutan']+1;
    end else if ATipe = 'PR' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(nopembelianrequest)as urutan from tbl_pembelianrequestdetail where nopembelianrequest=:a';
      ParamByName('a').Value := ANoRef;
      Open;
      if IsEmpty then
        Result := 1
      else Result := FieldValues['urutan']+1;
    end;
    Free;
  end;
end;

function TDM.ConvKeHuruf(inp: string): string;
var
  a,b,c,Poskoma,PosTitik : integer;
  temp,angka,dpnKoma,BlkKoma : string;
  AdaKoma: boolean;
begin
  PosKoma:= pos(',',Inp);
  PosTitik:= pos('.',Inp);
  if (Poskoma<>0) or (posTitik<> 0) then begin
    adaKoma:= true;
    if PosKoma= 0 then posKoma:= PosTitik;
  end else begin
    adakoma:= False;
    DpnKoma:= inp;
  end;
  // Jika ada Koma
  if adakoma then begin
    dpnkoma:= copy(inp,1,posKoma-1);
    blkKoma:= Copy(inp,posKoma+1,length(inp)-posKoma);
    if trim(DpnKoma)='0' then
      temp:= 'Nol'+ ' Koma ' + terbilang(blkKoma)
    else temp:= Terbilang(dpnKoma)+ ' Koma ' + Terbilang(blkKoma);
  // Jika Tidak ada Koma
  end else begin
    temp:=Terbilang(dpnKoma);
  end;
  Result:= temp+'Rupiah';
end;

function TDM.GetTerm(ADiskonDay, ADueDate, AEarlyDiskon,
  ALateCharge: Double): string;
begin
  if (ADiskonDay = 0) and (ADueDate = 0) and (AEarlyDiskon = 0) and (ALateCharge = 0) then
    Result := ''
  else
    Result := FloatToStr(AEarlyDiskon)+'% '+FloatToStr(ADiskonDay)+' Net '+FloatToStr(ADueDate);
end;

function TDM.CekUserGudang(AUser: string): Boolean;
var
  gud: Integer;
begin
  if AUser = '' then begin
    Result := True;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := con;
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:a';
      ParamByName('a').Value := AUser;
      Open;
      if FieldValues['induk'] = 1 then
        Result := True
      else Result := False;
    end;
  end;
end;

function TDM.CekUserHargaJual(AUser: string): Boolean;
begin
  if AUser <> '' then begin
    with TZQuery.Create(Self)do begin
      Connection := con;
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:nu';
      ParamByName('nu').Value := AUser;
      Open;
      if FieldValues['induk']=1 then begin
        Result := True;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_userwewenang where namauser=:nu and wewenang=:w';
        ParamByName('nu').Value := AUser;
        ParamByName('w').Value := 'Penjualan12';
        Open;
        if IsEmpty then
          Result := False
        else Result := True;
        Free;
      end;
    end;
  end else begin
    Result := True;
  end;
end;

function TDM.GetNoPeriode(ABulan: Integer; ATahun: string): Integer;
var
  noped: Integer;
begin
  noped := 0;
  with TZQuery.Create(Self) do begin
    Connection := DM.Con;
    Close;
    SQL.Clear;
    SQL.text:='select * from tbl_periode where bulan=:b and tahun=:t';
    ParamByName('b').Value := ABulan;
    ParamByName('t').Value := ATahun;
    Open;

    if not IsEmpty then noped := FieldValues['noperiode'];
    Free;
  end;
  Result := noped;
end;

function TDM.HargaBeli(ANoBarang: Integer): Double;
begin
  with TZQuery.Create(Self)do begin
    Connection := Con;
    Close;
    SQL.Text := 'select * from tbl_bukubesarbarang where nobarang=:nb and tipe=:t order by tgltransaksi';
    ParamByName('nb').Value := ANoBarang;
    ParamByName('t').Value := 'PU';
    Open;
    if IsEmpty then begin
      Result := 0;
    end else begin
      Last;
      Result := FieldValues['hpp'];
    end;
    Free;
  end;
end;

function TDM.GenerateKodeFaktur(kodefaktur: Double): string;
begin
  Result:= FloatToStr(kodefaktur);
  if Length(Result)=1 then Result:='000000000000'+Result;
  if Length(Result)=2 then Result:='00000000000'+Result;
  if Length(Result)=3 then Result:='0000000000'+Result;
  if Length(Result)=4 then Result:='000000000'+Result;
  if Length(Result)=5 then Result:='00000000'+Result;
  if Length(Result)=6 then Result:='0000000'+Result;
  if Length(Result)=7 then Result:='000000'+Result;
  if Length(Result)=8 then Result:='00000'+Result;
  if Length(Result)=9 then Result:='0000'+Result;
  if Length(Result)=10 then Result:='000'+Result;
  if Length(Result)=11 then Result:='00'+Result;
  if Length(Result)=12 then Result:='0'+Result;
  Result:=Result;
end;

end.
