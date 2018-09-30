unit UDataBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TFrm_DataBarang = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    QData: TZQuery;
    DSData: TDataSource;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    dbgdataDBTableView1kodebarang: TcxGridDBColumn;
    dbgdataDBTableView1namabarang: TcxGridDBColumn;
    dbgdataDBTableView1tersedia: TcxGridDBColumn;
    Q1: TZQuery;
    Q2: TZQuery;
    QDatanobarang: TLargeintField;
    QDatakodebarang: TStringField;
    QDatanamabarang: TStringField;
    QDatanokelompokbarang: TLargeintField;
    QDatanosatuan: TLargeintField;
    QDatahargajual: TFloatField;
    QDatafaktor: TFloatField;
    QDatatipe: TStringField;
    QDatatersedia: TFloatField;
    QDatatotal: TLargeintField;
    QDatakodesatuan: TStringField;
    dbgdataDBTableView1Column1: TcxGridDBColumn;
    dbgdataDBTableView1Column2: TcxGridDBColumn;
    BtnGudang: TRzToolButton;
    BtnUpdate: TRzToolButton;
    ATipe1: TRzLabel;
    LGudang: TRzLabel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGDataDblClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
    procedure BtnUbahClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure dbgdataDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGudangClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
    procedure RefreshQ1;
  end;

var
  Frm_DataBarang: TFrm_DataBarang;
  AGudang,ATipe:Integer;

implementation

uses UDM, NxCells, UInputBarang, UMain, UDataGudang;

{$R *.dfm}

procedure TFrm_DataBarang.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataBarang.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataBarang.RefreshQ1;
begin
  AGudang := -1;
  with QData do begin
    Close;
    SQL.Clear;
    if AGudang = -1 then begin
      if ATipe = -1 then begin
        SQL.Text := 'SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                    '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                    '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM tbl_barang where aktif=1 ' +
                    'UNION ' +
                    'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang FROM tbl_barang where aktif=1)AS a ' +
                    'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                    'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                    'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROUP BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c ' +
                    'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan ' +
                    'ORDER BY c.namabarang';
      end else begin
        SQL.Text := 'SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                    '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                    '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM tbl_barang where aktif=1 ' +
                    'UNION ' +
                    'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang FROM tbl_barang where aktif=1)AS a ' +
                    'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                    'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                    'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROUP BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c ' +
                    'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan WHERE c.tipe<>'+QuotedStr('Service')+' ORDER BY c.namabarang';
      end;
    end else begin
      if ATipe = -1 then begin
        SQL.Text := 'SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                    '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                    '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM tbl_barang where aktif=1 ' +
                    'UNION ' +
                    'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang FROM tbl_barang where aktif=1)AS a ' +
                    'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                    'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                    'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang and h.nogudang=:ng GROUP BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c ' +
                    'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan ' +
                    'ORDER BY c.namabarang';
      end else begin
        SQL.Text := 'SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                    '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                    '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM tbl_barang where aktif=1 ' +
                    'UNION ' +
                    'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' else '+QuotedStr('Service')+' end as tipe FROM ' +
                    '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang FROM tbl_barang where aktif=1)AS a ' +
                    'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                    'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                    'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang and h.nogudang=:ng GROUP BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c ' +
                    'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan WHERE c.tipe<>'+QuotedStr('Service')+' ORDER BY c.namabarang';
      end;
      ParamByName('ng').Value := AGudang;
    end;
    Open;
  end;
end;

