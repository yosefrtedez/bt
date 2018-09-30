unit UDaftarGiroKeluar;

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
  RzButton, ExtCtrls, RzPanel, cxPC, cxCheckBox;

type
  TFrm_DaftarGiroKeluar = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnCair: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1nomorgiro: TcxGridDBColumn;
    dbgdataDBTableView1tanggal: TcxGridDBColumn;
    dbgdataDBTableView1nilai: TcxGridDBColumn;
    dbgdataDBTableView1pos: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
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
    DSData: TDataSource;
    BtnUnPost: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnCairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUnPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarGiroKeluar: TFrm_DaftarGiroKeluar;

implementation

uses UDM, UMain, URincianGiroKeluar;

{$R *.dfm}

procedure TFrm_DaftarGiroKeluar.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarGiroKeluar.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarGiroKeluar.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarGiroKeluar.BtnPerincianClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_RincianGiroKeluar, Frm_RincianGiroKeluar);
  Frm_RincianGiroKeluar.Cleartext;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM tbl_giro WHERE jenis=:j and noreferensi=:nr';
    ParamByName('nr').Value := QData.FieldValues['noreferensi'];
    ParamByName('j').Value := 'out';
    Open;
    Frm_RincianGiroKeluar.LID.Caption := FieldValues['noreferensi'];
    Frm_RincianGiroKeluar.LTipe.Caption := FieldValues['tipe'];
    Frm_RincianGiroKeluar.txtnomor.Text := FieldValues['nomorgiro'];
    Frm_RincianGiroKeluar.txtnilai.Value := FieldValues['nilai'];
    Frm_RincianGiroKeluar.dtptempo.Date := FieldValues['tanggal'];
    if FieldValues['posting'] = 1 then
      Frm_RincianGiroKeluar.cbposting.Checked := True
    else Frm_RincianGiroKeluar.cbposting.Checked := False;
    if FieldValues['tipe'] = 'CO' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.namaakun from ' +
                  '(select * from tbl_pengeluaranlain where nopengeluaran=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakun';
      ParamByName('np').Value := Frm_RincianGiroKeluar.LID.Caption;
      Open;
      Frm_RincianGiroKeluar.txttanggal.Text := FormatDateTime('dd/mm/yyyy',FieldValues['tgltransaksi']);
      Frm_RincianGiroKeluar.txtkas.Text := FieldValues['namaakun'];
      Frm_RincianGiroKeluar.LKas.Caption := FieldValues['noakun'];
    end else if QData.FieldValues['tipe'] = 'CD' then begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.namaakun from ' +
                  '(select * from tbl_pembayaranhutang where nopembayaranhutang=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.nokas';
      ParamByName('np').Value := Frm_RincianGiroKeluar.LID.Caption;
      Open;
      Frm_RincianGiroKeluar.txttanggal.Text := FormatDateTime('dd/mm/yyyy',FieldValues['tglbayar']);
      Frm_RincianGiroKeluar.txtkas.Text := FieldValues['namaakun'];
      Frm_RincianGiroKeluar.LKas.Caption := FieldValues['nokas'];
    end;
    if Frm_RincianGiroKeluar.ShowModal = mrok then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_giro set tanggal=:a where noreferensi=:nr and tipe=:t';
      ParamByName('nr').Value := Frm_RincianGiroKeluar.LID.Caption;
      ParamByName('t').Value := Frm_RincianGiroKeluar.LTipe.Caption;
      ParamByName('a').Value := FormatDateTime('yyyy-mm-dd',Frm_RincianGiroKeluar.dtptempo.Date);
      ExecSQL;
      if Frm_RincianGiroKeluar.LTipe.Caption = 'CO' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pengeluaranlain set noakun=:a where nopengeluaran=:np';
        ParamByName('np').Value := Frm_RincianGiroKeluar.LID.Caption;
        ParamByName('a').Value := Frm_RincianGiroKeluar.LKas.Caption;
        ExecSQL;
      end else if Frm_RincianGiroKeluar.LTipe.Caption = 'CD' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pembayaranhutang set nokas=:a where nopembayaranhutang=:np';
        ParamByName('np').Value := Frm_RincianGiroKeluar.LID.Caption;
        ParamByName('a').Value := Frm_RincianGiroKeluar.LKas.Caption;
        ExecSQL;
      end;
      RefreshQ;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarGiroKeluar.BtnCairClick(Sender: TObject);
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
  if MessageDlg('Program secara otomatis akan memindahkan nilai giro ke kas.'#10#13'Yakin akan melanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    {if DM.CekPeriode(QData.FieldValues['tanggal'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end else if DM.CekPeriode(QData.FieldValues['tanggal'])= 2 then begin
      if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      nokas := 0;
      nilaikas := 0;
      if QData.FieldValues['tipe'] = 'CO' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pengeluaranlain where nopengeluaran=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        nokas := FieldValues['noakun'];
        nilaikas := FieldValues['total'];
        kodejurnal := DM.GenerateKodeTransaksi('GJ',Date);
        nojurnal := DM.GenerateNoMaster('jurnalumum');
        keterangan := 'Penyesuaian Giro Cair, Bank '+QData.FieldValues['namabank']+', No. '+QData.FieldValues['nomorgiro'];
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
        SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d,:e,:f)';
        ParamByName('a').Value := nojurnal;
        ParamByName('b').Value := QData.FieldValues['noakun'];
        ParamByName('c').Value := QData.FieldValues['nilai'];
        ParamByName('d').Value := 0;
        ExecSQL;
        //masuk buku besar
        DM.InsertBukuBesarAkun(QData.FieldValues['noakun'],Date,'GJ',nojurnal,keterangan,QData.FieldValues['nilai'],0);
      end else if QData.FieldValues['tipe'] = 'CD' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembayaranhutang where nopembayaranhutang=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        nokas := FieldValues['nokas'];
        nilaikas := FieldValues['total'];
        keterangan := FieldValues['keterangan'];
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembayaranhutangdetail where nopembayaranhutang=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;
        for i:=0 to RecordCount-1 do begin
          DM.InsertBukuBesarAkun(FieldValues['noakunhutang'],QData.FieldValues['tanggal'],'CD',QData.FieldValues['noreferensi'],keterangan,FieldValues['jumlahbayar'],0);
          if FieldValues['potonganhutang'] > 0 then begin
            DM.InsertBukuBesarAkun(FieldValues['noakunhutang'],QData.FieldValues['tanggal'],'CD',QData.FieldValues['noreferensi'],'Potongan Pembelian'+QData.FieldValues['namakontak'],FieldValues['potonganhutang'],0);
            DM.InsertBukuBesarAkun(FieldValues['noakunpotonganpembelian'],QData.FieldValues['tanggal'],'CD',QData.FieldValues['noreferensi'],'Potongan Pembelian'+QData.FieldValues['namakontak'],0,FieldValues['potonganhutang']);
          end;
          Next;
        end;
        DM.InsertBukuBesarAkun(nokas,QData.FieldValues['tanggal'],'CD',QData.FieldValues['noreferensi'],keterangan,0,nilaikas);
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

