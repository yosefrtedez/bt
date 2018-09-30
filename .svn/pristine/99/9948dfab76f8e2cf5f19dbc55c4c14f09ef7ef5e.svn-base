object Frm_DataInvoicePiutang: TFrm_DataInvoicePiutang
  Left = 409
  Top = 20
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Rincian Piutang Usaha'
  ClientHeight = 670
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 464
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Rincian Piutang Usaha'
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
    Top = 629
    Width = 464
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      464
      41)
    object BtnOk: TRzBitBtn
      Left = 384
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
      Left = 304
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
    Width = 464
    Height = 604
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
      object dbgdataDBTableView1kodepembelian: TcxGridDBColumn
        Caption = 'No. Invoice'
        DataBinding.FieldName = 'kodepenjualaninvoice'
        Width = 105
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpenjualaninvoice'
        Width = 93
      end
      object dbgdataDBTableView1sisahutang: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'sisapiutang'
        HeaderAlignmentHorz = taRightJustify
        Width = 146
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT e.*,e.totalpiutang-e.jumlahretur-e.jumlahbayar AS sisapiu' +
        'tang FROM'
      
        '(SELECT c.*,IFNULL(SUM(d.jumlahbayar+d.selisih),0)AS jumlahbayar' +
        ' FROM'
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM'
      
        '(SELECT nopenjualaninvoice,kodepenjualaninvoice,tglpenjualaninvo' +
        'ice,nokontak,total AS totalpiutang,noakunpiutang FROM tbl_penjua' +
        'laninvoice WHERE nokontak=:isu)AS a'
      
        'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nope' +
        'njualaninvoice GROUP BY a.nopenjualaninvoice)AS c'
      
        'LEFT JOIN (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih F' +
        'ROM '
      
        '                            (SELECT * FROM tbl_pembayaranpiutang' +
        ')AS a '
      
        '                            LEFT JOIN tbl_pembayaranpiutangdetai' +
        'l AS b ON b.nopembayaranpiutang=a.nopembayaranpiutang) AS d ON d' +
        '.nopenjualaninvoice=c.nopenjualaninvoice GROUP BY c.nopenjualani' +
        'nvoice)as e where e.totalpiutang-e.jumlahretur-e.jumlahbayar>0 O' +
        'RDER BY e.tglpenjualaninvoice')
    Params = <
      item
        DataType = ftUnknown
        Name = 'isu'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'isu'
        ParamType = ptUnknown
      end>
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
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
    object QDatatotalpiutang: TFloatField
      FieldName = 'totalpiutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanoakunpiutang: TLargeintField
      FieldName = 'noakunpiutang'
    end
    object QDatasisapiutang: TFloatField
      FieldName = 'sisapiutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanopenjualaninvoice: TLargeintField
      FieldName = 'nopenjualaninvoice'
      ReadOnly = True
    end
    object QDatakodepenjualaninvoice: TStringField
      FieldName = 'kodepenjualaninvoice'
      ReadOnly = True
      Size = 15
    end
    object QDatatglpenjualaninvoice: TDateField
      FieldName = 'tglpenjualaninvoice'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
