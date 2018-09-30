unit UDaftarPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, frxClass, frxDBSet, cxPC, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox, SUISideChannel, Menus;

type
  TFrm_DaftarPembelian = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    Q1: TZQuery;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    BtnCetak: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    dbgdata: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1kodepembelianterima: TcxGridDBColumn;
    cxGridDBTableView1tglpembelianterima: TcxGridDBColumn;
    cxGridDBTableView1kodepembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView1tglpembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView1total: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    QDatanopembelianterima: TLargeintField;
    QDatanokontak: TLargeintField;
    QDatanopembelianorder: TLargeintField;
    QDatakodepembelianterima: TStringField;
    QDatatglpembelianterima: TDateField;
    QDatanamauser: TStringField;
    QDatakodepembelianinvoice: TStringField;
    QDatatglpembelianinvoice: TDateField;
    QDatakodepembelianorder: TStringField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    QDatanopembelianinvoice: TLargeintField;
    QDatatotal: TFloatField;
    PopupMenu1: TPopupMenu;
    JurnalVoucher1: TMenuItem;
    Button1: TButton;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure JurnalVoucher1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPembelian: TFrm_DaftarPembelian;
  datedari,datesampai:string;
  nogrid: Integer;

implementation

uses UDM, UPembelian, UMain, UFTanggal, UAPInvoice, UCetakPembelian, UPembelianRequest, UPembelianOrder;

{$R *.dfm}

