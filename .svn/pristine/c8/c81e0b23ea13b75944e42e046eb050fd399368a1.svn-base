object Frm_RincianHutang: TFrm_RincianHutang
  Left = 295
  Top = 150
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Perincian Hutang Usaha'
  ClientHeight = 442
  ClientWidth = 1097
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
    Width = 1097
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = '             Perincian Hutang Usaha'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1019
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
    object BtnKontak: TRzToolButton
      Left = 0
      Top = 0
      Width = 30
      ImageIndex = 5
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnKontakClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 401
    Width = 1097
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1097
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1009
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
      TabOrder = 0
      OnClick = BtnSelesaiClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1097
    Height = 247
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
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpembelianinvoice'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1kodepembelian: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepembelianinvoice'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1Column1: TcxGridDBColumn
        Caption = 'Tgl. Tempo'
        DataBinding.FieldName = 'tgltempo'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1N1: TcxGridDBColumn
        Caption = '0 - 30 Hari'
        DataBinding.FieldName = 'N1'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1N2: TcxGridDBColumn
        Caption = '30 - 60 Hari'
        DataBinding.FieldName = 'N2'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1N3: TcxGridDBColumn
        Caption = '60 - 90 Hari'
        DataBinding.FieldName = 'N3'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1N4: TcxGridDBColumn
        Caption = '> 90 Hari'
        DataBinding.FieldName = 'N4'
        HeaderAlignmentHorz = taCenter
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object dbgdetail: TcxGrid
    Left = 0
    Top = 272
    Width = 1097
    Height = 129
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
      OnCellDblClick = cxGridDBTableView1CellDblClick
      DataController.DataSource = DSDetail
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.ApplyChanges = fracImmediately
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object cxGridDBTableView1tanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tanggal'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridDBTableView1koderef: TcxGridDBColumn
        Caption = 'Referensi'
        DataBinding.FieldName = 'koderef'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridDBTableView1jumlah: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'jumlah'
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
      'SELECT h.* FROM'
      '(SELECT g.*,h.namakontak FROM'
      '(SELECT f.*,f.sisahutang AS N1,0 AS N2,0 AS N3,0 AS N4 FROM'
      
        '(SELECT e.*,e.totalhutang-e.jumlahbayar-e.jumlahretur AS sisahut' +
        'ang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0)AS jumlahbay' +
        'ar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0)AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,DATE_ADD(tglpembelianinvoice,I' +
        'NTERVAL duedate DAY) AS tgltempo FROM tbl_pembelianinvoice WHERE' +
        ' nokontak=:nk)AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS e)AS f WHERE f.sisahu' +
        'tang>0 AND DATEDIFF(CURRENT_DATE(),f.tgltempo)<=30)AS g'
      'LEFT JOIN tbl_kontak AS h ON h.nokontak=g.nokontak   '
      'UNION ALL'
      'SELECT g.*,h.namakontak FROM'
      '(SELECT f.*,0 AS N1,f.sisahutang AS N2,0 AS N3,0 AS N4 FROM'
      
        '(SELECT e.*,e.totalhutang-e.jumlahbayar-e.jumlahretur AS sisahut' +
        'ang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0)AS jumlahbay' +
        'ar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0)AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,DATE_ADD(tglpembelianinvoice,I' +
        'NTERVAL duedate DAY) AS tgltempo FROM tbl_pembelianinvoice WHERE' +
        ' nokontak=:nk)AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS e)AS f WHERE f.sisahu' +
        'tang>0 AND DATEDIFF(CURRENT_DATE(),f.tgltempo) BETWEEN 31 AND 60' +
        ')AS g'
      'LEFT JOIN tbl_kontak AS h ON h.nokontak=g.nokontak  '
      'UNION ALL'
      'SELECT g.*,h.namakontak FROM'
      '(SELECT f.*,0 AS N1,0 AS N2,f.sisahutang AS N3,0 AS N4 FROM'
      
        '(SELECT e.*,e.totalhutang-e.jumlahbayar-e.jumlahretur AS sisahut' +
        'ang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0)AS jumlahbay' +
        'ar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0)AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,DATE_ADD(tglpembelianinvoice,I' +
        'NTERVAL duedate DAY) AS tgltempo FROM tbl_pembelianinvoice WHERE' +
        ' nokontak=:nk)AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS e)AS f WHERE f.sisahu' +
        'tang>0 AND DATEDIFF(CURRENT_DATE(),f.tgltempo) BETWEEN 61 AND 90' +
        ')AS g'
      'LEFT JOIN tbl_kontak AS h ON h.nokontak=g.nokontak  '
      'UNION ALL'
      'SELECT g.*,h.namakontak FROM'
      '(SELECT f.*,0 AS N1,0 AS N2,0 AS N3,f.sisahutang AS N4 FROM'
      
        '(SELECT e.*,e.totalhutang-e.jumlahbayar-e.jumlahretur AS sisahut' +
        'ang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0)AS jumlahbay' +
        'ar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0)AS jumlahretur FROM'
      
        '(SELECT nopembelianinvoice,kodepembelianinvoice,tglpembelianinvo' +
        'ice,nokontak,total AS totalhutang,DATE_ADD(tglpembelianinvoice,I' +
        'NTERVAL duedate DAY) AS tgltempo FROM tbl_pembelianinvoice WHERE' +
        ' nokontak=:nk)AS a'
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM'
      '(SELECT * FROM tbl_pembayaranhutang where iscancel=0)AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang) AS d ON d.nopembelianinvoice=c.nopembeli' +
        'aninvoice GROUP BY c.nopembelianinvoice)AS e)AS f WHERE f.sisahu' +
        'tang>0 AND DATEDIFF(CURRENT_DATE(),f.tgltempo)>=91)AS g'
      
        'LEFT JOIN tbl_kontak AS h ON h.nokontak=g.nokontak)AS h ORDER BY' +
        ' h.namakontak,h.tglpembelianinvoice')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nk'
        ParamType = ptUnknown
      end>
    Left = 832
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nk'
        ParamType = ptUnknown
      end>
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      ReadOnly = True
    end
    object QDatatotalhutang: TFloatField
      FieldName = 'totalhutang'
      ReadOnly = True
    end
    object QDatajumlahretur: TFloatField
      FieldName = 'jumlahretur'
      ReadOnly = True
    end
    object QDatajumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
    end
    object QDatasisahutang: TFloatField
      FieldName = 'sisahutang'
      ReadOnly = True
    end
    object QDataN1: TFloatField
      FieldName = 'N1'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDataN2: TFloatField
      FieldName = 'N2'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDataN3: TFloatField
      FieldName = 'N3'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDataN4: TFloatField
      FieldName = 'N4'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QDatanopembelianinvoice: TLargeintField
      FieldName = 'nopembelianinvoice'
      ReadOnly = True
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
    object QDatatgltempo: TDateField
      FieldName = 'tgltempo'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 828
    Top = 136
  end
  object QDetail: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT * FROM'
      
        '(SELECT a.nopembayaranhutang AS noref, a.kodepembayaranhutang AS' +
        ' koderef,b.nopembelianinvoice,a.tglbayar AS tanggal,((b.jumlahba' +
        'yar+b.selisih))AS jumlah,a.tipe AS tipe FROM'
      
        '(SELECT nopembayaranhutang,kodepembayaranhutang,tglbayar,'#39'CD'#39' AS' +
        ' tipe FROM tbl_pembayaranhutang where iscancel=0) AS a'
      
        'LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.nopembayaranhutan' +
        'g=a.nopembayaranhutang'
      'UNION'
      
        'SELECT noreturpembelian AS noref,kodereturpembelian AS koderef,n' +
        'opembelianinvoice,tgltransaksi AS tanggal,total AS jumlah,'#39'PR'#39' A' +
        'S tipe FROM tbl_returpembelian)AS b'
      
        'WHERE b.nopembelianinvoice=:nopembelianinvoice ORDER BY b.tangga' +
        'l'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nopembelianinvoice'
        ParamType = ptUnknown
      end>
    DataSource = DSData
    Left = 672
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nopembelianinvoice'
        ParamType = ptUnknown
      end>
    object QDetailtanggal: TDateField
      FieldName = 'tanggal'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDetailjumlah: TFloatField
      FieldName = 'jumlah'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDetailtipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 2
    end
    object QDetailnoref: TLargeintField
      FieldName = 'noref'
      ReadOnly = True
    end
    object QDetailkoderef: TStringField
      FieldName = 'koderef'
      ReadOnly = True
      Size = 15
    end
    object QDetailnopembelianinvoice: TStringField
      FieldName = 'nopembelianinvoice'
      ReadOnly = True
    end
  end
  object DSDetail: TDataSource
    DataSet = QDetail
    Left = 708
    Top = 304
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 32
    Top = 120
  end
end
