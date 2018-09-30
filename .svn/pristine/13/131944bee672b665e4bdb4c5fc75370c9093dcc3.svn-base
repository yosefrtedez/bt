object Frm_DaftarJurnalUmum: TFrm_DaftarJurnalUmum
  Left = 355
  Top = 187
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Transaksi Jurnal Memorial'
  ClientHeight = 442
  ClientWidth = 912
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Transaksi Jurnal Memorial'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 834
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
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 401
    Width = 912
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      912
      41)
    object BtnSelesai: TRzBitBtn
      Left = 824
      Top = 8
      Anchors = [akTop, akRight]
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
    object BtnPerincian: TRzBitBtn
      Left = 744
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
    object BtnHapus: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Hapus'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnHapusClick
    end
    object BtnCetak: TRzBitBtn
      Left = 664
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Cetak'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCetakClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 912
    Height = 376
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
        Width = 120
      end
      object dbgdataDBTableView1kodejurnalumum: TcxGridDBColumn
        Caption = 'No. Jurnal'
        DataBinding.FieldName = 'kodejurnalumum'
        Width = 127
      end
      object dbgdataDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 526
      end
      object dbgdataDBTableView1hasilkali: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        HeaderAlignmentHorz = taRightJustify
        Options.Filtering = False
        Width = 137
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select * from tbl_jurnalumum where tgltransaksi between :tkd and' +
        ' :tks')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    Left = 840
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDataketerangan: TStringField
      FieldName = 'keterangan'
      Size = 255
    end
    object QDatanilai: TFloatField
      FieldName = 'nilai'
      DisplayFormat = '#,#0.##'
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QDatanojurnalumum: TLargeintField
      FieldName = 'nojurnalumum'
      Required = True
    end
    object QDatakodejurnalumum: TStringField
      FieldName = 'kodejurnalumum'
      Size = 15
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 32
    Top = 128
  end
end
