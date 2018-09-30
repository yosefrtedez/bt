unit UDaftarPenjualanTunai;

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
  RzButton, ExtCtrls, RzPanel, cxPC, frxClass;

type
  TFrm_DaftarPenjualanTunai = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    BtnCetak: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodepenjualanorder: TcxGridDBColumn;
    dbgdataDBTableView1tgltransaksi: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopenjualantunai: TLargeintField;
    QDatakodepenjualantunai: TStringField;
    QDatanokontak: TLargeintField;
    QDatatgltransaksi: TDateField;
    QDatanogudang: TLargeintField;
    QDatanokas: TLargeintField;
    QDatanosales: TLargeintField;
    QDatapocustomer: TStringField;
    QDatatotaldpp: TFloatField;
    QDatatotalpajak: TFloatField;
    QDatabiayalain: TFloatField;
    QDatanoakunbiayalain: TLargeintField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDatanamakontak: TStringField;
    BtnVariabel: TRzBitBtn;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure BtnVariabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPenjualanTunai: TFrm_DaftarPenjualanTunai;
  datedari,datesampai:string;

implementation

uses UDM, UPenjualanTunai, UFTanggal, UMain, UInputFakturPajak;

{$R *.dfm}

{ TFrm_DaftarPenjualanTunai }

procedure TFrm_DaftarPenjualanTunai.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPenjualanTunai.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPenjualanTunai.BtnHapusClick(Sender: TObject);
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
  if MessageDlg('Apakah anda ingin menghapus transaksi ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:a and tipe=:b';
      ParamByName('a').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('b').Value := 'SP';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('t').Value := 'SP';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('t').Value := 'SP';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:a and tipe=:b';
      ParamByName('a').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('b').Value := 'SP';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:a and tipe=:b';
      ParamByName('a').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('b').Value := 'SP';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_penjualantunai where nopenjualantunai=:np';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_penjualantunaidetail where nopenjualantunai=:np';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarPenjualanTunai.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarPenjualanTunai.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPenjualanTunai.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPenjualanTunai.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
    ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
    ParamByName('t').Value := 'SP';
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
      ParamByName('a').Value := QData.FieldValues['nopenjualantunai'];;
      ParamByName('b').Value := 'SP';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];;
      ParamByName('t').Value := 'SP';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end;
    Free;
    dm.Q_NotaPenjualanTunai.Close;
    DM.Q_NotaPenjualanTunai.ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];;
    DM.Q_NotaPenjualanTunai.Open;
    dm.Q_NotaTerbilang.Close;
    DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];;
    DM.Q_NotaTerbilang.ParamByName('t').Value := 'SP';
    DM.Q_NotaTerbilang.Open;
    DM.Nota_PenjualanTunai.ShowReport(True);
  end;
end;

procedure TFrm_DaftarPenjualanTunai.dbgdataDBTableView1DblClick(
  Sender: TObject);
var
  i: Integer;
  g: TFrm_PenjualanTunai;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('AR Invoice + Payment') then begin
    g := TFrm_PenjualanTunai.Create(Self);
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
                    '(SELECT a.*,b.namaakun FROM ' +
                    '(SELECT a.*,IFNULL(b.namagudang,'+QuotedStr('Gudang Utama')+')AS namagudang FROM ' +
                    '(SELECT * FROM tbl_penjualantunai where nopenjualantunai=:np)AS a ' +
                    'LEFT JOIN tbl_gudang AS b ON b.nogudang=a.nogudang)as a ' +
                    'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokas)as a ' +
                    'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
        ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
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
    g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    g.Show;

    ts := (g.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarPenjualanTunai.RzBitBtn1Click(Sender: TObject);
var
  t:TfrxMemoView;
begin
  if QData.IsEmpty then Exit;
  if MessageDlg('Cetak Jurnal Voucher ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    dm.Q_JurnalVoucher.Close;
    DM.Q_JurnalVoucher.ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
    DM.Q_JurnalVoucher.ParamByName('t').Value := 'SP';
    DM.Q_JurnalVoucher.Open;
    t := TfrxMemoView(DM.Rpt_JurnalVoucher.FindObject('Memo1'));
    t.Memo.Text := 'Jurnal Voucher';
    DM.Rpt_JurnalVoucher.ShowReport(True);
  end;

end;

procedure TFrm_DaftarPenjualanTunai.BtnVariabelClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_Variabel, Frm_Variabel);
  Frm_Variabel.ClearText;
  with TZQuery.Create(Self)do begin
    Connection := dm.Con;
    Close;
    SQL.Text := 'select ifnull(kodefaktur,'+QuotedStr('')+')as kodefaktur from tbl_penjualantunai where nopenjualantunai=:np';
    ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
    Open;
    Frm_Variabel.txtkode.Text := FieldValues['kodefaktur'];
    if Frm_Variabel.ShowModal = mrok then begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_penjualantunai set kodefaktur=:a where nopenjualantunai=:np';
      ParamByName('np').Value := QData.FieldValues['nopenjualantunai'];
      ParamByName('a').Value := Frm_Variabel.txtkode.Text;
      ExecSQL;
    end;
    Free;
  end;
  RefreshQ;
end;

end.
