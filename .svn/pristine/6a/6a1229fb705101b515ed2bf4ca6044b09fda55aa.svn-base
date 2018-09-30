object Frm_DaftarKontak: TFrm_DaftarKontak
  Left = 273
  Top = 165
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Data Kontak'
  ClientHeight = 442
  ClientWidth = 1049
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1049
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = '          Address Data'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 971
      Top = 0
      Width = 78
      ImageIndex = 1
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnUpdateClick
    end
    object MBStatus: TRzMenuButton
      Left = 1
      Top = 0
      Width = 25
      Height = 24
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      TabOrder = 0
      DropDownMenu = PopupMenu1
    end
  end
  object PnBarang: TRzPanel
    Left = 0
    Top = 25
    Width = 1049
    Height = 376
    Align = alClient
    BorderOuter = fsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsCustom
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object dbgdata: TcxGrid
      Left = 0
      Top = 0
      Width = 1049
      Height = 376
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object dbgdataDBTableView1: TcxGridDBTableView
        OnDblClick = dbgdataDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DSData
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glHorizontal
        object dbgdataDBTableView1kodekontak: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kodekontak'
          HeaderAlignmentHorz = taCenter
          Width = 135
        end
        object dbgdataDBTableView1namakontak: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'namakontak'
          HeaderAlignmentHorz = taCenter
          Width = 434
        end
        object dbgdataDBTableView1Pos: TcxGridDBColumn
          Caption = 'Tipe'
          DataBinding.FieldName = 'Pos'
          HeaderAlignmentHorz = taCenter
          Width = 185
        end
        object dbgdataDBTableView1telpon1kontak: TcxGridDBColumn
          Caption = 'Telp. 1'
          DataBinding.FieldName = 'telpon1kontak'
          HeaderAlignmentHorz = taCenter
          Width = 172
        end
        object dbgdataDBTableView1Column1: TcxGridDBColumn
          Caption = 'Currency'
          DataBinding.FieldName = 'kodematauang'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
      end
      object dbgdataLevel1: TcxGridLevel
        GridView = dbgdataDBTableView1
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 401
    Width = 1049
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      1049
      41)
    object BtnBaru: TRzBitBtn
      Left = 16
      Top = 8
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
    object BtnUbah: TRzBitBtn
      Left = 96
      Top = 8
      Caption = 'Ubah'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnUbahClick
    end
    object BtnHapus: TRzBitBtn
      Left = 176
      Top = 8
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
    object BtnSelesai: TRzBitBtn
      Left = 961
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Keluar'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtnSelesaiClick
    end
    object BtnSaldo: TRzBitBtn
      Left = 872
      Top = 8
      Width = 84
      Anchors = [akTop, akRight]
      Caption = 'Saldo Awal'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnSaldoClick
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 424
    Top = 264
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select *,case when tipekontak=0 then '#39'Customer'#39' when tipekontak=' +
        '1 then '#39'Vendor'#39' else '#39'Sales'#39' end as Pos from tbl_kontak order by' +
        ' namakontak')
    Params = <>
    Left = 384
    Top = 260
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 5
    object BelumLunas1: TMenuItem
      Caption = 'Semua'
      OnClick = BelumLunas1Click
    end
    object Semua1: TMenuItem
      Caption = '-'
    end
    object Customer1: TMenuItem
      Caption = 'Customer'
      OnClick = Customer1Click
    end
    object Supplier1: TMenuItem
      Caption = 'Supplier'
      OnClick = Supplier1Click
    end
    object Sales1: TMenuItem
      Caption = 'Sales'
      OnClick = Sales1Click
    end
  end
end