procedure TFrm_DaftarGiroKeluar.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarGiroKeluar.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarGiroKeluar.BtnUnPostClick(Sender: TObject);
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
        if QData.FieldValues['tipe'] = 'CO' then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pengeluaranlain where nopengeluaran=:a';
          ParamByName('a').Value := QData.FieldValues['noreferensi'];
          Open;
          nokas := FieldValues['noakun'];
          nilaikas := FieldValues['total'];
          kodejurnal := DM.GenerateKodeTransaksi('GJ',Date);
          nojurnal := DM.GenerateNoMaster('jurnalumum');
          keterangan := 'Pembatalan Giro, Bank '+QData.FieldValues['namabank']+', No. '+QData.FieldValues['nomorgiro'];
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
          SQL.Text := 'insert into tbl_jurnalumumdetail values(:a,:b,:c,:d,:e,:f)';
          ParamByName('a').Value := nojurnal;
          ParamByName('b').Value := QData.FieldValues['noakun'];
          ParamByName('c').Value := 0;
          ParamByName('d').Value := QData.FieldValues['nilai'];
          ExecSQL;
          //masuk buku besar
          DM.InsertBukuBesarAkun(QData.FieldValues['noakun'],Date,'GJ',nojurnal,keterangan,0,QData.FieldValues['nilai']);
        end else if QData.FieldValues['tipe'] = 'CD' then begin
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
