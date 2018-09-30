unit UDaftarTerimaKirim;

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
  cxDataStorage, cxEdit, DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel;

type
  TFrm_DaftarKirimTerimaBarang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn;
    dbgdataDBTableView1ket: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopenyesuaian: TLargeintField;
    QDatakodepenyesuaian: TStringField;
    QDatatgltransaksi: TDateField;
    QDataketerangan: TMemoField;
    QDatanogudangdari: TLargeintField;
    QDatanogudangke: TLargeintField;
    QDatatipe: TSmallintField;
    QDatanamauser: TStringField;
    QDatakodepenerimaanbarang: TStringField;
    QDatatglpenerimaanbarang: TDateField;
    QDatagudangdari: TStringField;
    QDatagudangke: TStringField;
    dbgdataDBTableView1kodepenerimaanbarang: TcxGridDBColumn;
    dbgdataDBTableView1tglpenerimaanbarang: TcxGridDBColumn;
    QDatanopenerimaanbarang: TLargeintField;
    QDataapprove: TSmallintField;
    BtnApprove: TRzBitBtn;
    BtnCetak: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure dbgdataDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dbgdataDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnApproveClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarKirimTerimaBarang: TFrm_DaftarKirimTerimaBarang;
  datedari,datesampai:string;
  nogrid: Integer;

implementation

uses UDM, UMain, UPenyesuaianBarang, UPenerimaanBarang, UFTanggal;

{$R *.dfm}

procedure TFrm_DaftarKirimTerimaBarang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarKirimTerimaBarang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarKirimTerimaBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarKirimTerimaBarang.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarKirimTerimaBarang.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarKirimTerimaBarang.dbgdataDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  nogrid := ACellViewInfo.Item.Index;
end;

