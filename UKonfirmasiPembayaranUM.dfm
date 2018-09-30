object Frm_KonfirmasiPembayaran: TFrm_KonfirmasiPembayaran
  Left = 545
  Top = 333
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Konfirmasi Penjualan Kontan'
  ClientHeight = 195
  ClientWidth = 555
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
    Width = 555
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Konfirmasi Penjualan Kontan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 25
    Width = 555
    Height = 129
    ActivePage = TabSheet1
    ActivePageDefault = TabSheet1
    Align = alClient
    Color = 7915456
    UseColoredTabs = True
    ParentColor = False
    TabOrder = 1
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    FixedDimension = 0
    object TabSheet1: TRzTabSheet
      Color = 7915456
      TabVisible = False
      Caption = 'TabSheet1'
      DesignSize = (
        553
        127)
      object RzLabel1: TRzLabel
        Left = 17
        Top = 30
        Width = 52
        Height = 15
        Caption = 'Customer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel11: TRzLabel
        Left = 89
        Top = 30
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
      object RzLabel2: TRzLabel
        Left = 313
        Top = 30
        Width = 72
        Height = 15
        Caption = 'No. Referensi'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel6: TRzLabel
        Left = 393
        Top = 30
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
      object RzLabel4: TRzLabel
        Left = 313
        Top = 57
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
      object RzLabel7: TRzLabel
        Left = 393
        Top = 57
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
        Left = 313
        Top = 84
        Width = 39
        Height = 15
        Caption = 'Jumlah'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 393
        Top = 84
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
      object RzLabel13: TRzLabel
        Left = 16
        Top = 61
        Width = 26
        Height = 15
        Caption = 'Kas :'
      end
      object LKas: TRzLabel
        Left = 96
        Top = 81
        Width = 25
        Height = 15
        Caption = 'LKas'
        Visible = False
      end
      object txtreferensi: TRzEdit
        Left = 408
        Top = 27
        Width = 132
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
        TabOrder = 2
      end
      object txtsebesar: TRzNumericEdit
        Left = 408
        Top = 81
        Width = 132
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
        IntegersOnly = False
        DisplayFormat = '#,#0'
      end
      object txtkontak: TRzEdit
        Left = 96
        Top = 27
        Width = 209
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
      object cbgiro: TRzCheckBox
        Left = 408
        Top = 4
        Width = 129
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Giro Mundur'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 5
        OnClick = cbgiroClick
      end
      object dtptanggal: TRzEdit
        Left = 408
        Top = 54
        Width = 132
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
        TabOrder = 3
      end
      object txtkas: TRzButtonEdit
        Left = 96
        Top = 54
        Width = 153
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
        OnKeyPress = txtkasKeyPress
        OnButtonClick = txtkasButtonClick
      end
    end
    object TabSheet2: TRzTabSheet
      Color = 7915456
      TabVisible = False
      Caption = 'TabSheet2'
      object RzLabel5: TRzLabel
        Left = 16
        Top = 11
        Width = 70
        Height = 15
        Caption = 'Nomor Giro :'
      end
      object RzLabel10: TRzLabel
        Left = 16
        Top = 39
        Width = 73
        Height = 15
        Caption = 'Jatuh Tempo :'
      end
      object RzLabel9: TRzLabel
        Left = 17
        Top = 67
        Width = 33
        Height = 15
        Caption = 'Bank :'
      end
      object RzLabel12: TRzLabel
        Left = 16
        Top = 93
        Width = 105
        Height = 15
        Caption = 'Akun Piutang Giro :'
      end
      object LAkunGiro: TRzLabel
        Left = 296
        Top = 97
        Width = 56
        Height = 15
        Caption = 'LAkunGiro'
        Visible = False
      end
      object txtnomorgiro: TRzEdit
        Left = 128
        Top = 8
        Width = 401
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 0
      end
      object dtptempo: TNxDatePicker
        Left = 128
        Top = 36
        Width = 153
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '16/04/2017'
        HideFocus = False
        Date = 42841.000000000000000000
        NoneCaption = 'None'
        TodayCaption = 'Today'
      end
      object txtbank: TRzEdit
        Left = 128
        Top = 64
        Width = 321
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 2
      end
      object txtakun: TRzButtonEdit
        Left = 128
        Top = 91
        Width = 153
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 3
        OnKeyPress = txtakunKeyPress
        OnButtonClick = txtakunButtonClick
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 154
    Width = 555
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    object BtnSimpan: TRzBitBtn
      Left = 458
      Top = 8
      Caption = 'Ok'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnSimpanClick
    end
    object BtnBatal: TRzBitBtn
      Left = 376
      Top = 8
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
end
