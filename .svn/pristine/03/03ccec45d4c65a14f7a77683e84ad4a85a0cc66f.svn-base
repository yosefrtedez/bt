unit UDaftarPembayaranPiutang;

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
  RzButton, ExtCtrls, RzPanel, cxCheckBox;

type
  TFrm_DaftarPembayaranPiutang = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1tglbayar: TcxGridDBColumn;
    dbgdataDBTableView1nokaskeluar: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    QDatanokontak: TLargeintField;
    QDatatglbayar: TDateField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDatanamakontak: TStringField;
    QDatanokas: TLargeintField;
    QDatagiro: TSmallintField;
    DSData: TDataSource;
    Q1: TZQuery;
    QDatanopembayaranpiutang: TLargeintField;
    QDatakodepembayaranpiutang: TStringField;
    BtnCetak: TRzBitBtn;
    QDatatotaldenda: TFloatField;
    QDatanoakundenda: TLargeintField;
    BtnApprove: TRzBitBtn;
    procedure BtnFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure BtnApproveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPembayaranPiutang: TFrm_DaftarPembayaranPiutang;
  datedari,datesampai:string;

implementation

uses UDM, UPembayaranPiutang, UFTanggal, UMain, NxCells;

{$R *.dfm}

{ TFrm_DaftarPembayaranPiutang }

procedure TFrm_DaftarPembayaranPiutang.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPembayaranPiutang.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPembayaranPiutang.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarPembayaranPiutang.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPembayaranPiutang.BtnHapusClick(Sender: TObject);
var
  nopenjualan:string;
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;         }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan11')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  {if MessageDlg('Hapus transaksi ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      if QData.FieldValues['giro'] = 1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
        ParamByName('a').Value := QData.FieldValues['nopembayaranpiutang'];
        ParamByName('b').Value := 'CR';
        Open;
        if FieldValues['posting'] = 1 then begin
          MessageDlg('Data pembayaran piutang tidak dapat dihapus, karena giro telah cair!',mtError,[mbOK],0);
          Free;
          Exit;
        end;
      end;
      if QData.FieldValues['uangmuka']=1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:a';
        ParamByName('a').Value := QData.FieldValues['nopembayaranpiutang'];
        Open;
        First;
        nopenjualan := FieldValues['nopenjualan'];
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_penjualan set uangmuka=0 where nopenjualan=:np';
        ParamByName('np').Value := nopenjualan;
        ExecSQL;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranpiutang where nopembayaranpiutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end; }
  if MessageDlg('Transaksi dibatalkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranpiutang where nopembayaranpiutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarPembayaranPiutang.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_PembayaranPiutang;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pembayaran Piutang Usaha') then begin
    f := TFrm_PembayaranPiutang.Create(Self);
    with f do begin
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
        ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
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
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarPembayaranPiutang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPembayaranPiutang.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarPembayaranPiutang.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
    ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
    ParamByName('t').Value := 'CR';
    Open;
    if IsEmpty then begin
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
      ParamByName('a').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('b').Value := 'CR';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
      ParamByName('t').Value := 'CR';
      ParamByName('c').Value := DM.ConvKeHuruf(FloatToStr(QData.FieldValues['total']));
      ExecSQL;
    end;
    dm.Q_NotaPembayaranPiutang.Close;
    DM.Q_NotaPembayaranPiutang.ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
    DM.Q_NotaPembayaranPiutang.Open;
    dm.Q_NotaTerbilang.Close;
    DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nopembayaranpiutang'];
    DM.Q_NotaTerbilang.ParamByName('t').Value := 'CR';
    DM.Q_NotaTerbilang.Open;
    DM.Nota_PembayaranPiutang.ShowReport(True);
    Free;
  end;
end;

procedure TFrm_DaftarPembayaranPiutang.BtnApproveClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Penjualan10')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['iscancel'] = 0 then begin
    if QData.FieldValues['approve'] = 0 then begin
      if MessageDlg('Penerimaan Pembayaran telah disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        with TZQuery.Create(Self)do begin
          Connection := dm.con;
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,b.tglpenjualaninvoice,b.kodepenjualaninvoice,DATE_ADD(b.tglpenjualaninvoice,INTERVAL b.duedate DAY) AS tgltempo from ' +
                      '(select * from tbl_pembayaranpiutangdetail where nopembayaranpiutang=:nk)as a ' +
                      'left join tbl_penjualaninvoice as b on b.nopenjualaninvoice=a.nopenjualaninvoice';
          ParamByName('nk').Value := QData.FieldValues['nopembayaranpiutang'];
          Open;
          for i:= 0 to RecordCount-1 do begin
            DM.InsertBukuBesarAkun(FieldValues['noakunpiutang'],Date,'CR',QData.FieldValues['nopembayaranpiutang'],'Pembayaran Piutang,'+QData.FieldValues['kodepembayaranpiutang'],0,FieldValues['jumlahbayar']);
            if FieldValues['selisih']>0 then begin
              DM.InsertBukuBesarAkun(FieldValues['noakunselisih'],Date,'CR',QData.FieldValues['nopembayaranpiutang'],'Selisih Pembayaran,'+QData.FieldValues['kodepembayaranpiutang'],0,FieldValues['selisih']);
            end else if FieldValues['selisih']<0 then begin
              DM.InsertBukuBesarAkun(FieldValues['noakunselisih'],Date,'CR',QData.FieldValues['nopembayaranpiutang'],'Selisih Pembayaran,'+QData.FieldValues['kodepembayaranpiutang'],Abs(FieldValues['selisih']),0);
            end;        
          end;
          DM.InsertBukuBesarAkun(QData.FieldValues['nokastransit'],Date,'CR',QData.FieldValues['nopembayaranpiutang'],'Pembayaran Piutang,'+QData.FieldValues['kodepembayaranpiutang'],QData.FieldValues['total'],0);
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_pembayaranpiutang set approve=:ap where nopembayaranpiutang=:a';
          ParamByName('a').Value := QData.FieldValues['nopembayaranpiutang'];
          ParamByName('ap').Value := 1;
          ExecSQL;
          Free;
        end;
        RefreshQ;
      end;
    end;
  end;
end;

end.
