object Frm_DaftarPPh: TFrm_DaftarPPh
  Left = 194
  Top = 33
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Data Pajak Penghasilan'
  ClientHeight = 636
  ClientWidth = 1289
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
    Width = 1289
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Pajak Penghasilan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1211
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
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1289
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1201
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
    Width = 1289
    Height = 570
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
        DataBinding.FieldName = 'kodepph'
      end
      object dbgdataDBTableView1namapajak: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namapph'
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
      'select 0 as nopph,'#39'-'#39' as kodepph,'#39'-'#39' as namapph,'#39'0'#39' as persen'
      'union'
      'select nopph,kodepph,namapph,persen from tbl_pajakpenghasilan')
    Params = <>
    Left = 816
    Top = 88
    object QDatapersen: TFloatField
      FieldName = 'persen'
    end
    object QDatanopph: TLargeintField
      FieldName = 'nopph'
      ReadOnly = True
    end
    object QDatakodepph: TStringField
      FieldName = 'kodepph'
      ReadOnly = True
      Size = 15
    end
    object QDatanamapph: TStringField
      FieldName = 'namapph'
      ReadOnly = True
      Size = 50
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
end
