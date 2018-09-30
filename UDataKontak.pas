unit UDataKontak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, SMDBGrid, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, jpeg, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TFrm_DataKontak = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    BtnBatal: TRzBitBtn;
    BtnOk: TRzBitBtn;
    QData: TZQuery;
    DSData: TDataSource;
    BtnBaru: TRzBitBtn;
    BtnUbah: TRzBitBtn;
    dbgdata: TcxGrid;
    dbgdataDBTableView1: TcxGridDBTableView;
    dbgdataDBTableView1kodekontak: TcxGridDBColumn;
    dbgdataDBTableView1namakontak: TcxGridDBColumn;
    dbgdataDBTableView1Pos: TcxGridDBColumn;
    dbgdataLevel1: TcxGridLevel;
    procedure BtnBatalClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
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
  Frm_DataKontak: TFrm_DataKontak;
  tipekontak: Integer;

implementation

uses UInputKontak, UDM, UMain;

{$R *.dfm}

{ TFrm_DataKontak }

procedure TFrm_DataKontak.RefreshQ;
begin
  if tipekontak = 0 then begin
    Frm_DataKontak.Caption := 'Data Customer';
    RzPanel2.Caption := 'Data Customer';
  end else if tipekontak = 1 then begin
    Frm_DataKontak.Caption := 'Data Supplier';
    RzPanel2.Caption := 'Data Supplier';
  end else if tipekontak = 2 then begin
    Frm_DataKontak.Caption := 'Data Sales';
    RzPanel2.Caption := 'Data Sales';
  end else if tipekontak = -1 then begin
    Frm_DataKontak.Caption := 'Data Kontak';
    RzPanel2.Caption := 'Data Kontak';
  end;
  with QData do begin
    Close;
    SQL.Clear;
    if tipekontak = -1 then begin
      SQL.Text := 'select *,case when tipekontak=0 then '+QuotedStr('Customer')+' when tipekontak=1 then '+QuotedStr('Supplier')+' else '+QuotedStr('Sales')+' end as Pos from tbl_kontak order by namakontak';
    end else begin
      SQL.Text := 'select *,case when tipekontak=0 then '+QuotedStr('Customer')+' when tipekontak=1 then '+QuotedStr('Supplier')+' else '+QuotedStr('Sales')+' end as Pos from tbl_kontak where tipekontak=:tp order by namakontak';
      ParamByName('tp').Value := tipekontak;
    end;
    Open;
  end;
end;

procedure TFrm_DataKontak.BtnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrm_DataKontak.BtnOkClick(Sender: TObject);
begin
  if QData.IsEmpty then Exit;
  ModalResult := mrOk;
end;

