object Frm_DaftarPengeluaranLain: TFrm_DaftarPengeluaranLain
  Left = 201
  Top = 91
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Transaksi Pengeluaran Kas'
  ClientHeight = 554
  ClientWidth = 1147
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
    Width = 1147
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Transaksi Pengeluaran Kas'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 991
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
      Left = 1069
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
    Top = 513
    Width = 1147
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    GradientColorStop = 16744448
    TabOrder = 2
    DesignSize = (
      1147
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1059
      Top = 8
      Anchors = [akRight, akBottom]
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
      Left = 980
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
      Left = 900
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
    object RzBitBtn1: TRzBitBtn
      Left = 800
      Top = 8
      Width = 95
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
      OnClick = RzBitBtn1Click
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1147
    Height = 488
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
        Width = 173
      end
      object dbgdataDBTableView1kodepenerimaan: TcxGridDBColumn
        Caption = 'No. Ref.'
        DataBinding.FieldName = 'kodepengeluaran'
        Width = 200
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Penerima'
        DataBinding.FieldName = 'penerima'
        Width = 220
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taRightJustify
        Width = 305
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,b.namaakun FROM '
      
        '(SELECT * FROM tbl_pengeluaranlain where tgltransaksi between :t' +
        'kd and :tks)AS a'
      
        'LEFT JOIN tbl_akun AS b ON b.noakun=a.noakun ORDER BY a.tgltrans' +
        'aksi,a.kodepengeluaran')
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
    Left = 848
    Top = 120
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
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatanoakun: TLargeintField
      FieldName = 'noakun'
      ReadOnly = True
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamaakun: TStringField
      FieldName = 'namaakun'
      ReadOnly = True
      Size = 50
    end
    object QDatagiro: TSmallintField
      FieldName = 'giro'
      ReadOnly = True
    end
    object QDatanopengeluaran: TLargeintField
      FieldName = 'nopengeluaran'
      ReadOnly = True
    end
    object QDatakodepengeluaran: TStringField
      FieldName = 'kodepengeluaran'
      ReadOnly = True
      Size = 15
    end
    object QDatapenerima: TStringField
      FieldName = 'penerima'
      ReadOnly = True
      Size = 200
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 152
  end
end
