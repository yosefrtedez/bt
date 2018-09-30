object Frm_DataPajak: TFrm_DataPajak
  Left = 286
  Top = 32
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pajak'
  ClientHeight = 636
  ClientWidth = 418
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
    Width = 418
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Pajak'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 340
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
    Width = 418
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      418
      41)
    object BtnBatal: TRzBitBtn
      Left = 252
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
      TabOrder = 2
      OnClick = BtnBatalClick
    end
    object BtnOk: TRzBitBtn
      Left = 331
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
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnBaru: TRzBitBtn
      Left = 16
      Top = 8
      Caption = 'Baru'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnBaruClick
    end
    object BtnUbah: TRzBitBtn
      Left = 96
      Top = 8
      Caption = 'Ubah'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnUbahClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 418
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
      object dbgdataDBTableView1kodegudang: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodepajak'
      end
      object dbgdataDBTableView1namagudang: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namapajak'
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select 0 as nopajak,'#39'-'#39' as kodepajak,'#39'-'#39' as namapajak,0 as perse' +
        'n,0 as tipepajak,0 as akunpajakpembelian,0 as akunpajakpenjualan' +
        ',0 as akunpajakpembelianblm,0 as akunpajakpenjualanblm'
      'union'
      
        'select nopajak,kodepajak,namapajak,persen,tipepajak,akunpajakpem' +
        'belian,akunpajakpenjualan,akunpajakpembelianblm,akunpajakpenjual' +
        'anblm from tbl_pajak')
    Params = <>
    Left = 48
    Top = 104
    object QDatanopajak: TLargeintField
      FieldName = 'nopajak'
      ReadOnly = True
    end
    object QDatakodepajak: TStringField
      FieldName = 'kodepajak'
      ReadOnly = True
      Size = 15
    end
    object QDatanamapajak: TStringField
      FieldName = 'namapajak'
      ReadOnly = True
      Size = 50
    end
    object QDatapersen: TFloatField
      FieldName = 'persen'
      ReadOnly = True
    end
    object QDatatipepajak: TLargeintField
      FieldName = 'tipepajak'
      ReadOnly = True
    end
    object QDataakunpajakpembelian: TLargeintField
      FieldName = 'akunpajakpembelian'
      ReadOnly = True
    end
    object QDataakunpajakpenjualan: TLargeintField
      FieldName = 'akunpajakpenjualan'
    end
    object QDataakunpajakpembelianblm: TLargeintField
      FieldName = 'akunpajakpembelianblm'
      ReadOnly = True
    end
    object QDataakunpajakpenjualanblm: TLargeintField
      FieldName = 'akunpajakpenjualanblm'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
