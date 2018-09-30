object Frm_DaftarReturPenjualan: TFrm_DaftarReturPenjualan
  Left = 225
  Top = 89
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Retur Penjualan'
  ClientHeight = 590
  ClientWidth = 1073
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
    Width = 1073
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Retur Penjualan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 917
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
      Left = 995
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
    Top = 549
    Width = 1073
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1073
      41)
    object BtnSelesai: TRzBitBtn
      Left = 985
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
    object BtnPerincian: TRzBitBtn
      Left = 905
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
    object RzBitBtn2: TRzBitBtn
      Left = 720
      Top = 8
      Width = 99
      Anchors = [akTop, akRight]
      Caption = 'Jurnal Voucher'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
    object RzBitBtn1: TRzBitBtn
      Left = 824
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Cetak Nota'
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
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1073
    Height = 524
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
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object dbgdataDBTableView1kodepenjualan: TcxGridDBColumn
        Caption = 'No. Referensi'
        DataBinding.FieldName = 'kodereturpenjualan'
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
      object dbgdataDBTableView1kodepenjualaninvoice: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepenjualaninvoice'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 499
      end
      object dbgdataDBTableView1totalpajak: TcxGridDBColumn
        Caption = 'PPN'
        DataBinding.FieldName = 'totalppn'
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,ifnull(d.namakontak,'#39#39')as namakontak from '
      
        '(select a.*,ifnull(b.kodepenjualaninvoice,'#39#39')as kodepenjualaninv' +
        'oice from'
      
        '                  (select noreturpenjualan,kodereturpenjualan,no' +
        'kontak,tgltransaksi,totalppn,total,nopenjualaninvoice from tbl_r' +
        'eturpenjualan where tgltransaksi between :tkd and :tks)as a '
      
        'left join tbl_penjualaninvoice as b on b.nopenjualaninvoice=a.no' +
        'penjualaninvoice)as a'
      
        '                  left join tbl_kontak as d on d.nokontak=a.noko' +
        'ntak order by a.tgltransaksi,a.kodereturpenjualan')
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
    Left = 880
    Top = 72
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
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 100
    end
    object QDatanoreturpenjualan: TLargeintField
      FieldName = 'noreturpenjualan'
      ReadOnly = True
    end
    object QDatakodereturpenjualan: TStringField
      FieldName = 'kodereturpenjualan'
      ReadOnly = True
      Size = 15
    end
    object QDatatotalppn: TFloatField
      FieldName = 'totalppn'
      ReadOnly = True
    end
    object QDatanopenjualaninvoice: TLargeintField
      FieldName = 'nopenjualaninvoice'
      ReadOnly = True
    end
    object QDatakodepenjualaninvoice: TStringField
      FieldName = 'kodepenjualaninvoice'
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
end
