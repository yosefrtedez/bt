unit UDataPajak;

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
  cxDataStorage, cxEdit, DB, cxDBData, RzButton, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, RzPanel;

type
  TFrm_DataPajak = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodegudang: TcxGridDBColumn;
    dbgdataDBTableView1namagudang: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    QData: TZQuery;
    DSData: TDataSource;
    QDatanopajak: TLargeintField;
    QDatakodepajak: TStringField;
    QDatanamapajak: TStringField;
    BtnUpdate: TRzToolButton;
    QDatapersen: TFloatField;
    QDatatipepajak: TLargeintField;
    QDataakunpajakpembelian: TLargeintField;
    QDataakunpajakpenjualan: TLargeintField;
    QDataakunpajakpembelianblm: TLargeintField;
    QDataakunpajakpenjualanblm: TLargeintField;
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DataPajak: TFrm_DataPajak;

implementation

uses UDM, UInputPajak, UMain;

{$R *.dfm}

procedure TFrm_DataPajak.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DataPajak.RefreshQ;
begin
  QData.Close;
  QData.Open;
end;

procedure TFrm_DataPajak.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataPajak.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataPajak.BtnBaruClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputPajak, Frm_InputPajak);
  Frm_InputPajak.ClearText;
  if Frm_InputPajak.ShowModal = mrok then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'insert into tbl_pajak values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
      ParamByName('a').Value := DM.GenerateNoMaster('pajak');
      ParamByName('b').Value := Frm_InputPajak.txtkode.Text;
      ParamByName('c').Value := Frm_InputPajak.txtnama.Text;
      ParamByName('d').Value := Frm_InputPajak.txtpersen.Value;
      ParamByName('e').Value := Frm_InputPajak.cbtipe.ItemIndex;
      ParamByName('f').Value := Frm_InputPajak.LPajakPembelian.Caption;
      ParamByName('g').Value := Frm_InputPajak.LPajakPenjualan.Caption;
      ParamByName('h').Value := Frm_InputPajak.LPajakPembelianblm.Caption;
      ParamByName('i').Value := Frm_InputPajak.LPajakPenjualanblm.Caption;
      ExecSQL;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DataPajak.BtnUbahClick(Sender: TObject);
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data6')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.IsEmpty then Exit;
  if QData.FieldValues['nopajak'] = 0 then begin
    MessageDlg('Data pajak ini tidak dapat diubah!',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputPajak, Frm_InputPajak);
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tbl_pajak where nopajak=:np';
    ParamByName('np').Value := QData.FieldValues['nopajak'];
    Open;
    with Frm_InputPajak do begin
      LID.Caption := FieldValues['nopajak'];
      txtkode.Text := FieldValues['kodepajak'];
      txtnama.Text := FieldValues['namapajak'];
      txtpersen.Value := FieldValues['persen'];
      cbtipe.ItemIndex := FieldValues['tipepajak'];
      LPajakPenjualan.Caption := FieldValues['akunpajakpenjualan'];
      LPajakPembelian.Caption := FieldValues['akunpajakpembelian'];
      LPajakPenjualanblm.Caption := FieldValues['akunpajakpenjualanblm'];
      LPajakPembelianblm.Caption := FieldValues['akunpajakpembelianblm'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPenjualan.Caption;
      Open;
      if IsEmpty then begin
        LPajakPenjualan.Caption := '0';
        txtpajakpenjualan.Clear;
      end else txtpajakpenjualan.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPembelian.Caption;
      Open;
      if IsEmpty then begin
        LPajakPembelian.Caption := '0';
        txtpajakpembelian.Clear;
      end else txtpajakpembelian.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPenjualanblm.Caption;
      Open;
      if IsEmpty then begin
        LPajakPenjualanblm.Caption := '0';
        txtpajakpenjualanblm.Clear;
      end else txtpajakpenjualanblm.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LPajakPembelianblm.Caption;
      Open;
      if IsEmpty then begin
        LPajakPembelianblm.Caption := '0';
        txtpajakpembelianblm.Clear;
      end else txtpajakpembelianblm.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      if Frm_InputPajak.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_pajak set kodepajak=:b,namapajak=:c,persen=:d,tipepajak=:e,akunpajakpembelian=:f,akunpajakpenjualan=:g,akunpajakpembelianblm=:h,akunpajakpenjualanblm=:i where nopajak=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtnama.Text;
        ParamByName('d').Value := txtpersen.Value;
        ParamByName('e').Value := cbtipe.ItemIndex;
        ParamByName('f').Value := LPajakPembelian.Caption;
        ParamByName('g').Value := LPajakPenjualan.Caption;
        ParamByName('h').Value := LPajakPembelianblm.Caption;
        ParamByName('i').Value := LPajakPenjualanblm.Caption;
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DataPajak.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

end.
