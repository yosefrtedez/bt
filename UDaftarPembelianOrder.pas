unit UDaftarPembelianOrder;

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
  RzButton, ExtCtrls, RzPanel, cxCheckBox, frxClass, Menus, StdCtrls;

type
  TFrm_DaftarPembelianOrder = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    BtnCetak: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopembelianorder: TLargeintField;
    QDatakodepembelianorder: TStringField;
    QDatanokontak: TLargeintField;
    QDatanopembelianrequest: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDataselesai: TSmallintField;
    QDatakodepembelianrequest: TStringField;
    QDatanamakontak: TStringField;
    dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1hasilkali: TcxGridDBColumn;
    dbgdataDBTableView1Pos: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1kodepembelianrequest: TcxGridDBColumn;
    QDatatotalpajak: TFloatField;
    QDatatotaldpp: TFloatField;
    QDatabiayalain: TFloatField;
    QDatapph: TFloatField;
    QDataapprove: TSmallintField;
    QDatatglapprove: TDateTimeField;
    QDatadiskonday: TIntegerField;
    QDataduedate: TIntegerField;
    QDataearlydiskon: TFloatField;
    QDatalatecharge: TFloatField;
    PopupMenu1: TPopupMenu;
    CekPO1: TMenuItem;
    BtnApprove: TRzBitBtn;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure dbgdataDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dbgdataDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure CekPO1Click(Sender: TObject);
    procedure BtnApproveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPembelianOrder: TFrm_DaftarPembelianOrder;
  datedari,datesampai:string;
  nogrid: Integer;

implementation

uses UDM, UPembelianOrder, UFTanggal, UMain, UPembelianRequest, UPembelian, UDataPembelianOrderTerima;

{$R *.dfm}

procedure TFrm_DaftarPembelianOrder.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPembelianOrder.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPembelianOrder.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(QData.FieldValues['tgltransaksi'])= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;     }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM tbl_pembelianterima WHERE nopembelianorder=:np';
    ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
    Open;
    if not IsEmpty then begin
      MessageDlg('Pembelian Order tidak dapat dihapus, karena sebagian barang telah diterima!',mtError,[mbOK],0);
    end else begin
      if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'delete from tbl_pembelianorder where nopembelianorder=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_tbl_pembelianorderdetail where nopembelianorder=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
          ExecSQL;
          Free;
        end;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarPembelianOrder.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  nogrid := -1;
  RefreshQ;
end;

procedure TFrm_DaftarPembelianOrder.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPembelianOrder.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPembelianOrder.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_PembelianOrder;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Order Pembelian') then begin
    f := TFrm_PembelianOrder.Create(Self);
    with f do begin
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
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_DaftarPembelianOrder.BtnCetakClick(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
    ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
    ParamByName('t').Value := 'PO';
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
      ParamByName('a').Value := QData.FieldValues['nopembelianorder'];
      ParamByName('b').Value := 'PO';
      ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['total']));
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
      ParamByName('t').Value := 'PO';
      ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['total']));
      ExecSQL;
    end;
    dm.Q_NotaPembelianPO.Close;
    DM.Q_NotaPembelianPO.ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
    DM.Q_NotaPembelianPO.Open;
    dm.Q_NotaTerbilang.Close;
    DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
    DM.Q_NotaTerbilang.ParamByName('t').Value := 'PO';
    DM.Q_NotaTerbilang.Open;
    t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo1'));
    if QData.FieldValues['approve'] = 1 then begin
      t.Memo.Text := 'Order Pembelian';
      t.Font.Size := 18;
    end else begin
      t.Memo.Text := 'Order Pembelian Proforma';
      t.Font.Size := 14;
    end;
    t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo40'));
    if QData.FieldValues['approve'] = 1 then begin
      t.Memo.Text := 'Purchasing';
    end else begin
      t.Memo.Text := 'Dibuat Oleh';
    end;
    t := TfrxMemoView(DM.Nota_PembelianPO.FindObject('Memo33'));
    if QData.FieldValues['approve'] = 1 then begin
      t.Memo.Text := 'Supplier';
    end else begin
      t.Memo.Text := 'Disetujui Oleh';
    end;
    DM.Nota_PembelianPO.ShowReport(True);
    Free;
  end;
end;

procedure TFrm_DaftarPembelianOrder.dbgdataDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  nogrid := ACellViewInfo.Item.Index;
end;

