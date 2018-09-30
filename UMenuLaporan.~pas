unit UMenuLaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxDBSet, StdCtrls, RzLstBox, frxPreview, ExtCtrls, RzPanel, RzGroupBar,
  frxDesgn, RzButton, RzRadChk, frxExportPDF, frxExportXLS, frxExportMail,
  frxDMPExport, SUISideChannel, RzTabs, DateUtils;

type
  TFrm_MenuLaporan = class(TForm)
    PnMain: TRzPanel;
    frxPreview1: TfrxPreview;
    RzPanel3: TRzPanel;
    ScrollBox1: TScrollBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzPanel4: TRzPanel;
    LJudul: TRzPanel;
    RzPanel2: TRzPanel;
    cbpreview: TRzCheckBox;
    RzBitBtn3: TRzBitBtn;
    PGFinancial: TRzPageControl;
    TabFinansial: TRzTabSheet;
    TabLedger: TRzTabSheet;
    TabCashBank: TRzTabSheet;
    PGSales: TRzPageControl;
    TabSales: TRzTabSheet;
    TabReceivable: TRzTabSheet;
    MemoPenjualan: TRzListBox;
    PGPurchase: TRzPageControl;
    TabPurchase: TRzTabSheet;
    TabPayable: TRzTabSheet;
    MemoPembelian: TRzListBox;
    PGProduct: TRzPageControl;
    TabInventory: TRzTabSheet;
    TabProductAnalys: TRzTabSheet;
    MemoAnalisa: TRzListBox;
    MemoPersediaan: TRzListBox;
    PGOther: TRzPageControl;
    TabName: TRzTabSheet;
    MemoKaryawan: TRzListBox;
    MemoPiutang: TRzListBox;
    MemoHutangUsaha: TRzListBox;
    MemoKas: TRzListBox;
    MemoKeuangan: TRzListBox;
    MemoBukuBesar: TRzListBox;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn6Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure MemoPenjualanDblClick(Sender: TObject);
    procedure MemoPiutangDblClick(Sender: TObject);
    procedure MemoPersediaanDblClick(Sender: TObject);
    procedure MemoPembelianDblClick(Sender: TObject);
    procedure MemoHutangUsahaDblClick(Sender: TObject);
    procedure MemoKasDblClick(Sender: TObject);
    procedure MemoKeuanganDblClick(Sender: TObject);
    procedure MemoBukuBesarDblClick(Sender: TObject);
    procedure MemoKaryawanDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_MenuLaporan: TFrm_MenuLaporan;

implementation

uses UDM, UMain, UFLapKas, UFLapKontak, UFLapBarang, UFLapKontak1, UFTanggal, UFilterKeuangan, UFilterAkun, UFilterGudang, UFTglGudang, UFTglBarangGudang;

{$R *.dfm}

procedure TFrm_MenuLaporan.RzBitBtn1Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Laporan2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    LJudul.Caption := '';

    PGFinancial.Visible := False;
    PGFinancial.Align := alNone;
    PGSales.Visible := False;
    PGSales.Align := alNone;
    PGPurchase.Visible := False;
    PGPurchase.Align := alNone;
    PGProduct.Visible := False;
    PGProduct.Align := alNone;
    PGOther.Visible := False;
    PGOther.Align := alNone;

    frxPreview1.Visible := False;
    Exit;
  end;
  LJudul.Caption := 'Penjualan dan Piutang Usaha';

  PGFinancial.Visible := False;
  PGFinancial.Align := alNone;
  PGSales.Visible := True;
  PGSales.Align := alClient;
  PGSales.ActivePage := TabSales;
  MemoPenjualan.Visible := True;
  PGPurchase.Visible := False;
  PGPurchase.Align := alNone;
  PGProduct.Visible := False;
  PGProduct.Align := alNone;
  PGOther.Visible := False;
  PGOther.Align := alNone;

  frxPreview1.Visible := False;
end;

procedure TFrm_MenuLaporan.RzBitBtn2Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Laporan3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    LJudul.Caption := '';

    PGFinancial.Visible := False;
    PGFinancial.Align := alNone;
    PGSales.Visible := False;
    PGSales.Align := alNone;
    PGPurchase.Visible := False;
    PGPurchase.Align := alNone;
    PGProduct.Visible := False;
    PGProduct.Align := alNone;
    PGOther.Visible := False;
    PGOther.Align := alNone;

    frxPreview1.Visible := False;
    Exit;
  end;
  LJudul.Caption := 'Purchase and Payable Report';

  PGFinancial.Visible := False;
  PGFinancial.Align := alNone;
  PGSales.Visible := False;
  PGSales.Align := alNone;
  PGPurchase.Visible := True;
  PGPurchase.Align := alClient;
  PGPurchase.ActivePage := TabPurchase;
  PGProduct.Visible := False;
  PGProduct.Align := alNone;
  PGOther.Visible := False;
  PGOther.Align := alNone;

  frxPreview1.Visible := False;
end;

procedure TFrm_MenuLaporan.RzBitBtn4Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Laporan4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    LJudul.Caption := '';

    PGFinancial.Visible := False;
    PGFinancial.Align := alNone;
    PGSales.Visible := False;
    PGSales.Align := alNone;
    PGPurchase.Visible := False;
    PGPurchase.Align := alNone;
    PGProduct.Visible := False;
    PGProduct.Align := alNone;
    PGOther.Visible := False;
    PGOther.Align := alNone;

    frxPreview1.Visible := False;
    Exit;
  end;
  LJudul.Caption := 'Product Report';

  PGFinancial.Visible := False;
  PGFinancial.Align := alNone;
  PGSales.Visible := False;
  PGSales.Align := alNone;
  PGPurchase.Visible := False;
  PGPurchase.Align := alNone;
  PGProduct.Visible := True;
  PGProduct.Align := alClient;
  PGProduct.ActivePage := TabInventory;
  PGOther.Visible := False;
  PGOther.Align := alNone;

  frxPreview1.Visible := False;
end;

procedure TFrm_MenuLaporan.RzBitBtn6Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Laporan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    LJudul.Caption := '';

    PGFinancial.Visible := False;
    PGFinancial.Align := alNone;
    PGSales.Visible := False;
    PGSales.Align := alNone;
    PGPurchase.Visible := False;
    PGPurchase.Align := alNone;
    PGProduct.Visible := False;
    PGProduct.Align := alNone;
    PGOther.Visible := False;
    PGOther.Align := alNone;

    frxPreview1.Visible := False;
    Exit;
  end;
  LJudul.Caption := 'Other Report';

  PGFinancial.Visible := False;
  PGFinancial.Align := alNone;
  PGSales.Visible := False;
  PGSales.Align := alNone;
  PGPurchase.Visible := False;
  PGPurchase.Align := alNone;
  PGProduct.Visible := False;
  PGProduct.Align := alNone;
  PGOther.Visible := True;
  PGOther.Align := alClient;
  PGOther.ActivePage := TabName;

  frxPreview1.Visible := False;
end;

