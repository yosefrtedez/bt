object Frm_DataTO: TFrm_DataTO
  Left = 256
  Top = 139
  BorderStyle = bsSingle
  Caption = 'Data Penerimaan Barang'
  ClientHeight = 636
  ClientWidth = 558
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
    Width = 558
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Penerimaan Barang'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 480
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
    Top = 595
    Width = 558
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      558
      41)
    object BtnOk: TRzBitBtn
      Left = 478
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
      Left = 398
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
    Width = 558
    Height = 570
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
        DataBinding.FieldName = 'tglpembelianterima'
        Width = 118
      end
      object dbgdataDBTableView1kodepembelianorder: TcxGridDBColumn
        Caption = 'No. Penerimaan'
        DataBinding.FieldName = 'kodepembelianterima'
        Width = 134
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Supplier'
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
      
        '(SELECT * FROM tbl_pembelianterima WHERE nokontak=:nk and nopemb' +
        'elianterima not in(select nopembelianterima from tbl_pembelianin' +
        'voice))as a'
      
        'left join tbl_kontak as b on b.nokontak=a.nokontak ORDER BY a.tg' +
        'lpembelianterima,a.kodepembelianterima')
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
    object QDatanopembelianterima: TLargeintField
      FieldName = 'nopembelianterima'
      ReadOnly = True
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatanopembelianorder: TLargeintField
      FieldName = 'nopembelianorder'
      ReadOnly = True
    end
    object QDatakodepembelianterima: TStringField
      FieldName = 'kodepembelianterima'
      ReadOnly = True
      Size = 15
    end
    object QDatatglpembelianterima: TDateField
      FieldName = 'tglpembelianterima'
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
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
