unit UDaftarPenyesuaianBarang;

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
  RzButton, ExtCtrls, RzPanel, frxClass, cxCheckBox;

type
  TFrm_DaftarPenyesuaianBarang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopenyesuaian: TLargeintField;
    QDatakodepenyesuaian: TStringField;
    QDatatgltransaksi: TDateField;
    QDatanogudangdari: TLargeintField;
    QDatanogudangke: TLargeintField;
    QDatatipe: TSmallintField;
    QDatanamauser: TStringField;
    QDataket: TStringField;
    dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    dbgdataDBTableView1ket: TcxGridDBColumn;
    dbgdataDBTableView1Pos: TcxGridDBColumn;
    QDataketerangan: TMemoField;
    BtnApprove: TRzBitBtn;
    QDataapprove: TSmallintField;
    RzBitBtn1: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnApproveClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPenyesuaianBarang: TFrm_DaftarPenyesuaianBarang;
  datedari,datesampai:string;

implementation

uses UDM, UPenyesuaianBarang, UMain, UFTanggal;

{$R *.dfm}

procedure TFrm_DaftarPenyesuaianBarang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPenyesuaianBarang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPenyesuaianBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPenyesuaianBarang.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarPenyesuaianBarang.BtnFilterClick(Sender: TObject);
begin
  Application.CreateForm(TFTanggal, FTanggal);
  with FTanggal do begin
    if FTanggal.ShowModal=mrok then begin
      datedari := FormatDateTime('yyyy-mm-dd',FTanggal.dtpdari.Date);
      datesampai := FormatDateTime('yyyy-mm-dd',FTanggal.dtpsampai.Date);
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarPenyesuaianBarang.BtnHapusClick(Sender: TObject);
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
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    {Close;
    SQL.Clear;
    SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
    ParamByName('a').Value := QData.FieldValues['nopenyesuaian'];
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
    end;    }
    if QData.FieldValues['approve']=0 then begin
      if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        {if QData.FieldValues['tipe'] <> 2 then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          ParamByName('t').Value := 'IJ';
          Open;
          for i:=0 to RecordCount-1 do begin
            if FieldValues['masuk'] > 0 then begin
              DM.HitungHPPAverage1(FieldValues['nobarang'],FieldValues['masuk'],FieldValues['hpp']);
              Next;
            end;
          end;
        end;
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
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
        ParamByName('t').Value := 'IJ';
        ExecSQL;    }
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
  end;
end;

procedure TFrm_DaftarPenyesuaianBarang.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_PenyesuaianBarang;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['tipe'] = 1 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan1')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
  end else if QData.FieldValues['tipe'] = 3 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if not DM.CekTabOpen('Penyesuaian Persediaan') then begin
    f := TFrm_PenyesuaianBarang.Create(Self);
    with f do begin
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
        if FieldValues['approve'] = 0 then
          cbapprove.Checked := False
        else cbapprove.Checked := True;
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
end;

procedure TFrm_DaftarPenyesuaianBarang.BtnApproveClick(Sender: TObject);
var
  i: Integer;
  hpp: Double;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['approve'] = 0 then begin
    if MessageDlg('Transaksi Penyesuaian Barang disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'select * from tbl_penyesuaian where nopenyesuaian=:np';
        ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
        Open;
        if FieldValues['approve']=0 then begin
          Screen.Cursor := crSQLWait;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penyesuaiandetail where nopenyesuaian=:np';
          ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
          Open;
          First;
          try
            dm.con.StartTransaction;
            //for i:=0 to RecordCount-1 do begin
            while not Eof do begin
              if FieldValues['qty'] > 0 then begin
                hpp := DM.HargaBeli(FieldValues['nobarang']);
                DM.HitungHPPAverage(FieldValues['nobarang'],FieldValues['qty']*FieldValues['nilai'],hpp);
                Q1.Close;
                Q1.SQL.Clear;
                //masuk tabel buku besar barang
                Q1.SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                //Q1.ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                Q1.ParamByName('b').Value := FieldValues['nobarang'];
                Q1.ParamByName('c').Value := 'IJ';
                Q1.ParamByName('d').Value := QData.FieldValues['nogudangdari'];
                Q1.ParamByName('e').Value := QData.FieldValues['tgltransaksi'];
                Q1.ParamByName('f').Value := FieldValues['nopenyesuaian'];
                Q1.ParamByName('g').Value := QData.FieldValues['keterangan'];
                Q1.ParamByName('h').Value := FieldValues['qty']*FieldValues['nilai'];
                Q1.ParamByName('i').Value := hpp;
                Q1.ExecSQL;

                hpp := hpp*FieldValues['qty']*FieldValues['nilai'];
                DM.InsertBukuBesarAkun(FieldValues['noakunpersediaan'],QData.FieldValues['tgltransaksi'],'IJ',FieldValues['nopenyesuaian'],QData.FieldValues['keterangan'],hpp,0);
                DM.InsertBukuBesarAkun(FieldValues['noakunlain'],QData.FieldValues['tgltransaksi'],'IJ',FieldValues['nopenyesuaian'],QData.FieldValues['keterangan'],0,hpp);
              end else if FieldValues['qty'] < 0 then begin
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
                hpp := DM.HitungHPPPenjualan(FieldValues['nobarang'],Abs(FieldValues['qty']*FieldValues['nilai']));
                Q1.ParamByName('i').Value := hpp;
                Q1.ParamByName('j').Value := 0;
                Q1.ExecSQL;

                //masuk buku besar barang detail
                dm.AmbilNoBuku(FieldValues['nobarang'],QData.FieldValues['nogudangdari'],Abs(FieldValues['qty']*FieldValues['nilai']),FieldValues['nopenyesuaian'],'IJ');

                hpp := hpp*Abs(FieldValues['qty']*FieldValues['nilai']);
                DM.InsertBukuBesarAkun(FieldValues['noakunlain'],QData.FieldValues['tgltransaksi'],'IJ',FieldValues['nopenyesuaian'],QData.FieldValues['keterangan'],hpp,0);
                DM.InsertBukuBesarAkun(FieldValues['noakunpersediaan'],QData.FieldValues['tgltransaksi'],'IJ',FieldValues['nopenyesuaian'],QData.FieldValues['keterangan'],0,hpp);
              end;
              Next;
            end;
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_penyesuaian set approve=1 where nopenyesuaian=:np';
            ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
            ExecSQL;
            dm.con.Commit;
            {if MessageDlg('Cetak Surat Jalan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              dm.Q_NotaSJTransfer.Close;
              DM.Q_NotaSJTransfer.ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];;
              DM.Q_NotaSJTransfer.Open;
              DM.Nota_SJTransfer.ShowReport(True);
            end;  }
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
          Free;
        end;
        Screen.Cursor := crDefault;
        RefreshQ;
      end;
    end;
  end;
end;

procedure TFrm_DaftarPenyesuaianBarang.RzBitBtn1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.Q_JurnalVoucher.Close;
    DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopenyesuaian'];
    DM.Q_JurnalVoucher.ParamByName('t').Value := 'IJ';
    DM.Q_JurnalVoucher.Open;
    t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
    t.Memo.Text := 'Jurnal Voucher';
    DM.Rpt_JurnalVoucher.ShowReport(True);
  end;
end;

end.