procedure TFrm_DaftarKirimTerimaBarang.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
  f: TFrm_PenyesuaianBarang;
  g: TFrm_PenerimaanBarang;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if nogrid = 1 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan3')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Penyesuaian Persediaan') then begin
      f := TFrm_PenyesuaianBarang.Create(Self);
      with f do begin
        tipe := 2;
        ClearText;
        dbgbarang.AddRow(); 
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtptanggal.ReadOnly := True;
        end;    }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select c.*,ifnull(d.kodegudang,'+QuotedStr('Gudang Utama')+')as gudangke from ' +
                      '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as gudangdari from ' +
                      '(select * from tbl_penyesuaian where nopenyesuaian=:np)as a ' +
                      'left join tbl_gudang as b on b.nogudang=a.nogudangdari)as c ' +
                      'left join tbl_gudang as d on d.nogudang=c.nogudangke';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          Open;
          LID.Caption := FieldValues['nopenyesuaian'];
          txtref.Text := FieldValues['kodepenyesuaian'];
          tipe := FieldValues['tipe'];
          txtketerangan.Text := FieldValues['keterangan'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          txtgudangdari.Text := FieldValues['gudangdari'];
          LGudangDari.Caption := FieldValues['nogudangdari'];
          txtgudangke.Text := FieldValues['gudangke'];
          LGudangKe.Caption := FieldValues['nogudangke'];
          Close;
          SQL.Clear;
          SQL.Text := 'select e.*,ifnull(f.kodeakun,'+QuotedStr('')+')as kodeakun from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penyesuaiandetail where nopenyesuaian=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as e ' +
                      'left join tbl_akun as f on f.noakun=e.noakunlain';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
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
                Cell[4,i].AsString := FieldValues['kodeakun'];
                Cell[6,i].AsInteger := FieldValues['nobarang'];
                Cell[7,i].AsInteger := FieldValues['nosatuan'];
                Cell[8,i].AsFloat := FieldValues['nilai'];
                Cell[9,i].AsInteger := FieldValues['noakunpersediaan'];
                Cell[10,i].AsInteger := FieldValues['noakunlain'];
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
  end else if nogrid = 4 then begin
    if QData.FieldValues['nopenerimaanbarang']=null then Exit;
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan4')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Penerimaan Barang Antar Gudang') then begin
      g := TFrm_PenerimaanBarang.Create(Self);
      with g do begin
        ClearText;
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtptanggal.ReadOnly := True;
        end;    }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select c.*,ifnull(d.kodegudang,'+QuotedStr('Gudang Utama')+')as gudangdari from ' +
                      '(select a.*,b.kodepenyesuaian,b.nogudangdari from ' +
                      '(select * from tbl_penerimaanbarang where nopenerimaanbarang=:np)as a ' +
                      'left join tbl_penyesuaian as b on b.nopenyesuaian=a.nopengiriman)as c ' +
                      'left join tbl_gudang as d on d.nogudang=c.nogudangdari';
          ParamByName('np').Value := QData.FieldValues['nopenerimaanbarang'];
          Open;
          LID.Caption := FieldValues['nopenerimaanbarang'];
          txtref.Text := FieldValues['kodepenerimaanbarang'];
          txtketerangan.Text := FieldValues['keterangan'];
          dtptanggal.Date := FieldValues['tglpenerimaanbarang'];
          txtpengiriman.Text := FieldValues['kodepenyesuaian'];
          LPengiriman.Caption := FieldValues['nopengiriman'];
          LGudangDari.Caption := FieldValues['nogudangdari'];
          txtgudangdari.Text := FieldValues['gudangdari'];
          LGudangKe.Caption := FieldValues['nogudang'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_gudang where nogudang=:np';
          ParamByName('np').Value := LGudangKe.Caption;
          Open;
          RzGroupBox1.Caption := 'Penerimaan Barang Antar Gudang - '+FieldValues['namagudang'];
          Close;
          SQL.Clear;
          SQL.Text := 'select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penerimaanbarangdetail where nopenerimaanbarang=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan';
          ParamByName('np').Value := LID.Caption;
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
                Cell[3,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[4,i].AsInteger := FieldValues['nobarang'];
                Cell[5,i].AsInteger := FieldValues['nosatuan'];
                Cell[6,i].AsFloat := FieldValues['nilai'];
              end;
              Next;
            end;
          end;
        end;
      end;
      g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      g.Show;

      ts := (g.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end;
end;

procedure TFrm_DaftarKirimTerimaBarang.BtnHapusClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;    }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if nogrid = 1 then begin
    if QData.FieldValues['approve']=0 then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          ParamByName('t').Value := 'IJ';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          ParamByName('t').Value := 'IJ';
          ExecSQL;
          Close;
          SQL.Text := 'delete from tbl_penyesuaian where nopenyesuaian=:np';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penyesuaiandetail where nopenyesuaian=:np';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          ExecSQL;
          Free;
        end;
        RefreshQ;
      end;
    end else begin
      MessageDlg('Transaksi Pengiriman telah diterima. Data tidak dapat dihapus!',mtError,[mbOK],0);
      Exit;
    end;
  end else if nogrid = 4 then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
      ParamByName('a').Value := QData.FieldValues['nopenerimaanbarang'];
      ParamByName('t').Value := 'IJ';
      Open;
      for i:=0 to RecordCount-1 do begin
        if FieldValues['terjual']=0 then begin
          Next;
        end else begin
          MessageDlg('Transaksi tidak dapat dihapus, karena barang telah terpakai oleh transaksi lain'#10#13'Hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
          Free;
          Exit;
        end;
      end;
      if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopenerimaanbarang'];
        ParamByName('t').Value := 'IJ';
        ExecSQL;
        Close;
        SQL.Text := 'delete from tbl_penerimaanbarang where nopenerimaanbarang=:np';
        ParamByName('np').Value := QData.FieldValues['nopenerimaanbarang'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_penerimaanbarangdetail where nopenerimaanbarang=:np';
        ParamByName('np').Value := QData.FieldValues['nopenerimaanbarang'];
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarKirimTerimaBarang.BtnApproveClick(Sender: TObject);
var
  hpp :Double;
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['approve']=0 then begin
    if MessageDlg('Transfer barang disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'select * from tbl_penyesuaian where nopenyesuaian=:np';
        ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
        Open;
        if FieldValues['approve']=0 then begin
          Screen.Cursor := crSQLWait;
          Close;
          SQL.Text := 'select * from tbl_penyesuaiandetail where nopenyesuaian=:np';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          Open;
          First;
          try
            dm.con.StartTransaction;
          //for i:=0 to RecordCount-1 do begin
            while not Eof do begin
              hpp := DM.HitungHPPPenjualan(FieldValues['nobarang'],FieldValues['qty']*FieldValues['nilai']);
              Q1.Close;
              Q1.SQL.Clear;
              //masuk tabel buku besar barang
              Q1.SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
              //Q1.ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
              Q1.ParamByName('b').Value := FieldValues['nobarang'];
              Q1.ParamByName('c').Value := 'IJ';
              Q1.ParamByName('d').Value := QData.FieldValues['nogudangdari'];
              Q1.ParamByName('e').Value := QData.FieldValues['tgltransaksi'];
              Q1.ParamByName('f').Value := FieldValues['nopenyesuaian'];
              Q1.ParamByName('g').Value := QData.FieldValues['keterangan'];
              Q1.ParamByName('h').Value := Abs(FieldValues['qty']*FieldValues['nilai']);
              Q1.ParamByName('i').Value := hpp;
              Q1.ParamByName('j').Value := 0;
              Q1.ExecSQL;
              //masuk buku besar barang detail
              dm.AmbilNoBuku(FieldValues['nobarang'],QData.FieldValues['nogudangdari'],Abs(FieldValues['qty']*FieldValues['nilai']),QData.FieldValues['nopenyesuaian'],'IJ');
              Next;
            end;
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_penyesuaian set approve=1 where nopenyesuaian=:np';
            ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
            ExecSQL;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            if MessageDlg('Cetak Surat Jalan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              dm.Q_NotaSJTransfer.Close;
              DM.Q_NotaSJTransfer.ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];;
              DM.Q_NotaSJTransfer.Open;
              DM.Nota_SJTransfer.ShowReport(True);
            end;
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
        end;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarKirimTerimaBarang.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  dm.Q_NotaSJTransfer.Close;
  DM.Q_NotaSJTransfer.ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];;
  DM.Q_NotaSJTransfer.Open;
  DM.Nota_SJTransfer.ShowReport(True);
end;

end.
