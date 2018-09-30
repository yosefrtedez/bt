unit UDaftarPenjualan;

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
  RzButton, ExtCtrls, RzPanel, cxCheckBox, frxClass;

type
  TFrm_DaftarPengirimanBarang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    BtnCetak: TRzBitBtn;
    dbgdetil: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1kodepembelianterima: TcxGridDBColumn;
    cxGridDBTableView1tglpembelianterima: TcxGridDBColumn;
    cxGridDBTableView1kodepembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView1tglpembelianinvoice: TcxGridDBColumn;
    cxGridDBTableView1total: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    QDetil: TZQuery;
    DSDetil: TDataSource;
    QDetilnopenjualankirim: TLargeintField;
    QDetilkodepenjualankirim: TStringField;
    QDetiltglpenjualankirim: TDateField;
    QDetilkodepenjualaninvoice: TStringField;
    QDetiltglpenjualaninvoice: TDateField;
    QDetiltotal: TFloatField;
    QDatanopenjualanorder: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDatakodepenjualanorder: TStringField;
    QDatanokontak: TLargeintField;
    QDatatotal: TFloatField;
    QDatanamakontak: TStringField;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1kodepenjualanorder: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1kodepenjualanrequest: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    QDatakodepenjualando: TStringField;
    QDatakodepenjualanorder1: TStringField;
    BtnApprove: TRzBitBtn;
    QDataapprove: TSmallintField;
    QDataiscancel: TSmallintField;
    QDetilapprove: TSmallintField;
    QDetilnopenjualanorder: TLargeintField;
    QDetilnokontak: TLargeintField;
    QDetilnogudang: TLargeintField;
    QDetilbiayalain: TFloatField;
    QDetilnoakunbiayalain: TLargeintField;
    QDetilnamauser: TStringField;
    QDetiltglapprove: TDateTimeField;
    QDetilnopenjualaninvoice: TLargeintField;
    QDetilkodepenjualankirim1: TStringField;
    RzBitBtn1: TRzBitBtn;
    BtnVariabel: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure dbgdataDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dbgdataDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnApproveClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure BtnVariabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPengirimanBarang: TFrm_DaftarPengirimanBarang;
  datedari,datesampai:string;
  nogrid,notabel: Integer;

implementation

uses UDM, UPenjualan, UMain, UFTanggal, UPenjualanDelivery, USalesQuotation, UPenjualanOrder, UPenjualanDO, UInputFakturPajak,
  RzEdit;

{$R *.dfm}

{ TFrm_DaftarPengirimanBarang }

procedure TFrm_DaftarPengirimanBarang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
    QDetil.Close;
    QDetil.Open;
  end;
end;

