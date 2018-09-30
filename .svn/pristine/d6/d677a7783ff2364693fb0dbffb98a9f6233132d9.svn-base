object Frm_DaftarPajak: TFrm_DaftarPajak
  Left = 203
  Top = 117
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Data Pajak'
  ClientHeight = 539
  ClientWidth = 1102
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1102
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Pajak'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1024
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
    Top = 498
    Width = 1102
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1102
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1014
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
      TabOrder = 3
      OnClick = BtnSelesaiClick
    end
    object BtnBaru: TRzBitBtn
      Left = 10
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
    object BtnEdit: TRzBitBtn
      Left = 90
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
      OnClick = BtnEditClick
    end
    object BtnHapus: TRzBitBtn
      Left = 170
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
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1102
    Height = 473
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
      object dbgdataDBTableView1kodepajak: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodepajak'
      end
      object dbgdataDBTableView1namapajak: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namapajak'
      end
      object dbgdataDBTableView1persen: TcxGridDBColumn
        Caption = 'Nilai Pajak (%)'
        DataBinding.FieldName = 'persen'
        HeaderAlignmentHorz = taRightJustify
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select 0 as nopajak,'#39'-'#39' as kodepajak,'#39'No Tax'#39' as namapajak,'#39'0'#39' a' +
        's persen'
      'union'
      'select nopajak,kodepajak,namapajak,persen from tbl_pajak')
    Params = <>
    Left = 816
    Top = 88
    object QDatanopajak: TLargeintField
      FieldName = 'nopajak'
      ReadOnly = True
    end
    object QDatakodepajak: TStringField
      FieldName = 'kodepajak'
      ReadOnly = True
      Size = 15
    end
    object QDatanamapajak: TStringField
      FieldName = 'namapajak'
      ReadOnly = True
      Size = 50
    end
    object QDatapersen: TFloatField
      FieldName = 'persen'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
end
