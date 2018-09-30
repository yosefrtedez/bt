unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ExtCtrls, Menus, cxPC, RzButton, RzPanel, RzStatus, ShellAPI, IniFiles,
  dxGDIPlusClasses, jpeg;

type
  TFrm_Main = class(TForm)
    RzStatusBar1: TRzStatusBar;
    RzClockStatus1: TRzClockStatus;
    RzStatusPane1: TRzStatusPane;
    txtuser: TRzMarqueeStatus;
    RzKeyStatus1: TRzKeyStatus;
    RzKeyStatus2: TRzKeyStatus;
    RzVersionInfoStatus1: TRzStatusPane;
    RzPanel1: TRzPanel;
    RzToolbar1: TRzToolbar;
    BtnData: TRzToolButton;
    BtnPenjualan: TRzToolButton;
    BtnPersediaan: TRzToolButton;
    BtnLaporan: TRzToolButton;
    BtnKas: TRzToolButton;
    BtnPembelian: TRzToolButton;
    PGMain: TcxPageControl;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Password1: TMenuItem;
    Logout1: TMenuItem;
    SetupProgram1: TMenuItem;
    MembukaFileBackup1: TMenuItem;
    BackupData1: TMenuItem;
    N15: TMenuItem;
    Exit1: TMenuItem;
    Setting1: TMenuItem;
    N5: TMenuItem;
    eamViewer1: TMenuItem;
    Windows1: TMenuItem;
    utupSemuaWindowyangTerbuka1: TMenuItem;
    Timer1: TTimer;
    BtnBukuBesar: TRzToolButton;
    cxPageControl1: TcxPageControl;
    AkunPenting1: TMenuItem;
    ChangePassword1: TMenuItem;
    Image1: TImage;
    SaldoAwalAkun1: TMenuItem;
    N1: TMenuItem;
    RzToolButton1: TRzToolButton;
    procedure BtnBukuBesarClick(Sender: TObject);
    procedure BtnKasClick(Sender: TObject);
    procedure BtnDataClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure utupSemuaWindowyangTerbuka1Click(Sender: TObject);
    procedure eamViewer1Click(Sender: TObject);
    procedure MembukaFileBackup1Click(Sender: TObject);
    procedure BackupData1Click(Sender: TObject);
    procedure BtnPembelianClick(Sender: TObject);
    procedure AkunPenting1Click(Sender: TObject);
    procedure BtnPenjualanClick(Sender: TObject);
    procedure BtnPersediaanClick(Sender: TObject);
    procedure ChangePassword1Click(Sender: TObject);
    procedure Password1Click(Sender: TObject);
    procedure BtnLaporanClick(Sender: TObject);
    procedure SetupProgram1Click(Sender: TObject);
    procedure SaldoAwalAkun1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CloseTab(Frm: TForm; Sender: TObject);
    procedure CreatePanel;
    procedure CekTombol(AUser:string);
    procedure HideAllMenu(flag: boolean);
    procedure SettingWewenang;
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses UMenuBukuBesar, UDM, UMenuKasBank, UMenuData, USettingDatabase, USQLExecutive, URestoreBackup, USettingBackup, UMenuPembelian, UAkunPenting,
      UMenuPenjualan, UMenuPersediaan, ULogin, UUser, UMenuLaporan, UReminder, USetupPerusahaan, USaldoAwalAkun;

{$R *.dfm}

procedure TFrm_Main.BtnBukuBesarClick(Sender: TObject);
var
  f: TFrm_MenuBukuBesar;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Buku Besar') then begin
    f := TFrm_MenuBukuBesar.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.BtnKasClick(Sender: TObject);
var
  f: TFrm_MenuKasBank;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Kas Bank') then begin
    f := TFrm_MenuKasBank.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.BtnDataClick(Sender: TObject);
var
  f: TFrm_MenuData;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Data') then begin
    f := TFrm_MenuData.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.CloseTab(Frm: TForm; Sender: TObject);
begin
  Frm.Release;
end;