procedure TFrm_DataKontak.BtnBaruClick(Sender: TObject);
var
  nokontak,i:Integer;
  jp:TJpegimage;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  Application.CreateForm(TFrm_InputKontak, Frm_InputKontak);
  Frm_InputKontak.ClearText;
  if tipekontak <> -1 then begin
    Frm_InputKontak.cbtipe.ItemIndex := tipekontak;
    Frm_InputKontak.cbtipeExit(nil);
  end;
  Frm_InputKontak.dbgkontak.AddRow();
  if Frm_InputKontak.ShowModal = mrok then begin
    nokontak := DM.GenerateNoMaster('kontak');
    jp:=TJpegimage.Create;
    if Frm_InputKontak.LFoto.Caption <> '' then jp.LoadFromFile(Frm_InputKontak.LFoto.Caption);
    with TZQuery.Create(Self)do begin
      Connection := dm.Con;
      Close;
      SQL.Text := 'insert into tbl_kontak values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x,:y,:z,:aa,:ab,:ac,:ad,:ae,:af,:ag)';
      ParamByName('a').Value := nokontak;
      ParamByName('b').Value := Frm_InputKontak.txtkode.Text;
      ParamByName('c').Value := Frm_InputKontak.txtnama.Text;
      ParamByName('d').Value := Frm_InputKontak.LNoAkun.Caption;
      ParamByName('e').Value := Frm_InputKontak.cbtipe.ItemIndex;
      ParamByName('f').Value := Frm_InputKontak.txtnpwp.Text;
      if Frm_InputKontak.cbtipe.ItemIndex = 2 then begin
        ParamByName('g').Value := 0;
        ParamByName('s').Value := Frm_InputKontak.txtplafon.Value;
        ParamByName('t').Value := Frm_InputKontak.txtsaldo.Value;
        ParamByName('v').Value := 0;
        ParamByName('w').Value := 0;
        ParamByName('x').Value := 0;
        ParamByName('y').Value := 0;
        ParamByName('z').Value := 0;
        ParamByName('ac').Value := '';
        ParamByName('ad').Value := 0;
      end else begin
        ParamByName('g').Value := Frm_InputKontak.txtplafon.Value;
        ParamByName('s').Value := 0;
        ParamByName('t').Value := 0;
        ParamByName('v').Value := Frm_InputKontak.txtdiskondays.Value;
        ParamByName('w').Value := Frm_InputKontak.txtduedate.Value;
        ParamByName('x').Value := Frm_InputKontak.txtearlydiscount.Value;
        ParamByName('y').Value := Frm_InputKontak.txtlatecharge.Value;
        ParamByName('z').Value := Frm_InputKontak.txtsaldo.Value;
        ParamByName('ac').Value := Frm_InputKontak.txtpembayaran.Text;
        ParamByName('ad').Value := Frm_InputKontak.LNoAkunPotongan.Caption;
      end;
      ParamByName('h').Value := Frm_InputKontak.txttelpon1.Text;
      ParamByName('i').Value := Frm_InputKontak.txttelpon2.Text;
      ParamByName('j').Value := Frm_InputKontak.txtfax.Text;
      ParamByName('k').Value := Frm_InputKontak.txthp.Text;
      ParamByName('l').Value := Frm_InputKontak.txtemail.Text;
      ParamByName('m').Value := Frm_InputKontak.txtalamat1.Text;
      ParamByName('n').Value := Frm_InputKontak.txtalamat2.Text;
      ParamByName('o').Value := Frm_InputKontak.txtkota.Text;
      ParamByName('p').Value := Frm_InputKontak.txtzip.Text;
      ParamByName('q').Value := Frm_InputKontak.txtnegara.Text;
      ParamByName('r').Value := Frm_InputKontak.txtcatatan.Text;
      if Frm_InputKontak.LFoto.Caption = '' then
        ParamByName('u').Value := null
      else ParamByName('u').Assign(jp);
      ParamByName('aa').Value := Frm_InputKontak.txtfield1.Text;
      ParamByName('ab').Value := Frm_InputKontak.txtfield2.Text;
      ParamByName('ae').Value := Frm_InputKontak.txtnamanpwp.Text;
      ParamByName('af').Value := Frm_InputKontak.txtalamat1npwp.Text;
      ParamByName('ag').Value := Frm_InputKontak.txtalamat2npwp.Text;
      ExecSQL;
      for i:=0 to Frm_InputKontak.dbgkontak.RowCount-1 do begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into tbl_kontakperson values (:a,:b,:c,:d,:e)';
        ParamByName('a').Value := nokontak;
        ParamByName('b').Value := Frm_InputKontak.dbgkontak.Cell[0,i].AsString;
        ParamByName('c').Value := Frm_InputKontak.dbgkontak.Cell[1,i].AsString;
        ParamByName('d').Value := Frm_InputKontak.dbgkontak.Cell[2,i].AsString;
        ParamByName('e').Value := Frm_InputKontak.dbgkontak.Cell[3,i].AsString;
        ExecSQL;
      end;
      Free;
    end;
    RefreshQ;
  end;
end;

procedure TFrm_DataKontak.BtnUbahClick(Sender: TObject);
var
  jp:TJpegimage;
  stream: TMemoryStream;
  i: Integer;
