unit UMenuKasBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls,
  RzLabel, frxpngimage, ExtCtrls, RzButton, RzPanel, cxPC;

type
  TFrm_MenuKasBank = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    BtnKasKeluar: TRzToolButton;
    BtnKasMasuk: TRzToolButton;
    BtnTransfer: TRzToolButton;
    RzPanel3: TRzPanel;
    RzGroupBox5: TRzGroupBox;
    Image3: TImage;
    RzPanel4: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ZQuery1: TZQuery;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    BtnLoan: TRzToolButton;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    procedure BtnKasMasukClick(Sender: TObject);
    procedure RzLabel1Click(Sender: TObject);
    procedure RzLabel1MouseEnter(Sender: TObject);
    procedure RzLabel1MouseLeave(Sender: TObject);
    procedure RzLabel3Click(Sender: TObject);
    procedure RzLabel3MouseEnter(Sender: TObject);
    procedure RzLabel3MouseLeave(Sender: TObject);
    procedure BtnKasKeluarClick(Sender: TObject);
    procedure RzLabel4MouseEnter(Sender: TObject);
    procedure RzLabel2MouseEnter(Sender: TObject);
    procedure RzLabel4MouseLeave(Sender: TObject);
    procedure RzLabel2MouseLeave(Sender: TObject);
    procedure RzLabel4Click(Sender: TObject);
    procedure RzLabel2Click(Sender: TObject);
    procedure BtnTransferClick(Sender: TObject);
    procedure BtnLoanClick(Sender: TObject);
    procedure RzLabel5MouseEnter(Sender: TObject);
    procedure RzLabel5MouseLeave(Sender: TObject);
    procedure RzLabel5Click(Sender: TObject);
    procedure RzLabel6MouseEnter(Sender: TObject);
    procedure RzLabel6MouseLeave(Sender: TObject);
    procedure RzLabel6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MenuKasBank: TFrm_MenuKasBank;

implementation

uses  UInputPenerimaanLain, UDaftarPenerimaanLain, UMain, UDM, UDaftarGiroMasuk, UDaftarPengeluaranLain, UInputPengeluaranLain, UDaftarGiroKeluar,
      UTransferKas, UDaftarLoan, UDaftarPencairanDeposit, UDaftarTransferKas;

{$R *.dfm}

procedure TFrm_MenuKasBank.BtnKasMasukClick(Sender: TObject);
var
  f: TFrm_InputPenerimaanLain;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Penerimaan Kas') then begin
    f := TFrm_InputPenerimaanLain.Create(Self);
    f.ClearText;
    f.dbgdata.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel1Click(Sender: TObject);
var
  f: TFrm_DaftarPenerimaanLain;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Transaksi Penerimaan Kas') then begin
    f := TFrm_DaftarPenerimaanLain.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel1MouseEnter(Sender: TObject);
begin
  RzLabel1.Font.Style := [fsBold,fsUnderline];
  RzLabel1.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel1MouseLeave(Sender: TObject);
begin
  RzLabel1.Font.Style := [];
  RzLabel1.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.RzLabel3Click(Sender: TObject);
var
  f: TFrm_DaftarGiroMasuk;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Giro Masuk') then begin
    f := TFrm_DaftarGiroMasuk.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel3MouseEnter(Sender: TObject);
begin
  RzLabel3.Font.Style := [fsBold,fsUnderline];
  RzLabel3.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel3MouseLeave(Sender: TObject);
begin
  RzLabel3.Font.Style := [];
  RzLabel3.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.BtnKasKeluarClick(Sender: TObject);
var
  f: TFrm_InputPengeluaranLain;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pengeluaran Kas') then begin
    f := TFrm_InputPengeluaranLain.Create(Self);
    f.ClearText;
    f.dbgdata.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel4MouseEnter(Sender: TObject);
begin
  RzLabel4.Font.Style := [fsBold,fsUnderline];
  RzLabel4.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel2MouseEnter(Sender: TObject);
begin
  RzLabel2.Font.Style := [fsBold,fsUnderline];
  RzLabel2.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel4MouseLeave(Sender: TObject);
begin
  RzLabel4.Font.Style := [];
  RzLabel4.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.RzLabel2MouseLeave(Sender: TObject);
begin
  RzLabel2.Font.Style := [];
  RzLabel2.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.RzLabel4Click(Sender: TObject);
