unit URincianHutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, RzCmboBx, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxPC;

type
  TFrm_RincianHutang = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    QDetail: TZQuery;
    DSDetail: TDataSource;
    QDetailtanggal: TDateField;
    QDetailjumlah: TFloatField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    BtnUpdate: TRzToolButton;
    QDatanokontak: TLargeintField;
    QDatatotalhutang: TFloatField;
    QDatajumlahretur: TFloatField;
    QDatajumlahbayar: TFloatField;
    QDatasisahutang: TFloatField;
    QDataN1: TFloatField;
    QDataN2: TFloatField;
    QDataN3: TFloatField;
    QDataN4: TFloatField;
    QDatanamakontak: TStringField;
    dbgdataDBTableView1kodepembelian: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1N1: TcxGridDBColumn;
    dbgdataDBTableView1N2: TcxGridDBColumn;
    dbgdataDBTableView1N3: TcxGridDBColumn;
    dbgdataDBTableView1N4: TcxGridDBColumn;
    BtnKontak: TRzToolButton;
    QDetailtipe: TStringField;
    QDetailnoref: TLargeintField;
    QDetailkoderef: TStringField;
    dbgdetail: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1tanggal: TcxGridDBColumn;
    cxGridDBTableView1jumlah: TcxGridDBColumn;
    cxGridDBTableView1koderef: TcxGridDBColumn;
    Q1: TZQuery;
    QDatanopembelianinvoice: TLargeintField;
    QDatakodepembelianinvoice: TStringField;
    QDatatglpembelianinvoice: TDateField;
    QDetailnopembelianinvoice: TStringField;
    QDatatgltempo: TDateField;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnKontakClick(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dbgdataDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;

  end;

var
  Frm_RincianHutang: TFrm_RincianHutang;
  supplierid :Integer;

implementation

uses UDM, UDataKontak, UPembayaranHutang, UMain, UAPInvoice, UReturPembelian,
  NxIntf6;

{$R *.dfm}

{ TFrm_RincianHutang }

procedure TFrm_RincianHutang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('nk').Value := supplierid;
    Open;
  end;
  QDetail.Close;
  QDetail.Open;
end;

procedure TFrm_RincianHutang.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_RincianHutang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_RincianHutang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_RincianHutang.BtnKontakClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 1;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    supplierid := Frm_DataKontak.QData.FieldValues['nokontak'];
    RzPanel1.Caption := '             Perincian Hutang Usaha '+Frm_DataKontak.QData.FieldValues['namakontak'];
    RefreshQ;
  end;
end;

procedure TFrm_RincianHutang.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
  f: TFrm_PembayaranHutang;
  g: TFrm_ReturPembelian;
  ts: TcxTabSheet;
begin
  if QDetail.IsEmpty then Exit;
  if QDetail.FieldValues['tipe'] = 'CD' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian7')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                  '(SELECT * FROM tbl_pembayaranhutang where nopembayaranhutang=:np)AS a ' +
                  'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak ORDER BY a.tglbayar,a.kodepembayaranhutang';
      ParamByName('np').Value := QDetail.FieldValues['noref'];
      Open;
      if not DM.CekTabOpen('Pembayaran Hutang Usaha') then begin
        f := TFrm_PembayaranHutang.Create(Self);
        with f do begin
          ClearText;
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
        end;
        f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
        f.Show;

        ts := (f.parent as TcxTabSheet);

        Frm_Main.PGMain.ActivePage := ts;
      end;
      Free;
    end;
  end else if QDetail.FieldValues['tipe'] = 'PR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian5')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Retur Pembelian') then begin
      g := TFrm_ReturPembelian.Create(Self);
      with g do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QPembelian.FieldValues['tgltransaksi'])=0 then begin
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
          ParamByName('np').Value := QDetail.FieldValues['noref'];
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
      g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      g.Show;

      ts := (g.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end;
end;

procedure TFrm_RincianHutang.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i,j:Integer;
  f: TFrm_APInvoice;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Account Payable') then begin
    f := TFrm_APInvoice.Create(Self);
    with f do begin
      ClearText;
      {if DM.CekPeriode(QData.FieldValues['tglpembelianinvoice'])=0 then begin
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
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