procedure TFrm_DaftarPengirimanBarang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPengirimanBarang.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QPembelian.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;         }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan11')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if (notabel = 0) and (nogrid = 3) then begin
    {if DM.CekPeriode(QData.FieldValues['tglpenjualanrequest'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    if MessageDlg('Apakah anda ingin menghapus Transaksi Permintaan Pembelian, No. '+QData.FieldValues['kodepembelianrequest']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_penjualanrequest where nopenjualanrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopenjualanrequest'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_tbl_penjualanrequestdetail where nopenjualanrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopenjualanrequest'];
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end else if (notabel = 0) and (nogrid = 0) then begin
    {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_penjualankirim where nopenjualanorder=:a';
      ParamByName('a').Value := QData.FieldValues['nopenjualanorder'];
      Open;
      if IsEmpty then begin
        if MessageDlg('Apakah anda ingin menghapus Transaksi Order Penjualan, No. '+QData.FieldValues['kodepenjualanorder']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penjualanorder where nopenjualanorder=:np';
          ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_tbl_penjualanorderdetail where nopenjualanorder=:np';
          ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
          ExecSQL;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Penjualan Order tidak dapat dihapus, karena sebagian barang telah dikirim!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end else if (notabel = 1) and (nogrid = 0) then begin
    {if DM.CekPeriode(QDetil.FieldValues['tglpenjualankirim'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_penjualaninvoice where nopenjualankirim=:a';
      ParamByName('a').Value := QDetil.FieldValues['nopenjualankirim'];
      Open;
      if IsEmpty then begin
        if MessageDlg('Apakah anda ingin menghapus Transaksi Pengiriman Barang, No. '+QDetil.FieldValues['kodepenjualankirim']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'SJ';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ParamByName('t').Value := 'SJ';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_penjualankirimdetail where nopenjualankirim=:np';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_penjualankirim where nopenjualankirim=:np';
            ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
            ExecSQL;

            dm.con.Commit;
            Screen.Cursor := crDefault;
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Transaksi Pengiriman tidak dapat dihapus, karena telah dicetak invoice!',mtError,[mbOK],0);
      end;
      Free;
    end;
  end else if (notabel = 1) and (nogrid = 2) then begin
    {if DM.CekPeriode(QDetil.FieldValues['tglpenjualaninvoice'])= 0 then begin
      MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
      Exit;
    end;     }
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT IFNULL(SUM(a.total),0)AS total FROM ' +
                  '(SELECT nopenjualaninvoice AS noref,IFNULL(SUM(jumlahbayar+selisih),0)AS total FROM tbl_pembayaranpiutangdetail GROUP BY nopenjualaninvoice ' +
                  'UNION ' +
                  'SELECT nopenjualaninvoice AS noref,IFNULL(SUM(total),0)AS total FROM tbl_returpenjualan GROUP BY nopenjualaninvoice)AS a ' +
                  'WHERE a.noref=:np';
      ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      Open;
      if FieldValues['total']>0 then begin
        MessageDlg('Invoice Penjualan tidak dapat dihapus, karena barang telah terpakai oleh transaksi pembayaran / retur'#10#13'Hapus dulu transaksi pembayaran atau retur untuk Transaksi ini.',mtError,[mbOK],0);
        Free;
        Exit;
      end;
      if MessageDlg('Apakah anda ingin menghapus Invoice Penjualan, No. '+QDetil.FieldValues['kodepenjualaninvoice']+'?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penjualaninvoicedetail where nopenjualaninvoice=:np';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          ParamByName('t').Value := 'SA';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          ParamByName('t').Value := 'SA';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          ParamByName('t').Value := 'SA';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_penjualaninvoice where nopenjualaninvoice=:np';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          ExecSQL;
          dm.con.Commit;
          Screen.Cursor := crDefault;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        RefreshQ;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_DaftarPengirimanBarang.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  notabel := -1;
  nogrid := -1;
  RefreshQ;
end;

procedure TFrm_DaftarPengirimanBarang.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPengirimanBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPengirimanBarang.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if (notabel = 0) and (nogrid = 0) then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
      ParamByName('t').Value := 'SO';
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
        ParamByName('a').Value := QData.FieldValues['nopenjualanorder'];;
        ParamByName('b').Value := 'SO';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
        ExecSQL;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];;
        ParamByName('t').Value := 'SO';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
        ExecSQL;
      end;
      Free;
      dm.Q_NotaPenjualanSO.Close;
      DM.Q_NotaPenjualanSO.ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];;
      DM.Q_NotaPenjualanSO.Open;
      dm.Q_NotaTerbilang.Close;
      DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];;
      DM.Q_NotaTerbilang.ParamByName('t').Value := 'SO';
      DM.Q_NotaTerbilang.Open;
      DM.Nota_PenjualanSO.ShowReport(True);
    end;
  end else if (notabel = 0) and (nogrid = 1) then begin
    if QData.FieldValues['kodepenjualando'] <> '' then begin
      dm.Q_NotaDO.Close;
      DM.Q_NotaDO.ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
      DM.Q_NotaDO.Open;
      DM.Nota_DO.ShowReport(True);
    end;
  end else if (notabel = 1) and (nogrid = 0) then begin
    DM.Q_NotaPenjualanDO.Close;
    DM.Q_NotaPenjualanDO.ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
    DM.Q_NotaPenjualanDO.Open;
    if QDetil.FieldValues['approve']=1 then
      DM.Nota_SJ.ShowReport(True)
    else DM.Nota_PenjualanDO.ShowReport(True);
  end else if (notabel = 1) and (nogrid = 2) then begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      ParamByName('t').Value := 'SA';
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
        ParamByName('a').Value := QDetil.FieldValues['nopenjualaninvoice'];
        ParamByName('b').Value := 'SA';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QDetil.FieldValues['total']));
        ExecSQL;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
        ParamByName('t').Value := 'SA';
        ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QDetil.FieldValues['total']));
        ExecSQL;
      end;
      Free;
      dm.Q_NotaPenjualanInv.Close;
      DM.Q_NotaPenjualanInv.ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      DM.Q_NotaPenjualanInv.Open;
      dm.Q_NotaTerbilang.Close;
      DM.Q_NotaTerbilang.ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      DM.Q_NotaTerbilang.ParamByName('t').Value := 'SA';
      DM.Q_NotaTerbilang.Open;
      DM.Nota_PenjualanInv.ShowReport(True);
    end;
  end;
end;

procedure TFrm_DaftarPengirimanBarang.dbgdataDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  notabel := 0;
  nogrid := ACellViewInfo.Item.Index;
end;

procedure TFrm_DaftarPengirimanBarang.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  notabel := 1;
  nogrid := ACellViewInfo.Item.Index;
end;

procedure TFrm_DaftarPengirimanBarang.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i: Integer;
  f: TFrm_DeliveryOrder;
  g: TFrm_SalesOrder;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if (notabel = 0) and (nogrid = 0) then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan1')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Order Penjualan') then begin
      g := TFrm_SalesOrder.Create(Self);
      with g do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtptanggal.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT * FROM tbl_penjualanorder where nopenjualanorder=:np)AS a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
          Open;
          LID.Caption := FieldValues['nopenjualanorder'];
          txtreferensi.Text := FieldValues['kodepenjualanorder'];
          dtptanggal.Date := FieldValues['tgltransaksi'];
          LCustomer.Caption := FieldValues['nokontak'];
          txtcustomer.Text := FieldValues['namakontak'];
          dtpkirim.Date := FieldValues['tglkirim'];
          if FieldValues['selesai'] = 1 then
            cbselesai.Checked := True
          else cbselesai.Checked := False;
          if FieldValues['approve'] = 1 then
            cbapprove.Checked := True
          else cbapprove.Checked := False;
          txtpo.Text := FieldValues['pocustomer'];
          txtdiskondays.Value := FieldValues['diskonday'];
          txtearlydiscount.Value := FieldValues['earlydiskon'];
          txtduedate.Value := FieldValues['duedate'];
          txtlatecharge.Value := FieldValues['latecharge'];
          txtterm.Text := DM.GetSalesTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
          txtbiaya.Value := FieldValues['biayalain'];
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          LSalesman.Caption := FieldValues['nosales'];
          LKirim.Caption := FieldValues['kodepenjualando'];
          if FieldValues['nopenjualanrequest'] <> 0 then begin
            LPenawaran.Caption := FieldValues['nopenjualanrequest'];
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_penjualanrequest where nopenjualanrequest=:np';
            ParamByName('np').Value := LPenawaran.Caption;
            Open;
            txtpenawaran.Text := FieldValues['kodepenjualanrequest'];
          end;
          if LSalesman.Caption <> '0' then begin
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_kontak where nokontak=:np';
            ParamByName('np').Value := LSalesman.Caption;
            Open;
            txtsalesman.Text := FieldValues['namakontak'];
          end;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.kodeakun from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penjualanorderdetail where nopenjualanorder=:np)as a ' +
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
                Cell[19,i].AsInteger := FieldValues['nodetailpenjualanorder'];
                Cell[20,i].AsInteger := FieldValues['noakunpenjualan'];

                txtcoa.Text := FieldValues['kodeakun'];
                LCoa.Caption := FieldValues['noakunpenjualan'];
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

      ts := (g.parent as TcxTabSheet);

      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else if (notabel = 0) and (nogrid = 1) then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Delivery Order') then begin
      f := TFrm_DeliveryOrder.Create(Self);
      with f do begin
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT * FROM tbl_penjualanorder where nopenjualanorder=:np)AS a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
          ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
          Open;
          LSO.Caption := FieldValues['nopenjualanorder'];
          txtreferensi.Text := FieldValues['kodepenjualando'];
          dtpfaktur.Date := FieldValues['tgldo'];
          LCustomer.Caption := FieldValues['nokontak'];
          txtcustomer.Text := FieldValues['namakontak'];
          txtso.Text := FieldValues['kodepenjualanorder'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penjualankirim where nopenjualanorder=:np';
          ParamByName('np').Value := LSO.Caption;
          Open;
          if not IsEmpty then LKirim.Caption := FieldValues['nopenjualankirim'];
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penjualanorderdetail where nopenjualanorder=:np)as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak';
          ParamByName('np').Value := LSO.Caption;
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
              end;
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
end;

