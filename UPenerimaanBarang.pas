unit UPenerimaanBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPC, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  NxColumns6, NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6,
  NxGrid6, RzButton, NxEdit, RzBtnEdt, StdCtrls, Mask, RzEdit, RzLabel,
  RzPanel, ExtCtrls;

type
  TFrm_PenerimaanBarang = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel17: TRzLabel;
    LID: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    LGudangDari: TRzLabel;
    LPengiriman: TRzLabel;
    txtref: TRzEdit;
    txtketerangan: TRzEdit;
    txtpengiriman: TRzButtonEdit;
    dtptanggal: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    dbgbarang: TNextGrid6;
    NxReportGridView62: TNxReportGridView6;
    NxTextColumn62: TNxTextColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn619: TNxNumberColumn6;
    NxNumberColumn620: TNxNumberColumn6;
    NxNumberColumn621: TNxNumberColumn6;
    Q1: TZQuery;
    txtgudangdari: TRzEdit;
    LGudangKe: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure txtpengirimanButtonClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure dtptanggalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
  end;

var
  Frm_PenerimaanBarang: TFrm_PenerimaanBarang;

implementation

uses UDM, UDataPengirimanAntarGudang, UMain;

{$R *.dfm}

{ TFrm_PenerimaanBarang }

procedure TFrm_PenerimaanBarang.ClearText;
begin
  dtptanggal.Date := tanggalserver;
  txtref.Text := DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
  dtptanggal.ReadOnly := False;
  dbgbarang.ClearRows;
  LID.Caption := '0';
  txtgudangdari.Clear;
  LGudangDari.Caption := '0';
  LGudangKe.Caption := '0';
  txtpengiriman.Clear;
  LPengiriman.Caption := '0';
end;

procedure TFrm_PenerimaanBarang.BtnBatalClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PenerimaanBarang.txtpengirimanButtonClick(Sender: TObject);
var
  i: Integer;
