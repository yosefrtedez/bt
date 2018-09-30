unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzRadChk, StdCtrls, RzCmboBx, RzEdit, Mask, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids, SMDBGrid,
  RzLabel, ExtCtrls, RzPanel, LbCipher, LbString, NxCustomGridControl, NxCustomGrid;

type
  TFrm_User = class(TForm)
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    DBGUser: TSMDBGrid;
    QUser: TZQuery;
    DSUser: TDataSource;
    BtnEdit: TRzBitBtn;
    BtnKeluar: TRzBitBtn;
    BtnBaru: TRzBitBtn;
    BtnHapus: TRzBitBtn;
    Q1: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure BtnBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQ;
  end;

var
  Frm_User: TFrm_User;
  Key128:TKey128;

implementation

uses UDM, USettingWewenang, ULogin, UMain, UCekPassword;

{$R *.dfm}

procedure TFrm_User.RefreshQ;
begin
  QUser.Close;
  QUser.Open;
end;

procedure TFrm_User.FormShow(Sender: TObject);
begin
  RefreshQ;
end;

procedure TFrm_User.BtnEditClick(Sender: TObject);
var
  i:Integer;
begin
  if QUser.FieldValues['namauser'] = Null then Exit;
  if Frm_Main.txtuser.Caption = QUser.FieldValues['namauser'] then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      if QUser.FieldValues['induk']=1 then begin
        MessageDlg('Anda tidak dapat memodifikasi user induk',mtError,[mbOK],0);
      end else begin
        Application.CreateForm(TFrm_SettingWewenang, Frm_SettingWewenang);
        with Frm_SettingWewenang do begin
          ClearText;
          Frm_SettingWewenang.ProsesTree('0');
          //1508
          cxlCabang.EditValue := QUser.FieldValues['nocabang'];
          txtNama.Text := QUser.FieldValues['namauser'];
          txtNama.Enabled := False;
          txtpassword.Text := QUser.FieldValues['sandiuser'];
          Q1.Close;
          Q1.SQL.Clear;
          Q1.SQL.Text :=  'SELECT a.nogudang, a.namagudang, b.namauser FROM ' +
                          '(SELECT 0 AS nogudang,'+QuotedStr('Gudang Utama')+'AS namagudang ' +
                          'UNION ' +
                          'SELECT nogudang, namagudang FROM tbl_gudang)AS a ' +
                          'LEFT JOIN tbl_usergudang b ON a.nogudang = b.nogudang AND b.namauser =:aa';
          Q1.ParamByName('aa').Value := txtNama.Text;
          Q1.Open;
          while not Q1.Eof do begin
            with cxtbGudang.DataController do begin
              i := AppendRecord;
              if Q1.FieldByName('namauser').IsNull then
                Values[i, cxColPilih.Index] := 0
              else
                Values[i, cxColPilih.Index] := 1;
              Values[i, cxColNamaGudang.Index] := Q1.FieldByName('namagudang').AsString;
              Values[i, cxColNoGudang.Index] := Q1.FieldByName('nogudang').AsInteger;
            end;
            Q1.Next;
          end;

          if QUser.FieldValues['aksesdata']=1 then begin
            Frm_SettingWewenang.cbdata.Checked := True;
            Frm_SettingWewenang.cbdataClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data1.Checked := True
            else Frm_SettingWewenang.Data1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data2.Checked := True
            else Frm_SettingWewenang.Data2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data3.Checked := True
            else Frm_SettingWewenang.Data3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data4.Checked := True
            else Frm_SettingWewenang.Data4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data5.Checked := True
            else Frm_SettingWewenang.Data5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data6.Checked := True
            else Frm_SettingWewenang.Data6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data7.Checked := True
            else Frm_SettingWewenang.Data7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data8.Checked := True
            else Frm_SettingWewenang.Data8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data9.Checked := True
            else Frm_SettingWewenang.Data9.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data10';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data10.Checked := True
            else Frm_SettingWewenang.Data10.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data11';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data11.Checked := True
            else Frm_SettingWewenang.Data11.Checked := False;
          end else begin
            Frm_SettingWewenang.cbdata.Checked := False;
            Frm_SettingWewenang.cbdataClick(nil);
          end;
          if QUser.FieldValues['aksespenjualan']=1 then begin
            Frm_SettingWewenang.cbpenjualan.Checked := True;
            Frm_SettingWewenang.cbpenjualanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan1.Checked := True
            else Frm_SettingWewenang.Penjualan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan2.Checked := True
            else Frm_SettingWewenang.Penjualan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan3.Checked := True
            else Frm_SettingWewenang.Penjualan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan4.Checked := True
            else Frm_SettingWewenang.Penjualan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan5.Checked := True
            else Frm_SettingWewenang.Penjualan5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan6.Checked := True
            else Frm_SettingWewenang.Penjualan6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan7.Checked := True
            else Frm_SettingWewenang.Penjualan7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan8.Checked := True
            else Frm_SettingWewenang.Penjualan8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan9.Checked := True
            else Frm_SettingWewenang.Penjualan9.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan10';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan10.Checked := True
            else Frm_SettingWewenang.Penjualan10.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan11';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan11.Checked := True
            else Frm_SettingWewenang.Penjualan11.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan12';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan12.Checked := True
            else Frm_SettingWewenang.Penjualan12.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpenjualan.Checked := False;
            Frm_SettingWewenang.cbpenjualanClick(nil);
          end;
          if QUser.FieldValues['aksespembelian']=1 then begin
            Frm_SettingWewenang.cbpembelian.Checked := True;
            Frm_SettingWewenang.cbpembelianClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian1.Checked := True
            else Frm_SettingWewenang.Pembelian1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian2.Checked := True
            else Frm_SettingWewenang.Pembelian2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian3.Checked := True
            else Frm_SettingWewenang.Pembelian3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian4.Checked := True
            else Frm_SettingWewenang.Pembelian4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian5.Checked := True
            else Frm_SettingWewenang.Pembelian5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian6.Checked := True
            else Frm_SettingWewenang.Pembelian6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian7.Checked := True
            else Frm_SettingWewenang.Pembelian7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian8.Checked := True
            else Frm_SettingWewenang.Pembelian8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian9.Checked := True
            else Frm_SettingWewenang.Pembelian9.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpembelian.Checked := False;
            Frm_SettingWewenang.cbpembelianClick(nil);
          end;
          if QUser.FieldValues['aksesbukubesar']=1 then begin
            Frm_SettingWewenang.cbbukubesar.Checked := True;
            Frm_SettingWewenang.cbbukubesarClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar1.Checked := True
            else Frm_SettingWewenang.BukuBesar1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar2.Checked := True
            else Frm_SettingWewenang.BukuBesar2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar3.Checked := True
            else Frm_SettingWewenang.BukuBesar3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar4.Checked := True
            else Frm_SettingWewenang.BukuBesar4.Checked := False;
          end else begin
            Frm_SettingWewenang.cbbukubesar.Checked := False;
            Frm_SettingWewenang.cbbukubesarClick(nil);
          end;
          if QUser.FieldValues['akseskas']=1 then begin
            Frm_SettingWewenang.cbkas.Checked := True;
            Frm_SettingWewenang.cbkasClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas1.Checked := True
            else Frm_SettingWewenang.Kas1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas2.Checked := True
            else Frm_SettingWewenang.Kas2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas3.Checked := True
            else Frm_SettingWewenang.Kas3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas4.Checked := True
            else Frm_SettingWewenang.Kas4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas5.Checked := True
            else Frm_SettingWewenang.Kas5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas6.Checked := True
            else Frm_SettingWewenang.Kas6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas7.Checked := True
            else Frm_SettingWewenang.Kas7.Checked := False;
          end else begin
            Frm_SettingWewenang.cbkas.Checked := False;
            Frm_SettingWewenang.cbkasClick(nil);
          end;
          if QUser.FieldValues['aksespersediaan']=1 then begin
            Frm_SettingWewenang.cbpersediaan.Checked := True;
            Frm_SettingWewenang.cbpersediaanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan1.Checked := True
            else Frm_SettingWewenang.Persediaan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan2.Checked := True
            else Frm_SettingWewenang.Persediaan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan3.Checked := True
            else Frm_SettingWewenang.Persediaan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan4.Checked := True
            else Frm_SettingWewenang.Persediaan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan5.Checked := True
            else Frm_SettingWewenang.Persediaan5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan6.Checked := True
            else Frm_SettingWewenang.Persediaan6.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpersediaan.Checked := False;
            Frm_SettingWewenang.cbpersediaanClick(nil);
          end;
          if QUser.FieldValues['akseslaporan']=1 then begin
            Frm_SettingWewenang.cblaporan.Checked := True;
            Frm_SettingWewenang.cblaporanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan1.Checked := True
            else Frm_SettingWewenang.Laporan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan2.Checked := True
            else Frm_SettingWewenang.Laporan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan3.Checked := True
            else Frm_SettingWewenang.Laporan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan4.Checked := True
            else Frm_SettingWewenang.Laporan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan5.Checked := True
            else Frm_SettingWewenang.Laporan5.Checked := False;
          end else begin
            Frm_SettingWewenang.cblaporan.Checked := False;
            Frm_SettingWewenang.cblaporanClick(nil);
          end;
          Q1.Close;
          Q1.SQL.Clear;
          Q1.SQL.Text := 'select * from tbl_wewenang where namauser=:nu';
          Q1.ParamByName('nu').Value := QUser.FieldValues['namauser'];
          Q1.Open;
          while not Q1.Eof do begin
            if Q1.FieldByName('wwn').AsInteger = 1 then begin
              if Frm_SettingWewenang.nxGrd.FindText(4, Q1.FieldByName('nm_comp').AsString,[soContinueFromTop,soCaseInsensitive,soExactMatch]) then begin
                i := Frm_SettingWewenang.nxGrd.SelectedRow;
                Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean := True;
              end;
            end
            else begin
              if Frm_SettingWewenang.nxGrd.FindText(4, Q1.FieldByName('nm_comp').AsString,[soContinueFromTop]) then begin
                i := Frm_SettingWewenang.nxGrd.SelectedRow;
                Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean := False;
              end;
            end;
            Q1.Next;
          end;
          if Frm_SettingWewenang.ShowModal = mrok then begin
            Close;
            SQL.Clear;
            // 1508
            SQL.Text := 'update tbl_user set sandiuser=:bb, aksesdata=:b, aksesbukubesar=:c, aksespenjualan=:d, aksespembelian=:e, akseskas=:f, aksespersediaan=:g, akseslaporan=:h, nogudang=:i, nocabang=:j where namauser=:a';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('bb').Value := Frm_SettingWewenang.txtpassword.Text;
            if Frm_SettingWewenang.cbdata.Checked = True then
              ParamByName('b').Value := 1
            else ParamByName('b').Value := 0;
            if Frm_SettingWewenang.cbbukubesar.Checked = True then
              ParamByName('c').Value := 1
            else ParamByName('c').Value := 0;
            if Frm_SettingWewenang.cbpenjualan.Checked = True then
              ParamByName('d').Value := 1
            else ParamByName('d').Value := 0;
            if Frm_SettingWewenang.cbpembelian.Checked = True then
              ParamByName('e').Value := 1
            else ParamByName('e').Value := 0;
            if Frm_SettingWewenang.cbkas.Checked = True then
              ParamByName('f').Value := 1
            else ParamByName('f').Value := 0;
            if Frm_SettingWewenang.cbpersediaan.Checked = True then
              ParamByName('g').Value := 1
            else ParamByName('g').Value := 0;
            if Frm_SettingWewenang.cblaporan.Checked = True then
              ParamByName('h').Value := 1
            else ParamByName('h').Value := 0;
            ParamByName('i').Value := 0;
            // 1508
            ParamByname('j').Value := Frm_SettingWewenang.cxlCabang.EditValue;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM tbl_wewenang WHERE namauser =:nu';
            ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
            ExecSQL;
            for i := 0 to nxGrd.RowCount - 1 do begin
              Close;
              SQL.Text := 'insert into tbl_wewenang values (:a,:b,:c)';
              ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
              ParamByName('b').Value := Frm_SettingWewenang.nxGrd.Cell[4,i].AsString;
              if Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean then
                ParamByName('c').Value := '1'
              else
                ParamByName('c').Value := '0';
              ExecSQL;
            end;
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM tbl_userwewenang WHERE namauser =:nu';
            ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
            ExecSQL;
            if Frm_SettingWewenang.cbdata.Checked = True then begin
              if Frm_SettingWewenang.Data1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data9';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data10.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data10';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data11.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data11';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpembelian.Checked = True then begin
              if Frm_SettingWewenang.Pembelian1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian9';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpenjualan.Checked = True then begin
              if Frm_SettingWewenang.Penjualan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan9';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan10.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan10';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan11.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan11';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan12.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan12';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbbukubesar.Checked = True then begin
              if Frm_SettingWewenang.BukuBesar1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar4';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbkas.Checked = True then begin
              if Frm_SettingWewenang.Kas1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas7';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpersediaan.Checked = True then begin
              if Frm_SettingWewenang.Persediaan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan6';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cblaporan.Checked = True then begin
              if Frm_SettingWewenang.Laporan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan5';
                ExecSQL;
              end;
            end;
            RefreshQ;
            Frm_Main.CekTombol(txtNama.Text);

            dm.con.ExecuteDirect(Format('DELETE FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]));
            Close;
            SQL.Clear;
            SQL.Text := Format('SELECT * FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]);
            Open;
            with Frm_SettingWewenang.cxtbGudang do begin
              for i := 0 to DataController.RecordCount - 1 do begin
                if DataController.Values[i, cxColPilih.Index] = 1 then begin
                  Insert;
                  FieldByName('namauser').AsString := Frm_SettingWewenang.txtNama.Text;
                  FieldByName('nogudang').AsInteger := DataController.Values[i, cxColNoGudang.Index];
                  Post;
                end;
              end;
            end;
          end;
        end;
      end;
      Free;
    end;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:nu';
      ParamByName('nu').Value := Frm_Main.txtuser.Caption;
      Open;
      if FieldValues['induk']=1 then begin
        Application.CreateForm(TFrm_SettingWewenang, Frm_SettingWewenang);
        with Frm_SettingWewenang do begin
          ClearText;
          Frm_SettingWewenang.ProsesTree('0');
          //1508
          cxlCabang.EditValue := QUser.FieldValues['nocabang'];
          txtNama.Text := QUser.FieldValues['namauser'];
          txtNama.Enabled := False;
          txtpassword.Text := QUser.FieldValues['sandiuser'];
          Q1.Close;
          Q1.SQL.Clear;
          Q1.SQL.Text :=  'SELECT a.nogudang, a.namagudang, b.namauser FROM ' +
                          '(SELECT 0 AS nogudang,'+QuotedStr('Gudang Utama')+'AS namagudang ' +
                          'UNION ' +
                          'SELECT nogudang, namagudang FROM tbl_gudang)AS a ' +
                          'LEFT JOIN tbl_usergudang b ON a.nogudang = b.nogudang AND b.namauser =:aa';
          Q1.ParamByName('aa').Value := txtNama.Text;
          Q1.Open;
          while not Q1.Eof do begin
            with cxtbGudang.DataController do begin
              i := AppendRecord;
              if Q1.FieldByName('namauser').IsNull then
                Values[i, cxColPilih.Index] := 0
              else
                Values[i, cxColPilih.Index] := 1;
              Values[i, cxColNamaGudang.Index] := Q1.FieldByName('namagudang').AsString;
              Values[i, cxColNoGudang.Index] := Q1.FieldByName('nogudang').AsInteger;
            end;
            Q1.Next;
          end;

          if QUser.FieldValues['aksesdata']=1 then begin
            Frm_SettingWewenang.cbdata.Checked := True;
            Frm_SettingWewenang.cbdataClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data1.Checked := True
            else Frm_SettingWewenang.Data1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data2.Checked := True
            else Frm_SettingWewenang.Data2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data3.Checked := True
            else Frm_SettingWewenang.Data3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data4.Checked := True
            else Frm_SettingWewenang.Data4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data5.Checked := True
            else Frm_SettingWewenang.Data5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data6.Checked := True
            else Frm_SettingWewenang.Data6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data7.Checked := True
            else Frm_SettingWewenang.Data7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data8.Checked := True
            else Frm_SettingWewenang.Data8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data9.Checked := True
            else Frm_SettingWewenang.Data9.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data10';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data10.Checked := True
            else Frm_SettingWewenang.Data10.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Data11';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Data11.Checked := True
            else Frm_SettingWewenang.Data11.Checked := False;
          end else begin
            Frm_SettingWewenang.cbdata.Checked := False;
            Frm_SettingWewenang.cbdataClick(nil);
          end;
          if QUser.FieldValues['aksespenjualan']=1 then begin
            Frm_SettingWewenang.cbpenjualan.Checked := True;
            Frm_SettingWewenang.cbpenjualanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan1.Checked := True
            else Frm_SettingWewenang.Penjualan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan2.Checked := True
            else Frm_SettingWewenang.Penjualan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan3.Checked := True
            else Frm_SettingWewenang.Penjualan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan4.Checked := True
            else Frm_SettingWewenang.Penjualan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan5.Checked := True
            else Frm_SettingWewenang.Penjualan5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan6.Checked := True
            else Frm_SettingWewenang.Penjualan6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan7.Checked := True
            else Frm_SettingWewenang.Penjualan7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan8.Checked := True
            else Frm_SettingWewenang.Penjualan8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan9.Checked := True
            else Frm_SettingWewenang.Penjualan9.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan10';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan10.Checked := True
            else Frm_SettingWewenang.Penjualan10.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan11';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan11.Checked := True
            else Frm_SettingWewenang.Penjualan11.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Penjualan12';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Penjualan12.Checked := True
            else Frm_SettingWewenang.Penjualan12.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpenjualan.Checked := False;
            Frm_SettingWewenang.cbpenjualanClick(nil);
          end;
          if QUser.FieldValues['aksespembelian']=1 then begin
            Frm_SettingWewenang.cbpembelian.Checked := True;
            Frm_SettingWewenang.cbpembelianClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian1.Checked := True
            else Frm_SettingWewenang.Pembelian1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian2.Checked := True
            else Frm_SettingWewenang.Pembelian2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian3.Checked := True
            else Frm_SettingWewenang.Pembelian3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian4.Checked := True
            else Frm_SettingWewenang.Pembelian4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian5.Checked := True
            else Frm_SettingWewenang.Pembelian5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian6.Checked := True
            else Frm_SettingWewenang.Pembelian6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian7.Checked := True
            else Frm_SettingWewenang.Pembelian7.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian8';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian8.Checked := True
            else Frm_SettingWewenang.Pembelian8.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Pembelian9';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Pembelian9.Checked := True
            else Frm_SettingWewenang.Pembelian9.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpembelian.Checked := False;
            Frm_SettingWewenang.cbpembelianClick(nil);
          end;
          if QUser.FieldValues['aksesbukubesar']=1 then begin
            Frm_SettingWewenang.cbbukubesar.Checked := True;
            Frm_SettingWewenang.cbbukubesarClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar1.Checked := True
            else Frm_SettingWewenang.BukuBesar1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar2.Checked := True
            else Frm_SettingWewenang.BukuBesar2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar3.Checked := True
            else Frm_SettingWewenang.BukuBesar3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'BukuBesar4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.BukuBesar4.Checked := True
            else Frm_SettingWewenang.BukuBesar4.Checked := False;
          end else begin
            Frm_SettingWewenang.cbbukubesar.Checked := False;
            Frm_SettingWewenang.cbbukubesarClick(nil);
          end;
          if QUser.FieldValues['akseskas']=1 then begin
            Frm_SettingWewenang.cbkas.Checked := True;
            Frm_SettingWewenang.cbkasClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas1.Checked := True
            else Frm_SettingWewenang.Kas1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas2.Checked := True
            else Frm_SettingWewenang.Kas2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas3.Checked := True
            else Frm_SettingWewenang.Kas3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas4.Checked := True
            else Frm_SettingWewenang.Kas4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas5.Checked := True
            else Frm_SettingWewenang.Kas5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas6.Checked := True
            else Frm_SettingWewenang.Kas6.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Kas7';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Kas7.Checked := True
            else Frm_SettingWewenang.Kas7.Checked := False;
          end else begin
            Frm_SettingWewenang.cbkas.Checked := False;
            Frm_SettingWewenang.cbkasClick(nil);
          end;
          if QUser.FieldValues['aksespersediaan']=1 then begin
            Frm_SettingWewenang.cbpersediaan.Checked := True;
            Frm_SettingWewenang.cbpersediaanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan1.Checked := True
            else Frm_SettingWewenang.Persediaan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan2.Checked := True
            else Frm_SettingWewenang.Persediaan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan3.Checked := True
            else Frm_SettingWewenang.Persediaan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan4.Checked := True
            else Frm_SettingWewenang.Persediaan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan5.Checked := True
            else Frm_SettingWewenang.Persediaan5.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Persediaan6';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Persediaan6.Checked := True
            else Frm_SettingWewenang.Persediaan6.Checked := False;
          end else begin
            Frm_SettingWewenang.cbpersediaan.Checked := False;
            Frm_SettingWewenang.cbpersediaanClick(nil);
          end;
          if QUser.FieldValues['akseslaporan']=1 then begin
            Frm_SettingWewenang.cblaporan.Checked := True;
            Frm_SettingWewenang.cblaporanClick(nil);
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan1';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan1.Checked := True
            else Frm_SettingWewenang.Laporan1.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan2';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan2.Checked := True
            else Frm_SettingWewenang.Laporan2.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan3';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan3.Checked := True
            else Frm_SettingWewenang.Laporan3.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan4';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan4.Checked := True
            else Frm_SettingWewenang.Laporan4.Checked := False;
            Close;
            SQL.Clear;
            SQL.Text := 'select * from tbl_userwewenang where namauser=:a and wewenang=:b';
            ParamByName('a').Value := QUser.FieldValues['namauser'];
            ParamByName('b').Value := 'Laporan5';
            Open;
            if not IsEmpty then
              Frm_SettingWewenang.Laporan5.Checked := True
            else Frm_SettingWewenang.Laporan5.Checked := False;
          end else begin
            Frm_SettingWewenang.cblaporan.Checked := False;
            Frm_SettingWewenang.cblaporanClick(nil);
          end;
          Q1.Close;
          Q1.SQL.Clear;
          Q1.SQL.Text := 'select * from tbl_wewenang where namauser=:nu';
          Q1.ParamByName('nu').Value := QUser.FieldValues['namauser'];
          Q1.Open;
          while not Q1.Eof do begin
            if Q1.FieldByName('wwn').AsInteger = 1 then begin
              if Frm_SettingWewenang.nxGrd.FindText(4, Q1.FieldByName('nm_comp').AsString,[soContinueFromTop,soCaseInsensitive,soExactMatch]) then begin
                i := Frm_SettingWewenang.nxGrd.SelectedRow;
                Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean := True;
              end;
            end
            else begin
              if Frm_SettingWewenang.nxGrd.FindText(4, Q1.FieldByName('nm_comp').AsString,[soContinueFromTop]) then begin
                i := Frm_SettingWewenang.nxGrd.SelectedRow;
                Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean := False;
              end;
            end;
            Q1.Next;
          end;
          if Frm_SettingWewenang.ShowModal = mrok then begin
            Close;
            SQL.Clear;
            //1508
            SQL.Text := 'update tbl_user set sandiuser=:bb, aksesdata=:b, aksesbukubesar=:c, aksespenjualan=:d, aksespembelian=:e, akseskas=:f, aksespersediaan=:g, akseslaporan=:h,nogudang=:i, nocabang=:j where namauser=:a';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('bb').Value := Frm_SettingWewenang.txtpassword.Text;
            if Frm_SettingWewenang.cbdata.Checked = True then
              ParamByName('b').Value := 1
            else ParamByName('b').Value := 0;
            if Frm_SettingWewenang.cbbukubesar.Checked = True then
              ParamByName('c').Value := 1
            else ParamByName('c').Value := 0;
            if Frm_SettingWewenang.cbpenjualan.Checked = True then
              ParamByName('d').Value := 1
            else ParamByName('d').Value := 0;
            if Frm_SettingWewenang.cbpembelian.Checked = True then
              ParamByName('e').Value := 1
            else ParamByName('e').Value := 0;
            if Frm_SettingWewenang.cbkas.Checked = True then
              ParamByName('f').Value := 1
            else ParamByName('f').Value := 0;
            if Frm_SettingWewenang.cbpersediaan.Checked = True then
              ParamByName('g').Value := 1
            else ParamByName('g').Value := 0;
            if Frm_SettingWewenang.cblaporan.Checked = True then
              ParamByName('h').Value := 1
            else ParamByName('h').Value := 0;
            //1508
            ParamByName('j').Value := Frm_SettingWewenang.cxlCabang.EditValue;
            ParamByName('i').Value := 0;
            ExecSQL;
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM tbl_wewenang WHERE namauser =:nu';
            ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
            ExecSQL;
            for i := 0 to nxGrd.RowCount - 1 do begin
              Close;
              SQL.Text := 'insert into tbl_wewenang values (:a,:b,:c)';
              ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
              ParamByName('b').Value := Frm_SettingWewenang.nxGrd.Cell[4,i].AsString;
              if Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean then
                ParamByName('c').Value := '1'
              else
                ParamByName('c').Value := '0';
              ExecSQL;
            end;
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM tbl_userwewenang WHERE namauser =:nu';
            ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
            ExecSQL;
            if Frm_SettingWewenang.cbdata.Checked = True then begin
              if Frm_SettingWewenang.Data1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data9';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data10.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data10';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Data11.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Data11';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpembelian.Checked = True then begin
              if Frm_SettingWewenang.Pembelian1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Pembelian9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Pembelian9';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpenjualan.Checked = True then begin
              if Frm_SettingWewenang.Penjualan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan7';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan8.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan8';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan9.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan9';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan10.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan10';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan11.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan11';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Penjualan12.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Penjualan12';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbbukubesar.Checked = True then begin
              if Frm_SettingWewenang.BukuBesar1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.BukuBesar4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'BukuBesar4';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbkas.Checked = True then begin
              if Frm_SettingWewenang.Kas1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas6';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Kas7.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Kas7';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cbpersediaan.Checked = True then begin
              if Frm_SettingWewenang.Persediaan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan5';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Persediaan6.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Persediaan6';
                ExecSQL;
              end;
            end;
            if Frm_SettingWewenang.cblaporan.Checked = True then begin
              if Frm_SettingWewenang.Laporan1.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan1';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan2.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan2';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan3.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan3';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan4.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan4';
                ExecSQL;
              end;
              if Frm_SettingWewenang.Laporan5.Checked = True then begin
                Close;
                SQL.Clear;
                SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
                ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
                ParamByName('b').Value := 'Laporan5';
                ExecSQL;
              end;
            end;
            RefreshQ;
            dm.con.ExecuteDirect(Format('DELETE FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]));
            Close;
            SQL.Clear;
            SQL.Text := Format('SELECT * FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]);
            Open;
            with Frm_SettingWewenang.cxtbGudang do begin
              for i := 0 to DataController.RecordCount - 1 do begin
                if DataController.Values[i, cxColPilih.Index] = 1 then begin
                  Insert;
                  FieldByName('namauser').AsString := Frm_SettingWewenang.txtNama.Text;
                  FieldByName('nogudang').AsInteger := DataController.Values[i, cxColNoGudang.Index];
                  Post;
                end;
              end;
            end;
          end;
        end;
      end else begin
        MessageDlg('Anda tidak dapat memodifikasi user lain!',mtError,[mbOK],0);
      end;
      RefreshQ;
      Free;
    end;
  end;
end;

procedure TFrm_User.BtnKeluarClick(Sender: TObject);
begin
  Close;
  //ModalResult := mrOk;
  Frm_Main.Timer1.Enabled := True;
end;

procedure TFrm_User.BtnHapusClick(Sender: TObject);
begin
  if QUser.IsEmpty then Exit;
  if Frm_Main.txtuser.Caption = QUser.FieldValues['namauser'] then begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      if MessageDlg('Delete User '+QUser.FieldValues['namauser']+' ?',mtConfirmation,[mbYes,mbNo],0)=mryes then begin
        if QUser.FieldValues['induk']=1 then begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_user';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_wewenang';
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'DELETE FROM tbl_userwewenang';
          ExecSQL;
        end else begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_user where namauser=:nu';
          ParamByName('nu').Value := QUser.FieldValues['namauser'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'delete from tbl_wewenang where namauser=:nu';
          ParamByName('nu').Value := QUser.FieldValues['namauser'];
          ExecSQL;
          Close;
          SQL.Clear;
          SQL.Text := 'DELETE FROM tbl_userwewenang WHERE namauser =:nu';
          ParamByName('nu').Value := QUser.FieldValues['namauser'];
          ExecSQL;
        end;
      end;
    end;
  end else begin
    with TZQuery.Create(Self)do begin
      Connection := dm.con;
      Close;
      SQL.Text := 'select * from tbl_user where namauser=:nu';
      ParamByName('nu').Value := Frm_Main.txtuser.Caption;
      Open;
      if FieldValues['induk']=1 then begin
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_user where namauser=:nu';
        ParamByName('nu').Value := QUser.FieldValues['namauser'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'delete from tbl_wewenang where namauser=:nu';
        ParamByName('nu').Value := QUser.FieldValues['namauser'];
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM tbl_userwewenang WHERE namauser =:nu';
        ParamByName('nu').Value := QUser.FieldValues['namauser'];
        ExecSQL;
      end else begin
        MessageDlg('Anda tidak dapat menghapus user lain',mtError,[mbOK],0);
      end;
      RefreshQ;
      Free;
    end;
  end;
end;

procedure TFrm_User.BtnBaruClick(Sender: TObject);
var
  i:Integer;
begin
  with TZQuery.Create(Self)do begin
    Connection := DM.con;
    Close;
    SQL.Text := 'select * from tbl_user';
    Open;
    if not IsEmpty then begin
      Application.CreateForm(TFrm_SettingWewenang, Frm_SettingWewenang);
      Frm_SettingWewenang.ClearText;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT a.nogudang, a.namagudang, b.namauser FROM ' +
                  '(SELECT 0 AS nogudang,'+QuotedStr('Gudang Utama')+'AS namagudang ' +
                  'UNION ' +
                  'SELECT nogudang, namagudang FROM tbl_gudang)AS a ' +
                  'LEFT JOIN tbl_usergudang b ON a.nogudang = b.nogudang AND b.namauser =:aa';
      ParamByName('aa').Value := Frm_SettingWewenang.txtNama.Text;
      Open;
      while not Eof do begin
        with Frm_SettingWewenang.cxtbGudang.DataController do begin
          i := AppendRecord;
          if FieldByName('namauser').IsNull then
            Values[i, Frm_SettingWewenang.cxColPilih.Index] := 0
          else
            Values[i, Frm_SettingWewenang.cxColPilih.Index] := 1;
          Values[i, Frm_SettingWewenang.cxColNamaGudang.Index] := FieldByName('namagudang').AsString;
          Values[i, Frm_SettingWewenang.cxColNoGudang.Index] := FieldByName('nogudang').AsInteger;
        end;
        Next;
      end;
      Frm_SettingWewenang.ProsesTree('0');
      if Frm_SettingWewenang.ShowModal = mrok then begin
        Close;
        SQL.Clear;
        //1508
        SQL.Text := 'insert into tbl_user values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l)';
        ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
        ParamByName('b').Value := Frm_SettingWewenang.txtpassword.Text;
        ParamByName('c').Value := 0;
        if Frm_SettingWewenang.cbdata.Checked = True then
          ParamByName('d').Value := 1
        else ParamByName('d').Value := 0;
        if Frm_SettingWewenang.cbbukubesar.Checked = True then
          ParamByName('e').Value := 1
        else ParamByName('e').Value := 0;
        if Frm_SettingWewenang.cbpenjualan.Checked = True then
          ParamByName('f').Value := 1
        else ParamByName('f').Value := 0;
        if Frm_SettingWewenang.cbpembelian.Checked = True then
          ParamByName('g').Value := 1
        else ParamByName('g').Value := 0;
        if Frm_SettingWewenang.cbkas.Checked = True then
          ParamByName('h').Value := 1
        else ParamByName('h').Value := 0;
        if Frm_SettingWewenang.cbpersediaan.Checked = True then
          ParamByName('i').Value := 1
        else ParamByName('i').Value := 0;
        if Frm_SettingWewenang.cblaporan.Checked = True then
          ParamByName('j').Value := 1
        else ParamByName('j').Value := 0;
        ParamByName('k').Value := 0;
        //1508
        ParamByName('l').Value := Frm_SettingWewenang.cxlCabang.EditValue;
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM tbl_wewenang WHERE namauser =:nu';
        ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
        ExecSQL;
        for i := 0 to Frm_SettingWewenang.nxGrd.RowCount - 1 do begin
          Close;
          SQL.Text := 'insert into tbl_wewenang values (:a,:b,:c)';
          ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
          ParamByName('b').Value := Frm_SettingWewenang.nxGrd.Cell[4,i].AsString;
          if Frm_SettingWewenang.nxGrd.Cell[2,i].AsBoolean then
            ParamByName('c').Value := '1'
          else
            ParamByName('c').Value := '0';
          ExecSQL;
        end;
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM tbl_userwewenang WHERE namauser =:nu';
        ParamByName('nu').Value := Frm_SettingWewenang.txtNama.Text;
        ExecSQL;
        if Frm_SettingWewenang.cbdata.Checked = True then begin
          if Frm_SettingWewenang.Data1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data5';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data6.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data6';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data7.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data7';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data8.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data8';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data9.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data9';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data10.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data10';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Data11.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Data11';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cbpembelian.Checked = True then begin
          if Frm_SettingWewenang.Pembelian1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian5';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian6.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian6';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian7.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian7';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian8.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian8';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Pembelian9.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Pembelian9';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cbpenjualan.Checked = True then begin
          if Frm_SettingWewenang.Penjualan1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan5';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan6.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan6';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan7.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan7';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan8.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan8';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan9.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan9';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan10.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan10';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan11.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan11';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Penjualan12.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Penjualan12';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cbbukubesar.Checked = True then begin
          if Frm_SettingWewenang.BukuBesar1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'BukuBesar1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.BukuBesar2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'BukuBesar2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.BukuBesar3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'BukuBesar3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.BukuBesar4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'BukuBesar4';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cbkas.Checked = True then begin
          if Frm_SettingWewenang.Kas1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas5';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas6.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas6';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Kas7.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Kas7';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cbpersediaan.Checked = True then begin
          if Frm_SettingWewenang.Persediaan1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Persediaan2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Persediaan3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Persediaan4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Persediaan5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan5';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Persediaan6.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Persediaan6';
            ExecSQL;
          end;
        end;
        if Frm_SettingWewenang.cblaporan.Checked = True then begin
          if Frm_SettingWewenang.Laporan1.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Laporan1';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Laporan2.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Laporan2';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Laporan3.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Laporan3';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Laporan4.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Laporan4';
            ExecSQL;
          end;
          if Frm_SettingWewenang.Laporan5.Checked = True then begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into tbl_userwewenang values (:a,:b)';
            ParamByName('a').Value := Frm_SettingWewenang.txtNama.Text;
            ParamByName('b').Value := 'Laporan5';
            ExecSQL;
          end;
        end;
        dm.con.ExecuteDirect(Format('DELETE FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]));
        Close;
        SQL.Clear;
        SQL.Text := Format('SELECT * FROM tbl_usergudang WHERE namauser = ''%s''',[Frm_SettingWewenang.txtNama.Text]);
        Open;
        with Frm_SettingWewenang.cxtbGudang do begin
          for i := 0 to DataController.RecordCount - 1 do begin
            if DataController.Values[i, Frm_SettingWewenang.cxColPilih.Index] = 1 then begin
              Insert;
              FieldByName('namauser').AsString := Frm_SettingWewenang.txtNama.Text;
              FieldByName('nogudang').AsInteger := DataController.Values[i, Frm_SettingWewenang.cxColNoGudang.Index];
              Post;
            end;
          end;
        end;
        RefreshQ;
      end;
    end else begin
      Application.CreateForm(TFrm_Login, Frm_Login);
      Frm_Login.ClearText;
      Frm_Login.LMessage.Caption := 'Masukkan Nama dan Password untuk User Induk / Utama';
      tipe := 'signup';
      Frm_Login.ShowModal;
    end;
    Free;
  end;
end;

end.