procedure TFrm_DataBarang.DBGDataDblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataBarang.BtnBaruClick(Sender: TObject);
var
  nobarang,i:Integer;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputBarang, Frm_InputBarang);
  with Frm_InputBarang do begin
    ClearText;
    CekSO;
    CekPO;
    DBGHarga.AddRow();
    if ShowModal = mrok then begin
      nobarang := DM.GenerateNoMaster('barang');
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'insert into tbl_barang values (:a,:b,:c,:d,:e,:f,:g,:h,:j,:l,:r,:s,:t,:u,:v)';
        ParamByName('a').Value := nobarang;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtNama.Text;
        ParamByName('d').Value := LKelompokBarang.Caption;
        ParamByName('e').Value := LSatuan.Caption;
        if cbaktif.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        ParamByName('g').Value := txtMin.Value;
        ParamByName('h').Value := txtjual.Value;
        if GBTipe.ItemIndex = 0 then
          ParamByName('j').Value := LAkunHpp.Caption
        else ParamByName('j').Value := 0;
        ParamByName('l').Value := LAkunPersediaan.Caption;
        ParamByName('r').Value := GBTipe.ItemIndex;
        ParamByName('s').Value := LPajakPembelian.Caption;
        ParamByName('t').Value := LPajakPenjualan.Caption;
        ParamByName('u').Value := txtfield1.Text;
        ParamByName('v').Value := txtfield2.Text;
        ExecSQL;
        for i:=0 to DBGHarga.RowCount-1 do begin
          if DBGHarga.Cell[3,i].AsInteger <> 0 then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_barangharga values (:a,:b,:c)';
            ParamByName('a').Value := nobarang;
            ParamByName('b').Value := DBGHarga.Cell[3,i].AsInteger;
            ParamByName('d').Value := DBGHarga.Cell[1,i].AsFloat;
            ExecSQL;
          end;
        end;
        Free;
      end;
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DataBarang.BtnUbahClick(Sender: TObject);
var
  i: Integer;