var
  f: TFrm_DaftarPengeluaranLain;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Transaksi Pengeluaran Kas') then begin
    f := TFrm_DaftarPengeluaranLain.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);     
    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel2Click(Sender: TObject);
var
  f: TFrm_DaftarGiroKeluar;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas8')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Giro Keluar') then begin
    f := TFrm_DaftarGiroKeluar.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.BtnTransferClick(Sender: TObject);
var
  referensi: Integer;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_TransferKas, Frm_TransferKas);
  Frm_TransferKas.ClearText;
  if Frm_TransferKas.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      referensi := dm.GenerateNoMaster('transferkas');
      Close;
      // masuk ke tabel jurnal umum
      SQL.Text := 'insert into tbl_transferkas values (:a,:b,:c,:d,:e,:f,:ff,:g,:h,:i,:j,:k)';
      ParamByName('a').Value := referensi;
      ParamByName('b').Value := FormatDateTime('yyyy-mm-dd',Frm_TransferKas.dtptanggal.Date);
      ParamByName('c').Value := Frm_TransferKas.txtketerangan.Text;
      ParamByName('d').Value := Frm_TransferKas.LKasDari.Caption;
      ParamByName('e').Value := Frm_TransferKas.LKasTransit.Caption;
      ParamByName('f').Value := Frm_TransferKas.LKasKe.Caption;
      ParamByName('ff').Value := Frm_TransferKas.LKasKeTransit.Caption;
      ParamByName('g').Value := Frm_TransferKas.txtjumlah.Value;
      ParamByName('h').Value := 0;
      ParamByName('i').Value := 0;
      ParamByName('j').Value := 0;
      ParamByName('k').Value := Frm_Main.txtuser.Caption;
      ExecSQL;
      if MessageDlg('Cetak ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_terbilang where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := referensi;
        ParamByName('t').Value := 'TR';
        Open;
        if IsEmpty then begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_terbilang values (:a,:b,:c)';
          ParamByName('a').Value := referensi;
          ParamByName('b').Value := 'TR';
          ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(Frm_TransferKas.txtjumlah.IntValue));
          ExecSQL;
        end else begin
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_terbilang set terbilang=:c where noreferensi=:np and tipe=:t';
          ParamByName('np').Value := referensi;
          ParamByName('t').Value := 'TR';
          ParamByName('c').Value := DM.ConvKeHuruf(IntToStr(Frm_TransferKas.txtjumlah.IntValue));
          ExecSQL;
        end;
        dm.Q_NotaPenerimaanKas.Close;
        DM.Q_NotaPenerimaanKas.ParamByName('np').Value := referensi;
        DM.Q_NotaPenerimaanKas.Open;
        dm.Q_NotaTerbilang.Close;
        DM.Q_NotaTerbilang.ParamByName('np').Value := referensi;
        DM.Q_NotaTerbilang.ParamByName('t').Value := 'TR';
        DM.Q_NotaTerbilang.Open;
        DM.Nota_PenerimaanKas.ShowReport(True);
      end;
      Free;
    end;
  end;
end;

procedure TFrm_MenuKasBank.BtnLoanClick(Sender: TObject);
var
  f: TFrm_DaftarKasbon;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Rincian Cash Advance') then begin
    f := TFrm_DaftarKasbon.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel5MouseEnter(Sender: TObject);
begin
  RzLabel5.Font.Style := [fsBold,fsUnderline];
  RzLabel5.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel5MouseLeave(Sender: TObject);
begin
  RzLabel5.Font.Style := [];
  RzLabel5.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.RzLabel5Click(Sender: TObject);
var
  f: TFrm_DaftarPencairanDeposit;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Pencairan Deposit') then begin
    f := TFrm_DaftarPencairanDeposit.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuKasBank.RzLabel6MouseEnter(Sender: TObject);
begin
  RzLabel6.Font.Style := [fsBold,fsUnderline];
  RzLabel6.Cursor := crHandPoint;
end;

procedure TFrm_MenuKasBank.RzLabel6MouseLeave(Sender: TObject);
begin
  RzLabel6.Font.Style := [];
  RzLabel6.Cursor := crDrag;
end;

procedure TFrm_MenuKasBank.RzLabel6Click(Sender: TObject);
var
  f: TFrm_DaftarTransfer;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Kas1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Transaksi Transfer Kas/Bank') then begin
    f := TFrm_DaftarTransfer.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
