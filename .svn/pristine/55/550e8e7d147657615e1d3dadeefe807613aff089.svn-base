unit UDaftarGiroMasuk;

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
  RzButton, StdCtrls, RzLabel, ExtCtrls, RzPanel, cxPC, Buttons, RzSpnEdt,
  cxCheckBox;

type
  TFrm_DaftarGiroMasuk = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnCair: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    BtnFilter: TRzToolButton;
    QDatatgltransaksi: TDateField;
    QDatanoreferensi: TLargeintField;
    QDatatipe: TStringField;
    QDatanomorgiro: TStringField;
    QDatatanggal: TDateField;
    QDatanamabank: TStringField;
    QDatanoakun: TLargeintField;
    QDataposting: TSmallintField;
    QDatajenis: TStringField;
    QDatanilai: TFloatField;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1tanggal: TcxGridDBColumn;
    dbgdataDBTableView1namabank: TcxGridDBColumn;
    dbgdataDBTableView1nilai: TcxGridDBColumn;
    dbgdataDBTableView1nomorgiro: TcxGridDBColumn;
    dbgdataDBTableView1pos: TcxGridDBColumn;
    BtnUnPost: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCairClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnUnPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarGiroMasuk: TFrm_DaftarGiroMasuk;

implementation

uses UDM, UMain, URincianGiroMasuk;

{$R *.dfm}

