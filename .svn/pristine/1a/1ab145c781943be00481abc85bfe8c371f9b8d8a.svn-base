object Frm_DaftarHutang: TFrm_DaftarHutang
  Left = 130
  Top = 55
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Daftar Hutang Usaha'
  ClientHeight = 442
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Width = 1068
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Hutang Usaha'
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
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 401
    Width = 1068
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      1068
      41)
    object BtnSelesai: TRzBitBtn
      Left = 980
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
      TabOrder = 1
      OnClick = BtnSelesaiClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 900
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
      TabOrder = 0
      OnClick = BtnPerincianClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1068
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
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 458
      end
      object dbgdataDBTableView1totalhutang: TcxGridDBColumn
        Caption = 'Total Hutang'
        DataBinding.FieldName = 'totalhutang'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 154
      end
      object dbgdataDBTableView1jumlahbayar: TcxGridDBColumn
        Caption = 'Hutang Terbayar'
        DataBinding.FieldName = 'jumlahbayar'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 154
      end
      object dbgdataDBTableView1sisahutang: TcxGridDBColumn
        Caption = 'Saldo Hutang'
        DataBinding.FieldName = 'sisahutang'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 151
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT f.*,g.namakontak FROM '
      '(SELECT h.* FROM '
      
        '(SELECT e.nokontak,SUM(e.totalhutang)AS totalhutang,(SUM(e.jumla' +
        'hretur)+SUM(e.jumlahbayar))AS jumlahbayar,SUM(e.totalhutang)-SUM' +
        '(e.jumlahretur)-SUM(e.jumlahbayar) AS sisahutang FROM '
      '(SELECT gg.* FROM'
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0) AS jumlahba' +
        'yar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM '
      
        '(SELECT nopembelianinvoice,nokontak,total AS totalhutang FROM tb' +
        'l_pembelianinvoice)AS a '
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS gg WHERE gg.totalhuta' +
        'ng-gg.jumlahretur-gg.jumlahbayar>0)AS e '
      'GROUP BY e.nokontak)AS h WHERE h.sisahutang>0)AS f '
      'LEFT JOIN tbl_kontak AS g ON g.nokontak=f.nokontak')
    Params = <>
    Left = 816
    Top = 88
    object QDatatotalhutang: TFloatField
      FieldName = 'totalhutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatajumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatasisahutang: TFloatField
      FieldName = 'sisahutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 100
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
end