procedure TFrm_DaftarPengirimanBarang.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
  f: TFrm_Penjualan;
  g: TFrm_PenjualanPengiriman;
  ts: TcxTabSheet;
begin
  if QDetil.IsEmpty then Exit;
  if (notabel = 1) and (nogrid = 0) then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan3')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Pengiriman Barang (Trucking)') then begin
      g := TFrm_PenjualanPengiriman.Create(Self);
      with g do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QDetail.FieldValues['tglpenjualankirim'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodegudang,'+QuotedStr('Gudang Utama')+')as kodegudang from ' +
                      '(select a.*,ifnull(b.kodepenjualando,'+QuotedStr('')+')as kodepenjualando from ' +
                      '(select a.*,b.namakontak from ' +
                      '(select * from tbl_penjualankirim where nopenjualankirim=:np)as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak)as a ' +
                      'left join tbl_penjualanorder as b on b.nopenjualanorder=a.nopenjualanorder)as a ' +
                      'left join tbl_gudang as b on b.nogudang=a.nogudang';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
          Open;
          LID.Caption := FieldValues['nopenjualankirim'];
          txtreferensi.Text := FieldValues['kodepenjualankirim'];
          dtpfaktur.Date := FieldValues['tglpenjualankirim'];
          LCustomer.Caption := FieldValues['nokontak'];
          txtcustomer.Text := FieldValues['namakontak'];
          txtgudang.Text := FieldValues['kodegudang'];
          LGUdang.Caption := FieldValues['nogudang'];
          txtso.Text := FieldValues['kodepenjualando'];
          LSO.Caption := FieldValues['nopenjualanorder'];
          //if QDetil.FieldValues['nopenjualaninvoice']>0 then LPosting.Caption := '1';
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          txtbiaya.Value := FieldValues['biayalain'];
          if FieldValues['approve'] = 1 then
            cbapprove.Checked := True
          else cbapprove.Checked := False;

          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_penjualankirimdetail where nopenjualankirim=:np) as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
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
                Cell[2,i].AsFloat := CekSO(StrToInt(LSO.Caption),FieldValues['nobarang'],FieldValues['nourutso']);
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['hargajual'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[10,i].AsInteger := FieldValues['nobarang'];
                Cell[11,i].AsInteger := FieldValues['nosatuan'];
                Cell[12,i].AsFloat := FieldValues['nilai'];
                Cell[13,i].AsInteger := FieldValues['noakunpersediaan'];
                Cell[14,i].AsInteger := FieldValues['noakunpenjualan'];
                Cell[15,i].AsInteger := FieldValues['noakunhpp'];
                Cell[16,i].AsInteger := FieldValues['nopajak'];
                Cell[17,i].AsInteger := FieldValues['tipepajak'];
                Cell[18,i].AsFloat := FieldValues['persenpajak'];
                Cell[19,i].AsFloat := FieldValues['dppbarang'];
                Cell[20,i].AsFloat := FieldValues['ppnbarang'];
                Cell[21,i].AsInteger := FieldValues['noakunpajakpenjualan'];
                Cell[22,i].AsInteger := FieldValues['nourutso'];
                Cell[23,i].AsInteger := FieldValues['tipebarang'];
                Cell[24,i].AsInteger := FieldValues['akunpajakpenjualanblm'];
                Cell[25,i].AsInteger := FieldValues['noakunterkirim'];
              end;
              Next;
            end;
            UpdateTotal;
          end;
          Free;
        end;
        g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
        g.Show;

        ts := (g.parent as TcxTabSheet);

        Frm_Main.PGMain.ActivePage := ts;

      end;
    end;
  end else if (notabel = 1) and (nogrid = 2) then begin
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
          {Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penjualaninvoicedetail where nopenjualaninvoice=:np';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
          Open;
          if IsEmpty then begin
            MessageDlg('Transaksi tidak dapat diubah: Saldo Awal Piutang',mtError,[mbOK],0);
            Free;
            Exit;
          end;    }
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.namakontak from ' +
                      '(select * from tbl_penjualaninvoice where nopenjualaninvoice=:np)as a ' +
                      'left join tbl_kontak as b on b.nokontak=a.nokontak';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
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

  end;
end;

procedure TFrm_DaftarPengirimanBarang.BtnApproveClick(Sender: TObject);
var
  kodesj,kodedo: string;
  i: Integer;
  hpp: Double;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if notabel = 0 then begin
    if QData.IsEmpty then Exit;
    if QData.FieldValues['iscancel']=0 then begin
      if QData.FieldValues['approve']=0 then begin
        {if DM.CekPlafon(StrToInt(LSupplier.Caption),txttotal.Value)=False then begin
          if MessageDlg('Transaksi ini melebihi batas kredit supplier. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
            Exit;
          end else cbapprove.Checked := False;
        end else cbapprove.Checked := True; }
        if MessageDlg('Apakah data order penjualan, No. '+QData.FieldValues['kodepenjualanorder']+' disetujui ?',mtConfirmation,[mbYes,mbNo],0)= mryes then begin
          with TZQuery.Create(Self)do begin
            Connection := dm.con;
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_penjualanorder set approve=:ab, tglapprove=:aa where nopenjualanorder=:np';
            ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
            ParamByName('aa').Value := FormatDateTime('yyyy-mm-dd',tanggalserver);
            ParamByName('ab').Value := 1;
            ExecSQL;
            if MessageDlg('Proses Delivery Order ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan2')=False then begin
                MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
                Exit;
              end;
              kodedo := DM.GenerateKodeTransaksi('DO',tanggalserver);
              Close;
              SQL.Clear;
              SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
              ParamByName('a').Value := 'DO';
              ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',tanggalserver);
              ParamByName('c').Value := kodedo;
              ExecSQL;
              Close;
              SQL.Clear;
              // update ke tabel penjualan order
              SQL.Text := 'update tbl_penjualanorder set kodepenjualando=:c,tgldo=:d where nopenjualanorder=:a';
              ParamByName('a').Value := QData.FieldValues['nopenjualanorder'];
              ParamByName('c').Value := kodedo;
              ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',tanggalserver);
              ExecSQL;
              dm.Q_NotaDO.Close;
              DM.Q_NotaDO.ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
              DM.Q_NotaDO.Open;
              DM.Nota_DO.ShowReport(True);
            end;

            Free;
          end;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Transaksi Order Penjualan telah disetujui!',mtError,[mbOK],0);
      end;
    end else begin
      MessageDlg('Transaksi Order Penjualan telah dibatalkan!',mtError,[mbOK],0);
    end;
  end else if notabel = 1 then begin
    if QDetil.FieldValues['approve']=0 then begin
      {if DM.CekPlafon(StrToInt(LSupplier.Caption),txttotal.Value)=False then begin
        if MessageDlg('Transaksi ini melebihi batas kredit supplier. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
          Exit;
        end else cbapprove.Checked := False;
      end else cbapprove.Checked := True; }
      if MessageDlg('Proses Surat Jalan ?',mtConfirmation,[mbYes,mbNo],0)= mryes then begin
        with TZQuery.Create(Self)do begin
          Connection := dm.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_penjualankirim where nopenjualankirim=:np';
          ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
          Open;
          if FieldValues['approve']=0 then begin
            Screen.Cursor := crSQLWait;
            try
              dm.con.StartTransaction;
              kodesj := QDetil.FieldValues['kodepenjualankirim'];
              Close;
              sql.Clear;
              SQL.Text := 'update tbl_penjualankirim set approve=:a, tglapprove=:b where nopenjualankirim=:np';
              ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
              ParamByName('a').Value := 1;
              ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',tanggalserver);
              ExecSQL;
              Close;
              SQL.Clear;
              SQL.Text := 'select * from tbl_penjualankirimdetail where nopenjualankirim=:a';
              ParamByName('a').Value := QDetil.FieldValues['nopenjualankirim'];
              Open;
              if not IsEmpty then begin
                First;
                for i:=0 to RecordCount-1 do begin
                  if FieldValues['tipebarang'] = 0 then begin
                    {Q1.Close;
                    Q1.SQL.Clear;
                    //masuk tabel buku besar barang
                    Q1.SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                    //Q1.ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    Q1.ParamByName('b').Value := FieldValues['nobarang'];
                    Q1.ParamByName('c').Value := 'SJ';
                    Q1.ParamByName('d').Value := QDetil.FieldValues['nogudang'];
                    Q1.ParamByName('e').Value := Date;
                    Q1.ParamByName('f').Value := QDetil.FieldValues['nopenjualankirim'];
                    Q1.ParamByName('g').Value := 'Pengiriman Barang No, '+kodesj;
                    Q1.ParamByName('h').Value := FieldValues['qty']*FieldValues['nilai'];
                    hpp := DM.HitungHPPPenjualan(FieldValues['nobarang'],FieldValues['qty']*FieldValues['nilai']);
                    Q1.ParamByName('i').Value := hpp;
                    Q1.ParamByName('j').Value := (FieldValues['subtotal']/FieldValues['qty']*FieldValues['nilai']);
                    Q1.ExecSQL;
                    //masuk buku besar barang detail
                    DM.AmbilNoBuku(FieldValues['nobarang'],QDetil.FieldValues['nogudang'],FieldValues['qty']*FieldValues['nilai'],QDetil.FieldValues['nopenjualankirim'],'SJ');

                    hpp := DM.HitungHPPPenjualan(FieldValues['nobarang'],FieldValues['qty']*FieldValues['nilai']);
                    DM.InsertBukuBesarAkun(hppintransit,Date,'SJ',QDetil.FieldValues['nopenjualankirim'],'Pengiriman Barang, No. '+kodesj,0,hpp*FieldValues['qty']*FieldValues['nilai']);
                    DM.InsertBukuBesarAkun(FieldValues['noakunhpp'],Date,'SJ',QDetil.FieldValues['nopenjualankirim'],'Pengiriman Barang, No. '+kodesj,hpp*FieldValues['qty']*FieldValues['nilai'],0);   }
                
                  end;
                  DM.InsertBukuBesarAkun(FieldValues['noakunterkirim'],tanggalserver,'SJ',QDetil.FieldValues['nopenjualankirim'],'Pengiriman Barang, No. '+kodesj,FieldValues['subtotal'],0);
                  DM.InsertBukuBesarAkun(FieldValues['noakunpenjualan'],tanggalserver,'SJ',QDetil.FieldValues['nopenjualankirim'],'Pengiriman Barang, No. '+kodesj,0,FieldValues['dppbarang']);
                  if FieldValues['ppnbarang'] > 0 then
                    DM.InsertBukuBesarAkun(FieldValues['akunpajakpenjualanblm'],tanggalserver,'SJ',QDetil.FieldValues['nopenjualankirim'],'Pengiriman Barang, No. '+kodesj,0,FieldValues['ppnbarang']);

                  Next;
                end;
              end;
              dm.con.Commit;
              Screen.Cursor := crDefault;
            except
              on E: Exception do begin
                dm.con.Rollback;
                MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
              end;
            end;
          end;
          Free;
        end;
        dm.Q_NotaPenjualanDO.Close;
        DM.Q_NotaPenjualanDO.ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
        DM.Q_NotaPenjualanDO.Open;
        DM.Nota_SJ.ShowReport(True);
        RefreshQ;
      end;
    end else begin
      MessageDlg('Transaksi Order Penjualan telah disetujui!',mtError,[mbOK],0);
    end;
  end;
end;

procedure TFrm_DaftarPengirimanBarang.RzBitBtn1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if (notabel = 0) and (nogrid = 1) then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopenjualanorder'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'DO';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal Voucher';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end else if (notabel = 1) and (nogrid = 0) then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QDetil.FieldValues['nopenjualankirim'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'SJ';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal Voucher';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end else if (notabel = 1) and (nogrid = 2) then begin
    if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
      dm.Q_JurnalVoucher.Close;
      DM.Q_JurnalVoucher.ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      DM.Q_JurnalVoucher.ParamByName('t').Value := 'SA';
      DM.Q_JurnalVoucher.Open;
      t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
      t.Memo.Text := 'Jurnal Voucher';
      DM.Rpt_JurnalVoucher.ShowReport(True);
    end;
  end;
end;

procedure TFrm_DaftarPengirimanBarang.BtnVariabelClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_Variabel, Frm_Variabel);
  Frm_Variabel.ClearText;
  with TZQuery.Create(Self)do begin
    Connection := dm.Con;
    Close;
    SQL.Text := 'select ifnull(kodefaktur,'+QuotedStr('')+')as kodefaktur from tbl_penjualaninvoice where nopenjualaninvoice=:np';
    ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
    Open;
    Frm_Variabel.txtkode.Text := FieldValues['kodefaktur'];
    if Frm_Variabel.ShowModal = mrok then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_penjualaninvoice set kodefaktur=:a where nopenjualaninvoice=:np';
      ParamByName('np').Value := QDetil.FieldValues['nopenjualaninvoice'];
      ParamByName('a').Value := Frm_Variabel.txtkode.Text;
      ExecSQL;
    end;
    Free;
  end;
  RefreshQ;
end;

end.
