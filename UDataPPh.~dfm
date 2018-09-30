object Frm_DataPPh: TFrm_DataPPh
  Left = 644
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Pajak Penghasilan'
  ClientHeight = 636
  ClientWidth = 411
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
    Width = 411
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Pajak Penghasilan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 333
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
    Width = 411
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      411
      41)
    object BtnBatal: TRzBitBtn
      Left = 245
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
      Left = 324
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
    Width = 411
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
        DataBinding.FieldName = 'kodepph'
      end
      object dbgdataDBTableView1namagudang: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namapph'
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'select 0 as nopph,'#39'-'#39' as kodepph,'#39'-'#39' as namapph,0 as persen,0 as' +
        ' akunpph'
      'union'
      
        'select nopph,kodepph,namapph,persen,akunpph from tbl_pajakpengha' +
        'silan')
    Params = <>
    Left = 48
    Top = 104
    object QDatanopph: TLargeintField
      FieldName = 'nopph'
      ReadOnly = True
    end
    object QDatakodepph: TStringField
      FieldName = 'kodepph'
      ReadOnly = True
      Size = 15
    end
    object QDatanamapph: TStringField
      FieldName = 'namapph'
      ReadOnly = True
      Size = 50
    end
    object QDatapersen: TFloatField
      FieldName = 'persen'
      ReadOnly = True
    end
    object QDataakunpph: TLargeintField
      FieldName = 'akunpph'
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