begin
  if DM.CekAkses(Frm_Main.txtuser.Caption,'Data1')=False then begin
    MessageDlg('Anda tidak memiliki akses !',mtError,[mbOK],0);
    Exit;
  end;
  if QData.IsEmpty then Exit;
  Application.CreateForm(TFrm_InputKontak, Frm_InputKontak);
  with Frm_InputKontak do begin
    ClearText;
    dbgkontak.AddRow();
    with TZQuery.Create(Self)do begin
      Connection := DM.Con;
      Close;
      SQL.Clear;
      SQL.Text := 'select a.*,ifnull(b.kodeakun,'+QuotedStr('')+')as kodeakunpotongan,ifnull(b.namaakun,'+QuotedStr('')+')as namaakunpotongan from ' +
                  '(select a.*,ifnull(b.kodeakun,'+QuotedStr('')+')as kodeakun,ifnull(b.namaakun,'+QuotedStr('')+')as namaakun from ' +
                  '(select * from tbl_kontak where nokontak=:nk)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakun)as a ' +
                  'left join tbl_akun as b on b.noakun=a.noakunpotongan';
      ParamByName('nk').Value := QData.FieldValues['nokontak'];
      Open;
      LID.Caption := FieldValues['nokontak'];
      txtkode.Text := FieldValues['kodekontak'];
      txtnama.Text := FieldValues['namakontak'];
      txtnamanpwp.Text := FieldValues['namanpwp'];
      cbtipe.ItemIndex := FieldValues['tipekontak'];
      cbtipeExit(nil);
      LNoAkun.Caption := FieldValues['noakun'];
      if LNoAkun.Caption <> '0' then txtakun.Text := FieldValues['kodeakun']+'|'+FieldValues['namaakun'];
      LNoAkunPotongan.Caption := FieldValues['noakunpotongan'];
      if LNoAkunPotongan.Caption <> '0' then txtakunpotongan.Text := FieldValues['kodeakunpotongan']+'|'+FieldValues['namaakunpotongan'];
      txtnpwp.Text := FieldValues['npwp'];
      if cbtipe.ItemIndex = 2 then begin
        txtplafon.Value := FieldValues['komisipenjualan'];
        txtsaldo.Value := FieldValues['nilaipenjualan'];
        txtdiskondays.Value := 0;
        txtduedate.Value := 0;
        txtearlydiscount.Value := 0;
        txtlatecharge.Value := 0;
      end else begin
        txtplafon.Value := FieldValues['plafon'];
        txtsaldo.Value := FieldValues['diskon'];
        txtdiskondays.Value := FieldValues['diskonday'];
        txtduedate.Value := FieldValues['duedate'];
        txtearlydiscount.Value := FieldValues['earlydiskon'];
        txtlatecharge.Value := FieldValues['latecharge'];
        txtpembayaran.Text := FieldValues['pembayaran'];
      end;
      txttelpon1.Text := FieldValues['telpon1kontak'];
      txttelpon2.Text := FieldValues['telpon2kontak'];
      txtfax.Text := FieldValues['faxkontak'];
      txthp.Text := FieldValues['hpkontak'];
      txtemail.Text := FieldValues['emailkontak'];
      txtalamat1.Text := FieldValues['alamat1kontak'];
      txtalamat2.Text := FieldValues['alamat2kontak'];
      txtalamat1npwp.Text := FieldValues['alamat1npwp'];
      txtalamat2npwp.Text := FieldValues['alamat2npwp'];
      txtkota.Text := FieldValues['kotakontak'];
      txtzip.Text := FieldValues['zipkontak'];
      txtnegara.Text := FieldValues['negarakontak'];
      txtcatatan.Text := FieldValues['keterangankontak'];
      if not FieldByName('filefoto').IsNull then begin
        LFoto.Caption := '1';
        Stream := TMemoryStream.Create;
        TBlobField(FieldByName('filefoto')).SaveToStream(Stream);
        Stream.Position := 0;

        jp := TJPEGImage.Create;
        jp.LoadFromStream(Stream);

        Image1.Picture.Assign(jp);

        Stream.Free;
        jp.Free;
      end;
      txtfield1.Text := FieldValues['field1'];
      txtfield2.Text := FieldValues['field2'];
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_kontakperson where nokontak=:ib';
      ParamByName('ib').Value := LID.Caption;
      Open;
      if not IsEmpty then begin
        dbgkontak.ClearRows;
        First;
        for i := 0 to RecordCount-1 do begin
          dbgkontak.AddRow();
          dbgkontak.Cell[0,i].AsString := FieldValues['nama'];
          dbgkontak.Cell[1,i].AsString := FieldValues['jabatan'];
          dbgkontak.Cell[2,i].AsString := FieldValues['telpon'];
          dbgkontak.Cell[3,i].AsString := FieldValues['keterangan'];
          Next;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Text := 'select * from tbl_bukubesarkontak where nokontak=:ib';
      ParamByName('ib').Value := LID.Caption;
      Open;
      if not IsEmpty then begin
        cbtipe.ReadOnly := True;
      end;
      if Frm_InputKontak.ShowModal = mrok then begin

        jp:=TJpegimage.Create;
        if (Frm_InputKontak.LFoto.Caption <> '') and (Frm_InputKontak.LFoto.Caption <> '1') then jp.LoadFromFile(Frm_InputKontak.LFoto.Caption);
        Close;
        SQL.Clear;
        SQL.Text := 'update tbl_kontak set kodekontak=:b,namakontak=:c,namanpwp=:cc,noakun=:d,tipekontak=:e,npwp=:f,plafon=:g,telpon1kontak=:h,telpon2kontak=:i,faxkontak=:j,' +
                    'hpkontak=:k,emailkontak=:l,alamat1kontak=:m,alamat2kontak=:n,alamat1npwp=:mm,alamat2npwp=:nn,kotakontak=:o,zipkontak=:p,negarakontak=:q,keterangankontak=:r,komisipenjualan=:s,' +
                    'nilaipenjualan=:t,diskonday=:v,duedate=:w,earlydiskon=:x,latecharge=:y,diskon=:z,field1=:aa,field2=:ab,pembayaran=:ac,noakunpotongan=:ad where nokontak=:a';
        ParamByName('a').Value := LID.Caption;
        ParamByName('b').Value := Frm_InputKontak.txtkode.Text;
        ParamByName('c').Value := Frm_InputKontak.txtnama.Text;
        ParamByName('cc').Value := Frm_InputKontak.txtnamanpwp.Text;
        ParamByName('d').Value := Frm_InputKontak.LNoAkun.Caption;
        ParamByName('e').Value := Frm_InputKontak.cbtipe.ItemIndex;
        ParamByName('f').Value := Frm_InputKontak.txtnpwp.Text;
        if Frm_InputKontak.cbtipe.ItemIndex = 2 then begin
          ParamByName('g').Value := 0;
          ParamByName('s').Value := Frm_InputKontak.txtplafon.Value;
          ParamByName('t').Value := Frm_InputKontak.txtsaldo.Value;
          ParamByName('v').Value := 0;
          ParamByName('w').Value := 0;
          ParamByName('x').Value := 0;
          ParamByName('y').Value := 0;
          ParamByName('z').Value := 0;
          ParamByName('ac').Value := '';
          ParamByName('ad').Value := 0;
        end else begin
          ParamByName('g').Value := Frm_InputKontak.txtplafon.Value;
          ParamByName('s').Value := 0;
          ParamByName('t').Value := 0;
          ParamByName('v').Value := Frm_InputKontak.txtdiskondays.Value;
          ParamByName('w').Value := Frm_InputKontak.txtduedate.Value;
          ParamByName('x').Value := Frm_InputKontak.txtearlydiscount.Value;
          ParamByName('y').Value := Frm_InputKontak.txtlatecharge.Value;
          ParamByName('z').Value := Frm_InputKontak.txtsaldo.Value;
          ParamByName('ac').Value := Frm_InputKontak.txtpembayaran.Text;
          ParamByName('ad').Value := Frm_InputKontak.LNoAkunPotongan.Caption;
        end;
        ParamByName('h').Value := Frm_InputKontak.txttelpon1.Text;
        ParamByName('i').Value := Frm_InputKontak.txttelpon2.Text;
        ParamByName('j').Value := Frm_InputKontak.txtfax.Text;
        ParamByName('k').Value := Frm_InputKontak.txthp.Text;
        ParamByName('l').Value := Frm_InputKontak.txtemail.Text;
        ParamByName('m').Value := Frm_InputKontak.txtalamat1.Text;
        ParamByName('n').Value := Frm_InputKontak.txtalamat2.Text;
        ParamByName('mm').Value := Frm_InputKontak.txtalamat1npwp.Text;
        ParamByName('nn').Value := Frm_InputKontak.txtalamat2npwp.Text;
        ParamByName('o').Value := Frm_InputKontak.txtkota.Text;
        ParamByName('p').Value := Frm_InputKontak.txtzip.Text;
        ParamByName('q').Value := Frm_InputKontak.txtnegara.Text;
        ParamByName('r').Value := Frm_InputKontak.txtcatatan.Text;
        ParamByName('aa').Value := Frm_InputKontak.txtfield1.Text;
        ParamByName('ab').Value := Frm_InputKontak.txtfield2.Text;
        ExecSQL;
        if Frm_InputKontak.LFoto.Caption = '' then begin
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_kontak set filefoto=:u where nokontak=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('u').Value := null;
          ExecSQL;
        end else if Frm_InputKontak.LFoto.Caption = '1' then begin

        end else begin
          Close;
          SQL.Clear;
          SQL.Text := 'update tbl_kontak set filefoto=:u where nokontak=:a';
          ParamByName('a').Value := LID.Caption;
          ParamByName('u').Assign(jp);
          ExecSQL;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_kontakperson where nokontak=:a';
        ParamByName('a').Value := LID.Caption;
        ExecSQL;   
        for i:=0 to Frm_InputKontak.dbgkontak.RowCount-1 do begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into tbl_kontakperson values (:a,:b,:c,:d,:e)';
          ParamByName('a').Value := LID.Caption;
          ParamByName('b').Value := Frm_InputKontak.dbgkontak.Cell[0,i].AsString;
          ParamByName('c').Value := Frm_InputKontak.dbgkontak.Cell[1,i].AsString;
          ParamByName('d').Value := Frm_InputKontak.dbgkontak.Cell[2,i].AsString;
          ParamByName('e').Value := Frm_InputKontak.dbgkontak.Cell[3,i].AsString;
          ExecSQL;
        end;
        RefreshQ;
      end;
      Free;
    end;
  end;
end;

procedure TFrm_DataKontak.dbgdataDBTableView1DblClick(Sender: TObject);
begin
  BtnOkClick(nil);
end;

end.