procedure TFrm_Main.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.CreatePanel;
var
  panel:TRzPanel;
  pagecontrol:TcxPageControl;
  f: TFrm_Reminder;
  ts: TcxTabSheet;    
begin
  PGMain.Free;
  pagecontrol := TcxPageControl.Create(Self);
  with pagecontrol do begin
    pagecontrol.Name := 'PGMain';
    pagecontrol.Align := alClient;
    pagecontrol.Parent := Frm_Main;
    pagecontrol.ShowFrame := True;
    pagecontrol.HotTrack := True;
    //pagecontrol.ParentColor := False;
    pagecontrol.Color := clSkyBlue;
    pagecontrol.LookAndFeel.Kind := lfOffice11;
    pagecontrol.Style := cxPageControl1.Style;
    pagecontrol.Visible := True;
    //pagecontrol.HideTabs := True;
    pagecontrol.Options := [pcoAlwaysShowGoDialogButton,pcoCloseButton,pcoGradient,pcoGradientClientArea,pcoRedrawOnResize];
  end;
  if not DM.CekTabOpen('Reminder') then begin
    f := TFrm_Reminder.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.CekTombol(AUser: string);
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Text := 'select * from tbl_user where namauser=:a';
    ParamByName('a').Value := AUser;
    Open;
    if  FieldValues['aksesdata']=1 then
      BtnData.Visible := True
    else BtnData.Visible := False;
    if  FieldValues['aksespenjualan']=1 then
      BtnPenjualan.Visible := True
    else BtnPenjualan.Visible := False;
    if  FieldValues['aksespembelian']=1 then
      BtnPembelian.Visible := True
    else BtnPembelian.Visible := False;
    if  FieldValues['aksespersediaan']=1 then
      BtnPersediaan.Visible := True
    else BtnPersediaan.Visible := False;
    if  FieldValues['akseskas']=1 then
      BtnKas.Visible := True
    else BtnKas.Visible := False;
    if  FieldValues['aksesbukubesar']=1 then
      BtnBukuBesar.Visible := True
    else BtnBukuBesar.Visible := False;
    if  FieldValues['akseslaporan']=1 then
      BtnLaporan.Visible := True
    else BtnLaporan.Visible := False;
    Free;
  end;
  
end;

procedure TFrm_Main.HideAllMenu(flag: boolean);
var
  i: integer;
begin
  for i := 0 to Frm_Main.ComponentCount - 1 do begin
    if Components[i].ClassName = 'TMenuItem' then
      (Components[i] as TMenuItem).Visible := Not Flag;
  end;
end;

procedure TFrm_Main.SettingWewenang;
var
  i: integer;
  namaKomponen: string;
  f: Boolean;
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'SELECT * FROM tbl_wewenang WHERE namauser =:nu';
    ParamByName('nu').Value := txtuser.Caption;
    Open;
    for i := 0 to Frm_Main.ComponentCount - 1 do begin
      namaKomponen := Trim(Frm_Main.Components[i].Name);
      if Locate('nm_comp', namaKomponen,[]) then begin
        f := false;
        if FieldByName('wwn').AsInteger = 1 then
          f := true;
        (Frm_Main.Components[i] as TMenuItem).Visible := f;
        First;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_Main.Timer1Timer(Sender: TObject);
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Timer1.Enabled := False;
    if txtuser.Caption = '' then begin
      Close;
      SQL.Text := 'select * from tbl_user';
      Open;
      if not IsEmpty then begin
        Logout1Click(nil);
      end;
    end else begin
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:a';
      ParamByName('a').Value := txtuser.Caption;
      Open;
      if IsEmpty then begin
        Logout1Click(nil);
      end;
    end;
    Free;
  end;
end;

procedure TFrm_Main.Logout1Click(Sender: TObject);
begin
  utupSemuaWindowyangTerbuka1Click(nil);
  DM.Con.Disconnect;
  koneksi := '';
  Frm_Main.txtuser.Caption := '';
  Frm_Main.Caption := '';
  Frm_Main.HideAllMenu(False);
  Frm_SettingDatabase.BorderIcons := [];
  Frm_SettingDatabase.ShowModal;
end;

