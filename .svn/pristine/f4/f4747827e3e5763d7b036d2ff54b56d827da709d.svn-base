object Frm_DataHutangUsaha: TFrm_DataHutangUsaha
  Left = 348
  Top = 40
  Width = 445
  Height = 662
  BorderIcons = [biSystemMenu]
  Caption = 'Data Hutang Usaha'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Hutang Usaha'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 582
    Width = 429
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      429
      41)
    object BtnOk: TRzBitBtn
      Left = 345
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnBatal: TRzBitBtn
      Left = 265
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Batal'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnBatalClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 429
    Height = 557
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
        Width = 146
      end
      object dbgdataDBTableView1sisahutang: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'sisahutang'
        HeaderAlignmentHorz = taCenter
        Width = 149
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT f.*,g.namakontak FROM '
      
        '(SELECT e.nokontak,SUM(e.totalhutang)AS totalhutang,(SUM(e.jumla' +
        'hretur)+SUM(e.jumlahbayar))AS jumlahbayar,SUM(e.totalhutang)-SUM' +
        '(e.jumlahretur)-SUM(e.jumlahbayar) AS sisahutang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0) AS jumlahba' +
        'yar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM '
      
        '(SELECT nopembelianinvoice,nokontak,total AS totalhutang FROM tb' +
        'l_pembelianinvoice)AS a '
      
        'LEFT JOIN tbl_returpembelian AS b ON b.nopembelianinvoice=a.nope' +
        'mbelianinvoice GROUP BY a.nopembelianinvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopembelianinvoice,b.jumlahbayar,b.selisih F' +
        'ROM '
      
        '                  (SELECT * FROM tbl_pembayaranhutang WHERE isca' +
        'ncel=0)AS a '
      
        '                 LEFT JOIN tbl_pembayaranhutangdetail AS b ON b.' +
        'nopembayaranhutang=a.nopembayaranhutang) AS d ON d.nopembelianin' +
        'voice=c.nopembelianinvoice GROUP BY c.nopembelianinvoice)AS e '
      'GROUP BY e.nokontak)AS f '
      
        'LEFT JOIN tbl_kontak AS g ON g.nokontak=f.nokontak HAVING f.sisa' +
        'hutang>0 ORDER BY g.namakontak')
    Params = <>
    Left = 48
    Top = 104
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
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
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 100
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
