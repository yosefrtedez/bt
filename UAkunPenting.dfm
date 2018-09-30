object Frm_AkunPenting: TFrm_AkunPenting
  Left = 290
  Top = 80
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Akun Default'
  ClientHeight = 442
  ClientWidth = 653
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 37
    Align = alTop
    BorderOuter = fsNone
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object Label22: TLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 19
      Caption = 'Akun Default'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 401
    Width = 653
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      653
      41)
    object BtnSimpan: TRzBitBtn
      Left = 573
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnSimpanClick
    end
    object BtnBatal: TRzBitBtn
      Left = 493
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
  object dbgdata: TNextGrid
    Left = 0
    Top = 37
    Width = 653
    Height = 364
    Align = alClient
    GridLinesColor = clSilver
    GridLinesStyle = lsActiveHorzOnly
    HeaderSize = 25
    HeaderStyle = hsOutlook
    InputSize = 25
    Options = [goGrid, goHeader]
    RowSize = 25
    TabOrder = 2
    TabStop = True
    WantTabs = True
    OnCellDblClick = dbgdataCellDblClick
    OnKeyDown = dbgdataKeyDown
    OnKeyPress = dbgdataKeyPress
    object NxTextColumn1: TNxTextColumn
      Color = clYellow
      DefaultWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Jenis'
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Width = 200
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 451
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      Header.Color = clSkyBlue
      Header.Caption = 'Kode Akun'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coPublicUsing, coShowTextFitHint]
      ParentFont = False
      Position = 1
      SortType = stAlphabetic
      Width = 451
    end
    object NxTextColumn3: TNxTextColumn
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Position = 2
      SortType = stAlphabetic
      Visible = False
    end
    object NxNumberColumn1: TNxNumberColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Position = 3
      SortType = stNumeric
      Visible = False
      Increment = 1.000000000000000000
      Precision = 0
    end
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 248
    Top = 176
  end
end