procedure TFrm_Main.utupSemuaWindowyangTerbuka1Click(Sender: TObject);
begin
  CreatePanel;
end;

procedure TFrm_Main.eamViewer1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName)+'teamviewer.exe'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TFrm_Main.MembukaFileBackup1Click(Sender: TObject);
begin
  Application.CreateForm(TFrm_RestoreBackup, Frm_RestoreBackup);
  Frm_RestoreBackup.ShowModal;
end;

procedure TFrm_Main.BackupData1Click(Sender: TObject);
var
  sNamaFileBat, sNamaFileBackup, sBackupPath, MysqlDump_Path : string;
  F: TextFile;
begin
  Application.CreateForm (TFrm_SettingBackup, Frm_SettingBackup);
  Frm_SettingBackup.Caption := 'Backup Data';
  Frm_SettingBackup.RzPanel1.Caption := 'Backup Data';
  Frm_SettingBackup.BtnKeluar.Visible := False;
  Frm_SettingBackup.BtnSimpan.Caption := 'Batal';
  Frm_SettingBackup.BtnBackup.Caption := 'Lanjutkan';
  Frm_SettingBackup.txtlokasi.Text := lokasibackup;
  if Frm_SettingBackup.ShowModal = mrok then begin
    //sTgl := FormatDateTime('dd-mm-yyyy', Date);
    sBackupPath := ExtractFilePath(Application.ExeName) + 'backup';
    sNamaFileBat := sBackupPath + '\backup.bat';
    //sNamaFileBackup := sBackupPath + '\backup_' + sTgl + '.sql';
    //sNamaFileBackup := Frm_SettingBackup.txtlokasi.Text + '\backup_' + sTgl + '.sql';
    sNamaFileBackup := Frm_SettingBackup.txtlokasi.Text + '\'+Frm_SettingBackup.txtnama.Text;

    if not DirectoryExists(sBackupPath) then CreateDirectory(PChar(sBackupPath), nil);
    if not DirectoryExists(Frm_SettingBackup.txtlokasi.Text) then CreateDirectory(PChar(Frm_SettingBackup.txtlokasi.Text), nil);
    if FileExists(sNamaFileBackup) then DeleteFile(sNamaFileBackup);
    AssignFile(F, sNamaFileBat);
    Rewrite(F);
    MysqlDump_Path :=  ExtractFilePath(Application.ExeName) + '\backup\mysqldump.exe';
    Writeln(F, '"' + mysqldump_path + '" -u ' + user + ' -p' + password +
    //Writeln(F, '"' + mysqldump_path + '" -u root -psamator' +
      ' -all --routines --add-drop-database --databases ' + dba + ' > "' + sNamaFileBackup + '"');

    CloseFile(F);
    WinExec(PChar('"' + sNamaFileBat + '"'), 1);
    MessageDlg('Backup selesai dengan nama file : '#13 +sNamaFileBackup,mtInformation,[mbOK],0);
    FileIni := ExtractFilePath(Application.ExeName) + 'setting.ini';
    Ini := TIniFile.Create(FileIni);
    Ini.WriteString('database','lokasi',Frm_SettingBackup.txtlokasi.Text);
    lokasibackup := Ini.ReadString('database','backup','');
  end;
end;

procedure TFrm_Main.BtnPembelianClick(Sender: TObject);
var
  f: TFrm_MenuPembelian;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Pembelian') then begin
    f := TFrm_MenuPembelian.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.AkunPenting1Click(Sender: TObject);
var
  i:Integer;
begin
  Application.CreateForm(TFrm_AkunPenting, Frm_AkunPenting);
  Frm_AkunPenting.RefreshQ;
  if Frm_AkunPenting.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      for i:=0 to Frm_AkunPenting.dbgdata.RowCount-1 do begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_akundefault set noakun=:na where jenis=:j';
        ParamByName('j').Value := Frm_AkunPenting.dbgdata.Cell[2,i].AsString;
        ParamByName('na').Value := Frm_AkunPenting.dbgdata.Cell[3,i].AsInteger;
        ExecSQL;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_Main.BtnPenjualanClick(Sender: TObject);
var
  f: TFrm_MenuPenjualan;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Penjualan') then begin
    f := TFrm_MenuPenjualan.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.BtnPersediaanClick(Sender: TObject);
var
  f: TFrm_MenuPersediaan;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Menu Persediaan') then begin
    f := TFrm_MenuPersediaan.Create(Self);
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.ChangePassword1Click(Sender: TObject);
begin
  Application.CreateForm(TFrm_Login, Frm_Login);
  Frm_Login.ClearText;
  Frm_Login.txtuser.Text := txtuser.Caption;
  Frm_Login.txtuser.ReadOnly := True;
  Frm_Login.LMessage.Caption := 'Masukkan user dan password lama';
  tipe := 'password';
  Frm_Login.ShowModal;
end;

procedure TFrm_Main.Password1Click(Sender: TObject);
begin
  utupSemuaWindowyangTerbuka1Click(nil);
  Application.CreateForm(TFrm_User, Frm_User);
  Frm_User.ShowModal;
end;

procedure TFrm_Main.BtnLaporanClick(Sender: TObject);
var
  f: TFrm_MenuLaporan;
  ts: TcxTabSheet;
begin
  if not DM.CekTabOpen('Report') then begin
    f := TFrm_MenuLaporan.Create(Self);
    f.ClearText;
    f.ManualDock(PGMain, PGMain, alClient);
    f.Show;

    ts := (f.parent as TcxTabSheet);

    PGMain.ActivePage := ts;

  end;
end;

procedure TFrm_Main.SetupProgram1Click(Sender: TObject);
var
  jp:TJpegimage;
  stream: TMemoryStream;
begin
  Application.CreateForm(TFrm_InfoPerusahaan, Frm_InfoPerusahaan);
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_setupperusahaan';
    Open;
    if not IsEmpty then begin
      First;
      with Frm_InfoPerusahaan do begin
        Cleartext;
        txtkode.Text := FieldValues['kode'];
        txtperusahaan.Text := FieldValues['nama'];
        txtalamat.Text := FieldValues['alamat'];
        txtkota.Text := FieldValues['kota'];
        txtkodepos.Text := FieldValues['kodepos'];
        txttelp.Text := FieldValues['telp'];
        cbhpp.ItemIndex := FieldValues['tipehpp'];
        txtnpwp.Text := FieldValues['npwp'];
        txtpkp.Text := FieldValues['pkp'];
        if FieldValues['tglpkp']<>null then dtppkp.Date := FieldValues['tglpkp'];
        txtnamapkp.Text := FieldValues['namapkp'];
        txtalamatpkp.Text := FieldValues['alamatpkp'];
        txtkotapkp.Text := FieldValues['kotapkp'];
        txtkodepospkp.Text := FieldValues['zippkp'];
        txtfooterpenjualan.Text := FieldValues['footerfakturpenjualan'];
        if not FieldByName('filefoto').IsNull then begin
          LFoto.Caption := '1';
          Stream := TMemoryStream.Create;
          TBlobField(FieldByName('filefoto')).SaveToStream(Stream);
          Stream.Position := 0;

          jp := TJPEGImage.Create;
          jp.LoadFromStream(Stream);

          Image1.Picture.Assign(jp);

          Stream.Free;
          jp.Free;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_bukubesarbarang';
        Open;
        if not IsEmpty then begin
          cbhpp.ReadOnly := True;
        end;
        if Frm_InfoPerusahaan.ShowModal = mrok then begin
          jp:=TJpegimage.Create;
          if (LFoto.Caption <> '') and (LFoto.Caption <> '1') then jp.LoadFromFile(LFoto.Caption);

          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_setupperusahaan set nama=:a,alamat=:b,kota=:c,kodepos=:d,telp=:e,tipehpp=:f,npwp=:g,pkp=:h,tglpkp=:i,namapkp=:j,alamatpkp=:k,kotapkp=:l,zippkp=:m,kode=:n,footerfakturpenjualan=:o';
          ParamByName('a').Value := txtperusahaan.Text;
          ParamByName('b').Value := txtalamat.Text;
          ParamByName('c').Value := txtkota.Text;
          ParamByName('d').Value := txtkodepos.Text;
          ParamByName('e').Value := txttelp.Text;
          ParamByName('f').Value := cbhpp.ItemIndex;
          ParamByName('g').Value := txtnpwp.Text;
          ParamByName('h').Value := txtpkp.Text;
          ParamByName('i').Value := FormatDateTime('yyyy-mm-dd',dtppkp.Date);
          ParamByName('j').Value := txtnamapkp.Text;
          ParamByName('k').Value := txtalamatpkp.Text;
          ParamByName('l').Value := txtkotapkp.Text;
          ParamByName('m').Value := txtkodepospkp.Text;
          ParamByName('n').Value := txtkode.Text;
          ParamByName('o').Value := txtfooterpenjualan.Text;
          ExecSQL;
          if LFoto.Caption = '' then begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_setupperusahaan set filefoto=:u';
            ParamByName('u').Value := null;
            ExecSQL;
          end else if LFoto.Caption = '1' then begin

          end else begin
            Close;
            SQL.Clear;
            SQL.Text := 'update tbl_setupperusahaan set filefoto=:u';
            ParamByName('u').Assign(jp);
            ExecSQL;
          end;
          namaperusahaan := txtperusahaan.Text;
          Frm_Main.Caption := namaperusahaan+' - '+host;
        end;
      end;
    end else begin
      Application.CreateForm(TFrm_InfoPerusahaan, Frm_InfoPerusahaan);
      Frm_InfoPerusahaan.Cleartext;
      if Frm_InfoPerusahaan.ShowModal=mrok then begin
        jp:=TJpegimage.Create;
        if (Frm_InfoPerusahaan.LFoto.Caption <> '') and (Frm_InfoPerusahaan.LFoto.Caption <> '1') then jp.LoadFromFile(Frm_InfoPerusahaan.LFoto.Caption);

        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_setupperusahaan values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p)';
        ParamByName('a').Value := Frm_InfoPerusahaan.txtperusahaan.Text;
        ParamByName('b').Value := Frm_InfoPerusahaan.txtalamat.Text;
        ParamByName('c').Value := Frm_InfoPerusahaan.txtkota.Text;
        ParamByName('d').Value := Frm_InfoPerusahaan.txtkodepos.Text;
        ParamByName('e').Value := Frm_InfoPerusahaan.txttelp.Text;
        ParamByName('f').Value := Frm_InfoPerusahaan.cbhpp.ItemIndex;
        ParamByName('g').Value := Frm_InfoPerusahaan.txtnpwp.Text;
        ParamByName('h').Value := Frm_InfoPerusahaan.txtpkp.Text;
        ParamByName('i').Value := FormatDateTime('yyyy-mm-dd',Frm_InfoPerusahaan.dtppkp.Date);
        ParamByName('j').Value := Frm_InfoPerusahaan.txtnamapkp.Text;
        ParamByName('k').Value := Frm_InfoPerusahaan.txtalamatpkp.Text;
        ParamByName('l').Value := Frm_InfoPerusahaan.txtkotapkp.Text;
        ParamByName('m').Value := Frm_InfoPerusahaan.txtkodepospkp.Text;
        ParamByName('n').Value := Frm_InfoPerusahaan.txtkode.Text;
        ParamByName('o').Value := null;
        ParamByName('p').Value := Frm_InfoPerusahaan.txtfooterpenjualan.Text;
        ExecSQL;
        if Frm_InfoPerusahaan.LFoto.Caption = '' then begin

        end else if Frm_InfoPerusahaan.LFoto.Caption = '1' then begin

        end else begin
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_setupperusahaan set filefoto=:u';
          ParamByName('u').Assign(jp);
          ExecSQL;
        end;

        namaperusahaan := Frm_InfoPerusahaan.txtperusahaan.Text;
        Frm_Main.Caption := namaperusahaan+' - '+host;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_Main.SaldoAwalAkun1Click(Sender: TObject);