procedure TFrm_DaftarGiroMasuk.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarGiroMasuk.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarGiroMasuk.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarGiroMasuk.BtnCairClick(Sender: TObject);
var
  nojurnal,nokas,i:Integer;
  kodejurnal,keterangan:string;
  nilaikas:Double;
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['posting']= 1 then begin
    MessageDlg('Giro telah cair, jurnal pencairan giro tidak mungkin dibuat dua kali!',mtError,[mbOK],0);
    Exit;
  end;
  if MessageDlg('Program secara otomatis akan memindahkan nilai giro ke kas. Giro yang telah dicairkan tidak dapat dibatalkan'#10#13'Yakin akan melanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    {if DM.CekPeriode(dtptanggal.Date)= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end else if DM.CekPeriode(dtptanggal.Date)= 2 then begin
      if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      nokas := 0;
      nilaikas := 0;
      if QData.FieldValues['tipe'] = 'CI' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_penerimaanlain where nopenerimaan=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        nokas := FieldValues['noakun'];
        nilaikas := FieldValues['total'];
        kodejurnal := DM.GenerateKodeTransaksi('GJ',Date);
        nojurnal := DM.GenerateNoMaster('jurnalumum');
        keterangan := 'Penyesuaian Giro Cair, Bank '+QData.FieldValues['namabank']+' No. '+QData.FieldValues['nomorgiro'];
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'GJ';
        ParamByName('b').Value := Date;
        ParamByName('c').Value := kodejurnal;
        ExecSQL;
        Close;
        // masuk ke tabel jurnal umum
        SQL.Clear;
        SQL.Text := 'insert into tbl_jurnalumum values (:a,:b,:c,:d,:e,:f)';
        ParamByName('a').Value := nojurnal;
        ParamByName('b').Value := kodejurnal;
        ParamByName('c').Value := Date;
        ParamByName('d').Value := keterangan;
        ParamByName('e').Value := QData.FieldValues['nilai'];
        ParamByName('f').Value := Frm_Main.txtuser.Caption;
        ExecSQL;
        Close;
        SQL.Clear;
        //masuk tabel detil jurnal umum
        SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
        ParamByName('a').Value := nojurnal;
        ParamByName('b').Value := nokas;
        ParamByName('c').Value := nilaikas;
        ParamByName('d').Value := 0;
        ExecSQL;
        //masuk buku besar
        DM.InsertBukuBesarAkun(nokas,Date,'GJ',nojurnal,keterangan,nilaikas,0);

        Close;
        SQL.Clear;
        //masuk tabel detil jurnal umum
        SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
        ParamByName('a').Value := nojurnal;
        ParamByName('b').Value := QData.FieldValues['noakun'];
        ParamByName('c').Value := 0;
        ParamByName('d').Value := QData.FieldValues['nilai'];
        ExecSQL;
        //masuk buku besar
        DM.InsertBukuBesarAkun(QData.FieldValues['noakun'],Date,'GJ',nojurnal,keterangan,0,QData.FieldValues['nilai']);
      end else if QData.FieldValues['tipe'] = 'CR' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembayaranpiutang where nopembayaranpiutang=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        nokas := FieldValues['nokas'];
        nilaikas := FieldValues['total'];
        keterangan := FieldValues['keterangan'];
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        for i:=0 to RecordCount-1 do begin
          DM.InsertBukuBesarAkun(FieldValues['noakunpiutang'],QData.FieldValues['tanggal'],'CR',QData.FieldValues['noreferensi'],keterangan,0,FieldValues['jumlahbayar']);
          if FieldValues['potonganpiutang'] > 0 then begin
            DM.InsertBukuBesarAkun(FieldValues['noakunpiutang'],QData.FieldValues['tanggal'],'CR',QData.FieldValues['noreferensi'],'Potongan Penjualan'+QData.FieldValues['namakontak'],0,FieldValues['potonganpiutang']);
            //DM.InsertBukuBesarAkun(FieldValues['noakunpotonganpenjualan'],QData.FieldValues['tanggal'],'CR',QData.FieldValues['noreferensi'],'Potongan Penjualan'+QData.FieldValues['namakontak'],FieldValues['potonganpiutang'],0);
          end;
          Next;
        end;
        DM.InsertBukuBesarAkun(nokas,QData.FieldValues['tanggal'],'CR',QData.FieldValues['noreferensi'],keterangan,nilaikas,0);
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_giro set posting=1 where noreferensi=:a and tipe=:b';
      ParamByName('a').Value := QData.FieldValues['noreferensi'];
      ParamByName('b').Value := QData.FieldValues['tipe'];
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarGiroMasuk.BtnPerincianClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_RincianGiroMasuk, Frm_RincianGiroMasuk);
  Frm_RincianGiroMasuk.Cleartext;
  Frm_RincianGiroMasuk.LID.Caption := QData.FieldValues['noreferensi'];
  Frm_RincianGiroMasuk.LTipe.Caption := QData.FieldValues['tipe'];
  Frm_RincianGiroMasuk.txtbank.Text := QData.FieldValues['namabank'];
  Frm_RincianGiroMasuk.txtnomor.Text := QData.FieldValues['nomorgiro'];
  Frm_RincianGiroMasuk.txtnilai.Value := QData.FieldValues['nilai'];
  Frm_RincianGiroMasuk.dtptempo.Date := QData.FieldValues['tanggal'];
  if QData.FieldValues['posting'] = 1 then
    Frm_RincianGiroMasuk.cbposting.Checked := True
  else Frm_RincianGiroMasuk.cbposting.Checked := False;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if QData.FieldValues['tipe'] = 'CI' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.namaakun from ' +
                  '(select * from tbl_penerimaanlain where nopenerimaan=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakun';
      ParamByName('np').Value := QData.FieldValues['noreferensi'];
      Open;
      Frm_RincianGiroMasuk.txttanggal.Text := FormatDateTime('dd/mm/yyyy',FieldValues['tgltransaksi']);
      Frm_RincianGiroMasuk.txtkas.Text := FieldValues['namaakun'];
      Frm_RincianGiroMasuk.LKas.Caption := FieldValues['noakun'];
    end else if QData.FieldValues['tipe'] = 'CR' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.namaakun from ' +
                  '(select * from tbl_pembayaranpiutang where nopembayaranpiutang=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.nokas';
      ParamByName('np').Value := Frm_RincianGiroMasuk.LID.Caption;
      Open;
      Frm_RincianGiroMasuk.txttanggal.Text := FormatDateTime('dd/mm/yyyy',FieldValues['tglbayar']);
      Frm_RincianGiroMasuk.txtkas.Text := FieldValues['namaakun'];
      Frm_RincianGiroMasuk.LKas.Caption := FieldValues['nokas'];
    end else if QData.FieldValues['tipe'] = 'SA' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.namaakun from ' +
                  '(select * from tbl_penjualaninvoice where nopenjualaninvoice=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakunkas';
      ParamByName('np').Value := Frm_RincianGiroMasuk.LID.Caption;
      Open;
      Frm_RincianGiroMasuk.txttanggal.Text := FormatDateTime('dd/mm/yyyy',FieldValues['tglpenjualaninvoice']);
      Frm_RincianGiroMasuk.txtkas.Text := FieldValues['namaakun'];
      Frm_RincianGiroMasuk.LKas.Caption := FieldValues['noakunkas'];
    end;
    if Frm_RincianGiroMasuk.ShowModal = mrok then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_giro set tanggal=:a where noreferensi=:nr and tipe=:t';
      ParamByName('nr').Value := Frm_RincianGiroMasuk.LID.Caption;
      ParamByName('t').Value := Frm_RincianGiroMasuk.LTipe.Caption;
      ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',Frm_RincianGiroMasuk.dtptempo.Date);
      if Frm_RincianGiroMasuk.LTipe.Caption = 'CI' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_penerimaanlain set noakun=:a where nopenerimaan=:np';
        ParamByName('np').Value := Frm_RincianGiroMasuk.LID.Caption;
        ParamByName('a').Value := Frm_RincianGiroMasuk.LKas.Caption;
        ExecSQL;
      end else if Frm_RincianGiroMasuk.LTipe.Caption = 'CR' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pembayaranpiutang set nokas=:a where nopembayaranpiutang=:np';
        ParamByName('np').Value := Frm_RincianGiroMasuk.LID.Caption;
        ParamByName('a').Value := Frm_RincianGiroMasuk.LKas.Caption;
        ExecSQL;
      end else if Frm_RincianGiroMasuk.LTipe.Caption = 'SA' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_penjualaninvoice set noakunkas=:a where nopenjualaninvoice=:np';
        ParamByName('np').Value := Frm_RincianGiroMasuk.LID.Caption;
        ParamByName('a').Value := Frm_RincianGiroMasuk.LKas.Caption;
        ExecSQL;
      end;
      ExecSQL;
      RefreshQ;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarGiroMasuk.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarGiroMasuk.BtnUnPostClick(Sender: TObject);
