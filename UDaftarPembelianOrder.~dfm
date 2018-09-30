object Frm_DaftarPembelianOrder: TFrm_DaftarPembelianOrder
  Left = 51
  Top = 19
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Order Pembelian'
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
    Caption = 'Daftar Order Pembelian'
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
    TabOrder = 2
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
      TabOrder = 4
      OnClick = BtnSelesaiClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 1121
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
      Left = 1041
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
      Left = 961
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
      Visible = False
      OnClick = BtnApproveClick
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
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object dbgdataDBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
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
      object dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn
        Caption = 'No. PO'
        DataBinding.FieldName = 'kodepembelianorder'
        HeaderAlignmentHorz = taCenter
        Width = 152
      end
      object dbgdataDBTableView1kodepembelianrequest: TcxGridDBColumn
        Caption = 'No. Permintaan'
        DataBinding.FieldName = 'kodepembelianrequest'
        HeaderAlignmentHorz = taCenter
        Width = 170
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 163
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 556
      end
      object dbgdataDBTableView1hasilkali: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 161
      end
      object dbgdataDBTableView1Column1: TcxGridDBColumn
        Caption = 'Approve'
        DataBinding.FieldName = 'approve'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1Pos: TcxGridDBColumn
        Caption = 'Selesai'
        DataBinding.FieldName = 'selesai'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 85
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
      
        '                  (SELECT a.*,IFNULL(b.kodepembelianrequest,'#39#39')a' +
        's kodepembelianrequest  FROM '
      
        '                  (SELECT * FROM tbl_pembelianorder where tgltra' +
        'nsaksi between :tkd and :tks)AS a '
      
        '                  LEFT JOIN tbl_pembelianrequest as b on b.nopem' +
        'belianrequest=a.nopembelianrequest)as a '
      
        '                  LEFT JOIN tbl_kontak AS b ON b.nokontak=a.noko' +
        'ntak ORDER BY a.tgltransaksi,a.kodepembelianorder')
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
    object QDatanopembelianorder: TLargeintField
      FieldName = 'nopembelianorder'
      ReadOnly = True
    end
    object QDatakodepembelianorder: TStringField
      FieldName = 'kodepembelianorder'
      ReadOnly = True
      Size = 15
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatanopembelianrequest: TLargeintField
      FieldName = 'nopembelianrequest'
      ReadOnly = True
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
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
    object QDataselesai: TSmallintField
      FieldName = 'selesai'
      ReadOnly = True
    end
    object QDatakodepembelianrequest: TStringField
      FieldName = 'kodepembelianrequest'
      ReadOnly = True
      Size = 15
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QDatatotalpajak: TFloatField
      FieldName = 'totalpajak'
      ReadOnly = True
    end
    object QDatatotaldpp: TFloatField
      FieldName = 'totaldpp'
      ReadOnly = True
    end
    object QDatabiayalain: TFloatField
      FieldName = 'biayalain'
      ReadOnly = True
    end
    object QDatapph: TFloatField
      FieldName = 'pph'
      ReadOnly = True
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDatatglapprove: TDateTimeField
      FieldName = 'tglapprove'
      ReadOnly = True
    end
    object QDatadiskonday: TIntegerField
      FieldName = 'diskonday'
    end
    object QDataduedate: TIntegerField
      FieldName = 'duedate'
    end
    object QDataearlydiskon: TFloatField
      FieldName = 'earlydiskon'
    end
    object QDatalatecharge: TFloatField
      FieldName = 'latecharge'
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
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 360
    object CekPO1: TMenuItem
      Caption = 'Lihat Penerimaan'
      OnClick = CekPO1Click
    end
  end
end