begin
  if QData.IsEmpty = null then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data3')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputBarang, Frm_InputBarang);
  with TZQuery.Create(Self)do begin
    Connection := dm.Con;
    with Frm_InputBarang do begin
      ClearText;
      DBGHarga.AddRow();
      Close;
      SQL.Text := 'SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM ' +
                  '(SELECT c.*,d.kodesatuan FROM ' +
                  '(SELECT * FROM tbl_barang where nobarang=:nb) AS c ' +
                  'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS g ' +
                  'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROUP BY g.nobarang ' +
                  'ORDER BY g.namabarang';
      ParamByName('nb').Value := QData.FieldValues['nobarang'];
      Open;
      LID.Caption := FieldValues['nobarang'];
      txtkode.Text := FieldValues['kodebarang'];
      txtNama.Text := FieldValues['namabarang'];
      txtsatuan.Text := FieldValues['kodesatuan'];
      LSatuan.Caption := FieldValues['nosatuan'];
      LKelompokBarang.Caption := FieldValues['nokelompokbarang'];
      if FieldValues['aktif'] = 1 then
        cbaktif.Checked := True
      else cbaktif.Checked := False;
      txtMin.Value := FieldValues['minstok'];
      txtjual.Value := FieldValues['hargajual'];
      txtStok.Value := FieldValues['tersedia'];
      txtpo.Value := 0;
      txtso.Value := 0;
      txtbeli.Value := DM.CekHargaBeli(FieldValues['nobarang']);
      txthpp.Value := DM.CekHPP(FieldValues['nobarang']);
      LAkunHpp.Caption := FieldValues['noakunhpp'];
      LAkunPersediaan.Caption := FieldValues['noakunpersediaan'];
      LPajakPembelian.Caption := FieldValues['nopajakpembelian'];
      LPajakPenjualan.Caption := FieldValues['nopajakpenjualan'];
      txtfield1.Text := FieldValues['field1'];
      txtfield2.Text := FieldValues['field2'];
      GBTipe.ItemIndex := FieldValues['tipebarang'];
      GBTipeClick(nil);

      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarbarang where nobarang=:a';
      ParamByName('a').Value := LID.Caption;
      Open;
      if not IsEmpty then begin
        txtsatuan.ReadOnly := True;
        GBTipe.Enabled := False;
        GBAkun.Enabled := False;
      end;
      if LKelompokBarang.Caption <> '0' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_kelompokbarang where nokelompokbarang=:a';
        ParamByName('a').Value := LKelompokBarang.Caption;
        Open;
        if IsEmpty then begin
          LKelompokBarang.Caption := '0';
          txtkelompokbarang.Clear;
        end else txtkelompokbarang.Text := FieldValues['kelompokbarang'];
      end;
      if LPajakPembelian.Caption <> '0' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pajak where nopajak=:a';
        ParamByName('a').Value := LPajakPembelian.Caption;
        Open;
        if IsEmpty then begin
          LPajakPembelian.Caption := '0';
          txtpajakbeli.Text := '-';
        end else txtpajakbeli.Text := FieldValues['kodepajak'];
      end;
      if LPajakPenjualan.Caption <> '0' then begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from tbl_pajak where nopajak=:a';
        ParamByName('a').Value := LPajakPenjualan.Caption;
        Open;
        if IsEmpty then begin
          LPajakPenjualan.Caption := '0';
          txtpajakjual.Text := '-';
        end else txtpajakjual.Text := FieldValues['kodepajak'];
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunHpp.Caption;
      Open;
      if IsEmpty then begin
        LAkunHpp.Caption := '0';
        txtakunhpp.Clear;
      end else txtakunhpp.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_akun where noakun=:a and aktif=1';
      ParamByName('a').Value := LAkunPersediaan.Caption;
      Open;
      if IsEmpty then begin
        LAkunPersediaan.Caption := '0';
        txtakunpersediaan.Clear;
      end else txtakunpersediaan.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      Q2.Close;
      Q2.SQL.Clear;
      Q2.SQL.Text :=  'select a.*,ifnull(b.kodesatuan,'+QuotedStr('')+')as kodesatuan from ' +
                      '(select * from tbl_barangharga where nobarang=:nb)as a ' +
                      'left join tbl_satuan as b on b.nosatuan=a.nosatuan';
      Q2.ParamByName('nb').Value := LID.Caption;
      Q2.Open;
      if not Q2.IsEmpty then begin
        DBGHarga.ClearRows;
        Q2.First;
        for i := 0 to Q2.RecordCount-1 do begin
          DBGHarga.AddRow();
          DBGHarga.Cell[0,i].AsString := Q2.FieldValues['kodesatuan'];
          DBGHarga.Cell[1,i].AsFloat := Q2.FieldValues['faktor'];
          DBGHarga.Cell[3,i].AsInteger := Q2.FieldValues['nosatuan'];
          Q2.Next;
        end;
      end;
      CekSO;
      CekPO;
      if Frm_InputBarang.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_barang set kodebarang=:b, namabarang=:c, nokelompokbarang=:d, nosatuan=:e, aktif=:f, minstok=:h, hargajual=:i, ' +
                    'noakunhpp=:k, noakunpersediaan=:m, tipebarang=:t,nopajakpembelian=:u,nopajakpenjualan=:v,field1=:w,field2=:x where nobarang=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := txtkode.Text;
        ParamByName('c').Value := txtNama.Text;
        ParamByName('d').Value := LKelompokBarang.Caption;
        ParamByName('e').Value := LSatuan.Caption;
        if cbaktif.Checked = True then
          ParamByName('f').Value := 0
        else ParamByName('f').Value := 1;
        ParamByName('h').Value := txtMin.Value;
        ParamByName('i').Value := txtjual.Value;
        if GBTipe.ItemIndex = 0 then
          ParamByName('k').Value := LAkunHpp.Caption
        else ParamByName('k').Value := 0;
        ParamByName('m').Value := LAkunPersediaan.Caption;
        ParamByName('t').Value := GBTipe.ItemIndex;
        ParamByName('u').Value := LPajakPembelian.Caption;
        ParamByName('v').Value := LPajakPenjualan.Caption;
        ParamByName('w').Value := txtfield1.Text;
        ParamByName('x').Value := txtfield2.Text;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_barangharga where nobarang=:a';
        ParamByName('a').Value := LID.Caption;
        ExecSQL;
        for i:=0 to DBGHarga.RowCount-1 do begin
          if DBGHarga.Cell[3,i].AsInteger <> 0 then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_barangharga values (:a,:b,:c)';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := DBGHarga.Cell[3,i].AsInteger;
            ParamByName('c').Value := DBGHarga.Cell[1,i].AsFloat;
            ExecSQL;
          end;
        end;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DataBarang.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

