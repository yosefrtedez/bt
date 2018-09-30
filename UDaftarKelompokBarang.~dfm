object Frm_DaftarKelompokBarang: TFrm_DaftarKelompokBarang
  Left = 195
  Top = 127
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Kelompok Barang'
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 912
    Height = 376
    Align = alClient
    BorderOuter = fsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsCustom
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object dbgdata: TcxGrid
      Left = 0
      Top = 0
      Width = 912
      Height = 376
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
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glHorizontal
        object dbgdataDBTableView1kelompokbarang: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'kelompokbarang'
        end
      end
      object dbgdataLevel1: TcxGridLevel
        GridView = dbgdataDBTableView1
      end
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 401
    Width = 912
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      912
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
      Left = 824
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Daftar Kelompok Barang'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 834
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
      'select * from tbl_kelompokbarang order by kelompokbarang'
      '')
    Params = <>
    Left = 488
    Top = 4
  end
end