var
  bulan,tahun:string;
  tanggal:TDate;
  i,noperiode,periodeawal,periodesekarang:Integer;
begin
  utupSemuaWindowyangTerbuka1Click(nil);
  with TZQuery.Create(Self)do begin
    Connection := dm.Con;
    Close;
    SQL.Text := 'select * from tbl_periode';
    Open;
    First;
    periodeawal := FieldValues['noperiode'];
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_periode where statusperiode=1';
    Open;
    periodesekarang := FieldValues['noperiode'];
    if periodeawal = periodesekarang then begin
      Application.CreateForm(TFrm_SaldoAwalAkun, Frm_SaldoAwalAkun);
      Frm_SaldoAwalAkun.dbgakun.Enabled := True;
      Frm_SaldoAwalAkun.NxNumberColumn1.Color := clWhite;
      Frm_SaldoAwalAkun.NxNumberColumn2.Color := clWhite;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_periode order by noperiode';
      Open;
      First;
      bulan := IntToStr(FieldValues['bulan']);
      if Length(bulan)=1 then bulan := '0'+bulan;
      tahun := FieldValues['tahun'];
      tanggal := DM.FDOM(StrToDate('01/'+bulan+'/'+tahun));
      noperiode := FieldValues['noperiode'];
      Frm_SaldoAwalAkun.RzPanel1.Caption := 'Saldo awal akun per tanggal '+FormatDateTime('dd MMMM yyyy',tanggal);
      Frm_SaldoAwalAkun.RefreshQ(noperiode);
      if Frm_SaldoAwalAkun.ShowModal=mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_saldoawalperiodeakun where noperiode=:np';
        ParamByName('np').Value := noperiode;
        ExecSQL;
        for i:=0 to Frm_SaldoAwalAkun.dbgakun.RowCount-1 do begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_saldoawalperiodeakun values (:a,:b,:c,:d)';
          ParamByName('a').Value := noperiode;
          ParamByName('b').Value := Frm_SaldoAwalAkun.dbgakun.Cell[4,i].AsInteger;
          ParamByName('c').Value := Frm_SaldoAwalAkun.dbgakun.Cell[2,i].AsFloat;
          ParamByName('d').Value := Frm_SaldoAwalAkun.dbgakun.Cell[3,i].AsFloat;
          ExecSQL;
        end;
      end;
    end else begin
      Application.CreateForm(TFrm_SaldoAwalAkun, Frm_SaldoAwalAkun);
      Frm_SaldoAwalAkun.dbgakun.Enabled := False;
      Frm_SaldoAwalAkun.NxNumberColumn1.Color := clYellow;
      Frm_SaldoAwalAkun.NxNumberColumn2.Color := clYellow;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_periode order by noperiode';
      Open;
      First;
      bulan := IntToStr(FieldValues['bulan']);
      if Length(bulan)=1 then bulan := '0'+bulan;
      tahun := FieldValues['tahun'];
      tanggal := DM.FDOM(StrToDate('01/'+bulan+'/'+tahun));
      noperiode := FieldValues['noperiode'];
      Frm_SaldoAwalAkun.RzPanel1.Caption := 'Saldo awal akun per tanggal '+FormatDateTime('dd MMMM yyyy',tanggal);
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,b.kodeakun,b.namaakun from ' +
                  '(select * from tbl_saldoawalperiodeakun where noperiode=:np)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakun order by b.kodeakun';
      ParamByName('np').Value := noperiode;
      Open;
      First;
      with Frm_SaldoAwalAkun.dbgakun do begin
        ClearRows;
        for i:= 0 to RecordCount-1 do begin
          AddRow();
          Cell[0,i].AsString := FieldValues['kodeakun'];
          Cell[1,i].AsString := FieldValues['namaakun'];
          Cell[2,i].AsFloat := FieldValues['debit'];
          Cell[3,i].AsFloat := FieldValues['kredit'];
          Cell[4,i].AsInteger := FieldValues['noakun'];
          Next;
        end;
      end;
      if Frm_SaldoAwalAkun.ShowModal=mrok then begin

      end;
    end;
    Free;
  end;
end;

end.
