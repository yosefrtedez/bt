object Frm_DaftarPembayaranHutangUsaha: TFrm_DaftarPembayaranHutangUsaha
  Left = 231
  Top = 94
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Pembayaran Hutang Usaha'
  ClientHeight = 442
  ClientWidth = 1071
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
    Width = 1071
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Pembayaran Hutang Usaha'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 915
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
      Left = 993
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
    Top = 401
    Width = 1071
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      1071
      41)
    object BtnSelesai: TRzBitBtn
      Left = 983
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
      TabOrder = 4
      OnClick = BtnSelesaiClick
    end
    object BtnHapus: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Batal'
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
    object BtnPerincian: TRzBitBtn
      Left = 903
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
      TabOrder = 3
      OnClick = BtnPerincianClick
    end
    object BtnCetak: TRzBitBtn
      Left = 823
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
      TabOrder = 2
      OnClick = BtnCetakClick
    end
    object BtnApprove: TRzBitBtn
      Left = 745
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Approve'
      Color = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnApproveClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1071
    Height = 376
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
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1tglbayar: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglbayar'
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object dbgdataDBTableView1nokaskeluar: TcxGridDBColumn
        Caption = 'No. Referensi'
        DataBinding.FieldName = 'kodepembayaranhutang'
        HeaderAlignmentHorz = taCenter
        Width = 168
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 228
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 288
      end
      object dbgdataDBTableView1approve: TcxGridDBColumn
        Caption = 'Approve'
        DataBinding.FieldName = 'approve'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object dbgdataDBTableView1cair: TcxGridDBColumn
        Caption = 'Cair'
        DataBinding.FieldName = 'cair'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object dbgdataDBTableView1iscancel: TcxGridDBColumn
        Caption = 'Cancel'
        DataBinding.FieldName = 'iscancel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,IFNULL(b.namakontak,'#39#39')AS namakontak FROM '
      
        '                  (SELECT *  FROM tbl_pembayaranhutang where tgl' +
        'bayar between :tkd and :tks)AS a '
      
        '                  LEFT JOIN tbl_kontak AS b ON b.nokontak=a.noko' +
        'ntak ORDER BY a.tglbayar,a.kodepembayaranhutang')
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
    Left = 816
    Top = 88
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
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatatglbayar: TDateField
      FieldName = 'tglbayar'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 50
    end
    object QDatanopembayaranhutang: TLargeintField
      FieldName = 'nopembayaranhutang'
      ReadOnly = True
    end
    object QDatanokas: TLargeintField
      FieldName = 'nokas'
      ReadOnly = True
    end
    object QDatagiro: TSmallintField
      FieldName = 'giro'
      ReadOnly = True
    end
    object QDatakodepembayaranhutang: TStringField
      FieldName = 'kodepembayaranhutang'
      ReadOnly = True
      Size = 15
    end
    object QDatanokastransit: TLargeintField
      FieldName = 'nokastransit'
      ReadOnly = True
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDatacair: TSmallintField
      FieldName = 'cair'
      ReadOnly = True
    end
    object QDataiscancel: TSmallintField
      FieldName = 'iscancel'
      ReadOnly = True
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
    Top = 120
  end
end
