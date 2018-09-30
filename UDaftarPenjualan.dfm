object Frm_DaftarPengirimanBarang: TFrm_DaftarPengirimanBarang
  Left = 44
  Top = 49
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Penjualan'
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
  OnShow = FormShow
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
    Caption = 'Daftar Penjualan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1133
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
      Left = 1211
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
      TabOrder = 5
      OnClick = BtnSelesaiClick
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
      Left = 1121
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
      TabOrder = 4
      OnClick = BtnCetakClick
    end
    object BtnApprove: TRzBitBtn
      Left = 1041
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
      TabOrder = 3
      OnClick = BtnApproveClick
    end
    object RzBitBtn1: TRzBitBtn
      Left = 961
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Jurnal'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = RzBitBtn1Click
    end
    object BtnVariabel: TRzBitBtn
      Left = 87
      Top = 7
      Width = 98
      Caption = 'Faktur Pajak'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = BtnVariabelClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1289
    Height = 367
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
      OnCellClick = dbgdataDBTableView1CellClick
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1kodepenjualanorder: TcxGridDBColumn
        Caption = 'No. SO'
        DataBinding.FieldName = 'kodepenjualanorder1'
        HeaderAlignmentHorz = taCenter
        Width = 211
      end
      object dbgdataDBTableView1kodepenjualanrequest: TcxGridDBColumn
        Caption = 'No. DO'
        DataBinding.FieldName = 'kodepenjualando'
        HeaderAlignmentHorz = taCenter
        Width = 191
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 131
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 541
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 213
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object dbgdetil: TcxGrid
    Left = 0
    Top = 392
    Width = 1289
    Height = 203
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridDBTableView1CellClick
      OnCellDblClick = cxGridDBTableView1CellDblClick
      DataController.DataSource = DSDetil
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object cxGridDBTableView1kodepembelianterima: TcxGridDBColumn
        Caption = 'No. Pengiriman'
        DataBinding.FieldName = 'kodepenjualankirim1'
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object cxGridDBTableView1tglpembelianterima: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpenjualankirim'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object cxGridDBTableView1kodepembelianinvoice: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepenjualaninvoice'
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object cxGridDBTableView1tglpembelianinvoice: TcxGridDBColumn
        Caption = 'Tgl. Invoice'
        DataBinding.FieldName = 'tglpenjualaninvoice'
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object cxGridDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,IFNULL(b.namakontak,'#39#39')AS namakontak FROM '
      
        '                  (SELECT nopenjualanorder,tgltransaksi,kodepenj' +
        'ualanorder,approve,iscancel,CASE '
      'WHEN iscancel=1 THEN CONCAT(kodepenjualanorder,'#39' (Batal)'#39')'
      'WHEN approve=1 THEN CONCAT(kodepenjualanorder,'#39' (Approve)'#39')'
      
        'WHEN approve=0 THEN CONCAT(kodepenjualanorder,'#39' (Pending)'#39') END ' +
        'AS kodepenjualanorder1,nokontak,total,kodepenjualando FROM tbl_p' +
        'enjualanorder where tgltransaksi between :tkd and :tks)AS a '
      
        '                  LEFT JOIN tbl_kontak AS b ON b.nokontak=a.noko' +
        'ntak ORDER BY a.tgltransaksi,a.kodepenjualanorder')
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
    object QDatanopenjualanorder: TLargeintField
      FieldName = 'nopenjualanorder'
      ReadOnly = True
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatakodepenjualanorder: TStringField
      FieldName = 'kodepenjualanorder'
      ReadOnly = True
      Size = 15
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QDatakodepenjualando: TStringField
      FieldName = 'kodepenjualando'
      ReadOnly = True
      Size = 15
    end
    object QDatakodepenjualanorder1: TStringField
      FieldName = 'kodepenjualanorder1'
      ReadOnly = True
      Size = 25
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
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
    Top = 128
  end
  object QDetil: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select a.*,ifnull(b.nopenjualaninvoice,0)as nopenjualaninvoice,i' +
        'fnull(b.kodepenjualaninvoice,'#39#39')as kodepenjualaninvoice,tglpenju' +
        'alaninvoice,total from'
      '(SELECT *,CASE '
      'WHEN approve=1 THEN CONCAT(kodepenjualankirim,'#39' (Approve)'#39')'
      
        'WHEN approve=0 THEN CONCAT(kodepenjualankirim,'#39' (Pending)'#39') END ' +
        'AS kodepenjualankirim1 FROM tbl_penjualankirim WHERE nopenjualan' +
        'order=:nopenjualanorder)as a'
      
        'left join tbl_penjualaninvoice as b on b.nopenjualankirim=a.nope' +
        'njualankirim ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nopenjualanorder'
        ParamType = ptUnknown
      end>
    DataSource = DSData
    Left = 816
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nopenjualanorder'
        ParamType = ptUnknown
      end>
    object QDetilnopenjualankirim: TLargeintField
      FieldName = 'nopenjualankirim'
      ReadOnly = True
    end
    object QDetilkodepenjualankirim: TStringField
      FieldName = 'kodepenjualankirim'
      ReadOnly = True
      Size = 15
    end
    object QDetiltglpenjualankirim: TDateField
      FieldName = 'tglpenjualankirim'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDetilkodepenjualaninvoice: TStringField
      FieldName = 'kodepenjualaninvoice'
      ReadOnly = True
      Size = 15
    end
    object QDetiltglpenjualaninvoice: TDateField
      FieldName = 'tglpenjualaninvoice'
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDetiltotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '#,#0.##'
    end
    object QDetilapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDetilnopenjualanorder: TLargeintField
      FieldName = 'nopenjualanorder'
      ReadOnly = True
    end
    object QDetilnokontak: TLargeintField
      FieldName = 'nokontak'
    end
    object QDetilnogudang: TLargeintField
      FieldName = 'nogudang'
      ReadOnly = True
    end
    object QDetilbiayalain: TFloatField
      FieldName = 'biayalain'
    end
    object QDetilnoakunbiayalain: TLargeintField
      FieldName = 'noakunbiayalain'
      ReadOnly = True
    end
    object QDetilnamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QDetiltglapprove: TDateTimeField
      FieldName = 'tglapprove'
      ReadOnly = True
    end
    object QDetilnopenjualaninvoice: TLargeintField
      FieldName = 'nopenjualaninvoice'
      ReadOnly = True
    end
    object QDetilkodepenjualankirim1: TStringField
      FieldName = 'kodepenjualankirim1'
      ReadOnly = True
      Size = 25
    end
  end
  object DSDetil: TDataSource
    DataSet = QDetil
    Left = 816
    Top = 512
  end
end
