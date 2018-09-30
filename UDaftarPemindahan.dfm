object Frm_DaftarPemindahan: TFrm_DaftarPemindahan
  Left = 192
  Top = 117
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Assembly / Disassembly'
  ClientHeight = 441
  ClientWidth = 912
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Assembly / Disassembly'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 756
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
      Left = 834
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
      OnClick = BtnFilterClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 400
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
      TabOrder = 2
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
      TabOrder = 1
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
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 912
    Height = 375
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
        Width = 115
      end
      object dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn
        Caption = 'Referensi'
        DataBinding.FieldName = 'kodepemindahan'
        Width = 157
      end
      object dbgdataDBTableView1tip: TcxGridDBColumn
        Caption = 'Tipe'
        DataBinding.FieldName = 'tip'
        Width = 121
      end
      object dbgdataDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 496
      end
      object dbgdataDBTableView1Pos: TcxGridDBColumn
        DataBinding.FieldName = 'Pos'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Width = 21
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
      'select *,case'
      #9'when posting=1'
      #9'then '#39'v'#39
      #9'else '#39#39
      #9'end as Pos,'
      'case'
      #9'when tipe=1'
      #9'then '#39'Assembly'#39
      #9'else '#39'Disassembly'#39
      #9'end as tip'
      'from tbl_pemindahan where tgltransaksi between :tkd and :tks')
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
      Size = 100
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QDatanopemindahan: TLargeintField
      FieldName = 'nopemindahan'
      Required = True
    end
    object QDatakodepemindahan: TStringField
      FieldName = 'kodepemindahan'
      Size = 15
    end
    object QDatanogudang: TLargeintField
      FieldName = 'nogudang'
    end
    object QDataposting: TSmallintField
      FieldName = 'posting'
    end
    object QDataPos: TStringField
      FieldName = 'Pos'
      ReadOnly = True
      Size = 1
    end
    object QDatatipe: TSmallintField
      FieldName = 'tipe'
    end
    object QDatatip: TStringField
      FieldName = 'tip'
      ReadOnly = True
      Size = 11
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