procedure TFrm_DaftarPembelian.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPembelian.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPembelian.BtnHapusClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QPembelian.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;         }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if nogrid = 0 then begin
    {if DM.CekPeriode(QDetil.FieldValues['tglpembelianterima'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_pembelianinvoicedetail where nopembelianterima=:a';
      ParamByName('a').Value := QData.FieldValues['nopembelianterima'];
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                    '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                    'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
        ParamByName('a').Value := QData.FieldValues['nopembelianterima'];
        ParamByName('t').Value := 'TO';
        Open;
        First;
        for i:=0 to RecordCount-1 do begin
          if FieldValues['terjual']=0 then begin
            Next;
          end else begin
            MessageDlg('Transaksi tidak dapat dihapus, karena barang telah terpakai oleh transaksi lain'#10#13'Hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
            Free;
            Exit;
          end;
        end;
        if MessageDlg('Apakah anda ingin menghapus Transaksi Penerimaan Barang, No. '+QData.FieldValues['kodepembelianterima']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          ParamByName('t').Value := 'TO';
          Open;
          for i:=0 to RecordCount-1 do begin
            DM.HitungHPPAverage1(FieldValues['nobarang'],FieldValues['masuk'],FieldValues['hpp']);
            Next;
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          ParamByName('t').Value := 'TO';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          ParamByName('t').Value := 'TO';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_pembelianterima where nopembelianterima=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_pembelianterimadetail where nopembelianterima=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          ExecSQL;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Transaksi Penerimaan tidak dapat dihapus, karena telah dicetak invoice!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end else if nogrid = 3 then begin
    {if DM.CekPeriode(QDetil.FieldValues['tglpembelianinvoice'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT IFNULL(SUM(a.total),0)AS total FROM ' +
                  '(SELECT nopembelianinvoice AS noref,IFNULL(SUM(jumlahbayar+selisih),0)AS total FROM tbl_pembayaranhutangdetail GROUP BY nopembelianinvoice ' +
                  'UNION ' +
                  'SELECT nopembelianinvoice AS noref,IFNULL(SUM(total),0)AS total FROM tbl_returpembelian GROUP BY nopembelianinvoice)AS a ' +
                  'WHERE a.noref=:np';
      ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
      Open;
      if FieldValues['total']>0 then begin
        MessageDlg('Invoice Pembelian tidak dapat dihapus, karena barang telah terpakai oleh transaksi pembayaran / retur'#10#13'Hapus dulu transaksi pembayaran atau retur untuk Transaksi ini.',mtError,[mbOK],0);
        Free;
        Exit;
      end;
      if MessageDlg('Apakah anda ingin menghapus Invoice Pembelian, No. '+QData.FieldValues['kodepembelianinvoice']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_pembelianinvoicedetail where nopembelianinvoice=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
        ParamByName('t').Value := 'PU';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
        ParamByName('t').Value := 'PU';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
        ParamByName('t').Value := 'PU';
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_pembelianinvoice where nopembelianinvoice=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
        ExecSQL;
        RefreshQ;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_DaftarPembelian.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  nogrid := -1;
  RefreshQ;
end;

procedure TFrm_DaftarPembelian.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPembelian.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPembelian.BtnCetakClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if QData.IsEmpty then Exit;
  if nogrid = 0 then begin
    DM.Q_NotaPembelianTO.Close;
    DM.Q_NotaPembelianTO.ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
    DM.Q_NotaPembelianTO.Open;
    DM.Nota_PembelianTO.ShowReport(True);
  end else if nogrid = 3 then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'PU';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal AP';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end else begin
    MessageDlg('Klik Nomor yang ingin dicetak!',mtError,[mbOK],0);
  end;
end;

procedure TFrm_DaftarPembelian.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  nogrid := ACellViewInfo.Item.Index;
end;

procedure TFrm_DaftarPembelian.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i,j:Integer;
  f: TFrm_Pembelian;
  g: TFrm_APInvoice;
  h: TFrm_PembelianOrder;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if nogrid = 0 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian3')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Penerimaan Pembelian') then begin
      f := TFrm_Pembelian.Create(Self);
      with f do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QDetail.FieldValues['tglpembelianterima'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepembelianorder,'+QuotedStr('')+')as kodepembelianorder from ' +
                      '(select a.*,b.namakontak from ' +
                      '(select * from tbl_pembelianterima where nopembelianterima=:np)as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak)as a ' +
                      'left join tbl_pembelianorder as b on b.nopembelianorder=a.nopembelianorder';
          ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
          Open;
          LID.Caption := FieldValues['nopembelianterima'];
          txtreferensi.Text := FieldValues['kodepembelianterima'];
          txtsupplier.Text := FieldValues['namakontak'];
          LSupplier.Caption := FieldValues['nokontak'];
          txtpo.Text := FieldValues['kodepembelianorder'];
          LPO.Caption := FieldValues['nopembelianorder'];
          if QData.FieldValues['nopembelianinvoice']>0 then LPosting.Caption := '1';
          dtpfaktur.Date := FieldValues['tglpembelianterima'];

          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as kodegudang from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_pembelianterimadetail where nopembelianterima=:np) as a ' +
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
                Cell[2,i].AsFloat := CekPO(StrToInt(LPO.Caption),FieldValues['nobarang'],FieldValues['nosatuan'])+FieldValues['qty'];
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['hargabeli'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[10,i].AsString := FieldValues['kodegudang'];
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
                Cell[22,i].AsInteger := FieldValues['tipebarang'];
                Cell[23,i].AsInteger := FieldValues['noakunbelumtertagih'];
                Cell[24,i].AsInteger := FieldValues['noakunpajakpembelianblm'];
                Cell[25,i].AsInteger := FieldValues['nopph'];
                Cell[26,i].AsFloat := FieldValues['persenpph'];
                Cell[27,i].AsInteger := FieldValues['noakunpph'];
                Cell[28,i].AsFloat := FieldValues['pphbarang'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
        f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
        f.Show;

        ts := (f.parent as TcxTabSheet);

        Frm_Main.PGMain.ActivePage := ts;
      end;
    end;
  end else if nogrid = 2 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Order Pembelian') then begin
      h := TFrm_PembelianOrder.Create(Self);
      with h do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT a.*,IFNULL(b.kodepembelianrequest,'+QuotedStr('')+')AS kodepembelianrequest FROM ' +
                      '(SELECT * FROM tbl_pembelianorder where nopembelianorder=:np)AS a ' +
                      'LEFT JOIN tbl_pembelianrequest as b on b.nopembelianrequest=a.nopembelianrequest)as a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak ORDER BY a.tgltransaksi,a.kodepembelianorder';
          ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
          Open;
          LID.Caption := FieldValues['nopembelianorder'];
          LSupplier.Caption := FieldValues['nokontak'];
          txtsupplier.Text := FieldValues['namakontak'];
          txtreferensi.Text := FieldValues['kodepembelianorder'];
          dtpfaktur.Date := FieldValues['tgltransaksi'];
          txtrequest.Text := FieldValues['kodepembelianrequest'];
          LRequest.Caption := FieldValues['nopembelianrequest'];
          if FieldValues['selesai']=0 then begin
            cbselesai.Checked := False;
          end else if FieldValues['selesai']=1 then begin
            cbselesai.Checked := True;
          end;
          if FieldValues['approve']=0 then begin
            cbapprove.Checked := False;
          end else if FieldValues['selesai']=1 then begin
            cbapprove.Checked := True;
          end;
          txtbiaya.Value := FieldValues['biayalain'];
          txtpph.Value := FieldValues['pph'];
          txtdiskondays.Value := FieldValues['diskonday'];
          txtduedate.Value := FieldValues['duedate'];
          txtearlydiscount.Value := FieldValues['earlydiskon'];
          txtlatecharge.Value := FieldValues['latecharge'];
          txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pembelianterima where nopembelianorder=:a';
          ParamByName('a').Value := LID.Caption;
          Open;
          if IsEmpty then
            LTerima.Caption := '0'
          else LTerima.Caption := '1';
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepph,'+QuotedStr('-')+')as kodepph from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_pembelianorderdetail where nopembelianorder=:np)as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_pajakpenghasilan as b on b.nopph=a.nopph';
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
                Cell[2,i].AsFloat := CekPR(StrToInt(LID.Caption),FieldValues['nobarang'],FieldValues['nosatuan'])+FieldValues['qty'];
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['harga'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[10,i].AsInteger := FieldValues['nobarang'];
                Cell[11,i].AsInteger := FieldValues['nosatuan'];
                Cell[12,i].AsFloat := FieldValues['nilai'];
                Cell[13,i].AsInteger := FieldValues['nopajak'];
                Cell[14,i].AsInteger := FieldValues['tipepajak'];
                Cell[15,i].AsFloat := FieldValues['persenpajak'];
                Cell[16,i].AsFloat := FieldValues['dppbarang'];
                Cell[17,i].AsFloat := FieldValues['ppnbarang'];
                Cell[18,i].AsString := FieldValues['kodepph'];
                Cell[19,i].AsInteger := FieldValues['nopph'];
                Cell[20,i].AsFloat := FieldValues['persenpph'];
                Cell[21,i].AsFloat := FieldValues['pphbarang'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      h.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      h.Show;

      ts := (h.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;

    end;
  end else if nogrid = 3 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian4')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Account Payable') then begin
      g := TFrm_APInvoice.Create(Self);
      with g do begin
        ClearText;
        {if DM.CekPeriode(QDetail.FieldValues['tglpembelianinvoice'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pembelianinvoicedetail where nopembelianinvoice=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
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
          ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
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
            for j:= 0 to RecordCount -1 do begin
              dbgbarang.AddRow();
              dbgbarang.Cell[0,j].AsString := FieldValues['kodebarang'];
              dbgbarang.Cell[1,j].AsString := FieldValues['namabarang'];
              dbgbarang.Cell[2,j].AsFloat := FieldValues['qty'];
              dbgbarang.Cell[3,j].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
              dbgbarang.Cell[4,j].AsFloat := FieldValues['hargabeli'];
              dbgbarang.Cell[5,j].AsFloat := FieldValues['diskon1'];
              dbgbarang.Cell[6,j].AsFloat := FieldValues['diskon2'];
              dbgbarang.Cell[7,j].AsFloat := FieldValues['subtotal'];
              dbgbarang.Cell[8,j].AsString := FieldValues['kodepajak'];
              dbgbarang.Cell[9,j].AsInteger := FieldValues['nobarang'];
              dbgbarang.Cell[10,j].AsInteger := FieldValues['nosatuan'];
              dbgbarang.Cell[11,j].AsFloat := FieldValues['nilai'];
              dbgbarang.Cell[12,j].AsInteger := FieldValues['noakunpersediaan'];
              dbgbarang.Cell[13,j].AsInteger := FieldValues['nopajak'];
              dbgbarang.Cell[14,j].AsInteger := FieldValues['tipepajak'];
              dbgbarang.Cell[15,j].AsFloat := FieldValues['persenpajak'];
              dbgbarang.Cell[16,j].AsFloat := FieldValues['dppbarang'];
              dbgbarang.Cell[17,j].AsFloat := FieldValues['ppnbarang'];
              dbgbarang.Cell[18,j].AsInteger := FieldValues['noakunpajakpembelian'];
              dbgbarang.Cell[19,j].AsInteger := FieldValues['tipebarang'];
              dbgbarang.Cell[20,j].AsInteger := FieldValues['noakunbelumtertagih'];
              dbgbarang.Cell[21,j].AsString := FieldValues['kodepph'];
              dbgbarang.Cell[22,j].AsInteger := FieldValues['noakunpajakpembelianblm'];
              dbgbarang.Cell[23,j].AsInteger := FieldValues['nopph'];
              dbgbarang.Cell[24,j].AsFloat := FieldValues['persenpph'];
              dbgbarang.Cell[25,j].AsInteger := FieldValues['noakunpph'];
              dbgbarang.Cell[26,j].AsFloat := FieldValues['pphbarang'];
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      g.Show;

      ts := (g.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end;
end;

procedure TFrm_DaftarPembelian.JurnalVoucher1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if nogrid = 0 then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'TO';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal Voucher';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end else if nogrid = 3 then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'PU';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal AP';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end;
end;

procedure TFrm_DaftarPembelian.Button1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if QData.IsEmpty then Exit;
  if nogrid = 0 then begin
    DM.Q_NotaPembelianTO.Close;
    DM.Q_NotaPembelianTO.ParamByName('np').Value := QData.FieldValues['nopembelianterima'];
    DM.Q_NotaPembelianTO.Open;
    DM.Nota_PembelianTO1.ShowReport(True);
  end else if nogrid = 3 then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopembelianinvoice'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'PU';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal AP';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end else begin
    MessageDlg('Klik Nomor yang ingin dicetak!',mtError,[mbOK],0);
  end;
end;

end.
