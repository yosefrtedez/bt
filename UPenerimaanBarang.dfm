object Frm_PenerimaanBarang: TFrm_PenerimaanBarang
  Left = 96
  Top = 98
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Penerimaan Barang Antar Gudang'
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
  PixelsPerInch = 96
  TextHeight = 15
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 1289
    Height = 636
    Align = alClient
    Caption = 'Penerimaan Barang Antar Gudang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
    object RzPanel1: TRzPanel
      Left = 1
      Top = 24
      Width = 1287
      Height = 121
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      object RzLabel2: TRzLabel
        Left = 9
        Top = 8
        Width = 19
        Height = 15
        Caption = 'Ref.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel4: TRzLabel
        Left = 9
        Top = 36
        Width = 42
        Height = 15
        Caption = 'Tanggal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel5: TRzLabel
        Left = 9
        Top = 62
        Width = 62
        Height = 15
        Caption = 'Keterangan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = 97
        Top = 8
        Width = 3
        Height = 15
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel3: TRzLabel
        Left = 97
        Top = 36
        Width = 3
        Height = 15
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel17: TRzLabel
        Left = 97
        Top = 62
        Width = 3
        Height = 15
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LID: TRzLabel
        Left = 465
        Top = 32
        Width = 17
        Height = 15
        Caption = 'LID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RzLabel6: TRzLabel
        Left = 9
        Top = 89
        Width = 84
        Height = 15
        Caption = 'No. Pengiriman'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 97
        Top = 89
        Width = 3
        Height = 15
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 289
        Top = 89
        Width = 30
        Height = 15
        Caption = 'Dari :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LGudangDari: TRzLabel
        Left = 785
        Top = 40
        Width = 71
        Height = 15
        Caption = 'LGudangDari'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LPengiriman: TRzLabel
        Left = 665
        Top = 40
        Width = 68
        Height = 15
        Caption = 'LPengiriman'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LGudangKe: TRzLabel
        Left = 785
        Top = 56
        Width = 60
        Height = 15
        Caption = 'LGudangKe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object txtref: TRzEdit
        Left = 105
        Top = 5
        Width = 176
        Height = 23
        TabStop = False
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 0
      end
      object txtketerangan: TRzEdit
        Left = 105
        Top = 59
        Width = 392
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOnEnter = True
        TabOrder = 2
      end
      object txtpengiriman: TRzButtonEdit
        Left = 104
        Top = 86
        Width = 177
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 3
        AllowKeyEdit = False
        OnButtonClick = txtpengirimanButtonClick
      end
      object dtptanggal: TNxDatePicker
        Left = 105
        Top = 32
        Width = 176
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '4/16/2017'
        OnChange = dtptanggalChange
        HideFocus = False
        Date = 42841.000000000000000000
        NoneCaption = 'None'
        TodayCaption = 'Today'
      end
      object txtgudangdari: TRzEdit
        Left = 329
        Top = 86
        Width = 168
        Height = 23
        TabStop = False
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 4
      end
    end
    object RzPanel2: TRzPanel
      Left = 1
      Top = 594
      Width = 1287
      Height = 41
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 1
      DesignSize = (
        1287
        41)
      object BtnRekam: TRzBitBtn
        Left = 1202
        Top = 8
        Anchors = [akTop, akRight]
        Caption = 'Rekam'
        Color = 12615680
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnRekamClick
      end
      object BtnBatal: TRzBitBtn
        Left = 1122
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
    object RzPanel3: TRzPanel
      Left = 1
      Top = 145
      Width = 1287
      Height = 449
      Align = alClient
      BorderOuter = fsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object dbgbarang: TNextGrid6
        Left = 0
        Top = 0
        Width = 1287
        Height = 449
        Align = alClient
        ParentColor = False
        TabOrder = 0
        ActiveView = NxReportGridView62
        ActiveViewIndex = 0
        AlternatingRowColor = clBtnFace
        AppearanceOptions = [aoAlternatingRowColors, aoBoldSelectedText, aoHintIndicators, aoStyleColors]
        RowHeight = 25
        ScrollBars = [sbHorizontal, sbVertical]
        Style = stModern
        object NxReportGridView62: TNxReportGridView6
          ColumnMoving = False
          GridLinesStyle = glActiveOnly
          HeaderHeight = 25
          ColorOverflowInactiveCells = False
        end
        object NxTextColumn62: TNxTextColumn6
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Alignment = taCenter
          Header.Caption = 'Kode'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 0
          ParentColor = False
          PlaceholderText = 'Text Text'
          Position = 0
          Width = 100
        end
        object NxTextColumn63: TNxTextColumn6
          AutoSize = True
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Alignment = taCenter
          Header.Caption = 'Nama'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 1
          ParentColor = False
          PlaceholderText = 'Text Text'
          Position = 1
          Width = 1008
        end
        object NxNumberColumn65: TNxNumberColumn6
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Alignment = taCenter
          Header.Caption = 'Qty'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 2
          ParentColor = False
          PlaceholderText = '1742.50'
          Position = 2
          FormatMask = '#,#0.##'
          Increment = 1.000000000000000000
          SpinButtons = False
          InsertString = '0'
        end
        object NxTextColumn64: TNxTextColumn6
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Alignment = taCenter
          Header.Caption = 'Satuan'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 3
          ParentColor = False
          PlaceholderText = 'Text Text'
          Position = 3
        end
        object NxNumberColumn619: TNxNumberColumn6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Caption = 'nobarang'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 4
          PlaceholderText = '1742.50'
          Position = 4
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn620: TNxNumberColumn6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Caption = 'nosatuan'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 5
          PlaceholderText = '1742.50'
          Position = 5
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn621: TNxNumberColumn6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = []
          Footer.FormatMask = '#,##0.00'
          Header.Caption = 'faktor'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 6
          PlaceholderText = '1742.50'
          Position = 6
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
      end
    end
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 49
    Top = 208
  end
end
