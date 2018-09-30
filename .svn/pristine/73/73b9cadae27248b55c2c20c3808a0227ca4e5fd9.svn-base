object Frm_DataPengirimanGudang: TFrm_DataPengirimanGudang
  Left = 194
  Top = 98
  Width = 444
  Height = 675
  BorderIcons = [biSystemMenu]
  Caption = 'Data Pengiriman Antar Gudang'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Order Pembelian'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 350
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
    Width = 428
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      428
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
    Width = 428
    Height = 570
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
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn
        Caption = 'Referensi'
        DataBinding.FieldName = 'kodepenyesuaian'
        HeaderAlignmentHorz = taCenter
        Width = 160
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 164
      end
      object dbgdataDBTableView1gudang: TcxGridDBColumn
        Caption = 'Dari'
        DataBinding.FieldName = 'gudang'
        HeaderAlignmentHorz = taCenter
        Width = 274
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,ifnull(b.namagudang,'#39'Gudang Utama'#39')as gudang from'
      
        '(SELECT * FROM tbl_penyesuaian WHERE tipe=2 and approve=1 and no' +
        'gudangke=:ng and nopenyesuaian not in (select nopengiriman from ' +
        'tbl_penerimaanbarang))as a'
      
        'left join tbl_gudang as b on b.nogudang=a.nogudangdari order by ' +
        'tgltransaksi,kodepenyesuaian')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ng'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ng'
        ParamType = ptUnknown
      end>
    object QDatanopenyesuaian: TLargeintField
      FieldName = 'nopenyesuaian'
      ReadOnly = True
    end
    object QDatakodepenyesuaian: TStringField
      FieldName = 'kodepenyesuaian'
      ReadOnly = True
      Size = 15
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDataketerangan: TMemoField
      FieldName = 'keterangan'
      BlobType = ftMemo
    end
    object QDatanogudangdari: TLargeintField
      FieldName = 'nogudangdari'
      ReadOnly = True
    end
    object QDatanogudangke: TLargeintField
      FieldName = 'nogudangke'
      ReadOnly = True
    end
    object QDatatipe: TSmallintField
      FieldName = 'tipe'
      ReadOnly = True
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatagudang: TStringField
      FieldName = 'gudang'
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
