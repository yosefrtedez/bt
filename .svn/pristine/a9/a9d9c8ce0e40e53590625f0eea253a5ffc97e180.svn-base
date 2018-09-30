object Frm_Disassembly: TFrm_Disassembly
  Left = 192
  Top = 117
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Disassembly'
  ClientHeight = 441
  ClientWidth = 912
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
    Width = 912
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Disassembly'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
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
  object dbgbarang: TNextGrid
    Left = 0
    Top = 25
    Width = 912
    Height = 374
    Align = alClient
    GridLinesStyle = lsActiveHorzOnly
    HeaderSize = 25
    HeaderStyle = hsOutlook
    InputSize = 25
    RowSize = 25
    TabOrder = 1
    TabStop = True
    WantTabs = True
    OnAfterEdit = dbgbarangAfterEdit
    object NxTextColumn1: TNxTextColumn
      Color = clYellow
      DefaultWidth = 166
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Kode Barang'
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 166
    end
    object NxTextColumn2: TNxTextColumn
      Color = clYellow
      DefaultWidth = 344
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Nama'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 344
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
    object NxNumberColumn3: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Jml. Tersedia'
      Header.Alignment = taRightJustify
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Width = 100
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
      SpinButtons = False
    end
    object NxNumberColumn4: TNxNumberColumn
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Jml. Diurai'
      Header.Alignment = taRightJustify
      Options = [coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect, coPublicUsing]
      ParentFont = False
      Position = 4
      SortType = stNumeric
      Width = 100
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
      SpinButtons = False
    end
    object NxNumberColumn5: TNxNumberColumn
      Color = clYellow
      DefaultValue = '0'
      DefaultWidth = 100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Total'
      Header.Alignment = taRightJustify
      ParentFont = False
      Position = 5
      SortType = stNumeric
      Width = 100
      FormatMask = '#,#0.##'
      Increment = 1.000000000000000000
      Precision = 0
      SpinButtons = False
    end
    object nobarang: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Position = 6
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
    object noakun: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Position = 7
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 399
    Width = 912
    Height = 42
    Align = alBottom
    BorderOuter = fsGroove
    TabOrder = 2
    DesignSize = (
      912
      42)
    object BtnProses: TRzBitBtn
      Left = 824
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Proses'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnProsesClick
    end
    object BtnBatal: TRzBitBtn
      Left = 744
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Batal'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnBatalClick
    end
  end
  object QBarang: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT a.*,IFNULL(SUM(b.masuk-b.keluar),0) AS stok,b.nogudang FR' +
        'OM'
      '(SELECT c.*,d.kodesatuan FROM '
      
        '(SELECT * FROM tbl_barang WHERE aktif=1 and disimpan=1 AND nobar' +
        'ang IN (SELECT nobarang FROM tbl_barangrakitan))AS c'
      'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS a'
      
        'LEFT JOIN tbl_bukubesarbarang AS b ON b.nobarang=a.nobarang and ' +
        'b.nogudang=:ng GROUP BY a.nobarang,b.nogudang'
      'ORDER BY a.namabarang')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ng'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ng'
        ParamType = ptUnknown
      end>
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 8
    Top = 72
  end
end
