object Frm_DaftarPembayaranPiutang: TFrm_DaftarPembayaranPiutang
  Left = 270
  Top = 165
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Pembayaran Piutang Usaha'
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
    Caption = 'Daftar Pembayaran Piutang Usaha'
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
      TabOrder = 3
      OnClick = BtnPerincianClick
    end
    object BtnCetak: TRzBitBtn
      Left = 663
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
      Left = 585
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
      object dbgdataDBTableView1tglbayar: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglbayar'
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object dbgdataDBTableView1nokaskeluar: TcxGridDBColumn
        Caption = 'No. Referensi'
        DataBinding.FieldName = 'kodepembayaranpiutang'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 135
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 127
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT a.*,IFNULL(b.namakontak,'#39'+QuotedStr('#39#39')+'#39')AS namakontak F' +
        'ROM '
      
        '                  (SELECT * FROM tbl_pembayaranpiutang where tgl' +
        'bayar between :tkd and :tks)AS a '
      
        '                  LEFT JOIN tbl_kontak AS b ON b.nokontak=a.noko' +
        'ntak ORDER BY a.tglbayar,a.kodepembayaranpiutang')
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
    object QDatanokas: TLargeintField
      FieldName = 'nokas'
      ReadOnly = True
    end
    object QDatagiro: TSmallintField
      FieldName = 'giro'
      ReadOnly = True
    end
    object QDatanopembayaranpiutang: TLargeintField
      FieldName = 'nopembayaranpiutang'
      ReadOnly = True
    end
    object QDatakodepembayaranpiutang: TStringField
      FieldName = 'kodepembayaranpiutang'
      ReadOnly = True
      Size = 15
    end
    object QDatatotaldenda: TFloatField
      FieldName = 'totaldenda'
      ReadOnly = True
    end
    object QDatanoakundenda: TLargeintField
      FieldName = 'noakundenda'
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
