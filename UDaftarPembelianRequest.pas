unit UDaftarPembelianRequest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, frxClass, frxDBSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC,
  cxTextEdit, cxCheckBox, Menus;

type
  TFrm_DaftarPembelianRequest = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    BtnSelesai: TRzBitBtn;
    BtnPerincian: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    BtnHapus: TRzBitBtn;
    Q1: TZQuery;
    BtnCetak: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataLevel1: TcxGridLevel;
    BtnUpdate: TRzToolButton;
    BtnFilter: TRzToolButton;
    QDatanopembelianrequest: TLargeintField;
    QDatakodepembelianrequest: TStringField;
    QDataselesai: TSmallintField;
    QDatanamauser: TStringField;
    dbgdataDBTableView1kodepembelianrequest: TcxGridDBColumn;
    dbgdataDBTableView1tgldibuat: TcxGridDBColumn;
    dbgdataDBTableView1keperluan: TcxGridDBColumn;
    dbgdataDBTableView1Pos: TcxGridDBColumn;
    QDatatglpembelianrequest: TDateField;
    PopupMenu1: TPopupMenu;
    CekPO1: TMenuItem;
    QDatacatatan: TMemoField;
    procedure BtnSelesaiClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnPerincianClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure dbgdataDBTableView1DblClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure CekPO1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_DaftarPembelianRequest: TFrm_DaftarPembelianRequest;
  datedari,datesampai:string;

implementation

uses UDM, UPembelianRequest, UFTanggal, UMain, UDataPembelianRequestOrder, UPembelianOrder;

{$R *.dfm}

procedure TFrm_DaftarPembelianRequest.BtnSelesaiClick(Sender: TObject);
var
   ts: TcxTabSheet;
begin
   ts := (Self.parent as TcxTabSheet);
   Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_DaftarPembelianRequest.RefreshQ;
begin
  with QData do begin
    Close;
    ParamByName('tkd').Value := datedari;
    ParamByName('tks').Value := datesampai;
    Open;
  end;
end;

