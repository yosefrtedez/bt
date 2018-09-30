object Frm_APInvoice: TFrm_APInvoice
  Left = 69
  Top = 38
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Account Payable'
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
    Caption = 'Account Payable'
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
      Height = 57
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 161
        Top = 5
        Width = 52
        Height = 15
        Caption = 'Supplier :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel2: TRzLabel
        Left = 17
        Top = 5
        Width = 67
        Height = 15
        Caption = 'No. Invoice :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel4: TRzLabel
        Left = 473
        Top = 5
        Width = 48
        Height = 15
        Caption = 'Tanggal :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LSupplier: TRzLabel
        Left = 201
        Top = 29
        Width = 51
        Height = 15
        Caption = 'LSupplier'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LID: TRzLabel
        Left = 1036
        Top = 19
        Width = 17
        Height = 15
        Alignment = taRightJustify
        Caption = 'LID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RzLabel18: TRzLabel
        Left = 617
        Top = 5
        Width = 93
        Height = 15
        Caption = 'No. Penerimaan :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LTO: TRzLabel
        Left = 810
        Top = 27
        Width = 19
        Height = 15
        Alignment = taRightJustify
        Caption = 'LTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RzLabel8: TRzLabel
        Left = 809
        Top = 5
        Width = 32
        Height = 15
        Caption = 'Term :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object txtsupplier: TRzButtonEdit
        Left = 161
        Top = 21
        Width = 304
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
        TabOrder = 1
        OnKeyPress = txtsupplierKeyPress
        AllowKeyEdit = False
        OnButtonClick = txtsupplierButtonClick
      end
      object txtreferensi: TRzEdit
        Left = 17
        Top = 21
        Width = 136
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
      object dtpfaktur: TNxDatePicker
        Left = 472
        Top = 21
        Width = 137
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '16/04/2017'
        OnChange = dtpfakturChange
        HideFocus = False
        Date = 42841.000000000000000000
        NoneCaption = 'None'
        TodayCaption = 'Today'
      end
      object txtto: TRzButtonEdit
        Left = 617
        Top = 21
        Width = 184
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
        TabOrder = 3
        AllowKeyEdit = False
        OnButtonClick = txttoButtonClick
      end
      object txtterm: TRzEdit
        Left = 809
        Top = 21
        Width = 136
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
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        1287
        41)
      object BtnRekam: TRzBitBtn
        Left = 1178
        Top = 8
        Anchors = [akRight, akBottom]
        Caption = 'Simpan'
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
        Left = 1098
        Top = 8
        Anchors = [akRight, akBottom]
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
      object BtnPenerimaan: TRzBitBtn
        Left = 16
        Top = 8
        Caption = 'penerimaan'
        TabOrder = 2
        Visible = False
      end
    end
    object RzPanel3: TRzPanel
      Left = 1
      Top = 81
      Width = 1287
      Height = 513
      Align = alClient
      BorderOuter = fsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object RzPanel4: TRzPanel
        Left = 0
        Top = 370
        Width = 1287
        Height = 143
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 0
        DesignSize = (
          1287
          143)
        object LHutang: TRzLabel
          Left = 688
          Top = 46
          Width = 44
          Height = 15
          Caption = 'LHutang'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object RzLabel27: TRzLabel
          Left = 954
          Top = 119
          Width = 27
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Total'
          FocusControl = BtnBatal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel26: TRzLabel
          Left = 1074
          Top = 118
          Width = 3
          Height = 15
          Anchors = [akTop, akRight]
          Caption = ':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel10: TRzLabel
          Left = 954
          Top = 63
          Width = 57
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Biaya Lain'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel11: TRzLabel
          Left = 1074
          Top = 62
          Width = 3
          Height = 15
          Anchors = [akTop, akRight]
          Caption = ':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel13: TRzLabel
          Left = 954
          Top = 35
          Width = 21
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'PPn'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel14: TRzLabel
          Left = 1074
          Top = 34
          Width = 3
          Height = 15
          Anchors = [akTop, akRight]
          Caption = ':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel3: TRzLabel
          Left = 954
          Top = 91
          Width = 21
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'PPh'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel5: TRzLabel
          Left = 1074
          Top = 90
          Width = 3
          Height = 15
          Anchors = [akTop, akRight]
          Caption = ':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel9: TRzLabel
          Left = 954
          Top = 7
          Width = 46
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Subtotal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object RzLabel12: TRzLabel
          Left = 1074
          Top = 6
          Width = 3
          Height = 15
          Anchors = [akTop, akRight]
          Caption = ':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LBiayaLain: TRzLabel
          Left = 696
          Top = 54
          Width = 59
          Height = 15
          Caption = 'LBiayaLain'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object txttotal: TRzNumericEdit
          Left = 1090
          Top = 116
          Width = 161
          Height = 24
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
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
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtbiaya: TRzNumericEdit
          Left = 1090
          Top = 60
          Width = 161
          Height = 24
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FocusColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          ReadOnly = True
          ReadOnlyColor = clYellow
          TabOnEnter = True
          TabOrder = 2
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtpajak: TRzNumericEdit
          Left = 1090
          Top = 32
          Width = 161
          Height = 24
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FocusColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          ReadOnly = True
          ReadOnlyColor = clYellow
          TabOnEnter = True
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtsubtotal: TRzNumericEdit
          Left = 1090
          Top = 4
          Width = 161
          Height = 24
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
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
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtpph: TRzNumericEdit
          Left = 1090
          Top = 88
          Width = 161
          Height = 24
          TabStop = False
          Anchors = [akTop, akRight]
          AutoSize = False
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FocusColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          ReadOnly = True
          ReadOnlyColor = clYellow
          TabOnEnter = True
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtlatecharge: TRzNumericEdit
          Left = 659
          Top = 80
          Width = 50
          Height = 23
          TabStop = False
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOnEnter = True
          TabOrder = 5
          Visible = False
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtearlydiscount: TRzNumericEdit
          Left = 635
          Top = 80
          Width = 50
          Height = 23
          TabStop = False
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOnEnter = True
          TabOrder = 6
          Visible = False
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtduedate: TRzNumericEdit
          Left = 587
          Top = 80
          Width = 50
          Height = 23
          TabStop = False
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOnEnter = True
          TabOrder = 7
          Visible = False
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
        object txtdiskondays: TRzNumericEdit
          Left = 547
          Top = 80
          Width = 50
          Height = 23
          TabStop = False
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOnEnter = True
          TabOrder = 8
          Visible = False
          IntegersOnly = False
          DisplayFormat = '#,#0.##'
        end
      end
      object dbgbarang: TNextGrid6
        Left = 0
        Top = 0
        Width = 1287
        Height = 370
        Align = alClient
        ParentColor = False
        TabOrder = 1
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
          Width = 528
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
        object NxNumberColumn66: TNxNumberColumn6
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
          Header.Caption = 'Harga'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 4
          ParentColor = False
          PlaceholderText = '1742.50'
          Position = 4
          FormatMask = '#,#0.##'
          Increment = 1.000000000000000000
          SpinButtons = False
          InsertString = '0'
        end
        object NxNumberColumn616: TNxNumberColumn6
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
          Header.Caption = 'Disc (%)'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 5
          ParentColor = False
          PlaceholderText = '1742.50'
          Position = 5
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          SpinButtons = False
          InsertString = '0'
        end
        object NxNumberColumn617: TNxNumberColumn6
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
          Header.Caption = 'Disc'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 6
          ParentColor = False
          PlaceholderText = '1742.50'
          Position = 6
          FormatMask = '#,#0.##'
          Increment = 1.000000000000000000
          SpinButtons = False
          InsertString = '0'
        end
        object NxNumberColumn618: TNxNumberColumn6
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
          Header.Caption = 'Subtotal'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 7
          ParentColor = False
          PlaceholderText = '1742.50'
          Position = 7
          FormatMask = '#,#0.##'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxTextColumn65: TNxTextColumn6
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
          Header.Caption = 'PPN'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 8
          ParentColor = False
          PlaceholderText = 'Text Text'
          Position = 8
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
          Index = 9
          PlaceholderText = '1742.50'
          Position = 9
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
          Index = 10
          PlaceholderText = '1742.50'
          Position = 10
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
          Index = 11
          PlaceholderText = '1742.50'
          Position = 11
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn622: TNxNumberColumn6
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
          Header.Caption = 'noakunpersediaan'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 12
          PlaceholderText = '1742.50'
          Position = 12
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn624: TNxNumberColumn6
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
          Header.Caption = 'nopajak'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 13
          PlaceholderText = '1742.50'
          Position = 13
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn625: TNxNumberColumn6
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
          Header.Caption = 'tipe'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 14
          PlaceholderText = '1742.50'
          Position = 14
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn626: TNxNumberColumn6
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
          Header.Caption = 'persen'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 15
          PlaceholderText = '1742.50'
          Position = 15
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn627: TNxNumberColumn6
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
          Header.Caption = 'dpp'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 16
          PlaceholderText = '1742.50'
          Position = 16
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn628: TNxNumberColumn6
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
          Header.Caption = 'ppn'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 17
          PlaceholderText = '1742.50'
          Position = 17
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn629: TNxNumberColumn6
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
          Header.Caption = 'noakunpajakpembelian'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 18
          PlaceholderText = '1742.50'
          Position = 18
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn64: TNxNumberColumn6
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
          Header.Caption = 'tipebarang'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 19
          PlaceholderText = '1742.50'
          Position = 19
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn68: TNxNumberColumn6
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
          Header.Caption = 'noakunbelumtertagih'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 20
          PlaceholderText = '1742.50'
          Position = 20
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxTextColumn61: TNxTextColumn6
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
          Header.Caption = 'PPh'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -13
          Header.Font.Name = 'Calibri'
          Header.Font.Style = []
          Header.ParentFont = False
          Index = 21
          ParentColor = False
          PlaceholderText = 'Text Text'
          Position = 21
        end
        object NxNumberColumn61: TNxNumberColumn6
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
          Header.Caption = 'noakunpajakpembelianblm'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 22
          PlaceholderText = '1742.50'
          Position = 22
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn62: TNxNumberColumn6
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
          Header.Caption = 'nopph'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 23
          PlaceholderText = '1742.50'
          Position = 23
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn63: TNxNumberColumn6
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
          Header.Caption = 'persenpph'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 24
          PlaceholderText = '1742.50'
          Position = 24
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn67: TNxNumberColumn6
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
          Header.Caption = 'noakunpph'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 25
          PlaceholderText = '1742.50'
          Position = 25
          Visible = False
          FormatMask = '#,##0.00'
          Increment = 1.000000000000000000
          InsertString = '0'
        end
        object NxNumberColumn69: TNxNumberColumn6
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
          Header.Caption = 'pph'
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Index = 26
          PlaceholderText = '1742.50'
          Position = 26
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
    Left = 937
    Top = 24
  end
  object QKas: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_akun where kas=1 and aktif=1')
    Params = <>
    Left = 968
    Top = 24
  end
end
