unit UBukuBesar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, SMDBGrid, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxPC, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Menus, frxClass;

type
  TFrm_BukuBesar = class(TForm)
    RzPanel1: TRzPanel;
    LBukuBesar: TRzLabel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    BtnAkun: TRzToolButton;
    LNoBukuBesar: TRzLabel;
    QDatanoakun: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDatatipe: TStringField;
    QDataketerangan: TStringField;
    QDatadebit: TFloatField;
    QDatakredit: TFloatField;
    QDatanoreferensi: TLargeintField;
    BtnPerincian: TRzBitBtn;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    QDatakoderef: TStringField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1tipe: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    dbgdataDBTableView1debit: TcxGridDBColumn;
    dbgdataDBTableView1kredit: TcxGridDBColumn;
    dbgdataDBTableView1koderef: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    JurnalVoucher1: TMenuItem;
    BtnVoucher: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnAkunClick(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure JurnalVoucher1Click(Sender: TObject);
    procedure BtnVoucherClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_BukuBesar: TFrm_BukuBesar;
  datedari,datesampai,md,td:string;
  akunbuku: Integer;

implementation

uses UDM, UDataAkun, UFTanggal, UMain, UInputJurnalUmum, UAPInvoice, UPenjualan, UPenyesuaianBarang, UPembayaranHutang, UPembayaranPiutang, UInputPenerimaanLain, UInputPengeluaranLain, UReturPembelian, UReturPenjualan, UTransferKas, UInputLoan, UPenjualanTunai;

{$R *.dfm}

procedure TFrm_BukuBesar.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_BukuBesar.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tk').Value := DM.GetNoPeriode(StrToInt(md),td);
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    ParamByName('a').Value := LNoBukuBesar.Caption;
    Open;
  end;
end;

procedure TFrm_BukuBesar.BtnAkunClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataAkun, Frm_DataAkun);
  akunkas := -1;
  noklas := 0;
  nosubklas := 0;
  Frm_DataAkun.RefreshQ;
  if Frm_DataAkun.ShowModal = mrok then begin
    if Frm_DataAkun.QData.FieldValues['noakun'] = akunlababerjalan then begin
      ShowMessage('Perkiraan ini merupakan perkiraan pembantu semata dan tidak ada transaksi real.');
      Exit;
    end;
    LNoBukuBesar.Caption := Frm_DataAkun.QData.FieldValues['noakun'];
    LBukuBesar.Caption := 'Buku Besar '+Frm_DataAkun.QData.FieldValues['namaakun'];
    RefreshQ;
  end;
end;

procedure TFrm_BukuBesar.BtnFilterClick(Sender: TObject);
begin
  Application.CreateForm(TFTanggal, FTanggal);
  with FTanggal do begin
    if ShowModal=mrok then begin
      datedari := FormatDateTime('yyyy-mm-dd',FTanggal.dtpdari.Date);
      md := FormatDateTime('mm',FTanggal.dtpdari.Date);
      td := FormatDateTime('yyyy',FTanggal.dtpdari.Date);
      datesampai := FormatDateTime('yyyy-mm-dd',FTanggal.dtpsampai.Date);
    end;
  end;
  RefreshQ;
end;

