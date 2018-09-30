unit UPenjualanDO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RzEdit,
  NxColumns6, NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6,
  NxGrid6, RzButton, NxEdit, StdCtrls, Mask, RzBtnEdt, RzLabel, RzPanel,
  ExtCtrls, cxPC;

type
  TFrm_DeliveryOrder = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LCustomer: TRzLabel;
    RzLabel3: TRzLabel;
    LSO: TRzLabel;
    txtcustomer: TRzButtonEdit;
    txtreferensi: TRzEdit;
    dtpfaktur: TNxDatePicker;
    txtso: TRzButtonEdit;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    RzPanel4: TRzPanel;
    RzLabel13: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel14: TRzLabel;
    txtqty: TRzNumericEdit;
    txtitem: TRzNumericEdit;
    ZQuery1: TZQuery;
    QMataUang: TZQuery;
    LKirim: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure txtsoButtonClick(Sender: TObject);
    procedure txtsoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRekamClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure IsiGridBarang;
    procedure UpdateTotal;
  end;

var
  Frm_DeliveryOrder: TFrm_DeliveryOrder;

implementation

uses UDM, UDataPenjualanOrder, UMain, UDataKontak, NxCells, NxIntf6;

{$R *.dfm}

procedure TFrm_DeliveryOrder.BtnBatalClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DeliveryOrder.ClearText;
begin
  LKirim.Caption := '0';
  dtpfaktur.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('DO',dtpfaktur.Date);
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  dbgbarang.ClearRows;
  txtso.Clear;
  LSO.Caption := '0';
  UpdateTotal;
end;

procedure TFrm_DeliveryOrder.IsiGridBarang;
var
  j: Integer;
begin
  dbgbarang.ClearRows;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select a.*,d.kodesatuan from ' +
                '(select a.*,b.kodebarang,b.namabarang from ' +
                '(select * from tbl_penjualanorderdetail where nopenjualanorder=:ib) as a ' +
                'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                'left join tbl_satuan as d on d.nosatuan=a.nosatuan';
    ParamByName('ib').Value := LSO.Caption;
    Open;
    if not IsEmpty then begin
      First;
      for j:=0 to RecordCount-1 do begin
        with dbgbarang do begin
          AddRow();
          Cell[0,j].AsString := FieldValues['kodebarang'];
          Cell[1,j].AsString := FieldValues['namabarang'];
          Cell[2,j].AsFloat := FieldValues['qty'];
          Cell[3,j].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
        end;
        Next;
      end;
      UpdateTotal;
    end;
    Free;
  end;
end;

procedure TFrm_DeliveryOrder.UpdateTotal;
var
  qty:Double;
  i:integer;
begin
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      qty := qty+Cell[2,i].AsFloat;
    end;
    txtqty.Value := qty;
    txtitem.Value := dbgbarang.RowCount;
  end;
end;

procedure TFrm_DeliveryOrder.txtcustomerButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataKontak, Frm_DataKontak);
  tipekontak := 0;
  Frm_DataKontak.RefreshQ;
  if Frm_DataKontak.ShowModal = mrok then begin
    if LSO.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    ClearText;
    dbgbarang.AddRow();
    txtcustomer.Text := Frm_DataKontak.QData.FieldValues['namakontak'];
    LCustomer.Caption := Frm_DataKontak.QData.FieldValues['nokontak'];
  end;
end;

procedure TFrm_DeliveryOrder.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_DeliveryOrder.txtsoButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataPenjualanOrder, Frm_DataPenjualanOrder);
  customerorder := StrToInt(LCustomer.Caption);
  statusdo := 0;
  Frm_DataPenjualanOrder.RefreshQ;
  if Frm_DataPenjualanOrder.ShowModal = mrok then begin
    if LSO.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    txtso.Text := Frm_DataPenjualanOrder.QData.FieldValues['kodepenjualanorder'];
    LSO.Caption := Frm_DataPenjualanOrder.QData.FieldValues['nopenjualanorder'];
    IsiGridBarang;
  end;
end;

procedure TFrm_DeliveryOrder.txtsoKeyPress(Sender: TObject; var Key: Char);
begin
  txtsoButtonClick(nil);
end;

procedure TFrm_DeliveryOrder.BtnRekamClick(Sender: TObject);
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LKirim.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        txtreferensi.Text := DM.GenerateKodeTransaksi('DO',dtpfaktur.Date);
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'DO';
        ParamByName('b').Value := dtpfaktur.Date;
        ParamByName('c').Value := txtreferensi.Text;
        ExecSQL;
        Close;
        SQL.Clear;
        // update ke tabel penjualan order
        SQL.Text := 'update tbl_penjualanorder set kodepenjualando=:c,tgldo=:d where nopenjualanorder=:a';
        ParamByName('a').Value := LSO.Caption;
        ParamByName('c').Value := txtreferensi.Text;
        ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
        ExecSQL;
        if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          dm.Q_NotaDO.Close;
          DM.Q_NotaDO.ParamByName('np').Value := LSO.Caption;
          DM.Q_NotaDO.Open;
          DM.Nota_DO.ShowReport(True);
        end;
        ClearText;
      end;
    end;
    Free;
  end;
end;

end.
