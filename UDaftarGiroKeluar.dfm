object Frm_DaftarGiroKeluar: TFrm_DaftarGiroKeluar
  Left = 227
  Top = 88
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Giro Keluar'
  ClientHeight = 578
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 1103
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Giro Keluar'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 947
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
    object BtnFilter: TRzToolButton
      Left = 1025
      Top = 0
      Width = 78
      ImageIndex = 2
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Filter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 537
    Width = 1103
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    GradientColorStop = 16744448
    TabOrder = 2
    DesignSize = (
      1103
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1015
      Top = 8
      Anchors = [akRight, akBottom]
      Caption = 'Selesai'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnSelesaiClick
    end
    object BtnCair: TRzBitBtn
      Left = 855
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Giro Cair'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCairClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 936
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Perincian'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnPerincianClick
    end
    object BtnUnPost: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Un - Post'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnUnPostClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1103
    Height = 512
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        Width = 90
      end
      object dbgdataDBTableView1nomorgiro: TcxGridDBColumn
        Caption = 'No. Giro'
        DataBinding.FieldName = 'nomorgiro'
        Width = 100
      end
      object dbgdataDBTableView1tanggal: TcxGridDBColumn
        Caption = 'Jatuh Tempo'
        DataBinding.FieldName = 'tanggal'
        Width = 90
      end
      object dbgdataDBTableView1nilai: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        HeaderAlignmentHorz = taRightJustify
        Options.Filtering = False
        Width = 100
      end
      object dbgdataDBTableView1pos: TcxGridDBColumn
        DataBinding.FieldName = 'posting'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Filtering = False
        Width = 30
        IsCaptionAssigned = True
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT * FROM tbl_giro WHERE jenis='#39'out'#39)
    Params = <>
    Left = 848
    Top = 120
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
    end
    object QDatanoreferensi: TLargeintField
      FieldName = 'noreferensi'
      ReadOnly = True
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 15
    end
    object QDatanomorgiro: TStringField
      FieldName = 'nomorgiro'
      ReadOnly = True
      Size = 50
    end
    object QDatatanggal: TDateField
      FieldName = 'tanggal'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanamabank: TStringField
      FieldName = 'namabank'
      ReadOnly = True
      Size = 50
    end
    object QDatanoakun: TLargeintField
      FieldName = 'noakun'
      ReadOnly = True
    end
    object QDataposting: TSmallintField
      FieldName = 'posting'
      ReadOnly = True
    end
    object QDatajenis: TStringField
      FieldName = 'jenis'
      ReadOnly = True
      Size = 5
    end
    object QDatanilai: TFloatField
      FieldName = 'nilai'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 152
  end
end
