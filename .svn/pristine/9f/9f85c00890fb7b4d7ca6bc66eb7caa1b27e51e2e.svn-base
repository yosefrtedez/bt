unit UPenjualanDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzButton, RzLine, NxColumnClasses, NxColumns,
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid, NxEdit,
  RzRadChk, StdCtrls, Mask, RzBtnEdt, RzLabel, RzPanel, ExtCtrls, cxPC, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RzTabs, RzCmboBx,
  NxColumns6, NxGridView6, NxControls6, NxCustomGrid6, NxVirtualGrid6,
  NxGrid6, frxClass;

type
  TFrm_PenjualanPengiriman = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    LCustomer: TRzLabel;
    LID: TRzLabel;
    txtcustomer: TRzButtonEdit;
    txtreferensi: TRzEdit;
    dtpfaktur: TNxDatePicker;
    RzPanel2: TRzPanel;
    BtnRekam: TRzBitBtn;
    BtnBatal: TRzBitBtn;
    RzPanel3: TRzPanel;
    ZQuery1: TZQuery;
    RzLabel3: TRzLabel;
    RzLabel6: TRzLabel;
    txtgudang: TRzButtonEdit;
    LGUdang: TRzLabel;
    txtso: TRzButtonEdit;
    LSO: TRzLabel;
    dbgbarang: TNextGrid6;
    NxReportGridView61: TNxReportGridView6;
    NxTextColumn61: TNxTextColumn6;
    NxTextColumn62: TNxTextColumn6;
    NxNumberColumn61: TNxNumberColumn6;
    NxNumberColumn62: TNxNumberColumn6;
    NxTextColumn63: TNxTextColumn6;
    NxNumberColumn63: TNxNumberColumn6;
    NxNumberColumn64: TNxNumberColumn6;
    NxNumberColumn65: TNxNumberColumn6;
    NxNumberColumn66: TNxNumberColumn6;
    NxTextColumn64: TNxTextColumn6;
    NxNumberColumn67: TNxNumberColumn6;
    NxNumberColumn68: TNxNumberColumn6;
    NxNumberColumn69: TNxNumberColumn6;
    NxNumberColumn617: TNxNumberColumn6;
    NxNumberColumn610: TNxNumberColumn6;
    NxNumberColumn611: TNxNumberColumn6;
    NxNumberColumn612: TNxNumberColumn6;
    NxNumberColumn613: TNxNumberColumn6;
    NxNumberColumn614: TNxNumberColumn6;
    NxNumberColumn615: TNxNumberColumn6;
    NxNumberColumn616: TNxNumberColumn6;
    NxNumberColumn619: TNxNumberColumn6;
    NxNumberColumn620: TNxNumberColumn6;
    NxNumberColumn621: TNxNumberColumn6;
    RzPanel4: TRzPanel;
    RzLabel13: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel14: TRzLabel;
    LBiayaLain: TRzLabel;
    txtqty: TRzNumericEdit;
    txtitem: TRzNumericEdit;
    txtbiaya: TRzNumericEdit;
    LPosting: TRzLabel;
    NxNumberColumn618: TNxNumberColumn6;
    NxNumberColumn622: TNxNumberColumn6;
    cbapprove: TRzCheckBox;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnRekamClick(Sender: TObject);
    procedure txtcustomerButtonClick(Sender: TObject);
    procedure txtcustomerKeyPress(Sender: TObject; var Key: Char);
    procedure txtsoButtonClick(Sender: TObject);
    procedure dbgbarangAfterEdit(Sender: TObject; ACol, ARow: Integer;
      Value: WideString);
    procedure txtgudangButtonClick(Sender: TObject);
    procedure txtgudangKeyPress(Sender: TObject; var Key: Char);
    procedure txtsoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpfakturChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ClearText;
    procedure IsiGridBarang;
    function CekSO(ANoSO, ANoBarang, AUrut:Integer):Double;
    procedure UpdateTotal;
  end;

