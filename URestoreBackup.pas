unit URestoreBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, Mask, RzEdit, RzBtnEdt, RzPanel,
  RzShellDialogs, RzButton, RzLabel, ExtCtrls;

type
  TFrm_RestoreBackup = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    txtlokasi: TRzButtonEdit;
    OpenDialog1: TRzOpenDialog;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtlokasiButtonClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RestoreBackup: TFrm_RestoreBackup;

implementation

uses UDM, UMain;

{$R *.dfm}

procedure TFrm_RestoreBackup.BtnOkClick(Sender: TObject);
var
  sNamaFileBat,sBackupPath : string;
  F: TextFile;
begin
  if txtlokasi.Text = '' then Exit;
  sBackupPath := ExtractFilePath(Application.ExeName) + '\backup';
  sNamaFileBat := sBackupPath + '\restore.bat';

  if FileExists(sNamaFileBat) then
    DeleteFile(PChar(sNamaFileBat));

  AssignFile(F, sNamaFileBat);

  Rewrite(F);

  Writeln(F, '"C:\mysql\bin\mysql.exe" -u ' + user + ' -p' +
    password + ' < "' + txtlokasi.Text + '"');

  CloseFile(F);

  WinExec(PChar('"' + sNamaFileBat + '"'), 1);

  Frm_RestoreBackup.Close;
  MessageDlg('Restore Database selesai. Jalankan kembali program.',mtInformation,[mbOK],0);
  Application.Terminate;
end;

procedure TFrm_RestoreBackup.FormShow(Sender: TObject);
begin
  txtlokasi.Clear;
end;

procedure TFrm_RestoreBackup.txtlokasiButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    txtlokasi.Text := OpenDialog1.FileName
  end;
end;

procedure TFrm_RestoreBackup.BtnBatalClick(Sender: TObject);
begin
  Close;
end;

end.
