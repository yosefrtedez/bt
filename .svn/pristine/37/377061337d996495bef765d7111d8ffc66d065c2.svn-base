object Frm_User: TFrm_User
  Left = 426
  Top = 219
  Width = 368
  Height = 321
  BorderIcons = [biSystemMenu]
  Caption = 'Security Manager'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel4: TRzPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 282
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 0
    object DBGUser: TSMDBGrid
      Left = 0
      Top = 0
      Width = 225
      Height = 282
      Align = alLeft
      DataSource = DSUser
      FixedColor = clSkyBlue
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
      Flat = True
      BandsFont.Charset = DEFAULT_CHARSET
      BandsFont.Color = clWindowText
      BandsFont.Height = -11
      BandsFont.Name = 'MS Sans Serif'
      BandsFont.Style = []
      Groupings = <>
      GridStyle.Style = gsCustom
      GridStyle.OddColor = clWindow
      GridStyle.EvenColor = clWindow
      TitleHeight.PixelCount = 24
      FooterColor = clSkyBlue
      GridLineWidth = 0
      ExOptions = []
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 18
      ScrollBars = ssHorizontal
      ColCount = 2
      RowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'namauser'
          Title.Caption = 'Username'
          Width = 453
          Visible = True
        end>
    end
    object RzPanel3: TRzPanel
      Left = 225
      Top = 0
      Width = 127
      Height = 282
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 1
      DesignSize = (
        127
        282)
      object BtnEdit: TRzBitBtn
        Left = 8
        Top = 40
        Width = 105
        Caption = 'Ubah'
        Color = 12615680
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtnEditClick
      end
      object BtnKeluar: TRzBitBtn
        Left = 8
        Top = 248
        Width = 105
        Anchors = [akLeft, akBottom]
        Caption = 'Keluar'
        Color = 12615680
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnKeluarClick
      end
      object BtnBaru: TRzBitBtn
        Left = 8
        Top = 8
        Width = 105
        Caption = 'Baru'
        Color = 12615680
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnBaruClick
      end
      object BtnHapus: TRzBitBtn
        Left = 8
        Top = 72
        Width = 105
        Caption = 'Hapus'
        Color = clMaroon
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnHapusClick
      end
    end
  end
  object QUser: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * '
      'from tbl_user'
      'ORDER BY namauser')
    Params = <>
    Left = 8
    Top = 8
  end
  object DSUser: TDataSource
    DataSet = QUser
    Left = 40
    Top = 8
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 80
    Top = 72
  end
end