var
  Frm_PenjualanPengiriman: TFrm_PenjualanPengiriman;

implementation

uses UDM, UDataPenjualanOrder, UMain, UDataKontak, NxCells, UDataGudang, UDataBarang,
  UDataSatuan, UDataPajak, NxIntf6;

{$R *.dfm}

procedure TFrm_PenjualanPengiriman.BtnBatalClick(Sender: TObject);
var
  ts: TcxTabSheet;
begin
  ts := (Self.parent as TcxTabSheet);
  Frm_Main.CloseTab(Self, ts);
end;

procedure TFrm_PenjualanPengiriman.ClearText;
begin
  LID.Caption := '0';
  dtpfaktur.Date := tanggalserver;
  txtreferensi.Text := DM.GenerateKodeTransaksi('SJ',dtpfaktur.Date);
  txtcustomer.Clear;
  LCustomer.Caption := '0';
  dbgbarang.ClearRows;
  txtgudang.Text := '';
  LGUdang.Caption := '';
  {if DM.CekUserGudang(Frm_Main.txtuser.Caption)= -1 then begin
    txtgudang.ReadOnly := False;
  end else begin
    txtgudang.ReadOnly := True;
    LGUdang.Caption := IntToStr(DM.CekUserGudang(Frm_Main.txtuser.Caption));
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Text := 'select namagudang from tbl_gudang where nogudang=:a';
      ParamByName('a').Value := LGUdang.Caption;
      Open;
      txtgudang.Text := FieldValues['namagudang'];
      Free;
    end;
  end;    }
  txtso.Clear;
  LSO.Caption := '0';
  txtbiaya.Value := 0;
  UpdateTotal;
  LPosting.Caption := '0';
end;

procedure TFrm_PenjualanPengiriman.BtnRekamClick(Sender: TObject);
var
  notransaksi,i,j: Integer;
  jumlahqty, hpp:Double;
  t:TfrxMemoView;