procedure TFrm_BukuBesar.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  md := FormatDateTime('mm',DM.FDOM(Date));
  td := FormatDateTime('yyyy',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  if akunbuku = 0 then begin
    with TZQuery.Create(Self) do begin
      Connection := dm.Con;
      Close;
      SQL.Text := 'select * from tbl_akun where aktif=1 order by kodeakun';
      Open;
      if not IsEmpty then begin
        First;
        LNoBukuBesar.Caption := FieldValues['noakun'];
        LBukuBesar.Caption := 'Buku Besar '+FieldValues['namaakun'];
      end else LNoBukuBesar.Caption := '0';
      Free;
    end;
  end else begin
    with TZQuery.Create(Self) do begin
      Connection := dm.Con;
      Close;
      SQL.Text := 'select * from tbl_akun where noakun=:a order by kodeakun';
      ParamByName('a').Value := akunbuku;
      Open;
      if not IsEmpty then begin
        LNoBukuBesar.Caption := FieldValues['noakun'];
        LBukuBesar.Caption := 'Buku Besar '+FieldValues['namaakun'];
      end else LNoBukuBesar.Caption := '0';
      Free;
    end;
  end;
  RefreshQ;
end;

procedure TFrm_BukuBesar.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_BukuBesar.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  c: TFrm_InputPengeluaranLain;
  a: TFrm_InputPenerimaanLain;
  d: TFrm_APInvoice;
  e: TFrm_PembayaranHutang;
  f: TFrm_Penjualan;
  b: TFrm_InputJurnalUmum;
  g: TFrm_PembayaranPiutang;
  h: TFrm_PenyesuaianBarang;
  j: TFrm_ReturPenjualan;
  k: TFrm_ReturPembelian;
  l: TFrm_PenjualanTunai;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['tipe'] = 'CI' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Penerimaan Kas') then begin
      a := TFrm_InputPenerimaanLain.Create(Self);
      with a do begin
        ClearText;
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtptanggal.ReadOnly := True;
        end; }
        LID.Caption := QData.FieldValues['noreferensi'];
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,b.namaakun FROM ' +
                      '(SELECT * FROM tbl_penerimaanlain where nopenerimaan=:np)AS a ' +
                      'LEFT JOIN tbl_akun AS b ON b.noakun=a.noakun';
          ParamByName('np').Value := LID.Caption;
          Open;
          txtreferensi.Text := QData.FieldValues['kodepenerimaan'];
          txtkas.Text := FieldValues['namaakun'];
          LKas.Caption := FieldValues['noakun'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          if FieldValues['giro'] = 1 then
            cbgiro.Checked := True
          else cbgiro.Checked := False;
          if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CI';
            Open;
            if FieldValues['posting'] = 1 then begin
              cbgiro.Enabled := False;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun,b.namaakun from ' +
                      '(select * from tbl_penerimaanlaindetail where nopenerimaan=:nk)as a ' +
                      'left join tbl_akun as b on b.noakun=a.noakun';
          ParamByName('nk').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            DBGData.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              DBGData.AddRow();
              DBGData.Cell[0,i].AsString := FieldValues['kodeakun'];
              DBGData.Cell[1,i].AsString := FieldValues['namaakun'];
              DBGData.Cell[2,i].AsFloat := FieldValues['jumlah'];
              DBGData.Cell[3,i].AsString := FieldValues['memo'];
              DBGData.Cell[5,i].AsInteger := FieldValues['noakun'];
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      a.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      a.Show;

      ts := (a.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;

    end;
  end else if QData.FieldValues['tipe'] = 'GJ' then begin
    if not DM.CekTabOpen('Jurnal Umum') then begin
      b := TFrm_InputJurnalUmum.Create(Self);
      with b do begin
        ClearText;
        dbgpembayaran.AddRow();
        LID.Caption := QData.FieldValues['noreferensi'];
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'select * from tbl_jurnalumum where nojurnalumum=:nj';
          ParamByName('nj').Value := LID.Caption;
          Open;
          txtreferensi.Text := FieldValues['kodejurnalumum'];
          LID.Caption := FieldValues['nojurnalumum'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          txtketerangan.Text := FieldValues['keterangan'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun,b.namaakun from ' +
                      '(select * from tbl_jurnalumumdetail where nojurnalumum=:np) as a ' +
                      'left join tbl_akun as b on b.noakun=a.noakun';
          ParamByName('np').Value := LID.Caption;
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
      b.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      b.Show;

      ts := (b.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'CO' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas3')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Pengeluaran Kas') then begin
      c := TFrm_InputPengeluaranLain.Create(Self);
      with c do begin
        ClearText;
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,b.namaakun FROM ' +
                      '(SELECT * FROM tbl_pengeluaranlain where nopengeluaran=:np)AS a ' +
                      'LEFT JOIN tbl_akun AS b ON b.noakun=a.noakun';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          {if DM.CekPeriode(FieldValues['tgltransaksi'])=0 then begin
            dtptanggal.ReadOnly := True;
          end; }
          LID.Caption := FieldValues['nopengeluaran'];
          txtreferensi.Text := FieldValues['kodepengeluaran'];
          txtkas.Text := FieldValues['namaakun'];
          LKas.Caption := FieldValues['noakun'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          txtpenerima.Text := FieldValues['penerima'];
          if FieldValues['giro'] = 1 then
            cbgiro.Checked := True
          else cbgiro.Checked := False;
          if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CO';
            Open;
            if FieldValues['posting'] = 1 then begin
              cbgiro.Enabled := False;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun,b.namaakun from ' +
                      '(select * from tbl_pengeluaranlaindetail where nopengeluaran=:nk)as a ' +
                      'left join tbl_akun as b on b.noakun=a.noakun';
          ParamByName('nk').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            DBGData.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              DBGData.AddRow();
              DBGData.Cell[0,i].AsString := FieldValues['kodeakun'];
              DBGData.Cell[1,i].AsString := FieldValues['namaakun'];
              DBGData.Cell[2,i].AsFloat := FieldValues['jumlah'];
              DBGData.Cell[3,i].AsString := FieldValues['memo'];
              DBGData.Cell[5,i].AsInteger := FieldValues['noakun'];
              Next;
            end;

          end;
          UpdateTotal;
          Free;
        end;
      end;
      c.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      c.Show;

      ts := (c.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;

    end;
  end else if QData.FieldValues['tipe'] = 'PU' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian4')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Account Payable') then begin
      d := TFrm_APInvoice.Create(Self);
      with d do begin
        ClearText;
        {if DM.CekPeriode(QData.FieldValues['tglpembelianinvoice'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pembelianinvoicedetail where nopembelianinvoice=:np';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          if IsEmpty then begin
            MessageDlg('Transaksi tidak dapat diubah: Saldo Awal Hutang',mtError,[mbOK],0);
            Free;
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.namakontak from ' +
                      '(select a.*,b.kodepembelianterima from ' +
                      '(select * from tbl_pembelianinvoice where nopembelianinvoice=:np)as a ' +
                      'left join tbl_pembelianterima as b on b.nopembelianterima=a.nopembelianterima)as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          LID.Caption := FieldValues['nopembelianinvoice'];
          txtreferensi.Text := FieldValues['kodepembelianinvoice'];
          txtsupplier.Text := FieldValues['namakontak'];
          LSupplier.Caption := FieldValues['nokontak'];
          dtpfaktur.Date := FieldValues['tglpembelianinvoice'];
          txtto.Text := FieldValues['kodepembelianterima'];
          LTO.Caption := FieldValues['nopembelianterima'];
          txtdiskondays.Value := FieldValues['diskonday'];
          txtduedate.Value := FieldValues['duedate'];
          txtearlydiscount.Value := FieldValues['earlydiskon'];
          txtlatecharge.Value := FieldValues['latecharge'];
          txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
          LHutang.Caption := FieldValues['noakunhutang'];
          txtbiaya.Value := FieldValues['biayalain'];
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          txtpph.Value := FieldValues['pph'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepph,'+QuotedStr('-')+')as kodepph from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select a.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_pembelianinvoicedetail where nopembelianinvoice=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                      'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_pajakpenghasilan as b on b.nopph=a.nopph';
          ParamByName('np').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            First;
            for i:= 0 to RecordCount -1 do begin
              dbgbarang.AddRow();
              dbgbarang.Cell[0,i].AsString := FieldValues['kodebarang'];
              dbgbarang.Cell[1,i].AsString := FieldValues['namabarang'];
              dbgbarang.Cell[2,i].AsFloat := FieldValues['qty'];
              dbgbarang.Cell[3,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
              dbgbarang.Cell[4,i].AsFloat := FieldValues['hargabeli'];
              dbgbarang.Cell[5,i].AsFloat := FieldValues['diskon1'];
              dbgbarang.Cell[6,i].AsFloat := FieldValues['diskon2'];
              dbgbarang.Cell[7,i].AsFloat := FieldValues['subtotal'];
              dbgbarang.Cell[8,i].AsString := FieldValues['kodepajak'];
              dbgbarang.Cell[9,i].AsInteger := FieldValues['nobarang'];
              dbgbarang.Cell[10,i].AsInteger := FieldValues['nosatuan'];
              dbgbarang.Cell[11,i].AsFloat := FieldValues['nilai'];
              dbgbarang.Cell[12,i].AsInteger := FieldValues['noakunpersediaan'];
              dbgbarang.Cell[13,i].AsInteger := FieldValues['nopajak'];
              dbgbarang.Cell[14,i].AsInteger := FieldValues['tipepajak'];
              dbgbarang.Cell[15,i].AsFloat := FieldValues['persenpajak'];
              dbgbarang.Cell[16,i].AsFloat := FieldValues['dppbarang'];
              dbgbarang.Cell[17,i].AsFloat := FieldValues['ppnbarang'];
              dbgbarang.Cell[18,i].AsInteger := FieldValues['noakunpajakpembelian'];
              dbgbarang.Cell[19,i].AsInteger := FieldValues['tipebarang'];
              dbgbarang.Cell[20,i].AsInteger := FieldValues['noakunbelumtertagih'];
              dbgbarang.Cell[21,i].AsString := FieldValues['kodepph'];
              dbgbarang.Cell[22,i].AsInteger := FieldValues['noakunpajakpembelianblm'];
              dbgbarang.Cell[23,i].AsInteger := FieldValues['nopph'];
              dbgbarang.Cell[24,i].AsFloat := FieldValues['persenpph'];
              dbgbarang.Cell[25,i].AsInteger := FieldValues['noakunpph'];
              dbgbarang.Cell[26,i].AsFloat := FieldValues['pphbarang'];
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      d.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      d.Show;

      ts := (d.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'CD' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian7')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Pembayaran Hutang Usaha') then begin
      e := TFrm_PembayaranHutang.Create(Self);
      with e do begin
        ClearText;
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT * FROM tbl_pembayaranhutang where nopembayaranhutang=:np)AS a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          {if DM.CekPeriode(FieldValues['tglbayar'])= 0 then begin
            dtptanggal.ReadOnly := True;
          end   }
          LID.Caption := FieldValues['nopembayaranhutang'];
          txtreferensi.Text := FieldValues['kodepembayaranhutang'];
          txtsupplier.Text := FieldValues['namakontak'];
          LSupplier.Caption := FieldValues['nokontak'];
          txtsupplier.ReadOnly := True;
          dtptanggal.Date := FieldValues['tglbayar'];
          LKas.Caption := FieldValues['nokas'];
          LKasTransit.Caption := FieldValues['nokastransit'];
          if FieldValues['giro']=1 then
            cbgiro.Checked := True
          else cbgiro.Checked := False;
          if FieldValues['approve']=1 then
            cbapprove.Checked := True
          else cbapprove.Checked := False;
          if FieldValues['cair']=1 then
            cbcair.Checked := True
          else cbcair.Checked := False;
          if FieldValues['iscancel']=1 then
            cbcancel.Checked := True
          else cbcancel.Checked := False;
          if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CD';
            Open;
            if FieldValues['posting'] = 1 then begin
              cbgiro.Enabled := False;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_akun where noakun=:a';
          ParamByName('a').Value := LKas.Caption;
          Open;
          txtkas.Text := FieldValues['namaakun'];
          BtnRekam.Visible := False;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.tglpembelianinvoice,b.kodepembelianinvoice,DATE_ADD(b.tglpembelianinvoice,INTERVAL b.duedate DAY) AS tgltempo from ' +
                      '(select * from tbl_pembayaranhutangdetail where nopembayaranhutang=:nk)as a ' +
                      'left join tbl_pembelianinvoice as b on b.nopembelianinvoice=a.nopembelianinvoice';
          ParamByName('nk').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgpembayaran.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              dbgpembayaran.AddRow();
              dbgpembayaran.Cell[0,i].AsString := FieldValues['kodepembelianinvoice'];
              dbgpembayaran.Cell[1,i].AsDateTime := FieldValues['tglpembelianinvoice'];
              dbgpembayaran.Cell[2,i].AsDateTime := FieldValues['tgltempo'];
              dbgpembayaran.Cell[4,i].AsFloat := FieldValues['jumlahbayar'];
              dbgpembayaran.Cell[5,i].AsFloat := FieldValues['selisih'];
              dbgpembayaran.Cell[7,i].AsInteger := FieldValues['nopembelianinvoice'];
              dbgpembayaran.Cell[8,i].AsInteger := FieldValues['noakunselisih'];
              dbgpembayaran.Cell[9,i].AsInteger := FieldValues['noakunhutang'];

              Q1.Close;
              Q1.SQL.Clear;
              Q1.SQL.Text :=  'select e.*,e.totalhutang-e.jumlahbayar-e.jumlahretur as sisahutang from ' +
                              '(select c.*,ifnull(sum(d.jumlahbayar+d.selisih),0)as jumlahbayar from ' +
                              '(select a.*,ifnull(sum(b.total),0) as jumlahretur from ' +
                              '(select nopembelianinvoice,tglpembelianinvoice,nokontak,total as totalhutang from tbl_pembelianinvoice where nopembelianinvoice=:np)as a ' +
                              'left join tbl_returpembelian as b on b.nopembelianinvoice=a.nopembelianinvoice group by a.nopembelianinvoice)as c ' +
                              'left join (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih FROM ' +
                              '(SELECT * FROM tbl_pembayaranhutang WHERE iscancel=0)AS a ' +
                              'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutang=a.nopembayaranhutang) as d on d.nopembelianinvoice=c.nopembelianinvoice group by c.nopembelianinvoice)as e where e.totalhutang-e.jumlahbayar-e.jumlahretur<>0';
              Q1.ParamByName('np').Value := dbgpembayaran.Cell[0,i].AsString;
              Q1.Open;
              if Q1.IsEmpty then
                dbgpembayaran.Cell[3,i].AsFloat := 0
              else dbgpembayaran.Cell[3,i].AsFloat := Q1.FieldValues['sisahutang'];
              dbgpembayaran.Cell[3,i].AsFloat := dbgpembayaran.Cell[3,i].AsFloat+dbgpembayaran.Cell[4,i].AsFloat+dbgpembayaran.Cell[5,i].AsFloat;

              if dbgpembayaran.Cell[8,i].AsInteger > 0 then begin
                Q1.Close;
                Q1.SQL.Clear;
                Q1.SQL.Text :=  'select * from tbl_akun where noakun=:np';
                Q1.ParamByName('np').Value := dbgpembayaran.Cell[8,i].AsInteger;
                Q1.Open;
                dbgpembayaran.Cell[6,i].AsString := Q1.FieldValues['namaakun'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      e.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      e.Show;

      ts := (e.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'SA' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan4')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('AR Invoice') then begin
      f := TFrm_Penjualan.Create(Self);
      with f do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QDetail.FieldValues['tglpenjualaninvoice'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;          }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penjualaninvoicedetail where nopenjualaninvoice=:np';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          if IsEmpty then begin
            MessageDlg('Transaksi tidak dapat diubah: Saldo Awal Piutang',mtError,[mbOK],0);
            Free;
            Exit;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.namakontak from ' +
                      '(select * from tbl_penjualaninvoice where nopenjualaninvoice=:np)as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          LID.Caption := FieldValues['nopenjualaninvoice'];
          txtreferensi.Text := FieldValues['kodepenjualaninvoice'];
          txtcustomer.Text := FieldValues['namakontak'];
          LCustomer.Caption := FieldValues['nokontak'];
          dtpfaktur.Date := FieldValues['tglpenjualaninvoice'];
          LPiutang.Caption := FieldValues['noakunpiutang'];
          txtdiskondays.Value := FieldValues['diskonday'];
          txtduedate.Value := FieldValues['duedate'];
          txtearlydiscount.Value := FieldValues['earlydiskon'];
          txtlatecharge.Value := FieldValues['latecharge'];
          txtbiaya.Value := FieldValues['biayalain'];
          txtterm.Text := DM.GetSalesTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
          LNoPenjualanKirim.Caption := FieldValues['nopenjualankirim'];

          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.noakunbiayalain from ' +
                      '(select * from tbl_penjualankirim where nopenjualankirim=:ab)as a ' +
                      'left join tbl_penjualanorder as b on b.nopenjualanorder=a.nopenjualanorder';
          ParamByName('ab').Value := LNoPenjualanKirim.Caption;
          Open;
          txtsj.Text := FieldValues['kodepenjualankirim'];
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          IsiDBGBarang;
          UpdateTotal;
          Free;
        end;
      end;
      f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      f.Show;

      ts := (f.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'CR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan8')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Pembayaran Piutang Usaha') then begin
      g := TFrm_PembayaranPiutang.Create(Self);
      with g do begin
        ClearText;
        {if DM.CekPeriode(QData.FieldValues['tglbayar'])= 0 then begin
          dtptanggal.ReadOnly := True;
        end   }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT * FROM tbl_pembayaranpiutang where nopembayaranpiutang=:np)AS a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          LID.Caption := FieldValues['nopembayaranpiutang'];
          txtreferensi.Text := FieldValues['kodepembayaranpiutang'];
          txtcustomer.Text := FieldValues['namakontak'];
          LCustomer.Caption := FieldValues['nokontak'];
          txtcustomer.ReadOnly := True;
          dtptanggal.Date := FieldValues['tglbayar'];
          LKas.Caption := FieldValues['nokas'];
          txtbiaya.Value := FieldValues['totaldenda'];
          LPendapatanDenda.Caption := FieldValues['noakundenda'];
          BtnRekam.Visible := False;
          if FieldValues['giro']=1 then
            cbgiro.Checked := True
          else cbgiro.Checked := False;
          if cbgiro.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := 'CR';
            Open;
            if FieldValues['posting'] = 1 then begin
              cbgiro.Enabled := False;
            end;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_akun where noakun=:a';
          ParamByName('a').Value := LKas.Caption;
          Open;
          txtkas.Text := FieldValues['namaakun'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.tglpenjualaninvoice,b.kodepenjualaninvoice,DATE_ADD(b.tglpenjualaninvoice,INTERVAL b.duedate DAY) AS tgltempo from ' +
                      '(select * from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:nk)as a ' +
                      'left join tbl_penjualaninvoice as b on b.nopenjualaninvoice=a.nopenjualaninvoice';
          ParamByName('nk').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgpembayaran.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              dbgpembayaran.AddRow();
              dbgpembayaran.Cell[0,i].AsString := FieldValues['kodepenjualaninvoice'];
              dbgpembayaran.Cell[1,i].AsDateTime := FieldValues['tglpenjualaninvoice'];
              dbgpembayaran.Cell[2,i].AsDateTime := FieldValues['tgltempo'];
              dbgpembayaran.Cell[4,i].AsFloat := FieldValues['jumlahbayar'];
              dbgpembayaran.Cell[5,i].AsFloat := FieldValues['selisih'];
              dbgpembayaran.Cell[7,i].AsInteger := FieldValues['nopenjualaninvoice'];
              dbgpembayaran.Cell[8,i].AsInteger := FieldValues['noakunselisih'];
              dbgpembayaran.Cell[9,i].AsInteger := FieldValues['noakunpiutang'];
              dbgpembayaran.Cell[10,i].AsFloat := FieldValues['denda'];

              Q1.Close;
              Q1.SQL.Clear;
              Q1.SQL.Text :=  'select e.*,e.totalpiutang-e.jumlahbayar-e.jumlahretur as sisapiutang from ' +
                              '(select c.*,ifnull(sum(d.jumlahbayar+d.selisih),0)as jumlahbayar from ' +
                              '(select a.*,ifnull(sum(b.total),0) as jumlahretur from ' +
                              '(select nopenjualaninvoice,tglpenjualaninvoice,nokontak,total as totalpiutang from tbl_penjualaninvoice where nopenjualaninvoice=:np)as a ' +
                              'left join tbl_returpenjualan as b on b.nopenjualaninvoice=a.nopenjualaninvoice group by a.nopenjualaninvoice)as c ' +
                              'left join (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih FROM ' +
                              '(SELECT * FROM tbl_pembayaranpiutang)AS a ' +
                              'LEFT JOIN tbl_pembayaranpiutangdetail AS b ON b.nopembayaranpiutang=a.nopembayaranpiutang) as d on d.nopenjualaninvoice=c.nopenjualaninvoice group by c.nopenjualaninvoice)as e where e.totalpiutang-e.jumlahbayar-e.jumlahretur<>0';
              Q1.ParamByName('np').Value := dbgpembayaran.Cell[7,i].AsInteger;
              Q1.Open;
              if Q1.IsEmpty then
                dbgpembayaran.Cell[3,i].AsFloat := 0
              else dbgpembayaran.Cell[3,i].AsFloat := Q1.FieldValues['sisapiutang'];
              dbgpembayaran.Cell[3,i].AsFloat := dbgpembayaran.Cell[3,i].AsFloat+dbgpembayaran.Cell[4,i].AsFloat+dbgpembayaran.Cell[5,i].AsFloat;

              if dbgpembayaran.Cell[8,i].AsInteger > 0 then begin
                Q1.Close;
                Q1.SQL.Clear;
                Q1.SQL.Text :=  'select * from tbl_akun where noakun=:np';
                Q1.ParamByName('np').Value := dbgpembayaran.Cell[8,i].AsInteger;
                Q1.Open;
                dbgpembayaran.Cell[6,i].AsString := Q1.FieldValues['namaakun'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      g.Show;

      ts := (f.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'IJ' then begin  
    if not DM.CekTabOpen('Penyesuaian Persediaan') then begin
      h := TFrm_PenyesuaianBarang.Create(Self);
      with h do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
            dtptanggal.ReadOnly := True;
          end   }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select c.*,ifnull(d.kodegudang,'+QuotedStr('Gudang Utama')+')as gudangke from ' +
                      '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as gudangdari from ' +
                      '(select * from tbl_penyesuaian where nopenyesuaian=:np)as a ' +
                      'left join tbl_gudang as b on b.nogudang=a.nogudangdari)as c ' +
                      'left join tbl_gudang as d on d.nogudang=c.nogudangke';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          tipe := FieldValues['tipe'];
          if tipe = 1 then begin
            if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan1')=False then begin
              MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
              Exit;
            end;
          end else if tipe = 2 then begin
            if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan3')=False then begin
              MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
              Exit;
            end;
          end else if tipe = 3 then begin
            if DM.CekAkses(Frm_Main.txtuser.Caption,'Persediaan2')=False then begin
              MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
              Exit;
            end;
          end;
          LID.Caption := FieldValues['nopenyesuaian'];
          txtref.Text := FieldValues['kodepenyesuaian'];
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
      h.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      h.Show;

      ts := (h.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'SR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan6')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Retur Penjualan') then begin
      j := TFrm_ReturPenjualan.Create(Self);
      with j do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QPembelian.FieldValues['tgltransaksi'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'select c.*,ifnull(d.kodepenjualaninvoice,'+QuotedStr('')+')as kodepenjualaninvoice from ' +
                      '(select a.*,ifnull(b.namakontak,'+QuotedStr('')+')as namakontak from ' +
                      '(select * from tbl_returpenjualan where noreturpenjualan=:np) as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak)as c ' +
                      'left join tbl_penjualaninvoice as d on d.nopenjualaninvoice=c.nopenjualaninvoice';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          LID.Caption := FieldValues['noreturpenjualan'];
          txtreferensi.Text := FieldValues['kodereturpenjualan'];
          txtcustomer.Text := FieldValues['namakontak'];
          LCustomer.Caption := FieldValues['nokontak'];
          dtpfaktur.Date := FieldValues['tgltransaksi'];
          txtpenjualan.Text := FieldValues['kodepenjualaninvoice'];
          LNoPenjualan.Caption := FieldValues['nopenjualaninvoice'];
          LPiutang.Caption := FieldValues['noakunpiutang'];
          txtketerangan.Text := FieldValues['keterangan'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as kodegudang from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_returpenjualandetail where noreturpenjualan=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_gudang as b on b.nogudang=a.nogudang)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_akun as b on b.noakun=a.noakunreturpenjualan';
          ParamByName('np').Value := LID.Caption;
          Open;
          First;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            for i:=0 to RecordCount-1 do begin
              with dbgbarang do begin
                AddRow();
                Cell[0,i].AsString := FieldValues['kodeakun'];
                Cell[1,i].AsString := FieldValues['kodebarang'];
                Cell[2,i].AsString := FieldValues['namabarang'];
                Cell[3,i].AsString := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['hargajual'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[10,i].AsString := FieldValues['kodegudang'];
                Cell[12,i].AsInteger := FieldValues['nobarang'];
                Cell[13,i].AsInteger := FieldValues['nosatuan'];
                Cell[14,i].AsFloat := FieldValues['nilai'];
                Cell[15,i].AsInteger := FieldValues['noakunpersediaan'];
                Cell[16,i].AsInteger := FieldValues['noakunreturpenjualan'];
                Cell[17,i].AsInteger := FieldValues['noakunhpp'];
                Cell[18,i].AsInteger := FieldValues['nogudang'];
                Cell[19,i].AsInteger := FieldValues['nopajak'];
                Cell[20,i].AsInteger := FieldValues['tipepajak'];
                Cell[21,i].AsFloat := FieldValues['persenpajak'];
                Cell[22,i].AsFloat := FieldValues['dppbarang'];
                Cell[23,i].AsFloat := FieldValues['ppnbarang'];
                Cell[24,i].AsInteger := FieldValues['noakunpajakpenjualan'];
                Cell[25,i].AsInteger := FieldValues['tipebarang'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
        end;
      end;
      j.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      j.Show;

      ts := (j.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'PR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian5')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Retur Pembelian') then begin
      k := TFrm_ReturPembelian.Create(Self);
      with k do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'select c.*,ifnull(d.kodepembelianinvoice,'+QuotedStr('')+')as kodepembelianinvoice from ' +
                      '(select a.*,ifnull(b.namakontak,'+QuotedStr('')+')as namakontak from ' +
                      '(select * from tbl_returpembelian where noreturpembelian=:np) as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak)as c ' +
                      'left join tbl_pembelianinvoice as d on d.nopembelianinvoice=c.nopembelianinvoice';
          ParamByName('np').Value := QData.FieldValues['noreturpembelian'];
          Open;
          LID.Caption := FieldValues['noreturpembelian'];
          txtreferensi.Text := FieldValues['kodereturpembelian'];
          txtsupplier.Text := FieldValues['namakontak'];
          LSupplier.Caption := FieldValues['nokontak'];
          dtpfaktur.Date := FieldValues['tgltransaksi'];
          txtpembelian.Text := FieldValues['kodepembelianinvoice'];
          LNoPembelian.Caption := FieldValues['nopembelianinvoice'];
          LHutang.Caption := FieldValues['noakunhutang'];
          txtketerangan.Text := FieldValues['keterangan'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as kodegudang from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_returpembeliandetail where noreturpembelian=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_gudang as b on b.nogudang=a.nogudang)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak';
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
                Cell[4,i].AsFloat := FieldValues['hargaretur'];
                Cell[5,i].AsFloat := FieldValues['diskon1'];
                Cell[6,i].AsFloat := FieldValues['diskon2'];
                Cell[7,i].AsFloat := FieldValues['subtotal'];
                Cell[8,i].AsString := FieldValues['kodepajak'];
                Cell[9,i].AsString := FieldValues['kodegudang'];
                Cell[11,i].AsInteger := FieldValues['nobarang'];
                Cell[12,i].AsInteger := FieldValues['nosatuan'];
                Cell[13,i].AsFloat := FieldValues['nilai'];
                Cell[14,i].AsInteger := FieldValues['noakunpersediaan'];
                Cell[15,i].AsInteger := FieldValues['nogudang'];
                Cell[16,i].AsInteger := FieldValues['nopajak'];
                Cell[17,i].AsInteger := FieldValues['tipepajak'];
                Cell[18,i].AsFloat := FieldValues['persenpajak'];
                Cell[19,i].AsFloat := FieldValues['dppbarang'];
                Cell[20,i].AsFloat := FieldValues['ppnbarang'];
                Cell[21,i].AsInteger := FieldValues['noakunpajakpembelian'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
        end;
      end;
      k.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      k.Show;

      ts := (k.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if QData.FieldValues['tipe'] = 'TR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    Application.CreateForm(TFrm_TransferKas, Frm_TransferKas);
    Frm_TransferKas.ClearText;
    with Frm_TransferKas do begin
      ClearText;
      {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
        dtptanggal.ReadOnly := True;
      end; }
      LID.Caption := QData.FieldValues['noreferensi'];
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT a.*,b.namaakun as kaske FROM ' +
                    '(SELECT a.*,b.namaakun as kasdari FROM ' +
                    '(SELECT * FROM tbl_transferkas where noreferensi=:np)AS a ' +
                    'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokasdari)as a ' +
                    'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokaske';
        ParamByName('np').Value := LID.Caption;
        Open;
        txtketerangan.Text := FieldValues['keterangan'];
        txtdari.Text := FieldValues['kasdari'];
        LKasDari.Caption := FieldValues['nokasdari'];
        LKasTransit.Caption := FieldValues['nokastransit'];
        txtke.Text := FieldValues['kasdari'];
        LKasKe.Caption := FieldValues['nokaske'];
        LKasKeTransit.Caption := FieldValues['nokasketransit'];
        dtptanggal.Date := FieldValues['tgltransaksi'];
        txtjumlah.Value := FieldValues['nilai'];
        if FieldValues['approve'] = 1 then
          cbapprove.Checked := True
        else cbapprove.Checked := False;
        if FieldValues['cair'] = 1 then
          cbcair.Checked := True
        else cbcair.Checked := False;
        if FieldValues['iscancel'] = 1 then
          cbcancel.Checked := True
        else cbcancel.Checked := False;
        if FieldValues['approve'] = 1 then BtnSimpan.Visible := False;

        if Frm_TransferKas.ShowModal = mrok then begin
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_transferkas set tgltransaksi=:b,keterangan=:c,nokasdari=:d,nokaske=:f,nilai=:g where noreferensi=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
          ParamByName('c').Value := txtketerangan.Text;
          ParamByName('d').Value := LKasDari.Caption;
          ParamByName('f').Value := LKasKe.Caption;
          ParamByName('g').Value := txtjumlah.Value;
          ExecSQL;
          if MessageDlg('Cetak ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin

          end;
        end;
        Free;
      end;
    end;
  end else if QData.FieldValues['tipe'] = 'CA' then begin
    {if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
    end;                   }
    Application.CreateForm(TFrm_InputLoan, Frm_InputLoan);
    Frm_InputLoan.ClearText;
    Frm_InputLoan.LID.Caption := QData.FieldValues['noreferensi'];
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                  '(SELECT a.*,b.namaakun FROM ' +
                  '(SELECT * FROM tbl_loan where noloan=:np)AS a ' +
                  'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokas)AS a ' +
                  'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
      ParamByName('np').Value := Frm_InputLoan.LID.Caption;
      Open;
      Frm_InputLoan.txtreferensi.Text := QData.FieldValues['kodeloan'];
      Frm_InputLoan.txtkas.Text := FieldValues['namaakun'];
      Frm_InputLoan.LKas.Caption := FieldValues['nokas'];
      Frm_InputLoan.LKasTransir.Caption := FieldValues['nokastransit'];
      Frm_InputLoan.LAkunCA.Caption := FieldValues['noakunca'];
      Frm_InputLoan.dtptanggal.Date := FieldValues['tgltransaksi'];
      Frm_InputLoan.txtkontak.Text := FieldValues['namakontak'];
      Frm_InputLoan.LKontak.Caption := FieldValues['nokontak'];
      Frm_InputLoan.txtsebesar.Value := FieldValues['total'];
      Frm_InputLoan.txtsebesarExit(nil);
      Frm_InputLoan.txtkeperluan.Text := FieldValues['keperluan'];
      if FieldValues['approve']=1 then begin
        Frm_InputLoan.cbapprove.Checked := True;
        Frm_InputLoan.txtsebesar.ReadOnly := True;
        Frm_InputLoan.txtkontak.ReadOnly := True;
        Frm_InputLoan.txtkas.ReadOnly := True;
      end else begin
        Frm_InputLoan.cbapprove.Checked := False;
        Frm_InputLoan.txtsebesar.ReadOnly := False;
        Frm_InputLoan.txtkontak.ReadOnly := False;
        Frm_InputLoan.txtkas.ReadOnly := False;
      end;
      if FieldValues['cair']=1 then
        Frm_InputLoan.cbcair.Checked := True
      else Frm_InputLoan.cbcair.Checked := False;
      if FieldValues['iscancel']=1 then
        Frm_InputLoan.cbcancel.Checked := True
      else Frm_InputLoan.cbcancel.Checked := False;
      if Frm_InputLoan.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_loan set tgltransaksi=:c,nokontak=:d,noakunca=:e,nokas=:f,nokastransit=:g,total=:i,keperluan=:m where noloan=:a';
        ParamByName('a').Value := Frm_InputLoan.LID.Caption;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',Frm_InputLoan.dtptanggal.Date);
        ParamByName('d').Value := Frm_InputLoan.LKontak.Caption;
        ParamByName('e').Value := Frm_InputLoan.LAkunCA.Caption;
        ParamByName('f').Value := Frm_InputLoan.LKas.Caption;
        ParamByName('g').Value := Frm_InputLoan.LKasTransir.Caption;
        ParamByName('i').Value := Frm_InputLoan.txtsebesar.Value;
        ParamByName('m').Value := Frm_InputLoan.txtkeperluan.Text;
        ExecSQL;
      end;
      Free;
    end;
  end else if QData.FieldValues['tipe'] = 'SP' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan5')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('AR Invoice + Payment') then begin
      l := TFrm_PenjualanTunai.Create(Self);
      with l do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtptanggal.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT a.*,b.namaakun FROM ' +
                      '(SELECT a.*,IFNULL(b.namagudang,'+QuotedStr('Gudang Utama')+')AS namagudang FROM ' +
                      '(SELECT * FROM tbl_penjualantunai where nopenjualantunai=:np)AS a ' +
                      'LEFT JOIN tbl_gudang AS b ON b.nogudang=a.nogudang)as a ' +
                      'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokas)as a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
          Open;
          LID.Caption := FieldValues['nopenjualantunai'];
          txtreferensi.Text := FieldValues['kodepenjualantunai'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          LCustomer.Caption := FieldValues['nokontak'];
          txtcustomer.Text := FieldValues['namakontak'];
          txtkas.Text := FieldValues['namaakun'];
          Lkas.Caption := FieldValues['nokas'];
          txtgudang.Text := FieldValues['namagudang'];
          LGudang.Caption := FieldValues['nogudang'];
          txtpo.Text := FieldValues['pocustomer'];
          txtbiaya.Value := FieldValues['biayalain'];
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          LSalesman.Caption := FieldValues['nosales'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_kontak where nokontak=:aa';
          ParamByName('aa').Value := LSalesman.Caption;
          Open;
          txtsalesman.Text := FieldValues['namakontak'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penjualantunaidetail where nopenjualantunai=:np)as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_akun as b on b.noakun=a.noakunpenjualan';
          ParamByName('np').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              with dbgbarang do begin
                AddRow();
                Cell[0,i].AsString := FieldValues['kodeakun'];
                Cell[1,i].AsString := FieldValues['kodebarang'];
                Cell[2,i].AsString := FieldValues['namabarang'];
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['hargajual'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[11,i].AsInteger := FieldValues['nobarang'];
                Cell[12,i].AsInteger := FieldValues['nosatuan'];
                Cell[13,i].AsFloat := FieldValues['nilai'];
                Cell[14,i].AsInteger := FieldValues['nopajak'];
                Cell[15,i].AsInteger := FieldValues['tipepajak'];
                Cell[16,i].AsFloat := FieldValues['persenpajak'];
                Cell[17,i].AsFloat := FieldValues['dppbarang'];
                Cell[18,i].AsFloat := FieldValues['ppnbarang'];
                Cell[19,i].AsInteger := FieldValues['noakunpersediaan'];
                Cell[20,i].AsInteger := FieldValues['noakunpenjualan'];
                Cell[21,i].AsInteger := FieldValues['noakunhpp'];
                Cell[22,i].AsInteger := FieldValues['noakunpajakpenjualan'];
                Cell[23,i].AsInteger := FieldValues['tipebarang'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      l.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      l.Show;

      ts := (l.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end;
end;

procedure TFrm_BukuBesar.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_BukuBesar.JurnalVoucher1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.Q_JurnalVoucher.Close;
    DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['noreferensi'];
    DM.Q_JurnalVoucher.ParamByName('t').Value := QData.FieldValues['tipe'];
    DM.Q_JurnalVoucher.Open;
    t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
    t.Memo.Text := 'Jurnal Voucher';
    DM.Rpt_JurnalVoucher.ShowReport(True);
  end;
end;

procedure TFrm_BukuBesar.BtnVoucherClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.Q_JurnalVoucher.Close;
    DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['noreferensi'];
    DM.Q_JurnalVoucher.ParamByName('t').Value := QData.FieldValues['tipe'];
    DM.Q_JurnalVoucher.Open;
    t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
    t.Memo.Text := 'Jurnal Voucher';
    DM.Rpt_JurnalVoucher.ShowReport(True);
  end;
end;

end.