begin
  Application.CreateForm(TFrm_DataPengirimanGudang, Frm_DataPengirimanGudang);
  gudangtujuan := StrToInt(LGudangKe.Caption);
  Frm_DataPengirimanGudang.RefreshQ;
  if Frm_DataPengirimanGudang.ShowModal = mrok then begin
    txtpengiriman.Text := Frm_DataPengirimanGudang.QData.FieldValues['kodepenyesuaian'];
    LPengiriman.Caption := Frm_DataPengirimanGudang.QData.FieldValues['nopenyesuaian'];
    txtgudangdari.Text := Frm_DataPengirimanGudang.QData.FieldValues['gudang'];
    LGudangDari.Caption := Frm_DataPengirimanGudang.QData.FieldValues['nogudangdari'];
    txtketerangan.Text := 'Penerimaan barang dari '+txtgudangdari.Text;
    dbgbarang.ClearRows;
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select c.*,d.kodesatuan from ' +
                  '(select a.*,b.kodebarang,b.namabarang from ' +
                  '(select * from tbl_penyesuaiandetail where nopenyesuaian=:np) as a ' +
                  'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                  'left join tbl_satuan as d on d.nosatuan=c.nosatuan';
      ParamByName('np').Value := LPengiriman.Caption;
      Open;
      if not IsEmpty then begin
        dbgbarang.ClearRows;
        First;
        for i:=0 to RecordCount-1 do begin
          with dbgbarang do begin
            AddRow();
            Cell[0,i].AsString := FieldValues['kodebarang'];
            Cell[1,i].AsString := FieldValues['namabarang'];
            Cell[2,i].AsFloat := FieldValues['qty'];
            Cell[3,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
            Cell[4,i].AsInteger := FieldValues['nobarang'];
            Cell[5,i].AsInteger := FieldValues['nosatuan'];
            Cell[6,i].AsFloat := FieldValues['nilai'];
          end;
          Next;
        end;
      end;
    end;
  end;
end;

procedure TFrm_PenerimaanBarang.BtnRekamClick(Sender: TObject);
var
  nopenyesuaian,i: Integer;
begin
  if dbgbarang.RowCount = 0 then begin
    MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
    Exit;
  end;
  if LPengiriman.Caption = '0' then begin
    MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
    Exit;
  end;
  {if DM.CekPeriode(dtptanggal.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtptanggal.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;     }
  with TZQuery.Create(Self)do begin
    Connection := dm.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        txtref.Text := DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
        nopenyesuaian := DM.GenerateNoMaster('penyesuaian');
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
        ParamByName('a').Value := 'IJ';
        ParamByName('b').Value := dtptanggal.Date;
        ParamByName('c').Value := txtref.Text;
        ExecSQL;
        Close;
        // masuk ke tabel penyesuaian
        SQL.Clear;
        SQL.Text := 'insert into tbl_penerimaanbarang values (:a,:b,:c,:d,:e,:f,:g)';
        ParamByName('a').Value := nopenyesuaian;
        ParamByName('b').Value := txtref.Text;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('d').Value := LGudangKe.Caption;
        ParamByName('e').Value := LPengiriman.Caption;
        ParamByName('f').Value := txtketerangan.Text;
        ParamByName('g').Value := Frm_Main.txtuser.Caption;
        ExecSQL;
        with dbgbarang do begin
          for i:=0 to RowCount-1 do begin
            Close;
            SQL.Clear;
            //masuk tabel detil penyesuaian
            SQL.Text := 'insert into tbl_penerimaanbarangdetail values(:a,:b,:c,:d,:e)';
            ParamByName('a').Value := nopenyesuaian;
            ParamByName('b').Value := Cell[4,i].AsInteger;
            ParamByName('c').Value := Cell[2,i].AsFloat;
            ParamByName('d').Value := Cell[5,i].AsInteger;
            ParamByName('e').Value := Cell[6,i].AsFloat;
            ExecSQL;

            Close;
            SQL.Clear;
            //masuk tabel buku besar barang
            SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
            //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
            ParamByName('b').Value := Cell[4,i].AsInteger;
            ParamByName('c').Value := 'IJ';
            ParamByName('d').Value := LGudangKe.Caption;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('f').Value := nopenyesuaian;
            ParamByName('g').Value := txtketerangan.Text;
            ParamByName('h').Value := Cell[2,i].AsFloat*Cell[6,i].AsFloat;
            ParamByName('i').Value := 0;
            ExecSQL;
          end;
        end;
        ClearText;
      end;
    end else begin
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(sum(b.qty),0)as terjual from ' +
                  '(select * from tbl_bukubesarbarang where noreferensi=:a and tipe=:t)as a ' +
                  'left join tbl_bukubesarbarangdetail as b on b.nobuku=a.nobuku group by a.nobuku';
      ParamByName('a').Value := LID.Caption;
      ParamByName('t').Value := 'IJ';
      Open;
      First;
      for i:=0 to RecordCount-1 do begin
        if FieldValues['terjual']=0 then begin
          Next;
        end else begin
          MessageDlg('Data tidak dapat diubah, karena barang telah terpakai oleh transaksi lain'#10#13'Hapus dulu transaksi penjualan atau penyesuaian yang menggunakan barang yang berasal dari Transaksi ini.',mtError,[mbOK],0);
          Free;
          Exit;
        end;
      end;
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        // masuk ke tabel penyesuaian
        SQL.Clear;
        SQL.Text := 'update tbl_penerimaanbarang set tglpenerimaanbarang=:c,nogudang=:d,nopengiriman=:e,keterangan=:f where nopenerimaanbarang=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('c').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
        ParamByName('d').Value := LGudangKe.Caption;
        ParamByName('e').Value := LPengiriman.Caption;
        ParamByName('f').Value := txtketerangan.Text;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_penerimaanbarangdetail where nopenerimaanbarang=:a';
        ParamByName('a').Value := LID.Caption;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
        ParamByName('np').Value := LID.Caption;
        ParamByName('t').Value := 'IJ';
        ExecSQL;
        with dbgbarang do begin
          for i:=0 to RowCount-1 do begin
            Close;
            SQL.Clear;
            //masuk tabel detil penyesuaian
            SQL.Text := 'insert into tbl_penerimaanbarangdetail values(:a,:b,:c,:d,:e)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := Cell[4,i].AsInteger;
            ParamByName('c').Value := Cell[2,i].AsFloat;
            ParamByName('d').Value := Cell[5,i].AsInteger;
            ParamByName('e').Value := Cell[6,i].AsFloat;
            ExecSQL;

            Close;
            SQL.Clear;
            //masuk tabel buku besar barang
            SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
            //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
            ParamByName('b').Value := Cell[4,i].AsInteger;
            ParamByName('c').Value := 'IJ';
            ParamByName('d').Value := LGudangKe.Caption;
            ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtptanggal.Date);
            ParamByName('f').Value := LID.Caption;
            ParamByName('g').Value := txtketerangan.Text;
            ParamByName('h').Value := Cell[2,i].AsFloat*Cell[6,i].AsFloat;
            ParamByName('i').Value := 0;
            ExecSQL;
          end;
        end;
        ClearText;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_PenerimaanBarang.dtptanggalChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtref.Text :=  DM.GenerateKodeTransaksi('IJ',dtptanggal.Date);
end;

end.
