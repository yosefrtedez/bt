unit UDataGudang;

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
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TFrm_DataGudang = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    QDatanogudang: TLargeintField;
    QDatakodegudang: TStringField;
    QDatanamagudang: TStringField;
    QDataaktif: TLargeintField;
    dbgdataDBTableView1kodegudang: TcxGridDBColumn;
    dbgdataDBTableView1namagudang: TcxGridDBColumn;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataGudang: TFrm_DataGudang;

implementation

uses UDM, UInputGudang, UMain;

{$R *.dfm}

{ TFrm_DataGudang }

procedure TFrm_DataGudang.RefreshQ;
begin
  QData.Close;
  QData.SQL.Clear;
  if DM.CekUserGudang(Frm_Main.txtuser.Caption) = True then begin
    QData.SQL.Text := 'SELECT a.* FROM ' +
                      '(SELECT 0 AS nogudang, '+QuotedStr('Gudang Utama')+' AS kodegudang, '+QuotedStr('Gudang Utama')+'AS namagudang, 1 AS aktif ' +
                      'UNION ' +
                      'SELECT nogudang,kodegudang,namagudang,aktif FROM tbl_gudang)AS a where a.aktif=1';

  end else begin
    QData.SQL.Text := 'SELECT a.* FROM ' +
                      '(SELECT 0 AS nogudang, '+QuotedStr('Gudang Utama')+' AS kodegudang, '+QuotedStr('Gudang Utama')+'AS namagudang, 1 AS aktif ' +
                      'UNION ' +
                      'SELECT nogudang,kodegudang,namagudang,aktif FROM tbl_gudang)AS a where a.aktif=1 and nogudang in (select nogudang from tbl_usergudang where namauser=:aa)';
    QData.ParamByName('aa').Value := Frm_Main.txtuser.Caption;
  end;
  QData.Open;
end;

procedure TFrm_DataGudang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataGudang.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrok
end;

procedure TFrm_DataGudang.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DataGudang.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataGudang.BtnBaruClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data9')=False then begin
    MessageDlg('Anda tidak memiliki akses ',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputGudang, Frm_InputGudang);
  with Frm_InputGudang do begin
    ClearText;
    if ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'insert into tbl_gudang values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
        ParamByName('a').Value := DM.GenerateNoMaster('gudang');
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ParamByName('d').Value := txtalamat1.Text;
        ParamByName('e').Value := txtalamat2.Text;
        ParamByName('f').Value := txtkota.Text;
        ParamByName('g').Value := txtkodepos.Text;
        ParamByName('h').Value := txtnegara.Text;
        ParamByName('i').Value := txtketerangan.Text;
        if cbaktif.Checked = True then
          ParamByName('j').Value := 0
        else ParamByName('j').Value := 1;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DataGudang.BtnUbahClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.IsEmpty then Exit;
  if QData.FieldValues['nogudang']=0 then begin
    MessageDlg('Data gudang ini tidak boleh diedit!',mtError, [mbOK], 0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputGudang, Frm_InputGudang);
  with TZQuery.Create(Self)do begin
    Connection := DM.Con;
    Close;
    SQL.Text := 'select * from tbl_gudang where nogudang=:na';
    ParamByName('na').Value := QData.FieldValues['nogudang'];
    Open;
    with Frm_InputGudang do begin
      ClearText;
      LID.Caption := FieldValues['nogudang'];
      txtkode.Text := FieldValues['kodegudang'];
      txtNama.Text := QData.FieldValues['namagudang'];
      txtalamat1.Text := QData.FieldValues['alamat1gudang'];
      txtalamat2.Text := QData.FieldValues['alamat2gudang'];
      txtkota.Text := QData.FieldValues['kotagudang'];
      txtkodepos.Text := QData.FieldValues['kodeposgudang'];
      txtnegara.Text := QData.FieldValues['negaragudang'];
      txtketerangan.Text := QData.FieldValues['keterangan'];
      if FieldValues['aktif'] = 1 then
        cbaktif.Checked := False
      else cbaktif.Checked := True;
      if Frm_InputGudang.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_gudang set kodegudang=:a,namagudang=:b,alamat1gudang=:c,alamat2gudang=:d,kotagudang=:e,kodeposgudang=:f,negaragudang=:g, keterangan=:h, aktif=:i where nogudang=:na';
        ParamByName('na').Value := LID.Caption;
        ParamByName('a').Value := txtkode.Text;
        ParamByName('b').Value := txtnama.Text;
        ParamByName('c').Value := txtalamat1.Text;
        ParamByName('d').Value := txtalamat2.Text;
        ParamByName('e').Value := txtkota.Text;
        ParamByName('f').Value := txtkodepos.Text;
        ParamByName('g').Value := txtnegara.Text;
        ParamByName('h').Value := txtketerangan.Text;
        if cbaktif.Checked = True then
          ParamByName('i').Value := 0
        else ParamByName('i').Value := 1;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

end.