procedure TFrm_DataBarang.dbgdataDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then BtnOkClick(nil);
end;

procedure TFrm_DataBarang.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then begin
    BtnOkClick(nil);
  end else if key = vk_escape then begin
    BtnBatalClick(nil);
  end;
end;

procedure TFrm_DataBarang.BtnGudangClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  Frm_DataGudang.RefreshQ;
  if Frm_DataGudang.ShowModal = mrok then begin
    ATipe1.Caption := '1';
    RzPanel2.Caption := 'Data Barang - '+Frm_DataGudang.QData.FieldValues['namagudang'];
    LGudang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
    RefreshQ;
  end else begin
    ATipe1.Caption := '0';
    RzPanel2.Caption := 'Data Barang';
    RefreshQ;
  end;
end;

procedure TFrm_DataBarang.RefreshQ;
begin
  with QData do begin
    Close;
    if ATipe1.Caption = '0' then begin
      SQL.Clear;
      SQL.Text := 'SELECT g.*,IFNULL(h.kelompokbarang,'+QuotedStr('')+')AS kelompokbarang FROM ' +
                  '(SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                  '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                  '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia,IFNULL(h.nogudang,0)AS nogudang FROM ' +
                  '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+'  end as tipe,aktif FROM tbl_barang ' +
                  'UNION ' +
                  'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' end as tipe,aktif FROM ' +
                  '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang,aktif FROM tbl_barang)AS a ' +
                  'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                  'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                  'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROUP BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c ' +
                  'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS g ' +
                  'LEFT JOIN tbl_kelompokbarang AS h ON h.nokelompokbarang=g.nokelompokbarang ' +
                  'ORDER BY g.namabarang';
    end else begin
      SQL.Clear;
      SQL.Text := 'SELECT g.*,IFNULL(h.kelompokbarang,'+QuotedStr('')+')AS kelompokbarang FROM ' +
                  '(SELECT c.*,CONCAT(d.kodesatuan,'+QuotedStr('(')+',ROUND(c.faktor),'+QuotedStr(')')+')AS kodesatuan FROM ' +
                  '(SELECT a.*,tersedia DIV faktor AS total FROM ' +
                  '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia,IFNULL(h.nogudang,0)AS nogudang FROM ' +
                  '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan,hargajual,1 AS faktor,case when tipebarang=0 then '+QuotedStr('Persediaan')+' when tipebarang=1 then '+QuotedStr('Non-Persediaan')+'  end as tipe,aktif FROM tbl_barang ' +
                  'UNION ' +
                  'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '+QuotedStr('Persediaan')+' when a.tipebarang=1 then '+QuotedStr('Non-Persediaan')+' end as tipe,aktif FROM ' +
                  '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajual,tipebarang,aktif FROM tbl_barang)AS a ' +
                  'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang ' +
                  'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g ' +
                  'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang and h.nogudang=:ng GROUP BY g.nobarang,h.nogudang,g.nosatuan,g.faktor)AS a)AS c ' +
                  'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS g ' +
                  'LEFT JOIN tbl_kelompokbarang AS h ON h.nokelompokbarang=g.nokelompokbarang ' +
                  'ORDER BY g.namabarang';
      ParamByName('ng').Value := LGudang.Caption;
    end;
    Open;
  end;
end;

procedure TFrm_DataBarang.FormShow(Sender: TObject);
begin
  //if DM.CekUserGudang(Frm_Main.txtuser.Caption)= -1 then begin
    BtnGudang.Visible := True;
    ATipe1.Caption := '0';
    RzPanel2.Caption := 'Data Barang';
  {end else begin
    BtnGudang.Visible := False;
    ATipe1.Caption := '1';
    LGUdang.Caption := IntToStr(DM.CekUserGudang(Frm_Main.txtuser.Caption));
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
      ParamByName('a').Value := LGUdang.Caption;
      Open;
      RzPanel2.Caption := 'Data Barang - '+FieldValues['namagudang'];
      Free;
    end;
  end;  }
  RefreshQ;
end;

procedure TFrm_DataBarang.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

end.
