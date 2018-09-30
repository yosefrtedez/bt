unit UDataAkun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TFrm_DataAkun = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    QData: TZQuery;
    dsdata: TDataSource;
    QDatanoakun: TLargeintField;
    QDatanoklasifikasi: TLargeintField;
    QDatanosubklasifikasi: TLargeintField;
    QDatanamaakun: TStringField;
    QDatakas: TSmallintField;
    QDataaktif: TSmallintField;
    QDatanamasubklasifikasi: TStringField;
    QDatanamaklasifikasi: TStringField;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodeakun: TcxGridDBColumn;
    dbgdataDBTableView1namaakun: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QDatakodeakun: TStringField;
    BtnBaru: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataAkun: TFrm_DataAkun;
  akunkas,noklas,nosubklas:Integer;

implementation

uses UDM, UInputAkun, UMain;

{$R *.dfm}

procedure TFrm_DataAkun.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataAkun.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_akundefault where jenis=:j and noakun=:na';
    ParamByName('j').Value := 'lababerjalan';
    ParamByName('na').Value := QData.FieldValues['noakun'];
    Open;
    if not IsEmpty then begin
      ShowMessage('Perkiraan ini merupakan perkiraan pembantu semata dan tidak ada transaksi real.');
    end else ModalResult := mrOk;
    Free;
  end;
end;

procedure TFrm_DataAkun.RefreshQ;
begin
  with QData do begin
    Close;
    SQL.Clear;
    if akunkas = -1 then begin
      if (noklas = 0) and (nosubklas = 0) then begin
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi order by c.kodeakun';
      end else if (noklas = 0) and (nosubklas > 0) then begin
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and nosubklasifikasi=:aa)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi order by c.kodeakun';
        ParamByName('aa').Value := nosubklas;
      end else if (noklas > 0) and (nosubklas = 0) then begin
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and noklasifikasi=:aa)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi order by c.kodeakun';
        ParamByName('aa').Value := noklas;
      end else if (noklas > 0) and (nosubklas > 0) then begin
        SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                    '(select a.*,b.namasubklasifikasi from ' +
                    '(select * from tbl_akun where aktif=1 and noklasifikasi=:aa and nosubklasifikasi=:ab)as a ' +
                    'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                    'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi order by c.kodeakun';
        ParamByName('aa').Value := noklas;
        ParamByName('ab').Value := nosubklas;
      end;
    end else begin
      SQL.Text := 'select c.*,d.namaklasifikasi from ' +
                  '(select a.*,b.namasubklasifikasi from ' +
                  '(select * from tbl_akun where aktif=1 and kas=:k )as a ' +
                  'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubklasifikasi and b.noklasifikasi=a.noklasifikasi)as c  ' +
                  'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikasi order by c.kodeakun';
      ParamByName('k').Value := akunkas;
    end;
    Open;
  end;
end;

procedure TFrm_DataAkun.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataAkun.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    BtnOkClick(nil)
  else if key = vk_escape then BtnBatalClick(nil);
end;

procedure TFrm_DataAkun.BtnBaruClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputAkun, Frm_InputAkun);
  with Frm_InputAkun do begin
    ClearText;
    if ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'insert into tbl_akun values (:a,:b,:c,:d,:e,:f,:h)';
        ParamByName('a').Value := DM.GenerateNoMaster('akun');
        ParamByName('b').Value := LKlasifikasi.Caption;
        ParamByName('c').Value := LSubKlasifikasi.Caption;
        ParamByName('d').Value := txtkode.Text;
        ParamByName('e').Value := txtNama.Text;
        if cbkas.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        if cbaktif.Checked = True then
          ParamByName('h').Value := 1
        else ParamByName('h').Value := 0;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DataAkun.BtnEditClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data2')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputAkun, Frm_InputAkun);
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Text := 'select * from tbl_akundefault where noakun=:na';
    ParamByName('na').Value := QData.FieldValues['noakun'];
    Open;
    if not IsEmpty then begin
      MessageDlg('Rekening ini tidak disarankan untuk Anda rubah peruntukannya, karena telah digunakan sebagai Akun Default.'#10#13'Pastikan Anda menyadari resiko yang dapat terjadi sebelum mengedit rekening ini',mtWarning,[mbOK],0);
      Frm_InputAkun.cbklasifikasi.ReadOnly := True;
      Frm_InputAkun.txtkode.ReadOnly := True;
      Frm_InputAkun.cbkas.Enabled := False;
      Frm_InputAkun.cbaktif.Enabled := False;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarakun where noakun=:a';
      ParamByName('a').Value := QData.FieldValues['noakun'];
      Open;
      if not IsEmpty then begin
        MessageDlg('Rekening ini tidak disarankan untuk Anda rubah peruntukannya, karena telah digunakan dalam transaksi.'#10#13'Pastikan Anda menyadari resiko yang dapat terjadi sebelum mengedit rekening ini',mtWarning,[mbOK],0);
        Frm_InputAkun.cbklasifikasi.ReadOnly := True;
        Frm_InputAkun.txtkode.ReadOnly := True;
        Frm_InputAkun.cbkas.Enabled := False;
        Frm_InputAkun.cbaktif.Enabled := False;
      end;
    end;
    with Frm_InputAkun do begin
      ClearText;
      LID.Caption := QData.FieldValues['noakun'];
      LKlasifikasi.Caption := QData.FieldValues['noklasifikasi'];
      LSubKlasifikasi.Caption := QData.FieldValues['nosubklasifikasi'];
      txtkode.Text := QData.FieldValues['kodeakun'];
      txtNama.Text := QData.FieldValues['namaakun'];
      cbklasifikasi.Text := QData.FieldValues['namasubklasifikasi'];
      if QData.FieldValues['kas'] = 1 then
        cbkas.Checked := True
      else cbkas.Checked := False;
      if QData.FieldValues['aktif'] = 1 then
        cbaktif.Checked := True
      else cbaktif.Checked := False;
      if Frm_InputAkun.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_akun set noklasifikasi=:a,nosubklasifikasi=:b,kodeakun=:c,namaakun=:d,kas=:e,aktif=:f where noakun=:na';
        ParamByName('na').Value := LID.Caption;
        ParamByName('a').Value := LKlasifikasi.Caption;
        ParamByName('b').Value := LSubKlasifikasi.Caption;
        ParamByName('c').Value := txtkode.Text;
        ParamByName('d').Value := txtNama.Text;
        if cbkas.Checked = True then
          ParamByName('e').Value := 1
        else ParamByName('e').Value := 0;
        if cbaktif.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

end.
