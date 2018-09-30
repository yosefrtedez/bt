unit UDaftarPencairanDeposit;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, ExtCtrls, RzPanel, cxPC;

type
  TFrm_DaftarPencairanDeposit = class(TForm)
    RzPanel1: TRzPanel;
    BtnUpdate: TRzToolButton;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnCair: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanoreferensi: TLargeintField;
    QDatatipe: TStringField;
    QDatakodereferensi: TStringField;
    QDatatglbayar: TDateField;
    QDatatotal: TFloatField;
    QDatanokas: TLargeintField;
    QDatanokastransit: TLargeintField;
    QDataketerangan: TStringField;
    dbgdataDBTableView1kodereferensi: TcxGridDBColumn;
    dbgdataDBTableView1tglbayar: TcxGridDBColumn;
    dbgdataDBTableView1total: TcxGridDBColumn;
    dbgdataDBTableView1keterangan: TcxGridDBColumn;
    Q1: TZQuery;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure BtnCairClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
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
  Frm_DaftarPencairanDeposit: TFrm_DaftarPencairanDeposit;

implementation

uses UDM, UPembayaranHutang, UPembayaranPiutang, UTransferKas, UInputLoan,
  UMain;

{$R *.dfm}

procedure TFrm_DaftarPencairanDeposit.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPencairanDeposit.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DaftarPencairanDeposit.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_PembayaranHutang;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if QData.FieldValues['tipe'] = 'CD' then begin
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
          ParamByName('np').Value := QData.FieldValues['noreferensi'];
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
          if FieldValues['approve']=1 then BtnRekam.Visible := False;
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
  end else if QData.FieldValues['tipe'] = 'TR' then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas1')=False then begin
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
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas4')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
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
  end;
end;

procedure TFrm_DaftarPencairanDeposit.BtnCairClick(Sender: TObject);
var
  koderef,tipee: string;
  noref: Integer;
begin
  if QData.IsEmpty then Exit;
  if MessageDlg('Proses ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    koderef := DM.GenerateKodeTransaksi('DC',Date);
    noref := DM.GenerateNoMaster('depositcair');
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
      ParamByName('a').Value := 'DC';
      ParamByName('b').Value := Date;
      ParamByName('c').Value := koderef;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Text := 'insert into tbl_pencairaindeposit values (:a,:b,:c,:d,:e,:f,:g)';
      ParamByName('a').Value := noref;
      ParamByName('b').Value := koderef;
      ParamByName('c').Value := tipee;
      ParamByName('d').Value := QData.FieldValues['noreferensi'];
      ParamByName('e').Value := Date;
      ParamByName('f').Value := QData.FieldValues['total'];
      ParamByName('g').Value := Frm_Main.txtuser.Caption;
      ExecSQL;
      Free;
    end;
    if QData.FieldValues['tipe']='CD' then begin
      tipee := 'CD';
      DM.InsertBukuBesarAkun(QData.FieldValues['nokastransit'],Date,'DC',noref,'Pencairan Deposit,'+koderef,QData.FieldValues['total'],0);
      DM.InsertBukuBesarAkun(QData.FieldValues['nokas'],Date,'DC',noref,'Pencairan Deposit,'+koderef,0,QData.FieldValues['total']);
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pembayaranhutang set cair=:ap where nopembayaranhutang=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        ParamByName('ap').Value := 1;
        ExecSQL;
        Free;
      end;
    end else if QData.FieldValues['tipe']='CA' then begin
      tipee := 'CA';
      DM.InsertBukuBesarAkun(QData.FieldValues['nokastransit'],Date,'DC',noref,'Pencairan Deposit,'+koderef,QData.FieldValues['total'],0);
      DM.InsertBukuBesarAkun(QData.FieldValues['nokas'],Date,'DC',noref,'Pencairan Deposit,'+koderef,0,QData.FieldValues['total']);
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_loan set cair=:ap where noloan=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        ParamByName('ap').Value := 1;
        ExecSQL;
        Free;
      end;
    end else if QData.FieldValues['tipe']='TR' then begin
      tipee := 'TR';
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'select * from tbl_transferkas where noreferensi=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        Open;

        DM.InsertBukuBesarAkun(FieldValues['nokastransit'],Date,'DC',noref,'Pencairan Deposit,'+koderef,FieldValues['nilai'],0);
        DM.InsertBukuBesarAkun(FieldValues['nokasketransit'],Date,'DC',noref,'Pencairan Deposit,'+koderef,0,FieldValues['nilai']);

        DM.InsertBukuBesarAkun(FieldValues['nokasdari'],Date,'DC',noref,'Pencairan Deposit,'+koderef,0,FieldValues['nilai']);
        DM.InsertBukuBesarAkun(FieldValues['nokaske'],Date,'TR',noref,'Pencairan Deposit,'+koderef,FieldValues['nilai'],0);
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_transferkas set cair=:ap where noreferensi=:a';
        ParamByName('a').Value := QData.FieldValues['noreferensi'];
        ParamByName('ap').Value := 1;
        ExecSQL;
        Free;
      end;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DaftarPencairanDeposit.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPencairanDeposit.dbgdataDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  BtnPerincianClick(nil);
end;

end.
