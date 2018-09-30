unit UDaftarPembayaranHutang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxPC, cxTextEdit,
  cxCheckBox;

type
  TFrm_DaftarPembayaranHutangUsaha = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    BtnHapus: TRzBitBtn;
    Q1: TZQuery;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QDatanokontak: TLargeintField;
    QDatatglbayar: TDateField;
    QDatatotal: TFloatField;
    QDatanamauser: TStringField;
    QDatanamakontak: TStringField;
    dbgdataDBTableView1nokaskeluar: TcxGridDBColumn;
    dbgdataDBTableView1tglbayar: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    BtnPerincian: TRzBitBtn;
    QDatanopembayaranhutang: TLargeintField;
    QDatanokas: TLargeintField;
    QDatagiro: TSmallintField;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    QDatakodepembayaranhutang: TStringField;
    BtnCetak: TRzBitBtn;
    QDatanokastransit: TLargeintField;
    QDataapprove: TSmallintField;
    QDatacair: TSmallintField;
    QDataiscancel: TSmallintField;
    dbgdataDBTableView1approve: TcxGridDBColumn;
    dbgdataDBTableView1cair: TcxGridDBColumn;
    dbgdataDBTableView1iscancel: TcxGridDBColumn;
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
  Frm_DaftarPembayaranHutangUsaha: TFrm_DaftarPembayaranHutangUsaha;
  datedari,datesampai:string;

implementation

uses UDM, UPembayaranHutang, UFTanggal, UMain, NxCells;

{$R *.dfm}

{ TFrm_DaftarPembayaranHutangUsaha }

procedure TFrm_DaftarPembayaranHutangUsaha.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnFilterClick(Sender: TObject);
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

procedure TFrm_DaftarPembayaranHutangUsaha.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RzPanel1.Caption := 'Daftar Pembayaran Hutang Usaha';
  RefreshQ;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnSelesaiClick(
  Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end;         }
  {if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      if QData.FieldValues['giro'] = 1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_giro where noreferensi=:a and tipe=:b';
        ParamByName('a').Value := QData.FieldValues['nopembayaranhutang'];
        ParamByName('b').Value := 'CD';
        Open;
        if FieldValues['posting'] = 1 then begin
          MessageDlg('Data pembayaran hutang tidak dapat dihapus, karena giro telah cair!',mtError,[mbOK],0);
          Free;
          Exit;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_bukubesarkontak where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_giro where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranhutang where nopembayaranhutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'delete from tbl_pembayaranhutangdetail where nopembayaranhutang=:np';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ExecSQL;
      Free;
      RefreshQ;
    end;
  end;     }
  if MessageDlg('Transaksi dibatalkan ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    if QData.FieldValues['iscancel'] = 0 then begin
      if QData.FieldValues['approve'] = 0 then begin
        with TZQuery.Create(Self)do begin
          Connection := dm.Con;
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_pembayaranhutang set iscancel=:ic where nopembayaranhutang=:np';
          ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
          ParamByName('ic').Value := 1;
          ExecSQL;
          Free;
          RefreshQ;
        end;
      end else begin
        MessageDlg('Permohonan pembayaran telah disetujui. Transaksi tidak dapat dibatalkan!',mtError,[mbOK],0);
      end;
    end;
  end;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnPerincianClick(
  Sender: TObject);
var
  i:Integer;
  f: TFrm_PembayaranHutang;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pembayaran Hutang Usaha') then begin
    f := TFrm_PembayaranHutang.Create(Self);
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
                    '(SELECT * FROM tbl_pembayaranhutang where nopembayaranhutang=:np)AS a ' +
                    'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak';
        ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
        Open;
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
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['approve'] = 0 then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
      ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
      ParamByName('t').Value := 'CD';
      Open;
      if IsEmpty then begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
        ParamByName('a').Value := QData.FieldValues['nopembayaranhutang'];
        ParamByName('b').Value := 'CD';
        ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['total']));
        ExecSQL;
      end else begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];
        ParamByName('t').Value := 'CD';
        ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(QData.FieldValues['total']));
        ExecSQL;
      end;
      dm.Q_NotaPembayaranHutang.Close;
      DM.Q_NotaPembayaranHutang.ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];;
      DM.Q_NotaPembayaranHutang.Open;
      dm.Q_NotaTerbilang.Close;
      DM.Q_NotaTerbilang.ParamByName('np').Value := QData.FieldValues['nopembayaranhutang'];;
      DM.Q_NotaTerbilang.ParamByName('t').Value := 'CD';
      DM.Q_NotaTerbilang.Open;
      DM.Nota_PembayaranHutang.ShowReport(True);
      Free;
    end;
  end;
end;

procedure TFrm_DaftarPembayaranHutangUsaha.BtnApproveClick(
  Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.FieldValues['iscancel'] = 0 then begin
    if QData.FieldValues['approve'] = 0 then begin
      if MessageDlg('Permohonan Pembayaran telah disetujui ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          with TZQuery.Create(Self)do begin
            Connection := dm.con;
            Close;
            SQL.Clear;
            SQL.Text := 'select a.*,b.tglpembelianinvoice,b.kodepembelianinvoice,DATE_ADD(b.tglpembelianinvoice,INTERVAL b.duedate DAY) AS tgltempo from ' +
                        '(select * from tbl_pembayaranhutangdetail where nopembayaranhutang=:nk)as a ' +
                        'left join tbl_pembelianinvoice as b on b.nopembelianinvoice=a.nopembelianinvoice';
            ParamByName('nk').Value := QData.FieldValues['nopembayaranhutang'];
            Open;
            for i:= 0 to RecordCount-1 do begin
              DM.InsertBukuBesarAkun(FieldValues['noakunhutang'],Date,'CD',QData.FieldValues['nopembayaranhutang'],'Pembayaran Hutang,'+QData.FieldValues['kodepembayaranhutang'],FieldValues['jumlahbayar'],0);
              if FieldValues['selisih']>0 then begin
                DM.InsertBukuBesarAkun(FieldValues['noakunselisih'],Date,'CD',QData.FieldValues['nopembayaranhutang'],'Selisih Pembayaran,'+QData.FieldValues['kodepembayaranhutang'],FieldValues['selisih'],0);
              end else if FieldValues['selisih']<0 then begin
                DM.InsertBukuBesarAkun(FieldValues['noakunselisih'],Date,'CD',QData.FieldValues['nopembayaranhutang'],'Selisih Pembayaran,'+QData.FieldValues['kodepembayaranhutang'],0,Abs(FieldValues['selisih']));
              end;
            end;
            DM.InsertBukuBesarAkun(QData.FieldValues['nokastransit'],Date,'CD',QData.FieldValues['nopembayaranhutang'],'Pembayaran Hutang,'+QData.FieldValues['kodepembayaranhutang'],0,QData.FieldValues['total']);
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_pembayaranhutang set approve=:ap where nopembayaranhutang=:a';
            ParamByName('a').Value := QData.FieldValues['nopembayaranhutang'];
            ParamByName('ap').Value := 1;
            ExecSQL;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            Free;
          end;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        RefreshQ;
      end;
    end;
  end;
end;

end.
