object Frm_DaftarSatuan: TFrm_DaftarSatuan
  Left = 400
  Top = 35
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Data Satuan Pengukuran'
  ClientHeight = 633
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object PnBarang: TRzPanel
    Left = 0
    Top = 25
    Width = 700
    Height = 567
    Align = alClient
    BorderOuter = fsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsCustom
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
    object dbgdata: TcxGrid
      Left = 0
      Top = 0
      Width = 700
      Height = 567
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
        object dbgdataDBTableView1kodesatuan: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'kodesatuan'
          Width = 111
        end
        object dbgdataDBTableView1namasatuan: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'namasatuan'
          Width = 287
        end
      end
      object dbgdataLevel1: TcxGridLevel
        GridView = dbgdataDBTableView1
      end
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 592
    Width = 700
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      700
      41)
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
    object BtnHapus: TRzBitBtn
      Left = 176
      Top = 8
      Caption = 'Hapus'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnHapusClick
    end
    object BtnSelesai: TRzBitBtn
      Left = 609
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Selesai'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnSelesaiClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Satuan Pengukuran'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 2
    object BtnUpdate: TRzToolButton
      Left = 622
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
  object DSData: TDataSource
    DataSet = QData
    Left = 488
    Top = 40
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_satuan'
      '')
    Params = <>
    Left = 488
    Top = 4
  end
end