procedure TFrm_DaftarPembelianOrder.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
  f: TFrm_PembelianRequest;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if nogrid = 1 then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian1')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Permintaan Pembelian') then begin
      f := TFrm_PembelianRequest.Create(Self);
      with f do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tglpembelianrequest'])=0 then begin
          dtpdibuat.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Text := 'SELECT * FROM tbl_pembelianrequest WHERE nopembelianrequest=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
          Open;
          LID.Caption := FieldValues['nopembelianrequest'];
          txtreferensi.Text := FieldValues['kodepembelianrequest'];
          dtpdibuat.Date := FieldValues['tglpembelianrequest'];
          txtketerangan.Text := FieldValues['catatan'];
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * FROM tbl_pembelianorder WHERE nopembelianrequest=:np';
          ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
          Open;
          if not IsEmpty then LOrder.Caption := '1';
          Close;
          SQL.Clear;
          SQL.Text := 'select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_pembelianrequestdetail where nopembelianrequest=:np)as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan';
          ParamByName('np').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              with dbgbarang do begin
                AddRow();
                Cell[1,i].AsString := FieldValues['kodebarang'];
                Cell[2,i].AsString := FieldValues['namabarang'];
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                if FieldValues['tgldiperlukan'] <> null then
                Cell[5,i].AsDateTime := FieldValues['tgldiperlukan'];
                Cell[6,i].AsString := FieldValues['keteranganbarang'];
                Cell[7,i].AsFloat := CekPO(StrToInt(LID.Caption),FieldValues['nobarang'],FieldValues['nosatuan'])+FieldValues['qty'];
                Cell[8,i].AsInteger := FieldValues['nobarang'];
                Cell[9,i].AsInteger := FieldValues['nosatuan'];
                Cell[10,i].AsFloat := FieldValues['nilai'];
              end;
              Next;
            end;
          end;
          Free;
        end;
      end;
      f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      f.Show;
      ts := (f.parent as TcxTabSheet);
      Frm_Main.PGMain.ActivePage := ts;
    end;
  end else begin
    BtnPerincianClick(nil);
  end;
end;

procedure TFrm_DaftarPembelianOrder.CekPO1Click(Sender: TObject);
var
  f: TFrm_Pembelian;
  ts: TcxTabSheet;
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_DataPembelianOrderTerima, Frm_DataPembelianOrderTerima);
  noorderpembelian := QData.FieldValues['nopembelianorder'];
  Frm_DataPembelianOrderTerima.RefreshQ;
  if Frm_DataPembelianOrderTerima.ShowModal = mrok then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian3')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Penerimaan Barang') then begin
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
          ParamByName('np').Value := Frm_DataPembelianOrderTerima.QData.FieldValues['nopembelianterima'];
          Open;
          LID.Caption := FieldValues['nopembelianterima'];
          txtreferensi.Text := FieldValues['kodepembelianterima'];
          txtsupplier.Text := FieldValues['namakontak'];
          LSupplier.Caption := FieldValues['nokontak'];
          txtpo.Text := FieldValues['kodepembelianorder'];
          LPO.Caption := FieldValues['nopembelianorder'];
          dtpfaktur.Date := FieldValues['tglpembelianterima'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pembelianinvoice where nopembelianterima=:aa';
          ParamByName('aa').Value := LID.Caption;
          Open;
          if not IsEmpty then LPosting.Caption := '1';

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
                Cell[24,i].AsInteger := FieldValues['nopajakpembelianblm'];
                Cell[25,i].AsInteger := FieldValues['nopph'];
                Cell[26,i].AsFloat := FieldValues['nopersenpph'];
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
  end;
end;

procedure TFrm_DaftarPembelianOrder.BtnApproveClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['approve']=0 then begin
    {if DM.CekPlafon(StrToInt(LSupplier.Caption),txttotal.Value)=False then begin
      if MessageDlg('Transaksi ini melebihi batas kredit supplier. Diperlukan Persetujuan!'#10#13'Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)=mrno then begin
        Exit;
      end else cbapprove.Checked := False;
    end else cbapprove.Checked := True; }
    if MessageDlg('Apakah data order pembelian, No. '+QData.FieldValues['kodepembelianorder']+' disetujui ?',mtConfirmation,[mbYes,mbNo],0)= mryes then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.con;
        Close;
        SQL.Text := 'update tbl_pembelianorder set approve=:ab, tglapprove=:aa where nopembelianorder=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianorder'];
        ParamByName('aa').Value := FormatDateTime('yyyy-mm-dd',tanggalserver);
        ParamByName('ab').Value := 1;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end else begin
    MessageDlg('Transaksi Order Pembelian telah disetujui!',mtError,[mbOK],0);
  end;
end;

end.
