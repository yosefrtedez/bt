object Frm_BukuBesar: TFrm_BukuBesar
  Left = 139
  Top = 84
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Buku Besar'
  ClientHeight = 442
  ClientWidth = 912
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Color = 16744448
    TabOrder = 0
    DesignSize = (
      912
      25)
    object LBukuBesar: TRzLabel
      Left = 32
      Top = 5
      Width = 61
      Height = 15
      Caption = 'Buku Besar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object BtnAkun: TRzToolButton
      Left = 0
      Top = 0
      ImageIndex = 5
      Images = DM.IL16
      Align = alLeft
      OnClick = BtnAkunClick
    end
    object LNoBukuBesar: TRzLabel
      Left = 208
      Top = 3
      Width = 78
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'LNoBukuBesar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
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
    Top = 401
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
      TabOrder = 2
      OnClick = BtnSelesaiClick
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
      TabOrder = 1
      OnClick = BtnPerincianClick
    end
    object BtnVoucher: TRzBitBtn
      Left = 640
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
      TabOrder = 0
      OnClick = BtnVoucherClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 912
    Height = 376
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
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.##'
          Kind = skSum
          Column = dbgdataDBTableView1debit
        end
        item
          Format = '#,#0.##'
          Kind = skSum
          Column = dbgdataDBTableView1kredit
        end>
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
      OptionsView.Footer = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        Width = 93
      end
      object dbgdataDBTableView1tipe: TcxGridDBColumn
        Caption = 'Tp.'
        DataBinding.FieldName = 'tipe'
        Width = 55
      end
      object dbgdataDBTableView1koderef: TcxGridDBColumn
        Caption = 'No. Ref'
        DataBinding.FieldName = 'koderef'
        Width = 114
      end
      object dbgdataDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Keterangan'
        DataBinding.FieldName = 'keterangan'
        Width = 367
      end
      object dbgdataDBTableView1debit: TcxGridDBColumn
        Caption = 'Debit'
        DataBinding.FieldName = 'debit'
        HeaderAlignmentHorz = taRightJustify
        Width = 93
      end
      object dbgdataDBTableView1kredit: TcxGridDBColumn
        Caption = 'Kredit'
        DataBinding.FieldName = 'kredit'
        HeaderAlignmentHorz = taRightJustify
        Width = 94
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT STR_TO_DATE(CONCAT(a.tahun,'#39','#39',a.bulan,'#39','#39','#39'01'#39'),'#39'%Y,%m,%' +
        'd'#39')AS tgltransaksi,'#39'OB'#39' AS tipe,'#39#39' AS koderef,'#39'Saldo Awal'#39' AS ke' +
        'terangan,SUM(b.debit)AS debit,SUM(b.kredit)AS kredit,0 AS norefe' +
        'rensi,b.noakun FROM'
      
        '(SELECT noperiode,CASE WHEN LENGTH(bulan)=1 THEN CONCAT('#39'0'#39',bula' +
        'n) ELSE bulan END AS bulan,tahun FROM tbl_periode WHERE noperiod' +
        'e=:tk)AS a'
      
        'LEFT JOIN tbl_saldoawalperiodeakun AS b ON b.noperiode=a.noperio' +
        'de GROUP BY b.noakun HAVING b.noakun=:a'
      'UNION                              '
      'SELECT tgltransaksi,tipe,CASE'
      
        'WHEN tipe='#39'GJ'#39' THEN (SELECT kodejurnalumum FROM tbl_jurnalumum W' +
        'HERE nojurnalumum=noreferensi)  '
      
        'WHEN tipe='#39'CI'#39' THEN (SELECT kodepenerimaan FROM tbl_penerimaanla' +
        'in WHERE nopenerimaan=noreferensi)  '
      
        'WHEN tipe='#39'CO'#39' THEN (SELECT kodepengeluaran FROM tbl_pengeluaran' +
        'lain WHERE nopengeluaran=noreferensi)  '
      
        'WHEN tipe='#39'PU'#39' THEN (SELECT kodepembelianinvoice FROM tbl_pembel' +
        'ianinvoice WHERE nopembelianinvoice=noreferensi)  '
      
        'WHEN tipe='#39'CD'#39' THEN (SELECT kodepembayaranhutang FROM tbl_pembay' +
        'aranhutang WHERE nopembayaranhutang=noreferensi)  '
      
        'WHEN tipe='#39'SA'#39' THEN (SELECT kodepenjualaninvoice FROM tbl_penjua' +
        'laninvoice WHERE nopenjualaninvoice=noreferensi)  '
      
        'WHEN tipe='#39'CR'#39' THEN (SELECT kodepembayaranpiutang FROM tbl_pemba' +
        'yaranpiutang WHERE nopembayaranpiutang=noreferensi)  '
      
        'WHEN tipe='#39'IJ'#39' THEN (SELECT kodepenyesuaian FROM tbl_penyesuaian' +
        ' WHERE nopenyesuaian=noreferensi)  '
      
        'WHEN tipe='#39'PR'#39' THEN (SELECT kodereturpembelian FROM tbl_returpem' +
        'belian WHERE noreturpembelian=noreferensi)  '
      
        'WHEN tipe='#39'SR'#39' THEN (SELECT kodereturpenjualan FROM tbl_returpen' +
        'jualan WHERE noreturpenjualan=noreferensi)  '
      
        'WHEN tipe='#39'TR'#39' THEN (SELECT '#39'TRANSFER'#39' AS kodetransfer FROM tbl_' +
        'transferkas WHERE noreferensi=noreferensi)  '
      
        'WHEN tipe='#39'CA'#39' THEN (SELECT kodeloan FROM tbl_loan WHERE noloan=' +
        'noreferensi)  '
      
        'WHEN tipe='#39'AC'#39' THEN (SELECT '#39#39' AS kodepembayaranloan FROM tbl_pe' +
        'mbayaranloan WHERE nopembayaranloan=noreferensi)  '
      'END AS koderef'
      
        ',keterangan,SUM(debit)AS debit,SUM(kredit)AS kredit,noreferensi,' +
        'noakun FROM tbl_bukubesarakun WHERE noakun=:a AND tgltransaksi B' +
        'ETWEEN :tkd AND :tks GROUP BY noakun,noreferensi,tgltransaksi,ti' +
        'pe,keterangan')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tk'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end
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
    Left = 648
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tk'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end
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
    object QDatanoakun: TLargeintField
      FieldName = 'noakun'
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      Size = 10
    end
    object QDataketerangan: TStringField
      FieldName = 'keterangan'
      Size = 100
    end
    object QDatadebit: TFloatField
      FieldName = 'debit'
      DisplayFormat = '#,#0.##'
    end
    object QDatakredit: TFloatField
      FieldName = 'kredit'
      DisplayFormat = '#,#0.##'
    end
    object QDatanoreferensi: TLargeintField
      FieldName = 'noreferensi'
    end
    object QDatakoderef: TStringField
      FieldName = 'koderef'
      ReadOnly = True
      Size = 15
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 684
    Top = 144
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 728
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 152
    object JurnalVoucher1: TMenuItem
      Caption = 'Jurnal Voucher'
      OnClick = JurnalVoucher1Click
    end
  end
end
