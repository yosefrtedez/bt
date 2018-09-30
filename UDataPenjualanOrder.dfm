object Frm_DataPenjualanOrder: TFrm_DataPenjualanOrder
  Left = 425
  Top = 42
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Order Penjualan'
  ClientHeight = 749
  ClientWidth = 642
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
    Width = 642
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Order Penjualan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 564
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
  object RzPanel3: TRzPanel
    Left = 0
    Top = 708
    Width = 642
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      642
      41)
    object BtnOk: TRzBitBtn
      Left = 562
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
      Left = 482
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
    Width = 642
    Height = 683
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
        Width = 118
      end
      object dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn
        Caption = 'No. SO'
        DataBinding.FieldName = 'kodepenjualanorder'
        Width = 134
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Customer'
        DataBinding.FieldName = 'namakontak'
        Width = 385
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,ifnull(b.namakontak,'#39#39')as namakontak from'
      
        '(SELECT * FROM tbl_penjualanorder WHERE nokontak=:nk and selesai' +
        '=0 and iscancel=0 and approve=1)as a'
      
        'left join tbl_kontak as b on b.nokontak=a.nokontak ORDER BY a.tg' +
        'ltransaksi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nk'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nk'
        ParamType = ptUnknown
      end>
    object QDatanopenjualanorder: TLargeintField
      FieldName = 'nopenjualanorder'
      ReadOnly = True
    end
    object QDatakodepenjualanorder: TStringField
      FieldName = 'kodepenjualanorder'
      ReadOnly = True
      Size = 15
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatanopenjualanrequest: TLargeintField
      FieldName = 'nopenjualanrequest'
      ReadOnly = True
    end
    object QDatatglkirim: TDateField
      FieldName = 'tglkirim'
      ReadOnly = True
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanosales: TLargeintField
      FieldName = 'nosales'
      ReadOnly = True
    end
    object QDatapocustomer: TStringField
      FieldName = 'pocustomer'
      ReadOnly = True
      Size = 50
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDataselesai: TSmallintField
      FieldName = 'selesai'
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
    object QDatatotaldpp: TFloatField
      FieldName = 'totaldpp'
      ReadOnly = True
    end
    object QDatatotalpajak: TFloatField
      FieldName = 'totalpajak'
      ReadOnly = True
    end
    object QDatabiayalain: TFloatField
      FieldName = 'biayalain'
      ReadOnly = True
    end
    object QDatanoakunbiayalain: TLargeintField
      FieldName = 'noakunbiayalain'
      ReadOnly = True
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      ReadOnly = True
      Size = 50
    end
    object QDatatglapprove: TDateTimeField
      FieldName = 'tglapprove'
      ReadOnly = True
    end
    object QDataiscancel: TSmallintField
      FieldName = 'iscancel'
      ReadOnly = True
    end
    object QDatakodepenjualando: TStringField
      FieldName = 'kodepenjualando'
      ReadOnly = True
      Size = 15
    end
    object QDatatgldo: TDateField
      FieldName = 'tgldo'
      ReadOnly = True
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
