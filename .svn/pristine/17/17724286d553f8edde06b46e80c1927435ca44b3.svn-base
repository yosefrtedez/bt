object Frm_DaftarPencairanDeposit: TFrm_DaftarPencairanDeposit
  Left = 192
  Top = 117
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Pencairan Deposit'
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
    Caption = 'Daftar Pencairan Deposit'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
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
    GradientColorStop = 16744448
    TabOrder = 1
    DesignSize = (
      1289
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1201
      Top = 8
      Anchors = [akRight, akBottom]
      Caption = 'Keluar'
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
    object BtnCair: TRzBitBtn
      Left = 1041
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Cair'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnCairClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 1122
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
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = dbgdataDBTableView1CellDblClick
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
      object dbgdataDBTableView1kodereferensi: TcxGridDBColumn
        Caption = 'No. Referensi'
        DataBinding.FieldName = 'kodereferensi'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1tglbayar: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglbayar'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT nopembayaranhutang AS noreferensi,'#39'CD'#39' AS tipe,kodepembay' +
        'aranhutang AS kodereferensi,tglbayar,total,nokas,nokastransit,'#39'P' +
        'embayaran Hutang'#39' AS keterangan FROM tbl_pembayaranhutang WHERE ' +
        'iscancel=0 AND approve=1 AND cair=0'
      'UNION'
      
        'SELECT noreferensi AS noreferensi,'#39'TR'#39' AS tipe,'#39'TRANSFER'#39' AS kod' +
        'ereferensi,tgltransaksi,nilai as total,nokaske as nokas,nokastra' +
        'nsit,'#39'Tranfer Kas/Bank'#39' AS keterangan FROM tbl_transferkas WHERE' +
        ' iscancel=0 AND approve=1 AND cair=0'
      'union'
      
        'SELECT noloan AS noreferensi,'#39'CA'#39' AS tipe,kodeloan AS koderefere' +
        'nsi,tgltransaksi,total,nokas,nokastransit,'#39'Cash Advance'#39' AS kete' +
        'rangan FROM tbl_loan WHERE iscancel=0 AND approve=1 AND cair=0')
    Params = <>
    Left = 848
    Top = 120
    object QDatanoreferensi: TLargeintField
      FieldName = 'noreferensi'
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 2
    end
    object QDatakodereferensi: TStringField
      FieldName = 'kodereferensi'
      Size = 15
    end
    object QDatatglbayar: TDateField
      FieldName = 'tglbayar'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '#,#0.##'
    end
    object QDatanokas: TLargeintField
      FieldName = 'nokas'
    end
    object QDatanokastransit: TLargeintField
      FieldName = 'nokastransit'
    end
    object QDataketerangan: TStringField
      FieldName = 'keterangan'
      ReadOnly = True
      Size = 17
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 152
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 96
    Top = 136
  end
end