var
  nojurnal,nokas:Integer;
  kodejurnal,keterangan:string;
  nilaikas:Double;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas11')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  {if DM.CekPeriode(QData.FieldValues['tanggal'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end else if DM.CekPeriode(QData.FieldValues['tanggal'])= 2 then begin
      if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;     }
  if QData.FieldValues['posting']=1 then begin
    if MessageDlg('Giro sudah cair akan dikembalikan ke status pending. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        if QData.FieldValues['tipe'] = 'CI' then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penerimaanlain where nopenerimaan=:a';
          ParamByName('a').Value := QData.FieldValues['noreferensi'];
          Open;
          nokas := FieldValues['noakun'];
          nilaikas := FieldValues['total'];
          kodejurnal := DM.GenerateKodeTransaksi('GJ',Date);
          nojurnal := DM.GenerateNoMaster('jurnalumum');
          keterangan := 'Pembatalan Giro, Bank '+QData.FieldValues['namabank']+' No. '+QData.FieldValues['nomorgiro'];
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'GJ';
          ParamByName('b').Value := Date;
          ParamByName('c').Value := kodejurnal;
          ExecSQL;
          Close;
          // masuk ke tabel jurnal umum
          SQL.Clear;
          SQL.Text := 'insert into tbl_jurnalumum values (:a,:b,:c,:d,:e,:f)';
          ParamByName('a').Value := nojurnal;
          ParamByName('b').Value := kodejurnal;
          ParamByName('c').Value := Date;
          ParamByName('d').Value := keterangan;
          ParamByName('e').Value := QData.FieldValues['nilai'];
          ParamByName('f').Value := Frm_Main.txtuser.Caption;
          ExecSQL;
          Close;
          SQL.Clear;
          //masuk tabel detil jurnal umum
          SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
          ParamByName('a').Value := nojurnal;
          ParamByName('b').Value := nokas;
          ParamByName('c').Value := 0;
          ParamByName('d').Value := nilaikas;
          ExecSQL;
          //masuk buku besar
          DM.InsertBukuBesarAkun(nokas,Date,'GJ',nojurnal,keterangan,0,nilaikas);

          Close;
          SQL.Clear;
          //masuk tabel detil jurnal umum
          SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d)';
          ParamByName('a').Value := nojurnal;
          ParamByName('b').Value := QData.FieldValues['noakun'];
          ParamByName('c').Value := QData.FieldValues['nilai'];
          ParamByName('d').Value := 0;
          ExecSQL;
          //masuk buku besar
          DM.InsertBukuBesarAkun(QData.FieldValues['noakun'],Date,'GJ',nojurnal,keterangan,QData.FieldValues['nilai'],0);
        end else if QData.FieldValues['tipe'] = 'CR' then begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:a and tipe=:b';
          ParamByName('a').Value := QData.FieldValues['noreferensi'];
          ParamByName('b').Value := QData.FieldValues['tipe'];
          ExecSQL;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_giro set posting=0 where noreferensi=:a and tipe=:b';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        ParamByName('b').Value := QData.FieldValues['tipe'];
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

end.
