unit UStockOpname;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RzButton, StdCtrls, Mask, RzEdit, RzLabel,
  ExtCtrls, RzPanel, frxClass, frxDBSet, cxPC;

type
  TFrm_StokOpname = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnCetak: TRzBitBtn;
    BtnReset: TRzBitBtn;
    BtnReset0: TRzBitBtn;
    QData: TZQuery;
    dbgbarang: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxNumberColumn1: TNxNumberColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    nobarang: TNxNumberColumn;
    BtnProses: TRzBitBtn;
    Q1: TZQuery;
    LGudang: TRzLabel;
    NxNumberColumn4: TNxNumberColumn;
    NxNumberColumn5: TNxNumberColumn;
    NxNumberColumn6: TNxNumberColumn;
    BtnGudang: TRzToolButton;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure FormShow(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure BtnReset0Click(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure BtnProsesClick(Sender: TObject);
    procedure BtnGudangClick(Sender: TObject);
    procedure dbgbarangCellDblClick(Sender: TObject; ACol, ARow: Integer);
    procedure dbgbarangKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_StokOpname: TFrm_StokOpname;

implementation

uses UDM, UMain, NxCells, UDataGudang, USetAkun, UDataSatuan;

{$R *.dfm}

procedure TFrm_StokOpname.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_StokOpname.RefreshQ;
var
  i:Integer;
begin
  with QData do begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                '(SELECT c.*,d.kodesatuan FROM ' +
                '(SELECT * FROM tbl_barang where aktif=1) AS c ' +
                'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS g ' +
                'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang and h.nogudang=:ng GROUP BY g.nobarang ' +
                'ORDER BY g.namabarang';
    ParamByName('ng').Value := LGudang.Caption;
    Open;
    First;
    dbgbarang.ClearRows;
    with dbgbarang do begin
      for i:= 0 to RecordCount-1 do begin
        AddRow();
        Cell[0,i].AsString := FieldValues['kodebarang'];
        Cell[1,i].AsString := FieldValues['namabarang'];
        Cell[2,i].AsString := FieldValues['kodesatuan'];
        Cell[3,i].AsFloat := FieldValues['tersedia'];
        Cell[4,i].AsFloat := FieldValues['tersedia'];
        Cell[5,i].AsFloat := Cell[4,i].AsFloat-Cell[3,i].AsFloat;
        Cell[6,i].AsInteger := FieldValues['nobarang'];
        Cell[7,i].AsInteger := FieldValues['nosatuan'];
        Cell[8,i].AsFloat := 1;
        Cell[9,i].AsInteger := FieldValues['noakunpersediaan'];
        Next;
      end;
    end;
  end;
end;

procedure TFrm_StokOpname.dbgbarangAfterEdit(Sender: TObject; ACol,
  ARow: Integer; Value: WideString);
begin
  if dbgbarang.RowCount = 0 then Exit;
  if ACol = 4 then begin
    if dbgbarang.Cell[4,ARow].AsFloat < 0 then begin
      dbgbarang.Cell[4,ARow].AsFloat := 0;
    end;
    dbgbarang.Cell[5,ARow].AsFloat := dbgbarang.Cell[4,ARow].AsFloat-dbgbarang.Cell[3,ARow].AsFloat;
  end;
end;

procedure TFrm_StokOpname.FormShow(Sender: TObject);
begin
  dbgbarang.ClearRows;
  RefreshQ;
end;

procedure TFrm_StokOpname.BtnResetClick(Sender: TObject);
var
  i:Integer;
begin
  if MessageDlg('Proses ini akan menjadikan Jumlah Barang Berdasarkan Fisik akan sama dengan Jumlah Barang Berdasarkan Buku. Lanjutkan proses ini ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    for i:=0 to dbgbarang.RowCount-1 do begin
      with dbgbarang do begin
        Cell[4,i].AsFloat := Cell[3,i].AsFloat;
        Cell[5,i].AsFloat := Cell[4,i].AsFloat-Cell[3,i].AsFloat;
      end;
    end;
  end;
end;

procedure TFrm_StokOpname.BtnReset0Click(Sender: TObject);
var
  i:Integer;
begin
  if MessageDlg('Proses ini akan menjadikan Jumlah Barang Berdasarkan Fisik menjadi NOL. Lanjutkan proses ini ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
    for i:=0 to dbgbarang.RowCount-1 do begin
      with dbgbarang do begin
        Cell[4,i].AsFloat := 0;
        Cell[5,i].AsFloat := Cell[4,i].AsFloat-Cell[3,i].AsFloat;
      end;
    end;
  end;
end;

procedure TFrm_StokOpname.BtnCetakClick(Sender: TObject);
var
  i:Integer;
  t:TfrxMemoView;
begin
  {Application.CreateForm(TFrm_FilterLaporanStockOpname, Frm_FilterLaporanStockOpname);
  with Frm_FilterLaporanStockOpname do begin
    if Frm_FilterLaporanStockOpname.ShowModal = mrok then begin
      with TZQuery.Create(Self)do begin
        Connection := DM.Con;
        with dbgbarang do begin
          for i:=0 to RowCount-1 do begin
            Close;
            SQL.Clear;
            //masuk tabel pembelian detil
            SQL.Text := 'insert into tbl_stokopname values(:a,:b,:c,:d)';
            ParamByName('a').Value := Cell[6,i].AsInteger;
            ParamByName('b').Value := Cell[3,i].AsFloat;
            ParamByName('c').Value := Cell[4,i].AsFloat;
            ParamByName('d').Value := Cell[5,i].AsFloat;
            ExecSQL;
          end;
        end;
        if RzRadioGroup1.ItemIndex = 0 then begin
          DM.QStockOpname.Close;
          DM.QStockOpname.SQL.Text := 'select c.*,d.kodesatuan from ' +
                                      '(select a.*,b.kodebarang,b.namabarang,b.nosatuan from ' +
                                      '(select * from tbl_stokopname)as a ' +
                                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan order by c.namabarang';
          DM.QStockOpname.Open;
          DM.Rpt_Stokopname1.ShowReport(True);
        end else if RzRadioGroup1.ItemIndex = 1 then begin
          DM.QStockOpname.Close;
          DM.QStockOpname.SQL.Text := 'select c.*,d.kodesatuan from ' +
                                      '(select a.*,b.kodebarang,b.namabarang,b.nosatuan from ' +
                                      '(select * from tbl_stokopname where selisih<>0)as a ' +
                                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan order by c.namabarang';
          DM.QStockOpname.Open;
          DM.Rpt_Stokopname2.ShowReport(True);
        end else if RzRadioGroup1.ItemIndex = 2 then begin
          DM.QStockOpname.Close;
          DM.QStockOpname.SQL.Text := 'select c.*,d.kodesatuan from ' +
                                      '(select a.*,b.kodebarang,b.namabarang,b.nosatuan from ' +
                                      '(select * from tbl_stokopname)as a ' +
                                      'left join tbl_barang as b on b.nobarang=a.nobarang)as c ' +
                                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan order by c.namabarang';
          DM.QStockOpname.Open;
          DM.Rpt_Stokopname3.ShowReport(True);
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_stokopname';
        ExecSQL;
        Free;
      end;
    end;
  end; }
end;

procedure TFrm_StokOpname.BtnProsesClick(Sender: TObject);
var
  i,j,nopenyesuaian,akunlain:Integer;
  kodepenyesuaian:string;
  hpp: Double;
begin
  j:= 0;
  for i:=0 to dbgbarang.RowCount-1 do begin
    if dbgbarang.Cell[5,i].AsFloat <> 0 then begin
      j:=j+1;
    end;
  end;
  if j > 0 then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Application.CreateForm(TFrm_SetAkun, Frm_SetAkun);
        JudulAkun := 'Koreksi Persediaan';
        Frm_SetAkun.LNoAkun.Caption := '0';
        Frm_SetAkun.txtke.Clear;
        if Frm_SetAkun.ShowModal = mrok then begin
          akunlain := StrToInt(Frm_SetAkun.LNoAkun.Caption);
          kodepenyesuaian := DM.GenerateKodeTransaksi('IJ',Date);
          nopenyesuaian := DM.GenerateNoMaster('penyesuaian');
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'IJ';
          ParamByName('b').Value := Date;
          ParamByName('c').Value := kodepenyesuaian;
          Close;
          // masuk ke tabel penyesuaian
          SQL.Clear;
          SQL.Text := 'insert into tbl_penyesuaian values (:a,:b,:c,:d,:e,:f,:g,:i)';
          ParamByName('a').Value := nopenyesuaian;
          ParamByName('b').Value := kodepenyesuaian;
          ParamByName('c').Value := Date;
          ParamByName('d').Value := 'Stock Opname';
          ParamByName('e').Value := LGudang.Caption;
          ParamByName('f').Value := LGudang.Caption;
          ParamByName('g').Value := 3;
          ParamByName('i').Value := Frm_Main.txtuser.Caption;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              Close;
              SQL.Clear;
              //masuk tabel detil penyesuaian
              SQL.Text := 'insert into tbl_penyesuaiandetail values(:a,:b,:c,:d,:e,:f,:g)';
              ParamByName('a').Value := nopenyesuaian;
              ParamByName('b').Value := Cell[6,i].AsInteger;
              ParamByName('c').Value := Cell[5,i].AsFloat;
              ParamByName('d').Value := Cell[7,i].AsInteger;
              ParamByName('e').Value := Cell[8,i].AsFloat;
              ParamByName('f').Value := Cell[9,i].AsInteger;
              ParamByName('g').Value := akunlain;
              ExecSQL;
              if Cell[5,i].AsFloat > 0 then begin
                hpp := DM.HargaBeli(Cell[6,i].AsInteger);
                DM.HitungHPPAverage(Cell[6,i].AsInteger,Cell[5,i].AsFloat*Cell[8,i].AsFloat,hpp);
                Close;
                SQL.Clear;
                //masuk tabel buku besar barang
                SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,masuk,hpp) values (:a,:b,:c,:d,:e,:f,:g,:h,:i)';
                //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                ParamByName('b').Value := Cell[6,i].AsInteger;
                ParamByName('c').Value := 'IJ';
                ParamByName('d').Value := LGudang.Caption;
                ParamByName('e').Value := Date;
                ParamByName('f').Value := nopenyesuaian;
                ParamByName('g').Value := 'Stock Opname';
                ParamByName('h').Value := Cell[5,i].AsFloat*Cell[8,i].AsFloat;
                ParamByName('i').Value := hpp;
                ExecSQL;

                hpp := hpp*Cell[5,i].AsFloat*Cell[8,i].AsFloat;
                DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,Date,'IJ',nopenyesuaian,'Stock Opname',hpp,0);
                DM.InsertBukuBesarAkun(akunlain,Date,'IJ',nopenyesuaian,'Stock Opname',0,hpp);
              end else if Cell[5,i].AsFloat < 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel buku besar barang
                SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                ParamByName('b').Value := Cell[6,i].AsInteger;
                ParamByName('c').Value := 'IJ';
                ParamByName('d').Value := LGudang.Caption;
                ParamByName('e').Value := Date;
                ParamByName('f').Value := nopenyesuaian;
                ParamByName('g').Value := 'Stock Opname';
                ParamByName('h').Value := Abs(Cell[5,i].AsFloat*Cell[8,i].AsFloat);
                hpp := DM.HitungHPPPenjualan(Cell[6,i].AsInteger,Abs(Cell[5,i].AsFloat*Cell[8,i].AsFloat));
                ParamByName('i').Value := hpp;
                ParamByName('j').Value := 0;
                ExecSQL;

                //masuk buku besar barang detail
                dm.AmbilNoBuku(Cell[6,i].AsInteger,StrToInt(LGudang.Caption),Abs(Cell[5,i].AsFloat*Cell[8,i].AsFloat),nopenyesuaian,'IJ');

                hpp := hpp*Abs(Cell[5,i].AsFloat*Cell[8,i].AsFloat);
                DM.InsertBukuBesarAkun(akunlain,Date,'IJ',nopenyesuaian,'Stock Opname',hpp,0);
                DM.InsertBukuBesarAkun(Cell[9,i].AsInteger,Date,'IJ',nopenyesuaian,'Stock Opname',0,hpp);
              end;
            end;
          end;
          RefreshQ;
        end;      
      end;
      Free;
    end;
  end;
end;

procedure TFrm_StokOpname.BtnGudangClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    RzPanel1.Caption := 'Stock Opname - Gudang: '+Frm_DataGudang.QData.FieldValues['kodegudang'];
    LGudang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
    RefreshQ;
  end;
end;

procedure TFrm_StokOpname.dbgbarangCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
var
  stok: Double;
begin
  if ACol = 2 then begin
    if dbgbarang.Cell[6,ARow].AsInteger = 0 then Exit;
    Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
    nomorbarang := dbgbarang.Cell[6,ARow].AsInteger;
    Frm_DataSatuan.RefreshQ;
    if Frm_DataSatuan.ShowModal = mrok then begin
      stok := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[2,ARow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
      dbgbarang.Cell[7,ARow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
      dbgbarang.Cell[8,ARow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
      dbgbarang.Cell[3,ARow].AsFloat := stok/dbgbarang.Cell[8,ARow].AsFloat;
      dbgbarang.Cell[5,ARow].AsFloat := dbgbarang.Cell[4,ARow].AsFloat-dbgbarang.Cell[3,ARow].AsFloat;
    end;
  end;
end;

procedure TFrm_StokOpname.dbgbarangKeyPress(Sender: TObject;
  var Key: Char);
var
  stok: Double;
begin
  if dbgbarang.SelectedColumn = 2 then begin
    if (key in['0'..'9',#8,#13,#32]) or (key in['a'..'z','A'..'Z',#8,#13,#32]) then begin
      if dbgbarang.Cell[6,dbgbarang.SelectedRow].AsInteger = 0 then Exit;
      Application.CreateForm(TFrm_DataSatuan, Frm_DataSatuan);
      nomorbarang := dbgbarang.Cell[6,dbgbarang.SelectedRow].AsInteger;
      Frm_DataSatuan.RefreshQ;
      if Frm_DataSatuan.ShowModal = mrok then begin
        stok := dbgbarang.Cell[3,dbgbarang.SelectedRow].AsFloat*dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[2,dbgbarang.SelectedRow].AsString := Frm_DataSatuan.QData.FieldValues['kodesatuan'];
        dbgbarang.Cell[7,dbgbarang.SelectedRow].AsInteger := Frm_DataSatuan.QData.FieldValues['nosatuan'];
        dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat := Frm_DataSatuan.QData.FieldValues['faktor'];
        dbgbarang.Cell[3,dbgbarang.SelectedRow].AsFloat := stok/dbgbarang.Cell[8,dbgbarang.SelectedRow].AsFloat;
        dbgbarang.Cell[5,dbgbarang.SelectedRow].AsFloat := dbgbarang.Cell[4,dbgbarang.SelectedRow].AsFloat-dbgbarang.Cell[3,dbgbarang.SelectedRow].AsFloat;
      end;
    end;
  end;
end;

end.
