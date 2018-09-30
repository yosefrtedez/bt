unit UDataSatuan;

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
  TFrm_DataSatuan = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1kodesatuan: TcxGridDBColumn;
    dbgdataDBTableView1namasatuan: TcxGridDBColumn;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataSatuan: TFrm_DataSatuan;
  nomorbarang: Integer;

implementation

uses UDM, UInputSatuan, UMain;

{$R *.dfm}

procedure TFrm_DataSatuan.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataSatuan.RefreshQ;
begin
  QData.Close;
  if nomorbarang = 0 then begin
    QData.SQL.Text := 'select * from tbl_satuan order by namasatuan';
  end else begin
    QData.SQL.Text := 'select a.nosatuan,a.kodesatuan,concat(a.namasatuan,'+QuotedStr(' (')+',a.faktor,'+QuotedStr(')')+')as namasatuan,a.faktor from ' +
                      '(SELECT a.nosatuan,b.kodesatuan,b.namasatuan,1 as faktor FROM ' +
                      '(SELECT nosatuan FROM tbl_barang WHERE nobarang=:nb)AS a ' +
                      'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan ' +
                      'UNION ' +
                      'SELECT a.nosatuan,b.kodesatuan,b.namasatuan,a.faktor FROM ' +
                      '(SELECT nosatuan,faktor FROM tbl_barangharga WHERE nobarang=:nb)AS a ' +
                      'LEFT JOIN tbl_satuan AS b ON b.nosatuan=a.nosatuan)as a';
    QData.ParamByName('nb').Value := nomorbarang;
  end;
  QData.Open;
end;

procedure TFrm_DataSatuan.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataSatuan.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataSatuan.BtnBaruClick(Sender: TObject);
var
  nosatuan:Integer;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputSatuan, Frm_InputSatuan);
  Frm_InputSatuan.ClearText;
  if Frm_InputSatuan.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      nosatuan := DM.GenerateNoMaster('satuan');
      Close;
      SQL.Text := 'insert into tbl_satuan values (:a,:b,:c)';
      ParamByName('a').Value := nosatuan;
      ParamByName('b').Value := Frm_InputSatuan.txtkode.Text;
      ParamByName('c').Value := Frm_InputSatuan.txtnama.Text;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DataSatuan.BtnUbahClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data4')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputSatuan, Frm_InputSatuan);
  with Frm_InputSatuan do begin
    ClearText;
    LID.Caption := QData.FieldValues['nosatuan'];
    txtkode.Text := QData.FieldValues['kodesatuan'];
    txtnama.Text := QData.FieldValues['namasatuan'];
    if Frm_InputSatuan.ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := dm.Con;
        Close;
        SQL.Text := 'update tbl_satuan set kodesatuan=:b,namasatuan=:c where nosatuan=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ExecSQL;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DataSatuan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    BtnOkClick(nil)
  else if key = vk_escape then BtnBatalClick(nil);
end;

end.
