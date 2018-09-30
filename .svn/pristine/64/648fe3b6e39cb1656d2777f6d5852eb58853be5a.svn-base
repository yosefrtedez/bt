unit UMenuPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzGroupBar, StdCtrls, RzLabel, frxpngimage,
  RzButton, cxPC;

type
  TFrm_MenuPembelian = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    BtnPembelian: TRzToolButton;
    RzPanel2: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    Image1: TImage;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzPanel4: TRzPanel;
    BtnHutangUsaha: TRzToolButton;
    BtnPembayaran: TRzToolButton;
    RzLabel3: TRzLabel;
    BtnPurchaseOrder: TRzToolButton;
    BtnPermintaanBarang: TRzToolButton;
    BtnRetur: TRzToolButton;
    BtnAPInvoice: TRzToolButton;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    procedure BtnPermintaanBarangClick(Sender: TObject);
    procedure BtnPurchaseOrderClick(Sender: TObject);
    procedure BtnPembelianClick(Sender: TObject);
    procedure RzLabel2Click(Sender: TObject);
    procedure RzLabel2MouseEnter(Sender: TObject);
    procedure RzLabel2MouseLeave(Sender: TObject);
    procedure BtnPembayaranClick(Sender: TObject);
    procedure RzLabel1MouseEnter(Sender: TObject);
    procedure RzLabel1MouseLeave(Sender: TObject);
    procedure RzLabel1Click(Sender: TObject);
    procedure BtnHutangUsahaClick(Sender: TObject);
    procedure BtnReturClick(Sender: TObject);
    procedure RzLabel3Click(Sender: TObject);
    procedure RzLabel3MouseEnter(Sender: TObject);
    procedure RzLabel3MouseLeave(Sender: TObject);
    procedure BtnAPInvoiceClick(Sender: TObject);
    procedure RzLabel4MouseEnter(Sender: TObject);
    procedure RzLabel4MouseLeave(Sender: TObject);
    procedure RzLabel4Click(Sender: TObject);
    procedure RzLabel5MouseEnter(Sender: TObject);
    procedure RzLabel5MouseLeave(Sender: TObject);
    procedure RzLabel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MenuPembelian: TFrm_MenuPembelian;

implementation

uses UDM, UMain, UPembelianRequest, UPembelianOrder, UPembelian, UDaftarPembelian, UPembayaranHutang,
      UDaftarPembayaranHutang, UDaftarHutang, UAPInvoice, UReturPembelian, UDaftarReturPembelian, UDaftarPembelianRequest, UDaftarPembelianOrder;

{$R *.dfm}

procedure TFrm_MenuPembelian.BtnPermintaanBarangClick(Sender: TObject);
var
  f: TFrm_PembelianRequest;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Permintaan Pembelian') then begin
    f := TFrm_PembelianRequest.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.BtnPurchaseOrderClick(Sender: TObject);
var
  f: TFrm_PembelianOrder;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian2')=False then begin
    MessageDlg('You do not have access !',mtError,[mbOK],0);
    Exit;
  end;                   
  if not DM.CekTabOpen('Order Pembelian') then begin
    f := TFrm_PembelianOrder.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.BtnPembelianClick(Sender: TObject);
var
  f: TFrm_Pembelian;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Penerimaan Pembelian') then begin
    f := TFrm_Pembelian.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel2Click(Sender: TObject);
var
  f: TFrm_DaftarPembelian;
  ts: TcxTabSheet;
begin
  if (DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian3')=False) or (DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian4')=False) then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Pembelian') then begin
    f := TFrm_DaftarPembelian.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel2MouseEnter(Sender: TObject);
begin
  RzLabel2.Font.Style := [fsBold,fsUnderline];
  RzLabel2.Cursor := crHandPoint;
end;

procedure TFrm_MenuPembelian.RzLabel2MouseLeave(Sender: TObject);
begin
  RzLabel2.Font.Style := [];
  RzLabel2.Cursor := crDrag;
end;

procedure TFrm_MenuPembelian.BtnPembayaranClick(Sender: TObject);
var
  f: TFrm_PembayaranHutang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Pembayaran Hutang Usaha') then begin
    f := TFrm_PembayaranHutang.Create(Self);
    f.ClearText;
    f.dbgpembayaran.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel1MouseEnter(Sender: TObject);
begin
  RzLabel1.Font.Style := [fsBold,fsUnderline];
  RzLabel1.Cursor := crHandPoint;
end;

procedure TFrm_MenuPembelian.RzLabel1MouseLeave(Sender: TObject);
begin
  RzLabel1.Font.Style := [];
  RzLabel1.Cursor := crDrag;
end;

procedure TFrm_MenuPembelian.RzLabel1Click(Sender: TObject);
var
  f: TFrm_DaftarPembayaranHutangUsaha;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian7')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Pembayaran Hutang Usaha') then begin
    f := TFrm_DaftarPembayaranHutangUsaha.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.BtnHutangUsahaClick(Sender: TObject);
var
  f: TFrm_DaftarHutang;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;                   
  if not DM.CekTabOpen('Daftar Hutang Usaha') then begin
    f := TFrm_DaftarHutang.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.BtnReturClick(Sender: TObject);
var
  f: TFrm_ReturPembelian;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Retur Pembelian') then begin
    f := TFrm_ReturPembelian.Create(Self);
    f.ClearText;
    f.dbgbarang.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel3Click(Sender: TObject);
var
  f: TFrm_DaftarReturPembelian;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian5')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Retur Pembelian') then begin
    f := TFrm_DaftarReturPembelian.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel3MouseEnter(Sender: TObject);
begin
  RzLabel3.Font.Style := [fsBold,fsUnderline];
  RzLabel3.Cursor := crHandPoint;
end;

procedure TFrm_MenuPembelian.RzLabel3MouseLeave(Sender: TObject);
begin
  RzLabel3.Font.Style := [];
  RzLabel3.Cursor := crDrag;
end;

procedure TFrm_MenuPembelian.BtnAPInvoiceClick(Sender: TObject);
var
  f: TFrm_APInvoice;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Account Payable') then begin
    f := TFrm_APInvoice.Create(Self);
    f.ClearText;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel4MouseEnter(Sender: TObject);
begin
  RzLabel4.Font.Style := [fsBold,fsUnderline];
  RzLabel4.Cursor := crHandPoint;
end;

procedure TFrm_MenuPembelian.RzLabel4MouseLeave(Sender: TObject);
begin
  RzLabel4.Font.Style := [];
  RzLabel4.Cursor := crDrag;
end;

procedure TFrm_MenuPembelian.RzLabel4Click(Sender: TObject);
var
  f: TFrm_DaftarPembelianRequest;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Permintaan Pembelian') then begin
    f := TFrm_DaftarPembelianRequest.Create(Self);
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuPembelian.RzLabel5MouseEnter(Sender: TObject);
begin
  RzLabel5.Font.Style := [fsBold,fsUnderline];
  RzLabel5.Cursor := crHandPoint;
end;

procedure TFrm_MenuPembelian.RzLabel5MouseLeave(Sender: TObject);
begin
  RzLabel5.Font.Style := [];
  RzLabel5.Cursor := crDrag;
end;

procedure TFrm_MenuPembelian.RzLabel5Click(Sender: TObject);
var
  f: TFrm_DaftarPembelianOrder;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Order Pembelian') then begin
    f := TFrm_DaftarPembelianOrder.Create(Self);
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian8')=False then
      f.BtnApprove.Visible := False
    else f.BtnApprove.Visible := True;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