procedure TFrm_DaftarPembelianRequest.BtnHapusClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  {if DM.CekPeriode(QData.FieldValues['tgldibuat'])= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(QData.FieldValues['tgldibuat'])= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;     }
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian9')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM tbl_pembelianorder WHERE nopembelianrequest=:np';
    ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
    Open;
    if not IsEmpty then begin
      MessageDlg('Transaksi ini telah di order. Data tidak dapat dihapus!',mtError,[mbOK],0);
    end else begin
      if MessageDlg('Hapus transaksi ?'#10#13'Perhatian: Perubahan setelah dihapus tidak bisa dibatalkan/dikembalikan!',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Close;
        SQL.Text := 'delete from tbl_pembelianrequest where nopembelianrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_pembelianrequestdetail where nopembelianrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
        ExecSQL;
        RefreshQ;
      end;
    end;
    Free;
  end;
end;

procedure TFrm_DaftarPembelianRequest.BtnPerincianClick(Sender: TObject);
var
  i:Integer;
  f: TFrm_PembelianRequest;
  ts: TcxTabSheet;
begin
  if QData.IsEmpty then Exit;
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if not DM.CekTabOpen('Permintaan Pembelian') then begin
    f := TFrm_PembelianRequest.Create(Self);
    with f do begin
      ClearText;
      dbgbarang.AddRow();
      {if DM.CekPeriode(QData.FieldValues['tglpembelianrequest'])=0 then begin
        dtpdibuat.ReadOnly := True;
      end;         }
      with TZQuery.Create(Self)do begin
        Connection := DM.con;
        Close;
        SQL.Text := 'SELECT * FROM tbl_pembelianrequest WHERE nopembelianrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
        Open;
        LID.Caption := FieldValues['nopembelianrequest'];
        txtreferensi.Text := FieldValues['kodepembelianrequest'];
        dtpdibuat.Date := FieldValues['tglpembelianrequest'];
        txtketerangan.Text := FieldValues['catatan'];
        Close;
        SQL.Clear;
        SQL.Text := 'SELECT * FROM tbl_pembelianorder WHERE nopembelianrequest=:np';
        ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
        Open;
        if not IsEmpty then LOrder.Caption := '1';
        Close;
        SQL.Clear;
        SQL.Text := 'select c.*,d.kodesatuan from ' +
                    '(select a.*,b.kodebarang,b.namabarang from ' +
                    '(select * from tbl_pembelianrequestdetail where nopembelianrequest=:np)as a ' +
                    'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                    'left join tbl_satuan as d on d.nosatuan=c.nosatuan';
        ParamByName('np').Value := LID.Caption;
        Open;
        if not IsEmpty then begin
          dbgbarang.ClearRows;
          First;
          for i:=0 to RecordCount-1 do begin
            with dbgbarang do begin
              AddRow();
              Cell[1,i].AsString := FieldValues['kodebarang'];
              Cell[2,i].AsString := FieldValues['namabarang'];
              Cell[3,i].AsFloat := FieldValues['qty'];
              Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
              if FieldValues['tgldiperlukan'] <> null then 
              Cell[5,i].AsDateTime := FieldValues['tgldiperlukan'];
              Cell[6,i].AsString := FieldValues['keteranganbarang'];
              Cell[7,i].AsFloat := CekPO(StrToInt(LID.Caption),FieldValues['nobarang'],FieldValues['nosatuan']);
              Cell[8,i].AsInteger := FieldValues['nobarang'];
              Cell[9,i].AsInteger := FieldValues['nosatuan'];
              Cell[10,i].AsFloat := FieldValues['nilai'];
            end;
            Next;
          end;
        end;
        Free;
      end;
    end;
    f.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
    f.Show;
    ts := (f.parent as TcxTabSheet);
    Frm_Main.PGMain.ActivePage := ts;
  end;
end;

procedure TFrm_DaftarPembelianRequest.FormShow(Sender: TObject);
begin
  datedari := FormatDateTime('yyyy-mm-dd',DM.FDOM(Date));
  datesampai := FormatDateTime('yyyy-mm-dd',DM.LastDayCurrMon(Date));
  RefreshQ;
end;

procedure TFrm_DaftarPembelianRequest.BtnFilterClick(Sender: TObject);
begin
  Application.CreateForm(TFTanggal, FTanggal);
  with FTanggal do begin
    if ShowModal=mrok then begin
      datedari := FormatDateTime('yyyy-mm-dd',FTanggal.dtpdari.Date);
      datesampai := FormatDateTime('yyyy-mm-dd',FTanggal.dtpsampai.Date);
      RefreshQ;
    end;
  end;
end;

procedure TFrm_DaftarPembelianRequest.dbgdataDBTableView1DblClick(
  Sender: TObject);
begin
  BtnPerincianClick(nil);
end;

procedure TFrm_DaftarPembelianRequest.BtnUpdateClick(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_DaftarPembelianRequest.BtnCetakClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  DM.Q_NotaPembelianPR.Close;
  DM.Q_NotaPembelianPR.ParamByName('np').Value := QData.FieldValues['nopembelianrequest'];
  DM.Q_NotaPembelianPR.Open;
  DM.Nota_PembelianPR.ShowReport(True);
end;

procedure TFrm_DaftarPembelianRequest.CekPO1Click(Sender: TObject);
var
  g: TFrm_PembelianOrder;
  ts: TcxTabSheet;
  i: Integer;
begin
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_DataPembelianRequestOrder, Frm_DataPembelianRequestOrder);
  norequest := QData.FieldValues['nopembelianrequest'];
  Frm_DataPembelianRequestOrder.RefreshQ;
  if Frm_DataPembelianRequestOrder.ShowModal = mrok then begin
    if DM.CekAkses(Frm_Main.txtuser.Caption,'Pembelian2')=False then begin
      MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
      Exit;
    end;
    if not DM.CekTabOpen('Order Pembelian') then begin
      g := TFrm_PembelianOrder.Create(Self);
      with g do begin
        ClearText;
        dbgbarang.AddRow();
        {if DM.CekPeriode(QData.FieldValues['tgltransaksi'])=0 then begin
          dtpfaktur.ReadOnly := True;
        end;         }
        with TZQuery.Create(Self)do begin
          Connection := DM.con;
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT a.*,IFNULL(b.namakontak,'+QuotedStr('')+')AS namakontak FROM ' +
                      '(SELECT a.*,IFNULL(b.kodepembelianrequest,'+QuotedStr('')+')AS kodepembelianrequest FROM ' +
                      '(SELECT * FROM tbl_pembelianorder where nopembelianorder=:np)AS a ' +
                      'LEFT JOIN tbl_pembelianrequest as b on b.nopembelianrequest=a.nopembelianrequest)as a ' +
                      'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak ORDER BY a.tgltransaksi,a.kodepembelianorder';
          ParamByName('np').Value := Frm_DataPembelianRequestOrder.QData.FieldValues['nopembelianorder'];
          Open;
          LID.Caption := FieldValues['nopembelianorder'];
          LSupplier.Caption := FieldValues['nokontak'];
          txtsupplier.Text := FieldValues['namakontak'];
          txtreferensi.Text := FieldValues['kodepembelianorder'];
          dtpfaktur.Date := FieldValues['tgltransaksi'];
          txtrequest.Text := FieldValues['kodepembelianrequest'];
          LRequest.Caption := FieldValues['nopembelianrequest'];
          if FieldValues['selesai']=0 then begin
            cbselesai.Checked := False;
          end else if FieldValues['selesai']=1 then begin
            cbselesai.Checked := True;
          end;
          if FieldValues['approve']=0 then begin
            cbapprove.Checked := False;
          end else if FieldValues['selesai']=1 then begin
            cbapprove.Checked := True;
          end;
          txtbiaya.Value := FieldValues['biayalain'];
          txtpph.Value := FieldValues['pph'];
          txtdiskondays.Value := FieldValues['diskonday'];
          txtduedate.Value := FieldValues['duedate'];
          txtearlydiscount.Value := FieldValues['earlydiskon'];
          txtlatecharge.Value := FieldValues['latecharge'];
          txtterm.Text := DM.GetTerm(txtdiskondays.Value,txtduedate.Value,txtearlydiscount.Value,txtlatecharge.Value);
          LBiayaLain.Caption := FieldValues['noakunbiayalain'];
          Close;
          SQL.Clear;
          SQL.Text := 'select * from tbl_pembelianterima where nopembelianorder=:a';
          ParamByName('a').Value := LID.Caption;
          Open;
          if IsEmpty then
            LTerima.Caption := '0'
          else LTerima.Caption := '1';
          Close;
          SQL.Clear;
          SQL.Text := 'select a.*,ifnull(b.kodepph,'+QuotedStr('-')+')as kodepph from ' +
                      '(select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak from ' +
                      '(select c.*,d.kodesatuan from ' +
                      '(select a.*,b.kodebarang,b.namabarang from ' +
                      '(select * from tbl_pembelianorderdetail where nopembelianorder=:np)as a ' +
                      'left join tbl_barang as b on b.nobarang=a.nobarang) as c ' +
                      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as a ' +
                      'left join tbl_pajak as b on b.nopajak=a.nopajak)as a ' +
                      'left join tbl_pajakpenghasilan as b on b.nopph=a.nopph';
          ParamByName('np').Value := LID.Caption;
          Open;
          if not IsEmpty then begin
            dbgbarang.ClearRows;
            First;
            for i:=0 to RecordCount-1 do begin
              with dbgbarang do begin
                AddRow();
                Cell[0,i].AsString := FieldValues['kodebarang'];
                Cell[1,i].AsString := FieldValues['namabarang'];
                Cell[2,i].AsFloat := CekPR(StrToInt(LID.Caption),FieldValues['nobarang'],FieldValues['nosatuan'])+FieldValues['qty'];
                Cell[3,i].AsFloat := FieldValues['qty'];
                Cell[4,i].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
                Cell[5,i].AsFloat := FieldValues['harga'];
                Cell[6,i].AsFloat := FieldValues['diskon1'];
                Cell[7,i].AsFloat := FieldValues['diskon2'];
                Cell[8,i].AsFloat := FieldValues['subtotal'];
                Cell[9,i].AsString := FieldValues['kodepajak'];
                Cell[10,i].AsInteger := FieldValues['nobarang'];
                Cell[11,i].AsInteger := FieldValues['nosatuan'];
                Cell[12,i].AsFloat := FieldValues['nilai'];
                Cell[13,i].AsInteger := FieldValues['nopajak'];
                Cell[14,i].AsInteger := FieldValues['tipepajak'];
                Cell[15,i].AsFloat := FieldValues['persenpajak'];
                Cell[16,i].AsFloat := FieldValues['dppbarang'];
                Cell[17,i].AsFloat := FieldValues['ppnbarang'];
                Cell[18,i].AsString := FieldValues['kodepph'];
                Cell[19,i].AsInteger := FieldValues['nopph'];
                Cell[20,i].AsFloat := FieldValues['persenpph'];
                Cell[21,i].AsFloat := FieldValues['pphbarang'];
              end;
              Next;
            end;
          end;
          UpdateTotal;
          Free;
        end;
      end;
      g.ManualDock(Frm_Main.PGMain, Frm_Main.PGMain, alClient);
      g.Show;
      ts := (g.parent as TcxTabSheet); 
      Frm_Main.PGMain.ActivePage := ts;
    end;
  end;
end;

end.
