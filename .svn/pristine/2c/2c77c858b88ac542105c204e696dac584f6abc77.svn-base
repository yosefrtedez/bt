object Frm_DataPenawaranHarga: TFrm_DataPenawaranHarga
  Left = 701
  Top = 63
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Penawaran Harga'
  ClientHeight = 706
  ClientWidth = 386
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
    Width = 386
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Penawaran Harga'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 308
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
    Top = 665
    Width = 386
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      386
      41)
    object BtnOk: TRzBitBtn
      Left = 306
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
      Left = 226
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
    Width = 386
    Height = 640
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
      object dbgdataDBTableView1tglpenjualanrequest: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tglpenjualanrequest'
      end
      object dbgdataDBTableView1kodepembelianrequest: TcxGridDBColumn
        Caption = 'No. Penawaran'
        DataBinding.FieldName = 'kodepenjualanrequest'
        Width = 101
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taRightJustify
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT * FROM tbl_penjualanrequest WHERE nokontak=:nk and nopenj' +
        'ualanrequest not in (select nopenjualanrequest from tbl_penjuala' +
        'norder) ORDER BY tglpenjualanrequest')
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
    object QDatanopenjualanrequest: TLargeintField
      FieldName = 'nopenjualanrequest'
      ReadOnly = True
    end
    object QDatakodepenjualanrequest: TStringField
      FieldName = 'kodepenjualanrequest'
      ReadOnly = True
      Size = 15
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      Required = True
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatatotaldpp: TFloatField
      FieldName = 'totaldpp'
      ReadOnly = True
    end
    object QDatatotalpajak: TFloatField
      FieldName = 'totalpajak'
      ReadOnly = True
    end
    object QDatatglpenjualanrequest: TDateField
      FieldName = 'tglpenjualanrequest'
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatabiayalain: TFloatField
      FieldName = 'biayalain'
    end
    object QDataketerangan: TMemoField
      FieldName = 'keterangan'
      BlobType = ftMemo
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