begin
  if DM.CekAkunPenting = False then begin
    MessageDlg('Transaksi tidak dapat diproses. Cek kembali Akun Default !!',mtError,[mbOK],0);
    Exit;
  end;
  if LCustomer.Caption = '0' then begin
    MessageDlg('Customer : harus diisi terlebih dahulu !',mtError,[mbOK],0);
    txtcustomer.SetFocus;
    Exit;
  end;
  if LGUdang.Caption = '' then begin
    MessageDlg('Gudang : belum dipilih !',mtError,[mbOK],0);
    txtgudang.SetFocus;
    Exit;
  end;
  if LSO.Caption = '0' then begin
    MessageDlg('No. DO : belum dipilih !',mtError,[mbOK],0);
    txtso.SetFocus;
    Exit;
  end;
  with dbgbarang do begin
    jumlahqty := 0;
    for i:=0 to RowCount-1 do begin
      jumlahqty := jumlahqty+dbgbarang.Cell[3,i].AsInteger;
    end;
    if jumlahqty <= 0 then begin
      MessageDlg('Tidak ada transaksi !',mtError,[mbOK],0);
      Exit;
    end;
  end;
  with dbgbarang do begin
    jumlahqty := 0;
    for i:=0 to RowCount-1 do begin
      jumlahqty := Cell[3,i].AsFloat*Cell[12,i].AsFloat;
      for j:=0 to RowCount-1 do begin
        if i <> j then begin
          if Cell[10,i].AsInteger = Cell[10,j].AsInteger  then begin
            jumlahqty := jumlahqty+(Cell[3,j].AsFloat*Cell[12,j].AsFloat);
          end;
        end;
      end;
      if LID.Caption = '0' then begin
        if DM.CekStok(Cell[10,i].AsInteger,StrToInt(LGUdang.Caption),jumlahqty)=False then begin
          MessageDlg(Cell[1,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
      end else begin
        if DM.CekStok1(Cell[10,i].AsInteger,StrToInt(LGUdang.Caption),StrToInt(LID.Caption),'DO',jumlahqty)=False then begin
          MessageDlg(Cell[1,i].AsString+' tidak mencukupi !',mtError,[mbOK],0);
          Exit;
        end;
      end;
    end;
  end;
  {if DM.CekPeriode(dtpfaktur.Date)= 0 then begin
    MessageDlg('Anda tidak diperkenankan mengubah transaksi sebelum periode akuntansi yang sedang aktif',mtError,[mbOK],0);
    Exit;
  end else if DM.CekPeriode(dtpfaktur.Date)= 2 then begin
    if MessageDlg('Tanggal transaksi ini setelah periode akuntansi. Lanjutkan ?',mtConfirmation,[mbYes,mbNo],0)= mrno then begin
      Exit;
    end;
  end;   }
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    if LID.Caption = '0' then begin
      if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        Screen.Cursor := crSQLWait;
        try
          dm.con.StartTransaction;
          notransaksi := DM.GenerateNoMaster('pengiriman');
          txtreferensi.Text := DM.GenerateKodeTransaksi('SJ',dtpfaktur.Date);
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_referensikodetransaksi values (:a,:b,:c)';
          ParamByName('a').Value := 'SJ';
          ParamByName('b').Value := dtpfaktur.Date;
          ParamByName('c').Value := txtreferensi.Text;
          ExecSQL;
          Close;
          // masuk ke tabel penjualan
          SQL.Clear;
          SQL.Text := 'insert into tbl_penjualankirim values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k)';
          ParamByName('a').Value := notransaksi;
          ParamByName('b').Value := txtreferensi.Text;
          ParamByName('c').Value := LSO.Caption;
          ParamByName('d').Value := LCustomer.Caption;
          ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
          ParamByName('f').Value := LGUdang.Caption;
          ParamByName('g').Value := txtbiaya.Value;
          ParamByName('h').Value := LBiayaLain.Caption;
          ParamByName('i').Value := Frm_Main.txtuser.Caption;
          ParamByName('j').Value := 0;
          ParamByName('k').Value := null;
          ExecSQL;
          with dbgbarang do begin
            for i:=0 to RowCount-1 do begin
              if Cell[3,i].AsFloat > 0 then begin
                Close;
                SQL.Clear;
                //masuk tabel penjualan detil
                SQL.Text := 'insert into tbl_penjualankirimdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v)';
                ParamByName('a').Value := notransaksi;
                ParamByName('b').Value := Cell[10,i].AsInteger;
                ParamByName('c').Value := Cell[3,i].AsFloat;
                ParamByName('d').Value := Cell[5,i].AsFloat;
                ParamByName('e').Value := Cell[6,i].AsFloat;
                ParamByName('f').Value := Cell[7,i].AsFloat;
                ParamByName('g').Value := Cell[8,i].AsFloat;
                ParamByName('h').Value := Cell[11,i].AsInteger;
                ParamByName('i').Value := Cell[12,i].AsInteger;
                ParamByName('j').Value := Cell[13,i].AsFloat;
                ParamByName('k').Value := Cell[14,i].AsInteger;
                ParamByName('l').Value := Cell[15,i].AsInteger;
                ParamByName('m').Value := Cell[19,i].AsFloat;
                ParamByName('n').Value := Cell[20,i].AsFloat;
                ParamByName('o').Value := Cell[16,i].AsInteger;
                ParamByName('p').Value := Cell[17,i].AsInteger;
                ParamByName('q').Value := Cell[18,i].AsFloat;
                ParamByName('r').Value := Cell[21,i].AsInteger;
                ParamByName('s').Value := Cell[22,i].AsInteger;
                ParamByName('t').Value := Cell[23,i].AsInteger;
                ParamByName('u').Value := Cell[24,i].AsInteger;
                ParamByName('v').Value := Cell[25,i].AsInteger;
                ExecSQL;

                if Cell[23,i].AsInteger = 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel buku besar barang
                  SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                  //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                  ParamByName('b').Value := Cell[10,i].AsInteger;
                  ParamByName('c').Value := 'DO';
                  ParamByName('d').Value := LGUdang.Caption;
                  ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                  ParamByName('f').Value := notransaksi;
                  ParamByName('g').Value := 'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text;
                  ParamByName('h').Value := Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat;
                  hpp := DM.HitungHPPPenjualan(Cell[10,i].AsInteger,Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat);
                  ParamByName('i').Value := hpp;
                  ParamByName('j').Value := (Cell[8,i].AsFloat/(Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat));
                  ExecSQL;
                  //masuk buku besar barang detail
                  DM.AmbilNoBuku(Cell[10,i].AsInteger,StrToInt(LGUdang.Caption),Cell[3,i].AsFloat*Cell[12,i].AsFloat,notransaksi,'DO');

                  DM.InsertBukuBesarAkun(Cell[15,i].AsInteger,Date,'DO',notransaksi,'Delivery Order, No. '+txtreferensi.Text,hpp*Cell[3,i].AsFloat*Cell[12,i].AsFloat,0);
                  DM.InsertBukuBesarAkun(Cell[13,i].AsInteger,Date,'DO',notransaksi,'Delivery Order, No. '+txtreferensi.Text,0,hpp*Cell[3,i].AsFloat*Cell[12,i].AsFloat);

                end;
                {DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'DO',notransaksi,'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text,0,Cell[19,i].AsFloat);
                if Cell[20,i].AsFloat > 0 then DM.InsertBukuBesarAkun(Cell[21,i].AsInteger,dtpfaktur.Date,'DO',notransaksi,'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text,0,Cell[20,i].AsFloat);   }
              end;
            end;
          end;
          //DM.InsertBukuBesarAkun(Cell[14,i].AsInteger,dtpfaktur.Date,'DO',notransaksi,'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text,0,Cell[19,i].AsFloat);
          dm.con.Commit;
          Screen.Cursor := crDefault;
          if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
            dm.Q_NotaPenjualanDO.Close;
            DM.Q_NotaPenjualanDO.ParamByName('np').Value := notransaksi;
            DM.Q_NotaPenjualanDO.Open;
            if cbapprove.Checked = True then
              DM.Nota_SJ.ShowReport(True)
            else DM.Nota_PenjualanDO.ShowReport(True);
          end;
        except
          on E: Exception do begin
            dm.con.Rollback;
            MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
          end;
        end;
        ClearText;
        dbgbarang.AddRow();
      end;
    end else begin
      if cbapprove.Checked = False then begin
        if MessageDlg('Apakah data sudah benar ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
          Screen.Cursor := crSQLWait;
          try
            dm.con.StartTransaction;
            Close;
            SQL.Clear;
            // update ke tabel penjualan
            SQL.Text := 'update tbl_penjualankirim set nopenjualanorder=:b,nokontak=:c,tglpenjualankirim=:d,nogudang=:e,biayalain=:j,noakunbiayalain=:k' +
                        ' where nopenjualankirim=:a';
            ParamByName('a').Value := LID.Caption;
            ParamByName('b').Value := LSO.Caption;
            ParamByName('c').Value := LCustomer.Caption;
            ParamByName('d').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
            ParamByName('e').Value := LGUdang.Caption;
            ParamByName('j').Value := txtbiaya.Value;
            ParamByName('k').Value := LBiayaLain.Caption;
            ExecSQL;
            //hapus detil penjualan
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_penjualankirimdetail where nopenjualankirim=:np';
            ParamByName('np').Value := LID.Caption;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarbarang where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarakun where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'DO';
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_laba where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'DO';
            ExecSQL;
            {Close;
            SQL.Clear;
            SQL.Text := 'delete from tbl_bukubesarbarangdetail where noreferensi=:np and tipe=:t';
            ParamByName('np').Value := LID.Caption;
            ParamByName('t').Value := 'DO';
            ExecSQL;  }
            with dbgbarang do begin
              for i:=0 to RowCount-1 do begin
                if Cell[3,i].AsFloat > 0 then begin
                  Close;
                  SQL.Clear;
                  //masuk tabel penjualan detil
                  SQL.Text := 'insert into tbl_penjualankirimdetail values(:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v)';
                  ParamByName('a').Value := LID.Caption;
                  ParamByName('b').Value := Cell[10,i].AsInteger;
                  ParamByName('c').Value := Cell[3,i].AsFloat;
                  ParamByName('d').Value := Cell[5,i].AsFloat;
                  ParamByName('e').Value := Cell[6,i].AsFloat;
                  ParamByName('f').Value := Cell[7,i].AsFloat;
                  ParamByName('g').Value := Cell[8,i].AsFloat;
                  ParamByName('h').Value := Cell[11,i].AsInteger;
                  ParamByName('i').Value := Cell[12,i].AsInteger;
                  ParamByName('j').Value := Cell[13,i].AsFloat;
                  ParamByName('k').Value := Cell[14,i].AsInteger;
                  ParamByName('l').Value := Cell[15,i].AsInteger;
                  ParamByName('m').Value := Cell[19,i].AsFloat;
                  ParamByName('n').Value := Cell[20,i].AsFloat;
                  ParamByName('o').Value := Cell[16,i].AsInteger;
                  ParamByName('p').Value := Cell[17,i].AsInteger;
                  ParamByName('q').Value := Cell[18,i].AsFloat;
                  ParamByName('r').Value := Cell[21,i].AsInteger;
                  ParamByName('s').Value := Cell[22,i].AsInteger;
                  ParamByName('t').Value := Cell[23,i].AsInteger;
                  ParamByName('u').Value := Cell[24,i].AsInteger;
                  ParamByName('v').Value := Cell[25,i].AsInteger;
                  ExecSQL;
                  if Cell[23,i].AsInteger = 0 then begin
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[10,i].AsInteger;
                    ParamByName('c').Value := 'DO';
                    ParamByName('d').Value := LGUdang.Caption;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                    ParamByName('f').Value := LID.Caption;
                    ParamByName('g').Value := 'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text;
                    ParamByName('h').Value := Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat;
                    hpp := DM.HitungHPPPenjualan(Cell[10,i].AsInteger,Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat);
                    ParamByName('i').Value := hpp;
                    ParamByName('j').Value := (Cell[8,i].AsFloat/(Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat));
                    ExecSQL;
                    //masuk buku besar barang detail
                    DM.AmbilNoBuku(Cell[10,i].AsInteger,StrToInt(LGUdang.Caption),Cell[3,i].AsFloat*Cell[12,i].AsFloat,notransaksi,'DO');

                    DM.InsertBukuBesarAkun(Cell[15,i].AsInteger,Date,'DO',StrtoInt(LID.Caption),'Delivery Order, No. '+txtreferensi.Text,hpp*Cell[3,i].AsFloat*Cell[12,i].AsFloat,0);
                    DM.InsertBukuBesarAkun(Cell[13,i].AsInteger,Date,'DO',StrtoInt(LID.Caption),'Delivery Order, No. '+txtreferensi.Text,0,hpp*Cell[3,i].AsFloat*Cell[12,i].AsFloat);

                  end;
                  {if Cell[23,i].AsInteger = 0 then begin
                    Close;
                    SQL.Clear;
                    //masuk tabel buku besar barang
                    SQL.Text := 'insert into tbl_bukubesarbarang(nobuku,nobarang,tipe,nogudang,tgltransaksi,noreferensi,keterangan,keluar,hpp,hargajual) values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j)';
                    //ParamByName('a').Value := DM.GenerateNoMaster('bukubarang');
                    ParamByName('b').Value := Cell[10,i].AsInteger;
                    ParamByName('c').Value := 'DO';
                    ParamByName('d').Value := LGUdang.Caption;
                    ParamByName('e').Value := FormatDateTime('yyyy-mm-dd',dtpfaktur.Date);
                    ParamByName('f').Value := LID.Caption;
                    ParamByName('g').Value := 'Pengiriman Barang '+txtcustomer.Text+', '+txtreferensi.Text;
                    ParamByName('h').Value := Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat;
                    hpp := DM.HitungHPPPenjualan(Cell[10,i].AsInteger,Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat);
                    ParamByName('i').Value := hpp;
                    ParamByName('j').Value := (Cell[8,i].AsFloat/(Cell[3,i].AsFloat*dbgbarang.Cell[12,i].AsFloat));
                    ExecSQL;
                    //masuk buku besar barang detail
                    DM.AmbilNoBuku(Cell[10,i].AsInteger,StrToInt(LGUdang.Caption),Cell[3,i].AsFloat*Cell[12,i].AsFloat,StrtoInt(LID.Caption),'DO');
                  end;  }
                end;
              end;
            end;
            dm.con.Commit;
            Screen.Cursor := crDefault;
            if MessageDlg('Cetak Nota ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
              dm.Q_NotaPenjualanDO.Close;
              DM.Q_NotaPenjualanDO.ParamByName('np').Value := LID.Caption;
              DM.Q_NotaPenjualanDO.Open;
              if cbapprove.Checked = True then
                DM.Nota_SJ.ShowReport(True)
              else DM.Nota_PenjualanDO.ShowReport(True);
            end;
          except
            on E: Exception do begin
              dm.con.Rollback;
              MessageDlg('Error: ' + E.Message,mtWarning,[mbOk],0);
            end;
          end;
          ClearText;
          dbgbarang.AddRow();
        end;
      end else begin
        MessageDlg('Data sudah di Approve. Data tidak dapat diubah !!',mtError,[mbOK],0);
      end;
    end;
    Free;
  end;
end;

procedure TFrm_PenjualanPengiriman.txtcustomerButtonClick(Sender: TObject);
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

procedure TFrm_PenjualanPengiriman.txtcustomerKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtcustomerButtonClick(nil);
end;

procedure TFrm_PenjualanPengiriman.IsiGridBarang;
var
  j: Integer;
begin
  dbgbarang.ClearRows;
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Clear;
    SQL.Text := 'select a.*,ifnull(b.kodepajak,'+QuotedStr('-')+')as kodepajak,ifnull(b.akunpajakpenjualanblm,0)as akunpajakpenjualanblm from ' +
                '(select a.*,d.kodesatuan from ' +
                '(select a.*,b.kodebarang,b.namabarang,b.noakunpersediaan,b.noakunhpp,b.tipebarang from ' +
                '(select * from tbl_penjualanorderdetail where nopenjualanorder=:ib) as a ' +
                'left join tbl_barang as b on b.nobarang=a.nobarang)as a ' +
                'left join tbl_satuan as d on d.nosatuan=a.nosatuan)as a ' +
                'left join tbl_pajak as b on b.nopajak=a.nopajak';
    ParamByName('ib').Value := LSO.Caption;
    Open;
    if not IsEmpty then begin
      First;
      for j:=0 to RecordCount-1 do begin
        with dbgbarang do begin
          AddRow();
          Cell[0,j].AsString := FieldValues['kodebarang'];
          Cell[1,j].AsString := FieldValues['namabarang'];
          Cell[2,j].AsFloat := CekSO(StrToInt(LSO.Caption),FieldValues['nobarang'],FieldValues['nodetailpenjualanorder']);
          Cell[3,j].AsFloat := CekSO(StrToInt(LSO.Caption),FieldValues['nobarang'],FieldValues['nodetailpenjualanorder']);
          Cell[4,j].AsString := FieldValues['kodesatuan']+'('+FloatToStr(FieldValues['nilai'])+')';
          Cell[5,j].AsFloat := FieldValues['hargajual'];
          Cell[6,j].AsFloat := FieldValues['diskon1'];
          Cell[7,j].AsFloat := FieldValues['diskon2'];
          Cell[8,j].AsFloat := FieldValues['subtotal'];
          Cell[9,j].AsString := FieldValues['kodepajak'];
          Cell[10,j].AsInteger := FieldValues['nobarang'];
          Cell[11,j].AsInteger := FieldValues['nosatuan'];
          Cell[12,j].AsFloat := FieldValues['nilai'];
          Cell[13,j].AsInteger := FieldValues['noakunpersediaan'];
          Cell[14,j].AsInteger := FieldValues['noakunpenjualan'];
          Cell[15,j].AsInteger := FieldValues['noakunhpp'];
          Cell[16,j].AsInteger := FieldValues['nopajak'];
          Cell[17,j].AsInteger := FieldValues['tipepajak'];
          Cell[18,j].AsFloat := FieldValues['persenpajak'];
          Cell[19,j].AsFloat := FieldValues['dppbarang'];
          Cell[20,j].AsFloat := FieldValues['ppnbarang'];
          Cell[21,j].AsInteger := dm.CekAkunPajak(dbgbarang.Cell[16,j].AsInteger,'penjualan');
          Cell[22,j].AsInteger := FieldValues['nodetailpenjualanorder'];
          Cell[23,j].AsInteger := FieldValues['tipebarang'];
          Cell[24,j].AsInteger := FieldValues['akunpajakpenjualanblm'];
          Cell[25,j].AsInteger := piutangbelum;
        end;
        Next;
      end;
      UpdateTotal;
    end;
    Free;
  end;
end;

procedure TFrm_PenjualanPengiriman.txtsoButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataPenjualanOrder, Frm_DataPenjualanOrder);
  customerorder := StrToInt(LCustomer.Caption);
  statusdo := 1;
  Frm_DataPenjualanOrder.RefreshQ;
  if Frm_DataPenjualanOrder.ShowModal = mrok then begin
    if LSO.Caption <> '0' then begin
      if MessageDlg('Proses ini akan menghapus semua detil transaksi! Lanjutkan ?',mtConfirmation, [mbYes,mbNo],0)= mrno then begin
        Exit;
      end;
    end;
    txtso.Text := Frm_DataPenjualanOrder.QData.FieldValues['kodepenjualando'];
    LSO.Caption := Frm_DataPenjualanOrder.QData.FieldValues['nopenjualanorder'];
    txtbiaya.Value := Frm_DataPenjualanOrder.QData.FieldValues['biayalain'];
    LBiayaLain.Caption := Frm_DataPenjualanOrder.QData.FieldValues['noakunbiayalain'];
    IsiGridBarang;
  end;
end;

function TFrm_PenjualanPengiriman.CekSO(ANoSO, ANoBarang,
  AUrut: Integer): Double;
var
  dikirim,diorder: Double;
begin
  if ANoSO = 0 then begin
    Result := 0;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := DM.con;
      Close;
      SQL.Clear;
      SQL.Text := 'select qty,nosatuan,nilai from tbl_penjualanorderdetail where nopenjualanorder=:np and nobarang=:nb and nodetailpenjualanorder=:nu';
      ParamByName('np').Value := ANoSO;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := AUrut;
      Open;
      if IsEmpty then
        dikirim := 0
      else diorder := FieldValues['qty'];
      Close;
      SQL.Clear;
      SQL.Text := 'select b.nobarang, ifnull(b.qty,0)as qty, b.nourutso from ' +
                  '(select nopenjualankirim from tbl_penjualankirim where nopenjualanorder=:np)as a ' +
                  'left join tbl_penjualankirimdetail as b on b.nopenjualankirim=a.nopenjualankirim having b.nobarang=:nb and b.nourutso=:nu';
      ParamByName('np').Value := ANoSO;
      ParamByName('nb').Value := ANoBarang;
      ParamByName('nu').Value := AUrut;
      Open;
      if IsEmpty then
        dikirim := 0
      else dikirim := FieldValues['qty'];

      Result := diorder-dikirim;
      Free;
    end;
  end;
end;

procedure TFrm_PenjualanPengiriman.dbgbarangAfterEdit(Sender: TObject;
  ACol, ARow: Integer; Value: WideString);
var
  total:Double;
begin
  if ACol = 3 then begin
    if dbgbarang.Cell[0,ARow].AsString = '' then begin
      dbgbarang.Cell[3,ARow].AsFloat := 0;
      Exit;
    end;
    if dbgbarang.Cell[2,ARow].AsFloat < dbgbarang.Cell[3,ARow].AsFloat then begin
      dbgbarang.Cell[3,ARow].AsFloat := dbgbarang.Cell[2,ARow].AsFloat;
      Exit;
    end;
  end;
  total := dbgbarang.Cell[3,ARow].AsFloat*dbgbarang.Cell[5,ARow].AsFloat;
  total := total-((total*dbgbarang.Cell[6,ARow].AsFloat)/100);
  total := total-dbgbarang.Cell[7,ARow].AsFloat;
  dbgbarang.Cell[8,ARow].AsFloat := total;
  if dbgbarang.Cell[16,ARow].AsInteger = 0 then begin
    dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat;
    dbgbarang.Cell[20,ARow].AsFloat := 0;
  end else begin
    if dbgbarang.Cell[17,ARow].AsInteger = 0 then begin
      dbgbarang.Cell[19,ARow].AsFloat := dbgbarang.Cell[0,ARow].AsFloat;
      dbgbarang.Cell[20,ARow].AsFloat := Int((dbgbarang.Cell[0,ARow].AsFloat*dbgbarang.Cell[18,ARow].AsFloat/100)*100)/100;
    end else if dbgbarang.Cell[17,ARow].AsInteger = 1 then begin
      dbgbarang.Cell[19,ARow].AsFloat := Int((dbgbarang.Cell[8,ARow].AsFloat/(1+(dbgbarang.Cell[18,ARow].AsFloat/100)))*100)/100;
      dbgbarang.Cell[20,ARow].AsFloat := dbgbarang.Cell[8,ARow].AsFloat-dbgbarang.Cell[19,ARow].AsFloat;
    end;
  end;
  UpdateTotal;
end;

procedure TFrm_PenjualanPengiriman.UpdateTotal;
var
  qty:Double;
  i:integer;
begin
  with dbgbarang do begin
    for i:=0 to RowCount-1 do begin
      qty := qty+Cell[3,i].AsFloat;
    end;
    txtqty.Value := qty;
    txtitem.Value := dbgbarang.RowCount;
  end;
end;

procedure TFrm_PenjualanPengiriman.txtgudangButtonClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_DataGudang, Frm_DataGudang);
  if Frm_DataGudang.ShowModal = mrok then begin
    txtgudang.Text := Frm_DataGudang.QData.FieldValues['namagudang'];
    LGUdang.Caption := Frm_DataGudang.QData.FieldValues['nogudang'];
  end;
end;

procedure TFrm_PenjualanPengiriman.txtgudangKeyPress(Sender: TObject;
  var Key: Char);
begin
  if txtgudang.ReadOnly = False then txtgudangButtonClick(nil);
end;

procedure TFrm_PenjualanPengiriman.txtsoKeyPress(Sender: TObject;
  var Key: Char);
begin
  txtsoButtonClick(nil);
end;

procedure TFrm_PenjualanPengiriman.dtpfakturChange(Sender: TObject);
begin
  if LID.Caption = '0' then txtreferensi.Text := DM.GenerateKodeTransaksi(' ',dtpfaktur.Date);
end;

end.