procedure TFrm_MenuLaporan.RzBitBtn3Click(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Laporan1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    LJudul.Caption := '';

    PGFinancial.Visible := False;
    PGFinancial.Align := alNone;
    PGSales.Visible := False;
    PGSales.Align := alNone;
    PGPurchase.Visible := False;
    PGPurchase.Align := alNone;
    PGProduct.Visible := False;
    PGProduct.Align := alNone;
    PGOther.Visible := False;
    PGOther.Align := alNone;

    frxPreview1.Visible := False;
    Exit;
  end;
  LJudul.Caption := 'Financial Statement';

  PGFinancial.Visible := True;
  PGFinancial.Align := alClient;
  PGFinancial.ActivePage := TabFinansial;
  PGSales.Visible := False;
  PGSales.Align := alNone;
  PGPurchase.Visible := False;
  PGPurchase.Align := alNone;
  PGProduct.Visible := False;
  PGProduct.Align := alNone;
  PGOther.Visible := False;
  PGOther.Align := alNone;

  frxPreview1.Visible := False;
end;

procedure TFrm_MenuLaporan.ClearText;
begin
  PGSales.Visible := False;
  PGSales.Align := alNone;
  PGPurchase.Visible := False;
  PGPurchase.Align := alNone;
  PGFinancial.Visible := False;
  PGFinancial.Align := alNone;
  PGOther.Visible := False;
  PGOther.Align := alNone;
  PGProduct.Visible := False;
  PGProduct.Align := alNone;

  frxPreview1.Visible := False;
  LJudul.Caption := '';
end;

procedure TFrm_MenuLaporan.MemoPenjualanDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoPenjualan.ItemIndex = 0 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.QPenjualanRangkuman.Close;
        DM.QPenjualanRangkuman.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPenjualanRangkuman.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPenjualanRangkuman.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRangkuman.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRangkuman.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRangkuman.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRangkuman.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 1 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.QPenjualanRangkuman1.Close;
        DM.QPenjualanRangkuman1.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPenjualanRangkuman1.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPenjualanRangkuman1.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRangkuman1.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRangkuman1.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRangkuman1.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRangkuman1.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 2 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.QPenjualanRangkuman2.Close;
        DM.QPenjualanRangkuman2.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPenjualanRangkuman2.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPenjualanRangkuman2.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRangkuman2.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRangkuman2.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRangkuman2.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRangkuman2.ShowReport(True);
      end;
    end;

  end else if MemoPenjualan.ItemIndex = 3 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.QPenjualanRangkuman3.Close;
        DM.QPenjualanRangkuman3Retur.Close;
        DM.QPenjualanRangkuman3.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPenjualanRangkuman3.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPenjualanRangkuman3Retur.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPenjualanRangkuman3Retur.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPenjualanRangkuman3.Open;
        DM.QPenjualanRangkuman3Retur.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRangkuman3.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRangkuman3.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRangkuman3.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRangkuman3.ShowReport(True);
      end;
    end;

  end else if MemoPenjualan.ItemIndex = 4 then begin
    Application.CreateForm(TFrm_FilterKontak, Frm_FilterKontak);
    tipe := 0;
    with Frm_FilterKontak do begin
      if Frm_FilterKontak.ShowModal = mrok then begin
        DM.Q_PenjualanRincian.Close;
        DM.Q_PenjualanRincianTotal.Close;
        if LKontak.Caption = '0' then begin
          DM.Q_PenjualanRincian.SQL.Clear;
          DM.Q_PenjualanRincianTotal.SQL.Clear;
          DM.Q_PenjualanRincian.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM ' +
                                            'tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a  ' +
                                            'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                            'UNION ' +
                                            'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)AS a ' +
                                            'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                            'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                            'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tgltransaksi,a.koderef';


          DM.Q_PenjualanRincianTotal.SQL.Text :=  'select sum(total) as total from ' +
                                                  '(SELECT sum(total)as total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)as a';
        end else begin
          DM.Q_PenjualanRincian.SQL.Clear;
          DM.Q_PenjualanRincianTotal.SQL.Clear;
          DM.Q_PenjualanRincian.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM ' +
                                            'tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks and nokontak=:nk)AS a  ' +
                                            'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                            'UNION ' +
                                            'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nokontak=:nk)AS a ' +
                                            'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                            'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                            'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tgltransaksi,a.koderef';
          DM.Q_PenjualanRincian.ParamByName('nk').Value := LKontak.Caption;

          DM.Q_PenjualanRincianTotal.SQL.Text := 'select sum(total) as total from ' +
                                                  '(SELECT sum(total)as total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks and nokontak=:nk ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nokontak=:nk)as a';
          DM.Q_PenjualanRincianTotal.ParamByName('nk').Value := LKontak.Caption;
        end;
        DM.Q_PenjualanRincian.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincianTotal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincianTotal.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian.Open;
        DM.Q_PenjualanRincianTotal.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 5 then begin
    Application.CreateForm(TFTglGudang, FTglGudang);
    with FTglGudang do begin
      if FTglGudang.ShowModal = mrok then begin
        DM.Q_PenjualanRincian1.Close;
        DM.Q_PenjualanRincian1Total.Close;
        if LGudang.Caption = '0' then begin
          DM.Q_PenjualanRincian1.SQL.Clear;
          DM.Q_PenjualanRincian1.SQL.Clear;
          DM.Q_PenjualanRincian1.SQL.Text :=  'SELECT a.*,IFNULL(b.namagudang,'+QuotedStr('Gudang Utama')+')AS namagudang FROM ' +
                                              '(SELECT a.*,b.kodesatuan FROM ' +
                                              '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                              '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                              '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,b.nogudang,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                              '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                              'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                              'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                              'UNION ' +
                                              'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total,'+QuotedStr('')+' AS kodepenjualankirim,nogudang,0 AS nopenjualanorder,'+QuotedStr('')+' AS kodepenjualanorder,'+QuotedStr('')+' AS kodepenjualando FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                              'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                              'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)AS a ' +
                                              'LEFT JOIN tbl_gudang AS b ON b.nogudang=a.nogudang ORDER BY b.namagudang,a.namakontak,a.tgltransaksi,a.koderef';

          DM.Q_PenjualanRincian1Total.SQL.Text := 'select sum(total) as total from ' +
                                                  '(select sum(total)as total from ' +
                                                  '(select a.total,b.nogudang from ' +
                                                  '(SELECT nopenjualaninvoice,total,nopenjualankirim FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)as a ' +
                                                  'left join tbl_penjualankirim as b on b.nopenjualankirim=a.nopenjualankirim)as a ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)as a';

        end else begin
          DM.Q_PenjualanRincian1.SQL.Clear;
          DM.Q_PenjualanRincian1.SQL.Clear;
          DM.Q_PenjualanRincian1.SQL.Text :=  'SELECT a.*,IFNULL(b.namagudang,'+QuotedStr('Gudang Utama')+')AS namagudang FROM ' +
                                              '(SELECT a.*,b.kodesatuan FROM ' +
                                              '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                              '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                              '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,b.nogudang,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                              '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim having b.nogudang=:ng)AS a ' +
                                              'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                              'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                              'UNION ' +
                                              'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total,'+QuotedStr('')+' AS kodepenjualankirim,nogudang,0 AS nopenjualanorder,'+QuotedStr('')+' AS kodepenjualanorder,'+QuotedStr('')+' AS kodepenjualando FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nogudang=:ng)AS a ' +
                                              'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                              'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                              'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)AS a ' +
                                              'LEFT JOIN tbl_gudang AS b ON b.nogudang=a.nogudang ORDER BY b.namagudang,a.namakontak,a.tgltransaksi,a.koderef';
          DM.Q_PenjualanRincian1.ParamByName('ng').Value := LGudang.Caption;

          DM.Q_PenjualanRincian1Total.SQL.Text := 'select sum(total) as total from ' +
                                                  '(select sum(total)as total from ' +
                                                  '(select a.total,b.nogudang from ' +
                                                  '(SELECT nopenjualaninvoice,total,nopenjualankirim FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)as a ' +
                                                  'left join tbl_penjualankirim as b on b.nopenjualankirim=a.nopenjualankirim)as a where a.nogudang=:ng ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nogudang=:ng)as a';
          DM.Q_PenjualanRincian1Total.ParamByName('ng').Value := LGudang.Caption;
        end;
        DM.Q_PenjualanRincian1.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian1.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian1Total.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian1Total.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian1.Open;
        DM.Q_PenjualanRincian1Total.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian1.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian1.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian1.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian1.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 6 then begin
    Application.CreateForm(TFrm_FilterKontak, Frm_FilterKontak);
    tipe := 2;
    with Frm_FilterKontak do begin
      if Frm_FilterKontak.ShowModal = mrok then begin
        DM.Q_PenjualanRincian2.Close;
        DM.Q_PenjualanRincian2Total.Close;
        if LKontak.Caption = '0' then begin
          DM.Q_PenjualanRincian2.SQL.Clear;
          DM.Q_PenjualanRincian2.SQL.Clear;
          DM.Q_PenjualanRincian2.SQL.Text :=  'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namasales FROM ' +
                                              '(SELECT a.*,b.kodesatuan FROM ' +
                                              '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                              '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                              '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,b.nosales,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                              '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                              'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                              'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                              'UNION ' +
                                              'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total,'+QuotedStr('')+' AS kodepenjualankirim,0 AS nopenjualanorder,'+QuotedStr('')+' AS kodepenjualanorder,nosales,'+QuotedStr('')+' AS kodepenjualando FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                              'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                              'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nosales ORDER BY b.namakontak,a.namakontak,a.tgltransaksi,a.koderef';

          DM.Q_PenjualanRincian2Total.SQL.Text := 'select sum(total) as total from ' +
                                                  '(select sum(total)as total from ' +
                                                  '(select a.total,b.nosales from ' +
                                                  '(select a.total,b.nopenjualanorder from ' +
                                                  '(SELECT nopenjualaninvoice,total,nopenjualankirim FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)as a ' +
                                                  'left join tbl_penjualankirim as b on b.nopenjualankirim=a.nopenjualankirim)as a ' +
                                                  'left join tbl_penjualanorder as b on b.nopenjualanorder=a.nopenjualanorder)as a ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks)as a';

        end else begin
          DM.Q_PenjualanRincian2.SQL.Clear;
          DM.Q_PenjualanRincian2.SQL.Clear;
          DM.Q_PenjualanRincian2.SQL.Text :=  'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namasales FROM ' +
                                              '(SELECT a.*,b.kodesatuan FROM ' +
                                              '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                              '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                              '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,b.nosales,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                              '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                              '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a ' +
                                              'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                              'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder having b.nosales=:ng)AS a ' +
                                              'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref ' +
                                              'UNION ' +
                                              'SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                              '(SELECT nopenjualantunai AS noref,kodepenjualantunai AS koderef,tgltransaksi, 0 AS nopenjualankirim,nokontak,totaldpp,totalpajak AS totalppn,biayalain,total,'+QuotedStr('')+' AS kodepenjualankirim,0 AS nopenjualanorder,'+QuotedStr('')+' AS kodepenjualanorder,nosales,'+QuotedStr('')+' AS kodepenjualando FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nosales=:ng)AS a ' +
                                              'LEFT JOIN tbl_penjualantunaidetail AS b ON b.nopenjualantunai=a.noref)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                              'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                              'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)AS a ' +
                                              'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nosales ORDER BY b.namakontak,a.namakontak,a.tgltransaksi,a.koderef';
          DM.Q_PenjualanRincian2.ParamByName('ng').Value := LKontak.Caption;

          DM.Q_PenjualanRincian2Total.SQL.Text := 'select sum(total) as total from ' +
                                                  '(select sum(total)as total from ' +
                                                  '(select a.total,b.nosales from ' +
                                                  '(select a.total,b.nopenjualanorder from ' +
                                                  '(SELECT nopenjualaninvoice,total,nopenjualankirim FROM tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)as a ' +
                                                  'left join tbl_penjualankirim as b on b.nopenjualankirim=a.nopenjualankirim)as a ' +
                                                  'left join tbl_penjualanorder as b on b.nopenjualanorder=a.nopenjualanorder)as a where a.nosales=:ng ' +
                                                  'union ' +
                                                  'SELECT sum(total)as total FROM tbl_penjualantunai where tgltransaksi between :tkd and :tks and nosales=:ng)as a';
          DM.Q_PenjualanRincian2Total.ParamByName('ng').Value := LKontak.Caption;
        end;
        DM.Q_PenjualanRincian2.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian2.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian2Total.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian2Total.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian2.Open;
        DM.Q_PenjualanRincian2Total.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian2.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian2.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian2.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian2.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 7 then begin
    Application.CreateForm(TFrm_FilterKontak, Frm_FilterKontak);
    tipe := 0;
    with Frm_FilterKontak do begin
      if Frm_FilterKontak.ShowModal = mrok then begin
        DM.Q_PenjualanRincian3.Close;
        if LKontak.Caption = '0' then begin
          DM.Q_PenjualanRincian3.SQL.Clear;
          DM.Q_PenjualanRincian3.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM ' +
                                            'tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks)AS a  ' +
                                            'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref having b.subtotal=0)AS a ' +
                                            'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                            'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tgltransaksi,a.koderef';

        end else begin
          DM.Q_PenjualanRincian3.SQL.Clear;
          DM.Q_PenjualanRincian3.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualanorder,'+QuotedStr('')+')AS kodepenjualanorder,IFNULL(b.kodepenjualando,'+QuotedStr('')+')AS kodepenjualando FROM ' +
                                            '(SELECT a.*,IFNULL(b.kodepenjualankirim,'+QuotedStr('')+')AS kodepenjualankirim,IFNULL(b.nopenjualanorder,'+QuotedStr('')+')AS nopenjualanorder FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargajual,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopenjualaninvoice AS noref,kodepenjualaninvoice AS koderef,tglpenjualaninvoice AS tgltransaksi,nopenjualankirim,nokontak,totaldpp,totalppn,biayalain,total FROM ' +
                                            'tbl_penjualaninvoice where tglpenjualaninvoice between :tkd and :tks and nokontak=:nk)AS a  ' +
                                            'LEFT JOIN tbl_penjualaninvoicedetail AS b ON b.nopenjualaninvoice=a.noref having b.subtotal=0)as a ' +
                                            'LEFT JOIN tbl_penjualankirim AS b ON b.nopenjualankirim=a.nopenjualankirim)AS a ' +
                                            'LEFT JOIN tbl_penjualanorder AS b ON b.nopenjualanorder=a.nopenjualanorder)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tgltransaksi,a.koderef';
          DM.Q_PenjualanRincian3.ParamByName('nk').Value := LKontak.Caption;
        end;
        DM.Q_PenjualanRincian3.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian3.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian3.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian3.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian3.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian3.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian3.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 8 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.Q_PenjualanRincian4.Close;
        DM.Q_PenjualanRincian4.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian4.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian4.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian4.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian4.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian4.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian4.ShowReport(True);
      end;
    end;
  end else if MemoPenjualan.ItemIndex = 9 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if FTanggal.ShowModal = mrok then begin
        DM.Q_PenjualanRincian5.Close;
        DM.Q_PenjualanRincian5.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_PenjualanRincian5.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_PenjualanRincian5.Open;
        t := TfrxMemoView(DM.Rpt_PenjualanRincian5.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PenjualanRincian5.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PenjualanRincian5.Preview :=  frxPreview1;
        end;
        DM.Rpt_PenjualanRincian5.ShowReport(True);
      end;
    end;
  end;
end;

procedure TFrm_MenuLaporan.MemoPiutangDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoPiutang.ItemIndex = 0 then begin
    DM.Q_RptDaftarPiutang.Close;
    DM.Q_RptDaftarPiutang.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_DaftarPiutang.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_DaftarPiutang.Preview :=  frxPreview1;
    end;
    DM.Rpt_DaftarPiutang.ShowReport(True);
  end else if MemoPiutang.ItemIndex = 1 then begin
    Application.CreateForm(TFrm_FilterKontak1, Frm_FilterKontak1);
    tipe22 := 0;
    with Frm_FilterKontak1 do begin
      if ShowModal = mrok then begin
        if LKontak.Caption = '0' then begin
          DM.Q_RincianPiutang.Close;
          DM.Q_RincianPiutang.Open;
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_RincianPiutang.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_RincianPiutang.Preview :=  frxPreview1;
          end;
          DM.Rpt_RincianPiutang.ShowReport(True);
        end else begin
          DM.Q_RincianPiutang1.Close;
          DM.Q_RincianPiutang1.ParamByName('nk').Value := LKontak.Caption;
          DM.Q_RincianPiutang1.Open;
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_RincianPiutang1.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_RincianPiutang1.Preview :=  frxPreview1;
          end;
          DM.Rpt_RincianPiutang1.ShowReport(True);
        end;
      end;
    end;
  {end else if MemoPiutang.ItemIndex = 2 then begin
    Application.CreateForm(TFrm_FilterKontak, Frm_FilterKontak);
    tipe := 0;
    with Frm_FilterKontak do begin
      if ShowModal = mrok then begin
        if LKontak.Caption = '0' then begin
          DM.Q_KartuPiutang.Close;
          DM.Q_KartuPiutang.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_KartuPiutang.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_KartuPiutang.Open;
          t := TfrxMemoView(DM.Rpt_KartuPiutang.FindObject('txtperiode'));
          t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_KartuPiutang.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_KartuPiutang.Preview :=  frxPreview1;
          end;
          DM.Rpt_KartuPiutang.ShowReport(True);
        end else begin
          DM.Q_KartuPiutang1.Close;
          DM.Q_KartuPiutang1.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_KartuPiutang1.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_KartuPiutang1.ParamByName('nk').Value := LKontak.Caption;
          DM.Q_KartuPiutang1.Open;
          t := TfrxMemoView(DM.Rpt_KartuPiutang1.FindObject('txtperiode'));
          t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_KartuPiutang1.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_KartuPiutang1.Preview :=  frxPreview1;
          end;
          DM.Rpt_KartuPiutang1.ShowReport(True);
        end;
      end;
    end;    }
  end else if MemoPiutang.ItemIndex = 2 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.QPembayaranPiutang.Close;
        DM.QPembayaranPiutang.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPembayaranPiutang.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPembayaranPiutang.Open;
        t := TfrxMemoView(DM.Rpt_PembayaranPiutang.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PembayaranPiutang.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PembayaranPiutang.Preview :=  frxPreview1;
        end;
        DM.Rpt_PembayaranPiutang.ShowReport(True);
      end;
    end;
  end;
end;

procedure TFrm_MenuLaporan.MemoPersediaanDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoPersediaan.ItemIndex = 0 then begin
    Application.CreateForm(TFrm_FilterTglBarangGudang, Frm_FilterTglBarangGudang);
    with Frm_FilterTglBarangGudang do begin
      if ShowModal = mrok then begin
        DM.Q_KartuStokTotalAwal.Close;
        DM.Q_KartuStokTotal.Close;
        if LBarang.Caption = '0' then begin
          if LGudang.Caption = '0' then begin
            DM.Q_KartuStokTotalAwal.SQL.Clear;
            DM.Q_KartuStokTotalAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang GROUP BY nobarang';

            DM.Q_KartuStokTotal.SQL.Clear;
            DM.Q_KartuStokTotal.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,IFNULL(SUM(b.masuk),0)AS masuk,IFNULL(SUM(b.keluar),0)AS keluar FROM ' +
                                            '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1)AS a ' +
                                            'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang AND b.tgltransaksi BETWEEN :tkd AND :tks GROUP BY a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang';
          end else begin
            DM.Q_KartuStokTotalAwal.SQL.Clear;
            DM.Q_KartuStokTotalAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang and nogudang=:nogudang GROUP BY nobarang,nogudang';

            DM.Q_KartuStokTotal.SQL.Clear;
            DM.Q_KartuStokTotal.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.nogudang,IFNULL(SUM(b.masuk),0)AS masuk,IFNULL(SUM(b.keluar),0)AS keluar FROM ' +
                                            '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1)AS a ' +
                                            'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang AND b.tgltransaksi BETWEEN :tkd AND :tks and nogudang=:ng GROUP BY a.nobarang,b.nogudang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang ';
            DM.Q_KartuStokTotal.ParamByName('ng').Value := LGudang.Caption;
          end;
        end else begin
          if LGudang.Caption = '0' then begin
            DM.Q_KartuStokTotalAwal.SQL.Clear;
            DM.Q_KartuStokTotalAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang GROUP BY nobarang';

            DM.Q_KartuStokTotal.SQL.Clear;
            DM.Q_KartuStokTotal.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,IFNULL(SUM(b.masuk),0)AS masuk,IFNULL(SUM(b.keluar),0)AS keluar FROM ' +
                                            '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1 and nobarang=:nk)AS a ' +
                                            'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang AND b.tgltransaksi BETWEEN :tkd AND :tks GROUP BY a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang';
          end else begin
            DM.Q_KartuStokTotalAwal.SQL.Clear;
            DM.Q_KartuStokTotalAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang and nogudang=:nogudang GROUP BY nobarang,nogudang';

            DM.Q_KartuStokTotal.SQL.Clear;
            DM.Q_KartuStokTotal.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.nogudang,IFNULL(SUM(b.masuk),0)AS masuk,IFNULL(SUM(b.keluar),0)AS keluar FROM ' +
                                            '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1 and nobarang=:nk)AS a ' +
                                            'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang AND b.tgltransaksi BETWEEN :tkd AND :tks and nogudang=:ng GROUP BY a.nobarang,b.nogudang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang';
            DM.Q_KartuStokTotal.ParamByName('ng').Value := LGudang.Caption;
          end;                                       
          DM.Q_KartuStokTotal.ParamByName('nk').Value := LBarang.Caption;
        end;
        DM.Q_KartuStokTotalAwal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KartuStokTotal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KartuStokTotal.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_KartuStokTotalAwal.Open;
        DM.Q_KartuStokTotal.Open;
        t := TfrxMemoView(DM.Rpt_KartuStokTotal.FindObject('txtperiode'));
        if LGudang.Caption = '0' then
          t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date)
        else t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date)+', '+txtgudang.Text;
        if cbpreview.Checked = True then begin
          frxPreview1.Visible := True;
          DM.Rpt_KartuStokTotal.Preview := frxPreview1;
        end else begin
          frxPreview1.Visible := False;
          DM.Rpt_KartuStokTotal.Preview := nil;
        end;
        DM.Rpt_KartuStokTotal.ShowReport(True);
      end;
    end;
  end else if MemoPersediaan.ItemIndex = 1 then begin
    Application.CreateForm(TFrm_FilterTglBarangGudang, Frm_FilterTglBarangGudang);
    with Frm_FilterTglBarangGudang do begin
      if ShowModal = mrok then begin
        DM.QKartuStokUmum.Close;
        DM.QKartuStokUmumAwal.Close;
        if LBarang.Caption = '0' then begin
          if LGudang.Caption = '0' then begin
            DM.QKartuStokUmumAwal.SQL.Clear;
            DM.QKartuStokUmumAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang GROUP BY nobarang';

            DM.QKartuStokUmum.SQL.Clear;
            DM.QKartuStokUmum.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                          '(SELECT a.*,CASE WHEN a.kodereferensi IS NULL AND a.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenerimaanbarang FROM tbl_penerimaanbarang WHERE nopenerimaanbarang=a.noreferensi) END AS koderef FROM ' +
                                          '(SELECT a.*,b.nobuku,b.tgltransaksi,b.masuk,b.keluar,b.keterangan,b.noreferensi,b.tipe,CASE ' +
                                          'WHEN b.tipe='+QuotedStr('TO')+' THEN (SELECT kodepembelianterima FROM tbl_pembelianterima WHERE nopembelianterima=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('PR')+' THEN (SELECT kodereturpembelian FROM tbl_returpembelian WHERE noreturpembelian=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('DO')+' THEN (SELECT kodepenjualankirim FROM tbl_penjualankirim WHERE nopenjualankirim=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SR')+' THEN (SELECT kodereturpenjualan FROM tbl_returpenjualan WHERE noreturpenjualan=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenyesuaian FROM tbl_penyesuaian WHERE nopenyesuaian=noreferensi) END AS kodereferensi FROM ' +
                                          '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1)AS a ' +
                                          'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang and b.tgltransaksi BETWEEN :tkd AND :tks)AS a)as a ' +
                                          'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang,a.tgltransaksi,a.nobuku';
          end else begin
            DM.QKartuStokUmumAwal.SQL.Clear;
            DM.QKartuStokUmumAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang and nogudang=:nogudang GROUP BY nobarang';

            DM.QKartuStokUmum.SQL.Clear;
            DM.QKartuStokUmum.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                          '(SELECT a.*,CASE WHEN a.kodereferensi IS NULL AND a.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenerimaanbarang FROM tbl_penerimaanbarang WHERE nopenerimaanbarang=a.noreferensi) END AS koderef FROM ' +
                                          '(SELECT a.*,b.nobuku,b.tgltransaksi,b.masuk,b.keluar,b.keterangan,b.noreferensi,b.tipe,CASE ' +
                                          'WHEN b.tipe='+QuotedStr('TO')+' THEN (SELECT kodepembelianterima FROM tbl_pembelianterima WHERE nopembelianterima=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('PR')+' THEN (SELECT kodereturpembelian FROM tbl_returpembelian WHERE noreturpembelian=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('DO')+' THEN (SELECT kodepenjualankirim FROM tbl_penjualankirim WHERE nopenjualankirim=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SR')+' THEN (SELECT kodereturpenjualan FROM tbl_returpenjualan WHERE noreturpenjualan=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenyesuaian FROM tbl_penyesuaian WHERE nopenyesuaian=noreferensi) END AS kodereferensi FROM ' +
                                          '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1)AS a ' +
                                          'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang and b.tgltransaksi BETWEEN :tkd AND :tks and nogudang=:ng)AS a)as a ' +
                                          'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang,a.tgltransaksi,a.nobuku';
            DM.QKartuStokUmum.ParamByName('ng').Value := LGudang.Caption;
          end;
        end else begin
          if LGudang.Caption = '0' then begin
            DM.QKartuStokUmumAwal.SQL.Clear;
            DM.QKartuStokUmumAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang GROUP BY nobarang';

            DM.QKartuStokUmum.SQL.Clear;
            DM.QKartuStokUmum.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                          '(SELECT a.*,CASE WHEN a.kodereferensi IS NULL AND a.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenerimaanbarang FROM tbl_penerimaanbarang WHERE nopenerimaanbarang=a.noreferensi) END AS koderef FROM ' +
                                          '(SELECT a.*,b.nobuku,b.tgltransaksi,b.masuk,b.keluar,b.keterangan,b.noreferensi,b.tipe,CASE ' +
                                          'WHEN b.tipe='+QuotedStr('TO')+' THEN (SELECT kodepembelianterima FROM tbl_pembelianterima WHERE nopembelianterima=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('PR')+' THEN (SELECT kodereturpembelian FROM tbl_returpembelian WHERE noreturpembelian=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('DO')+' THEN (SELECT kodepenjualankirim FROM tbl_penjualankirim WHERE nopenjualankirim=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SR')+' THEN (SELECT kodereturpenjualan FROM tbl_returpenjualan WHERE noreturpenjualan=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenyesuaian FROM tbl_penyesuaian WHERE nopenyesuaian=noreferensi) END AS kodereferensi FROM ' +
                                          '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1 and nobarang=:nk)AS a ' +
                                          'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang and b.tgltransaksi BETWEEN :tkd AND :tks)AS a)as a ' +
                                          'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang,a.tgltransaksi,a.nobuku';
          end else begin
            DM.QKartuStokUmumAwal.SQL.Clear;
            DM.QKartuStokUmumAwal.SQL.Text := 'SELECT IFNULL(SUM(masuk-keluar),0)AS saldo FROM tbl_bukubesarbarang WHERE tgltransaksi<:tkd AND nobarang=:nobarang and nogudang=:nogudang GROUP BY nobarang';

            DM.QKartuStokUmum.SQL.Clear;
            DM.QKartuStokUmum.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                          '(SELECT a.*,CASE WHEN a.kodereferensi IS NULL AND a.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenerimaanbarang FROM tbl_penerimaanbarang WHERE nopenerimaanbarang=a.noreferensi) END AS koderef FROM ' +
                                          '(SELECT a.*,b.nobuku,b.tgltransaksi,b.masuk,b.keluar,b.keterangan,b.noreferensi,b.tipe,CASE ' +
                                          'WHEN b.tipe='+QuotedStr('TO')+' THEN (SELECT kodepembelianterima FROM tbl_pembelianterima WHERE nopembelianterima=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('PR')+' THEN (SELECT kodereturpembelian FROM tbl_returpembelian WHERE noreturpembelian=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('DO')+' THEN (SELECT kodepenjualankirim FROM tbl_penjualankirim WHERE nopenjualankirim=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SR')+' THEN (SELECT kodereturpenjualan FROM tbl_returpenjualan WHERE noreturpenjualan=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=noreferensi) ' +
                                          'WHEN b.tipe='+QuotedStr('IJ')+' THEN (SELECT kodepenyesuaian FROM tbl_penyesuaian WHERE nopenyesuaian=noreferensi) END AS kodereferensi FROM ' +
                                          '(SELECT nobarang,kodebarang,namabarang,nosatuan FROM tbl_barang WHERE tipebarang=0 AND aktif=1 and nobarang=:nk)AS a ' +
                                          'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang and b.tgltransaksi BETWEEN :tkd AND :tks and nogudang=:ng)AS a)as a ' +
                                          'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namabarang,a.tgltransaksi,a.nobuku';
            DM.QKartuStokUmum.ParamByName('ng').Value := LGudang.Caption;
          end;
          DM.QKartuStokUmum.ParamByName('nk').Value := LBarang.Caption;
        end;
        DM.QKartuStokUmumAwal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QKartuStokUmum.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QKartuStokUmum.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QKartuStokUmum.Open;
        DM.QKartuStokUmumAwal.Open;
        t := TfrxMemoView(DM.Rpt_KartuStokUmum.FindObject('txtperiode'));
        if LGudang.Caption = '0' then
          t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date)
        else t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date)+', '+txtgudang.Text;
        if cbpreview.Checked = True then begin
          frxPreview1.Visible := True;
          DM.Rpt_KartuStokUmum.Preview := frxPreview1;
        end else begin
          frxPreview1.Visible := False;
          DM.Rpt_KartuStokUmum.Preview := nil;
        end;
        DM.Rpt_KartuStokUmum.ShowReport(True);
      end;
    end;
  end else if MemoPersediaan.ItemIndex = 2 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.Q_KartuStokBarangAwal.Close;
        DM.Q_KartuStokBarang.Close;
        DM.Q_KartuStokBarangAwal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KartuStokBarang.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KartuStokBarang.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_KartuStokBarang.Open;
        DM.Q_KartuStokBarangAwal.Open;
        t := TfrxMemoView(DM.Rpt_KartuStokBarang.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_KartuStokBarang.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_KartuStokBarang.Preview :=  frxPreview1;
        end;
        DM.Rpt_KartuStokBarang.ShowReport(True);
      end;
    end;
  {end else if MemoPersediaan.ItemIndex = 3 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.Q_ItemDijual.Close;
        DM.Q_ItemDijual.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_ItemDijual.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_ItemDijual.Open;
        t := TfrxMemoView(DM.Rpt_ItemDijual.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_ItemDijual.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_ItemDijual.Preview :=  frxPreview1;
        end;
        DM.Rpt_ItemDijual.ShowReport(True);
      end;
    end;
  end else if MemoPersediaan.ItemIndex = 4 then begin
    Application.CreateForm(TFrm_FilterGudang, Frm_FilterGudang);
    DM.Q_DaftarStok.Close;
    if Frm_FilterGudang.LGudang.Caption = '0' then begin

    end else begin

    end;
    DM.Q_DaftarStok.Open;
    if cbpreview.Checked = True then begin
      frxPreview1.Visible := True;
      DM.Rpt_DaftarStok.Preview := frxPreview1;
    end else begin
      frxPreview1.Visible := False;
      DM.Rpt_DaftarStok.Preview := nil;
    end;
    DM.Rpt_DaftarStok.ShowReport(True);
  end else if MemoPersediaan.ItemIndex = 5 then begin
    DM.Q_DaftarStok.Close;
    DM.Q_DaftarStok.Open;
    if cbpreview.Checked = True then begin
      frxPreview1.Visible := True;
      DM.Rpt_HargaJualBarang.Preview := frxPreview1;
    end else begin
      frxPreview1.Visible := False;
      DM.Rpt_HargaJualBarang.Preview := nil;
    end;
    DM.Rpt_HargaJualBarang.ShowReport(True);    }
  end;
end;

procedure TFrm_MenuLaporan.MemoPembelianDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoPembelian.ItemIndex = 0 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.QPembelianRangkuman.Close;
        DM.QPembelianRangkuman.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QPembelianRangkuman.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QPembelianRangkuman.Open;
        t := TfrxMemoView(DM.Rpt_PembelianRangkuman.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PembelianRangkuman.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PembelianRangkuman.Preview :=  frxPreview1;
        end;
        DM.Rpt_PembelianRangkuman.ShowReport(True);
      end;
    end;
  end else if MemoPembelian.ItemIndex = 1 then begin
    Application.CreateForm(TFrm_FilterKontak, Frm_FilterKontak);
    tipe := 1;
    with Frm_FilterKontak do begin
      if Frm_FilterKontak.ShowModal = mrok then begin
        if LKontak.Caption = '0' then begin
          DM.Q_PembelianRincian.Close;
          DM.Q_PembelianRincian.SQL.Clear;
          DM.Q_PembelianRincian.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargabeli,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvoice,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_pembelianinvoice where tglpembelianinvoice between :tkd and :tks)AS a ' +
                                            'LEFT JOIN tbl_pembelianinvoicedetail AS b ON b.nopembelianinvoice=a.nopembelianinvoice)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tglpembelianinvoice,a.kodepembelianinvoice';
          DM.Q_PembelianRincian.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_PembelianRincian.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_PembelianRincian.Open;

          DM.Q_PembelianRincianTotal.Close;
          DM.Q_PembelianRincianTotal.SQL.Clear;
          DM.Q_PembelianRincianTotal.SQL.Text := 'SELECT sum(total)as total FROM tbl_pembelianinvoice where tglpembelianinvoice between :tkd and :tks';
          DM.Q_PembelianRincianTotal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_PembelianRincianTotal.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_PembelianRincianTotal.Open;
        end else begin
          DM.Q_PembelianRincian.Close;
          DM.Q_PembelianRincian.SQL.Clear;
          DM.Q_PembelianRincian.SQL.Text := 'SELECT a.*,b.kodesatuan FROM ' +
                                            '(SELECT a.*,b.kodebarang,b.namabarang FROM ' +
                                            '(SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                                            '(SELECT a.*,b.nobarang,b.qty,b.nosatuan,b.hargabeli,b.diskon1,b.diskon2,b.subtotal FROM ' +
                                            '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvoice,nokontak,totaldpp,totalppn,biayalain,total FROM tbl_pembelianinvoice where tglpembelianinvoice between :tkd and :tks and nokontak=:nk)AS a ' +
                                            'LEFT JOIN tbl_pembelianinvoicedetail AS b ON b.nopembelianinvoice=a.nopembelianinvoice)AS a ' +
                                            'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak)AS a ' +
                                            'LEFT JOIN tbl_barang AS b ON b.nobarang=a.nobarang)AS a ' +
                                            'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ORDER BY a.namakontak,a.tglpembelianinvoice,a.kodepembelianinvoice';
          DM.Q_PembelianRincian.ParamByName('nk').Value := LKontak.Caption;
          DM.Q_PembelianRincian.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_PembelianRincian.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_PembelianRincian.Open;

          DM.Q_PembelianRincianTotal.Close;
          DM.Q_PembelianRincianTotal.SQL.Clear;
          DM.Q_PembelianRincianTotal.SQL.Text := 'SELECT sum(total)as total FROM tbl_pembelianinvoice where tglpembelianinvoice between :tkd and :tks and nokontak=:nk';
          DM.Q_PembelianRincianTotal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.Q_PembelianRincianTotal.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.Q_PembelianRincianTotal.ParamByName('nk').Value := LKontak.Caption;
          DM.Q_PembelianRincianTotal.Open;
        end;
        t := TfrxMemoView(DM.Rpt_PembelianRincian.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_PembelianRincian.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_PembelianRincian.Preview :=  frxPreview1;
        end;
        DM.Rpt_PembelianRincian.ShowReport(True);
      end;
    end;
  end else if MemoPembelian.ItemIndex = 2 then begin
    {Application.CreateForm(TFrm_FilterPembelian, Frm_FilterPembelian);
    with Frm_FilterPembelian do begin
      if ShowModal = mrok then begin
        if LSupplier.Caption = '0' then begin
          DM.QReturPembelianRangkuman.Close;
          DM.QReturPembelianRangkuman.SQL.Clear;
          DM.QReturPembelianRangkuman.SQL.Text :=  'select c.*,d.namakontak from ' +
                                                '(select a.*,sum(b.subtotal)as subtotal from ' +
                                                '(select noreturpembelian,nokontak,tgltransaksi,posting,total ' +
                                                'from tbl_returpembelian where tgltransaksi between :tkd and :tks)as a ' +
                                                'left join tbl_returpembeliandetil as b on b.noreturpembelian=a.noreturpembelian group by a.noreturpembelian)as c ' +
                                                'left join tbl_kontak as d on d.nokontak=c.nokontak order by c.tgltransaksi';
          DM.QReturPembelianRangkuman.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QReturPembelianRangkuman.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        end else begin
          DM.QReturPembelianRangkuman.Close;
          DM.QReturPembelianRangkuman.SQL.Clear;
          DM.QReturPembelianRangkuman.SQL.Text :=  'select c.*,d.namakontak from ' +
                                                '(select a.*,sum(b.subtotal)as subtotal from ' +
                                                '(select noreturpembelian,nokontak,tgltransaksi,posting,total ' +
                                                'from tbl_returpembelian where tgltransaksi between :tkd and :tks and nokontak=:nk)as a ' +
                                                'left join tbl_returpembeliandetil as b on b.noreturpembelian=a.noreturpembelian group by a.noreturpembelian)as c ' +
                                                'left join tbl_kontak as d on d.nokontak=c.nokontak order by c.tgltransaksi';
          DM.QReturPembelianRangkuman.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QReturPembelianRangkuman.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.QReturPembelianRangkuman.ParamByName('nk').Value := LSupplier.Caption;
        end;
        DM.QPembelianRangkuman.Open;
        t := TfrxMemoView(DM.Rpt_ReturPembelianRangkuman.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = True then
          DM.Rpt_ReturPembelianRangkuman.Preview := frxPreview1
        else DM.Rpt_ReturPembelianRangkuman.Preview := nil;
        DM.Rpt_ReturPembelianRangkuman .ShowReport(True);
      end;
    end;  }
  end else if MemoPembelian.ItemIndex = 3 then begin
    {Application.CreateForm(TFrm_FilterPembelian, Frm_FilterPembelian);
    with Frm_FilterPembelian do begin
      if ShowModal = mrok then begin
        if LSupplier.Caption = '0' then begin
          DM.QReturPembelianRincian.Close;
          DM.QReturPembelianRincian.SQL.Clear;
          DM.QReturPembelianRincian.SQL.Text :=  'select g.*,h.kodesatuan from ' +
                                              '(select e.*,f.namakontak,f.kodekontak from ' +
                                              '(select c.*,d.namabarang,d.kodebarang,d.nosatuan from ' +
                                              '(select a.*,b.nobarang,b.qty,b.hargaretur,b.subtotal from ' +
                                              '(select noreturpembelian,nokontak,tgltransaksi,keterangan,posting,total,namauser from tbl_returpembelian where tgltransaksi between :tkd and :tks)as a ' +
                                              'left join tbl_returpembeliandetil as b on b.noreturpembelian=a.noreturpembelian)as c ' +
                                              'left join tbl_barang as d on d.nobarang=c.nobarang)as e ' +
                                              'left join tbl_kontak as f on f.nokontak=e.nokontak)as g ' +
                                              'left join tbl_satuan as h on h.nosatuan=g.nosatuan order by g.tgltransaksi,g.noreturpembelian';
          DM.QReturPembelianRincian.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QReturPembelianRincian.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        end else begin
          DM.QReturPembelianRincian.Close;
          DM.QReturPembelianRincian.SQL.Clear;
          DM.QReturPembelianRincian.SQL.Text :=  'select g.*,h.kodesatuan from ' +
                                              '(select e.*,f.namakontak,f.kodekontak from ' +
                                              '(select c.*,d.namabarang,d.kodebarang,d.nosatuan from ' +
                                              '(select a.*,b.nobarang,b.qty,b.hargaretur,b.subtotal from ' +
                                              '(select noreturpembelian,nokontak,tgltransaksi,keterangan,posting,total,namauser from tbl_returpembelian where tgltransaksi between :tkd and :tks and nokontak=:nk)as a ' +
                                              'left join tbl_returpembeliandetil as b on b.noreturpembelian=a.noreturpembelian)as c ' +
                                              'left join tbl_barang as d on d.nobarang=c.nobarang)as e ' +
                                              'left join tbl_kontak as f on f.nokontak=e.nokontak)as g ' +
                                              'left join tbl_satuan as h on h.nosatuan=g.nosatuan order by g.tgltransaksi,g.noreturpembelian';
          DM.QReturPembelianRincian.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QReturPembelianRincian.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.QReturPembelianRincian.ParamByName('nk').Value := LSupplier.Caption;
        end;
        DM.QReturPembelianRincian.Open;
        t := TfrxMemoView(DM.Rpt_ReturPembelianRincian.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = True then
          DM.Rpt_ReturPembelianRincian.Preview := frxPreview1
        else DM.Rpt_ReturPembelianRincian.Preview := nil;
        DM.Rpt_ReturPembelianRincian .ShowReport(True);
      end;
    end;      }
  end;
end;

procedure TFrm_MenuLaporan.MemoHutangUsahaDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoHutangUsaha.ItemIndex = 0 then begin
    DM.QRangkumanHutang.Close;
    DM.QRangkumanHutang.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_RangkumanHutang.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_RangkumanHutang.Preview :=  frxPreview1;
    end;
    DM.Rpt_RangkumanHutang.ShowReport(True);
  end else if MemoHutangUsaha.ItemIndex = 1 then begin
    Application.CreateForm(TFrm_FilterKontak1, Frm_FilterKontak1);
    tipe22 := 1;
    with Frm_FilterKontak1 do begin
      if ShowModal = mrok then begin
        if LKontak.Caption = '0' then begin
          DM.QRincianHutang.Close;
          DM.QRincianHutang.Open;
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_RincianHutang.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_RincianHutang.Preview :=  frxPreview1;
          end;
          DM.Rpt_RincianHutang.ShowReport(True);
        end else begin
          DM.QRincianHutang1.Close;
          DM.QRincianHutang1.ParamByName('nk').Value := LKontak.Caption;
          DM.QRincianHutang1.Open;
          if cbpreview.Checked = False then begin
            frxPreview1.Visible := False;
            DM.Rpt_RincianHutang1.Preview :=  nil;
          end else begin
            frxPreview1.Visible := True;
            DM.Rpt_RincianHutang1.Preview :=  frxPreview1;
          end;
          DM.Rpt_RincianHutang1.ShowReport(True);
        end;
      end;
    end;
  end;
end;

procedure TFrm_MenuLaporan.MemoKasDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoKas.ItemIndex = 1 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.Q_KasMasuk.Close;
        DM.Q_KasMasuk.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KasMasuk.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_KasMasuk.Open;
        t := TfrxMemoView(DM.Rpt_KasMasuk.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_KasMasuk.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_KasMasuk.Preview :=  frxPreview1;
        end;
        DM.Rpt_KasMasuk.ShowReport(True);
      end;
    end;
  end else if MemoKas.ItemIndex = 2 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.Q_KasKeluar.Close;
        DM.Q_KasKeluar.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.Q_KasKeluar.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.Q_KasKeluar.Open;
        t := TfrxMemoView(DM.Rpt_KasKeluar.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_KasKeluar.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_KasKeluar.Preview :=  frxPreview1;
        end;
        DM.Rpt_KasKeluar.ShowReport(True);
      end;
    end;
  end else if MemoKas.ItemIndex = 0 then begin
    Application.CreateForm(TFrm_FilterAkun, Frm_FilterAkun);
    with Frm_FilterAkun do begin
      if ShowModal = mrok then begin
        DM.QKasAwal.Close;
        DM.QKasAwal.ParamByName('tk').Value := DM.GetNoPeriode(StrToInt(FormatDateTime('mm',dtpdari.Date)),FormatDateTime('yyyy',dtpdari.Date));
        DM.QKasAwal.ParamByName('tkd1').Value := VarToStr(YearOf(dtpdari.Date))+'-'+VarToStr(MonthOf(dtpdari.Date))+'-01';
        DM.QKasAwal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        if Frm_FilterAkun.LAkun.Caption = '0' then begin
          DM.QKas.Close;
          DM.QKas.SQL.Clear;
          DM.QKas.SQL.Text := 'SELECT a.*,b.nobuku,b.tgltransaksi,b.noreferensi,b.tipe,b.keterangan,debit,kredit,CASE ' +
                              'WHEN tipe='+QuotedStr('CD')+' THEN (SELECT kodepembayaranhutang FROM tbl_pembayaranhutang WHERE nopembayaranhutang=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CR')+' THEN (SELECT kodepembayaranpiutang FROM tbl_pembayaranpiutang WHERE nopembayaranpiutang=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CO')+' THEN (SELECT kodepengeluaran FROM tbl_pengeluaranlain WHERE nopengeluaran=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CI')+' THEN (SELECT kodepenerimaan FROM tbl_penerimaanlain WHERE nopenerimaan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('TR')+' THEN (SELECT '+QuotedStr('TRANS')+' AS kodetr FROM tbl_transferkas WHERE noreferensi=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('DC')+' THEN (SELECT kodepencairan FROM tbl_pencairaindeposit WHERE nopencairan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CA')+' THEN (SELECT kodeloan FROM tbl_loan WHERE noloan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('AC')+' THEN (SELECT '+QuotedStr('')+' AS kodeac FROM tbl_pembayaranloan WHERE nopembayaranloan=b.noreferensi) ' +
                              'END AS kodereferensi FROM ' +
                              '(SELECT noakun,namaakun FROM tbl_akun WHERE aktif=1 AND kas=1)AS a ' +
                              'LEFT JOIN tbl_bukubesarakun AS b ON b.noakun=a.noakun AND b.tgltransaksi BETWEEN :tkd AND :tks ORDER BY a.namaakun,b.tgltransaksi,b.nobuku';
          DM.QKas.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QKas.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        end else begin
          DM.QKas.Close;
          DM.QKas.SQL.Clear;
          DM.QKas.SQL.Text := 'SELECT a.*,b.nobuku,b.tgltransaksi,b.noreferensi,b.tipe,b.keterangan,debit,kredit,CASE ' +
                              'WHEN tipe='+QuotedStr('CD')+' THEN (SELECT kodepembayaranhutang FROM tbl_pembayaranhutang WHERE nopembayaranhutang=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CR')+' THEN (SELECT kodepembayaranpiutang FROM tbl_pembayaranpiutang WHERE nopembayaranpiutang=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('SP')+' THEN (SELECT kodepenjualantunai FROM tbl_penjualantunai WHERE nopenjualantunai=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CO')+' THEN (SELECT kodepengeluaran FROM tbl_pengeluaranlain WHERE nopengeluaran=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CI')+' THEN (SELECT kodepenerimaan FROM tbl_penerimaanlain WHERE nopenerimaan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('TR')+' THEN (SELECT '+QuotedStr('TRANS')+' AS kodetr FROM tbl_transferkas WHERE noreferensi=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('DC')+' THEN (SELECT kodepencairan FROM tbl_pencairaindeposit WHERE nopencairan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('CA')+' THEN (SELECT kodeloan FROM tbl_loan WHERE noloan=b.noreferensi) ' +
                              'WHEN tipe='+QuotedStr('AC')+' THEN (SELECT '+QuotedStr('')+' AS kodeac FROM tbl_pembayaranloan WHERE nopembayaranloan=b.noreferensi) ' +
                              'END AS kodereferensi FROM ' +
                              '(SELECT noakun,namaakun FROM tbl_akun WHERE aktif=1 AND kas=1 and noakun=:nb)AS a ' +
                              'LEFT JOIN tbl_bukubesarakun AS b ON b.noakun=a.noakun AND b.tgltransaksi BETWEEN :tkd AND :tks ORDER BY a.namaakun,b.tgltransaksi,b.nobuku';
          DM.QKas.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QKas.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
          DM.QKas.ParamByName('nb').Value := LAkun.Caption;
        end;             
        DM.QKasAwal.Open;
        DM.QKas.Open;
        t := TfrxMemoView(DM.Rpt_BukuKas.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_BukuKas.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_BukuKas.Preview :=  frxPreview1;
        end;
        DM.Rpt_BukuKas.ShowReport(True);
      end;
    end;
  end;
end;

procedure TFrm_MenuLaporan.MemoKeuanganDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoKeuangan.ItemIndex = 0 then begin
    Application.CreateForm(TFrm_FilterKeuangan, Frm_FilterKeuangan);
    with Frm_FilterKeuangan do begin
      ClearText;
      if ShowModal = mrok then begin
        DM.QLabaRugi4.Close;
        DM.QLabaRugi4.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi4.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi4.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi4.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi4.Open;
        DM.QLabaRugi5.Close;
        DM.QLabaRugi5.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi5.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi5.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi5.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi5.Open;
        DM.QLabaRugi6.Close;
        DM.QLabaRugi6.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi6.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi6.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi6.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi6.Open;
        DM.QLabaRugi7.Close;
        DM.QLabaRugi7.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi7.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi7.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi7.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi7.Open;
        DM.QLabaRugi8.Close;
        DM.QLabaRugi8.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi8.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi8.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi8.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi8.Open;
        DM.QLabaRugi9.Close;
        DM.QLabaRugi9.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
        DM.QLabaRugi9.ParamByName('tkd1').Value := cbtahun1.Text;
        DM.QLabaRugi9.ParamByName('tks').Value := cbbulanhingga.ItemIndex+1;
        DM.QLabaRugi9.ParamByName('tks1').Value := cbtahunhingga.Text;
        DM.QLabaRugi9.Open;
        t := TfrxMemoView(DM.Rpt_LabaRugi.FindObject('txtperiode'));
        if cbbulandari.Text+' '+cbtahun1.Text = cbbulanhingga.Text+' '+cbtahunhingga.Text then
          t.Memo.Text := cbbulandari.Text+' '+cbtahun1.Text
        else
          t.Memo.Text := cbbulandari.Text+' '+cbtahun1.Text+' - ' +cbbulanhingga.Text+' '+cbtahunhingga.Text;
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_LabaRugi.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_LabaRugi.Preview :=  frxPreview1;
        end;
        DM.Rpt_LabaRugi.ShowReport(True);
      end;
    end;
  end else if MemoKeuangan.ItemIndex = 2 then begin
    Application.CreateForm(TFrm_FilterKeuangan, Frm_FilterKeuangan);
    with Frm_FilterKeuangan do begin
      ClearText;
      cbbulanhingga.Enabled := False;
      cbtahunhingga.Enabled := False;
      if ShowModal = mrok then begin
        with TZQuery.Create(Self)do begin
          Connection := DM.Con;
          Close;
          SQL.Text := 'select * from tbl_periode where bulan=:b and tahun=:t';
          ParamByName('b').Value := cbbulandari.ItemIndex+1;
          ParamByName('t').Value := cbtahun1.Text;
          Open;
          if not IsEmpty then begin
            DM.QNeracaSaldo.Close;
            DM.QNeracaSaldo.ParamByName('np').Value := FieldValues['noperiode'];
            DM.QNeracaSaldo.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
            DM.QNeracaSaldo.ParamByName('tks').Value := cbtahun1.Text;
            DM.QNeracaSaldo.Open;
            t := TfrxMemoView(DM.Rpt_NeracaSaldo.FindObject('txtperiode'));
            t.Memo.Text := cbbulandari.Text+' '+cbtahun1.Text;
            if cbpreview.Checked = False then begin
              frxPreview1.Visible := False;
              DM.Rpt_NeracaSaldo.Preview :=  nil;
            end else begin
              frxPreview1.Visible := True;
              DM.Rpt_NeracaSaldo.Preview :=  frxPreview1;
            end;
            DM.Rpt_NeracaSaldo.ShowReport(True);
          end else begin
            MessageDlg('Data tidak tersedia',mtError,[mbOK],0);
          end;
          Free;
        end;
      end;
    end;
  end else if MemoKeuangan.ItemIndex = 1 then begin
    Application.CreateForm(TFrm_FilterKeuangan, Frm_FilterKeuangan);
    with Frm_FilterKeuangan do begin
      ClearText;
      cbbulanhingga.Enabled := False;
      cbtahunhingga.Enabled := False;
      if ShowModal = mrok then begin
        with TZQuery.Create(Self)do begin
          Connection := DM.Con;
          Close;
          SQL.Text := 'select * from tbl_periode where bulan=:b and tahun=:t';
          ParamByName('b').Value := cbbulandari.ItemIndex+1;
          ParamByName('t').Value := cbtahun1.Text;
          Open;
          if not IsEmpty then begin
            DM.QNeracaStandart1.Close;
            DM.QNeracaStandart1.ParamByName('np').Value := FieldValues['noperiode'];
            DM.QNeracaStandart1.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
            DM.QNeracaStandart1.ParamByName('tks').Value := cbtahun1.Text;
            DM.QNeracaStandart1.Open;
            DM.QNeracaStandart2.Close;
            DM.QNeracaStandart2.ParamByName('np').Value := FieldValues['noperiode'];
            DM.QNeracaStandart2.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
            DM.QNeracaStandart2.ParamByName('tks').Value := cbtahun1.Text;
            DM.QNeracaStandart2.Open;
            DM.QNeracaStandart3.Close;
            DM.QNeracaStandart3.ParamByName('np').Value := FieldValues['noperiode'];
            DM.QNeracaStandart3.ParamByName('tkd').Value := cbbulandari.ItemIndex+1;
            DM.QNeracaStandart3.ParamByName('tks').Value := cbtahun1.Text;
            DM.QNeracaStandart3.Open;
            t := TfrxMemoView(DM.Rpt_NeracaStandart.FindObject('txtperiode'));
            t.Memo.Text := cbbulandari.Text+' '+cbtahun1.Text;
            if cbpreview.Checked = False then begin
              frxPreview1.Visible := False;
              DM.Rpt_NeracaStandart.Preview :=  nil;
            end else begin
              frxPreview1.Visible := True;
              DM.Rpt_NeracaStandart.Preview :=  frxPreview1;
            end;
            DM.Rpt_NeracaStandart.ShowReport(True);
          end else begin
            MessageDlg('Data tidak tersedia',mtError,[mbOK],0);
          end;
          Free;
        end;
      end;
    end;
  end else if MemoKeuangan.ItemIndex = 3 then begin
    Application.CreateForm(TFrm_FilterTglAkun, Frm_FilterTglAkun);
    with Frm_FilterTglAkun do begin
      if ShowModal = mrok then begin
        DM.QBukuBesarAwal.Close;
        DM.QBukuBesarStandart.Close;
        DM.QBukuBesarAwal.ParamByName('tk').Value := DM.GetNoPeriode(StrToInt(FormatDateTime('mm',dtpdari.Date)),FormatDateTime('yyyy',dtpdari.Date));
        DM.QBukuBesarAwal.ParamByName('tkd1').Value := VarToStr(YearOf(dtpdari.Date))+'-'+VarToStr(MonthOf(dtpdari.Date))+'-01';
        DM.QBukuBesarAwal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);    
        if LAkun.Caption = '0' then begin
          DM.QBukuBesarStandart.SQL.Clear;
          DM.QBukuBesarStandart.SQL.Text := 'select c.*,d.kodeakun,d.namaakun from ' +
                                            '(select noakun,tgltransaksi,tipe,noreferensi,keterangan,debit,kredit from tbl_bukubesarakun where tgltransaksi between :tkd and :tks)as c ' +
                                            'left join tbl_akun as d on d.noakun=c.noakun  order by d.kodeakun,c.tgltransaksi';
          DM.QBukuBesarStandart.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QBukuBesarStandart.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        end else begin
          DM.QBukuBesarStandart.SQL.Clear;
          DM.QBukuBesarStandart.SQL.Text := 'select c.*,d.kodeakun,d.namaakun from ' +
                                            '(select noakun,tgltransaksi,tipe,noreferensi,keterangan,debit,kredit from tbl_bukubesarakun where noakun=:na and tgltransaksi between :tkd and :tks)as c ' +
                                            'left join tbl_akun as d on d.noakun=c.noakun  order by d.kodeakun,c.tgltransaksi';
          DM.QBukuBesarStandart.ParamByName('na').Value := LAkun.Caption;
          DM.QBukuBesarStandart.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
          DM.QBukuBesarStandart.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        end;
        DM.QBukuBesarAwal.Open;
        DM.QBukuBesarStandart.Open;
        t := TfrxMemoView(DM.Rpt_BukuBesarStandart.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_BukuBesarStandart.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_BukuBesarStandart.Preview :=  frxPreview1;
        end;
        DM.Rpt_BukuBesarStandart.ShowReport(True);
      end;
    end;
  end;
end;

procedure TFrm_MenuLaporan.MemoBukuBesarDblClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if MemoBukuBesar.ItemIndex = 0 then begin
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_DaftarRekening.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_DaftarRekening.Preview :=  frxPreview1;
    end;
    DM.Rpt_DaftarRekening.ShowReport(True);
  end else if MemoBukuBesar.ItemIndex = 1 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.QDaftarJurnal.Close;
        DM.QDaftarJurnal.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QDaftarJurnal.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QDaftarJurnal.Open;
        t := TfrxMemoView(DM.Rpt_DaftarJurnal.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_DaftarJurnal.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_DaftarJurnal.Preview :=  frxPreview1;
        end;
        DM.Rpt_DaftarJurnal.ShowReport(True);
      end;
    end;
  end else if MemoBukuBesar.ItemIndex = 2 then begin
    Application.CreateForm(TFTanggal, FTanggal);
    with FTanggal do begin
      if ShowModal = mrok then begin
        DM.QJurnalUmum.Close;
        DM.QJurnalUmum.ParamByName('tkd').Value := FormatDateTime('yyyy-mm-dd',dtpdari.Date);
        DM.QJurnalUmum.ParamByName('tks').Value := FormatDateTime('yyyy-mm-dd',dtpsampai.Date);
        DM.QJurnalUmum.Open;
        t := TfrxMemoView(DM.Rpt_JurnalUmum.FindObject('txtperiode'));
        t.Memo.Text := FormatDateTime('dd MMMM yyyy',dtpdari.Date)+' - ' +FormatDateTime('dd MMMM yyyy',dtpsampai.Date);
        if cbpreview.Checked = False then begin
          frxPreview1.Visible := False;
          DM.Rpt_JurnalUmum.Preview :=  nil;
        end else begin
          frxPreview1.Visible := True;
          DM.Rpt_JurnalUmum.Preview :=  frxPreview1;
        end;
        DM.Rpt_JurnalUmum.ShowReport(True);
      end;
    end;
  end
end;

procedure TFrm_MenuLaporan.MemoKaryawanDblClick(Sender: TObject);
begin
  if MemoKaryawan.ItemIndex = 0 then begin
    DM.QCustomer.Close;
    DM.QCustomer.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_CustomerLengkap.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_CustomerLengkap.Preview :=  frxPreview1;
    end;
    DM.Rpt_CustomerLengkap.ShowReport(True);
  end else if MemoKaryawan.ItemIndex = 1 then begin
    DM.QCustomer.Close;
    DM.QCustomer.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_CustomerSederhana.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_CustomerSederhana.Preview :=  frxPreview1;
    end;
    DM.Rpt_CustomerSederhana.ShowReport(True);
  end else if MemoKaryawan.ItemIndex = 2 then begin
    DM.QSupplier.Close;
    DM.QSupplier.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_SupplierLengkap.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_SupplierLengkap.Preview :=  frxPreview1;
    end;
    DM.Rpt_SupplierLengkap.ShowReport(True);
  end else if MemoKaryawan.ItemIndex = 3 then begin
    DM.QSupplier.Close;
    DM.QSupplier.Open;
    if cbpreview.Checked = False then begin
      frxPreview1.Visible := False;
      DM.Rpt_SupplierSederhana.Preview :=  nil;
    end else begin
      frxPreview1.Visible := True;
      DM.Rpt_SupplierSederhana.Preview :=  frxPreview1;
    end;
    DM.Rpt_SupplierSederhana.ShowReport(True);
  end;
end;

end.
