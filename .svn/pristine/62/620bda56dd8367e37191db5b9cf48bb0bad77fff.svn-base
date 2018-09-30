object Frm_StokOpname: TFrm_StokOpname
  Left = 314
  Top = 88
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Stock Opname'
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Stok Opname'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LGudang: TRzLabel
      Left = 352
      Top = 8
      Width = 47
      Height = 15
      Caption = 'LGudang'
      Visible = False
    end
    object BtnGudang: TRzToolButton
      Left = 832
      Top = 0
      Width = 80
      ImageIndex = 3
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Gudang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnGudangClick
    end
  end
  object RzPanel2: TRzPanel
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
      TabOrder = 4
      OnClick = BtnSelesaiClick
    end
    object BtnCetak: TRzBitBtn
      Left = 744
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
      TabOrder = 3
      OnClick = BtnCetakClick
    end
    object BtnReset: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Reset ='
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnResetClick
    end
    object BtnReset0: TRzBitBtn
      Left = 88
      Top = 8
      Width = 81
      Caption = 'Reset 0'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnReset0Click
    end
    object BtnProses: TRzBitBtn
      Left = 664
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Proses'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnProsesClick
    end
  end
  object dbgbarang: TNextGrid
    Left = 0
    Top = 25
    Width = 912
    Height = 376
    Align = alClient
    GridLinesColor = clSilver
    GridLinesStyle = lsActiveHorzOnly
    HeaderSize = 25
    HeaderStyle = hsOutlook
    InputSize = 26
    RowSize = 25
    TabOrder = 1
    TabStop = True
    OnAfterEdit = dbgbarangAfterEdit
    OnCellDblClick = dbgbarangCellDblClick
    OnKeyPress = dbgbarangKeyPress
    object NxTextColumn1: TNxTextColumn
      Color = clYellow
      DefaultWidth = 150
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Kode Barang'
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 150
    end
    object NxTextColumn2: TNxTextColumn
      Color = clYellow
      DefaultWidth = 360
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Nama Barang'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coPublicUsing, coSearchColumn, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 360
    end
    object NxTextColumn3: TNxTextColumn
      Color = clYellow
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Satuan'
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Width = 100
    end
    object NxNumberColumn1: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Tersedia (Buku)'
      Header.Alignment = taRightJustify
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Width = 100
      EditOptions = [eoAllowFloat, eoAllowSigns]
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn2: TNxNumberColumn
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Tersedia (Fisik)'
      Header.Alignment = taRightJustify
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect, coPublicUsing]
      ParentFont = False
      Position = 4
      SortType = stNumeric
      Width = 100
      EditOptions = [eoAllowFloat, eoAllowSigns]
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
      SpinButtons = False
    end
    object NxNumberColumn3: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Selisih'
      Header.Alignment = taRightJustify
      ParentFont = False
      Position = 5
      SortType = stNumeric
      Width = 100
      EditOptions = [eoAllowFloat, eoAllowSigns]
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
    end
    object nobarang: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Myriad Pro'
      Font.Style = []
      ParentFont = False
      Position = 6
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn4: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'nosatuan'
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn5: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'nilai'
      ParentFont = False
      Position = 8
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object NxNumberColumn6: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Caption = 'noakunpersediaan'
      ParentFont = False
      Position = 9
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select e.*,ifnull(sum(f.masuk)-sum(f.keluar),0) as tersedia from'
      '(select c.*,d.namasatuan from'
      '(select * from tbl_barang where aktif=1) as c'
      'left join tbl_satuan as d on d.nosatuan=c.nosatuan)as e'
      'left join tbl_bukubesarbarang as f on f.nobarang=e.nobarang')
    Params = <>
    Left = 840
    Top = 56
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 688
    Top = 216
  end
end
