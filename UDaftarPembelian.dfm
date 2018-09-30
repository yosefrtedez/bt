object Frm_DaftarPembelian: TFrm_DaftarPembelian
  Left = 454
  Top = 245
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Daftar Pembelian'
  ClientHeight = 513
  ClientWidth = 1146
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
    Width = 1146
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Pembelian'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 990
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
      Left = 1068
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
    Top = 472
    Width = 1146
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1146
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1058
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
      TabOrder = 2
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
      Left = 975
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
    object Button1: TButton
      Left = 768
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1146
    Height = 447
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
    object cxGridDBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridDBTableView1CellClick
      OnCellDblClick = cxGridDBTableView1CellDblClick
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object cxGridDBTableView1kodepembelianterima: TcxGridDBColumn
        Caption = 'No. Penerimaan'
        DataBinding.FieldName = 'kodepembelianterima'
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object cxGridDBTableView1tglpembelianterima: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpembelianterima'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object cxGridDBTableView1Column1: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'kodepembelianorder'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridDBTableView1kodepembelianinvoice: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepembelianinvoice'
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object cxGridDBTableView1tglpembelianinvoice: TcxGridDBColumn
        Caption = 'Tgl. Invoice'
        DataBinding.FieldName = 'tglpembelianinvoice'
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
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 32
    Top = 128
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,b.kodepembelianorder from'
      
        '(select a.*,ifnull(b.nopembelianinvoice,0)as nopembelianinvoice,' +
        'ifnull(b.kodepembelianinvoice,'#39#39')as kodepembelianinvoice,b.tglpe' +
        'mbelianinvoice,ifnull(b.total,0)as total from'
      
        '(SELECT * FROM tbl_pembelianterima WHERE tglpembelianterima betw' +
        'een :tkd and :tks)as a'
      
        'left join tbl_pembelianinvoice as b on b.nopembelianterima=a.nop' +
        'embelianterima)as a'
      
        'left join tbl_pembelianorder as b on b.nopembelianorder=a.nopemb' +
        'elianorder')
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
    Left = 856
    Top = 168
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
    object QDatanopembelianterima: TLargeintField
      FieldName = 'nopembelianterima'
      ReadOnly = True
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
    end
    object QDatanopembelianorder: TLargeintField
      FieldName = 'nopembelianorder'
      Required = True
    end
    object QDatakodepembelianterima: TStringField
      FieldName = 'kodepembelianterima'
      ReadOnly = True
      Size = 15
    end
    object QDatatglpembelianterima: TDateField
      FieldName = 'tglpembelianterima'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QDatakodepembelianinvoice: TStringField
      FieldName = 'kodepembelianinvoice'
      ReadOnly = True
      Size = 15
    end
    object QDatatglpembelianinvoice: TDateField
      FieldName = 'tglpembelianinvoice'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatakodepembelianorder: TStringField
      FieldName = 'kodepembelianorder'
      Size = 15
    end
    object QDatanopembelianinvoice: TLargeintField
      FieldName = 'nopembelianinvoice'
      ReadOnly = True
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 856
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 208
    object JurnalVoucher1: TMenuItem
      Caption = 'Jurnal Voucher'
      OnClick = JurnalVoucher1Click
    end
  end
end
