object Frm_DataPiutangUsaha: TFrm_DataPiutangUsaha
  Left = 346
  Top = 35
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Piutang Usaha'
  ClientHeight = 627
  ClientWidth = 432
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
    Width = 432
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Piutang Usaha'
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
    Top = 586
    Width = 432
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      432
      41)
    object BtnOk: TRzBitBtn
      Left = 348
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
      Left = 268
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
    Width = 432
    Height = 561
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
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'namakontak'
        Width = 146
      end
      object dbgdataDBTableView1sisahutang: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'sisapiutang'
        HeaderAlignmentHorz = taRightJustify
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
      
        '(SELECT e.nokontak,SUM(e.totalpiutang)AS totalpiutang,(SUM(e.jum' +
        'lahretur)+SUM(e.jumlahbayar))AS jumlahbayar,SUM(e.totalpiutang)-' +
        'SUM(e.jumlahretur)-SUM(e.jumlahbayar) AS sisapiutang FROM '
      
        '(SELECT c.*,IFNULL(SUM((d.jumlahbayar+d.selisih)),0) AS jumlahba' +
        'yar FROM '
      '(SELECT a.*,IFNULL(SUM(b.total),0) AS jumlahretur FROM '
      
        '(SELECT nopenjualaninvoice,nokontak,total AS totalpiutang FROM t' +
        'bl_penjualaninvoice)AS a '
      
        'LEFT JOIN tbl_returpenjualan AS b ON b.nopenjualaninvoice=a.nope' +
        'njualaninvoice GROUP BY a.nopenjualaninvoice)AS c '
      
        'LEFT JOIN (SELECT b.nopenjualaninvoice,b.jumlahbayar,b.selisih F' +
        'ROM '
      '                  (SELECT * FROM tbl_pembayaranpiutang)AS a '
      
        '                  LEFT JOIN tbl_pembayaranpiutangdetail AS b ON ' +
        'b.nopembayaranpiutang=a.nopembayaranpiutang) AS d ON d.nopenjual' +
        'aninvoice=c.nopenjualaninvoice GROUP BY c.nopenjualaninvoice)AS ' +
        'e '
      'GROUP BY e.nokontak)AS f '
      
        'LEFT JOIN tbl_kontak AS g ON g.nokontak=f.nokontak HAVING f.sisa' +
        'piutang>0 ORDER BY g.namakontak')
    Params = <>
    Left = 48
    Top = 104
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatajumlahbayar: TFloatField
      FieldName = 'jumlahbayar'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 100
    end
    object QDatatotalpiutang: TFloatField
      FieldName = 'totalpiutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatasisapiutang: TFloatField
      FieldName = 'sisapiutang'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
