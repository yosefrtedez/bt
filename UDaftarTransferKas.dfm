object Frm_DaftarTransfer: TFrm_DaftarTransfer
  Left = 192
  Top = 125
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Transaksi Transfer Bank / Kas'
  ClientHeight = 636
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 1289
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Transaksi Transfer Bank / Kas'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1133
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
      Left = 1211
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
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    GradientColorStop = 16744448
    TabOrder = 1
    DesignSize = (
      1289
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1201
      Top = 8
      Anchors = [akRight, akBottom]
      Caption = 'Selesai'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtnSelesaiClick
    end
    object BtnHapus: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Batal'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnHapusClick
    end
    object BtnPerincian: TRzBitBtn
      Left = 1122
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
      TabOrder = 3
      OnClick = BtnPerincianClick
    end
    object BtnCetak: TRzBitBtn
      Left = 1042
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Cetak'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnCetakClick
    end
    object BtnApprove: TRzBitBtn
      Left = 959
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Approve'
      Color = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnApproveClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1289
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
      FilterRow.ApplyChanges = fracImmediately
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
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object dbgdataDBTableView1kodepenerimaan: TcxGridDBColumn
        Caption = 'Dari'
        DataBinding.FieldName = 'kasdari'
        HeaderAlignmentHorz = taCenter
        Width = 267
      end
      object dbgdataDBTableView1Column1: TcxGridDBColumn
        Caption = 'Ke'
        DataBinding.FieldName = 'kaske'
        HeaderAlignmentHorz = taCenter
        Width = 436
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'nilai'
        HeaderAlignmentHorz = taCenter
        Width = 160
      end
      object dbgdataDBTableView1approve: TcxGridDBColumn
        Caption = 'Approve'
        DataBinding.FieldName = 'approve'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object dbgdataDBTableView1cair: TcxGridDBColumn
        Caption = 'Cair'
        DataBinding.FieldName = 'cair'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object dbgdataDBTableView1iscancel: TcxGridDBColumn
        Caption = 'Cancel'
        DataBinding.FieldName = 'iscancel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.*,b.namaakun as kaske FROM '
      '(SELECT a.*,b.namaakun as kasdari FROM '
      
        '(SELECT * FROM tbl_transferkas where tgltransaksi between :tkd a' +
        'nd :tks)AS a'
      'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokasdari)as a'
      
        'LEFT JOIN tbl_akun AS b ON b.noakun=a.nokaske ORDER BY a.tgltran' +
        'saksi,a.noreferensi'
      '')
    Params = <
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
    Left = 848
    Top = 120
    ParamData = <
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
    object QDatanoreferensi: TLargeintField
      FieldName = 'noreferensi'
      ReadOnly = True
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDataketerangan: TStringField
      FieldName = 'keterangan'
      ReadOnly = True
      Size = 100
    end
    object QDatanokasdari: TLargeintField
      FieldName = 'nokasdari'
      ReadOnly = True
    end
    object QDatanokastransit: TLargeintField
      FieldName = 'nokastransit'
      ReadOnly = True
    end
    object QDatanokaske: TLargeintField
      FieldName = 'nokaske'
      ReadOnly = True
    end
    object QDatanilai: TFloatField
      FieldName = 'nilai'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDatacair: TSmallintField
      FieldName = 'cair'
      ReadOnly = True
    end
    object QDataiscancel: TSmallintField
      FieldName = 'iscancel'
      ReadOnly = True
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatakasdari: TStringField
      FieldName = 'kasdari'
      ReadOnly = True
      Size = 50
    end
    object QDatakaske: TStringField
      FieldName = 'kaske'
      Size = 50
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 152
  end
end
