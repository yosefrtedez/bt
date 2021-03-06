unit UMenuBukuBesar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzPanel, ExtCtrls, cxPC;

type
  TFrm_MenuBukuBesar = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    BtnBukuBesar: TRzToolButton;
    BtnMenu: TRzToolButton;
    BtnJurnalUmum: TRzToolButton;
    procedure BtnMenuClick(Sender: TObject);
    procedure BtnJurnalUmumClick(Sender: TObject);
    procedure BtnBukuBesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MenuBukuBesar: TFrm_MenuBukuBesar;

implementation

uses UDaftarJurnalUmum, UDM, UMain, UInputJurnalUmum, UBukuBesar;

{$R *.dfm}

procedure TFrm_MenuBukuBesar.BtnMenuClick(Sender: TObject);
var
  f: TFrm_DaftarJurnalUmum;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'BukuBesar3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Daftar Transaksi Jurnal Memorial') then begin
    f := TFrm_DaftarJurnalUmum.Create(Self);
    f.RefreshQ;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuBukuBesar.BtnJurnalUmumClick(Sender: TObject);
var
  f: TFrm_InputJurnalUmum;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'BukuBesar1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Jurnal Memorial') then begin
    f := TFrm_InputJurnalUmum.Create(Self);
    f.ClearText;
    f.dbgpembayaran.AddRow();
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_MenuBukuBesar.BtnBukuBesarClick(Sender: TObject);
var
  f: TFrm_BukuBesar;
  ts: TcxTabSheet;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'BukuBesar2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Buku Besar') then begin
    f := TFrm_BukuBesar.Create(Self);
    akunbuku := 0;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

end.
