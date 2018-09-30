object FTanggalCSV: TFTanggalCSV
  Left = 306
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 164
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzLabel2: TRzLabel
    Left = 8
    Top = 56
    Width = 48
    Height = 15
    Caption = 'Tanggal :'
  end
  object RzLabel3: TRzLabel
    Left = 64
    Top = 32
    Width = 30
    Height = 15
    Caption = 'Dari :'
  end
  object RzLabel4: TRzLabel
    Left = 216
    Top = 32
    Width = 47
    Height = 15
    Caption = 'Sampai :'
  end
  object RzLabel1: TRzLabel
    Left = 8
    Top = 83
    Width = 40
    Height = 15
    Caption = 'Status :'
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Filter'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 126
    Width = 342
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 5
    VisualStyle = vsClassic
    DesignSize = (
      342
      38)
    object BtnOk: TRzBitBtn
      Left = 257
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
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnBatal: TRzBitBtn
      Left = 177
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
  object BtnSama: TRzButton
    Left = 184
    Top = 53
    Width = 25
    Height = 24
    Caption = '>'
    Color = 12615680
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = BtnSamaClick
  end
  object dtpdari: TNxDatePicker
    Left = 64
    Top = 53
    Width = 113
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '4/16/2017'
    HideFocus = False
    Date = 42841.000000000000000000
    NoneCaption = 'None'
    TodayCaption = 'Today'
  end
  object dtpsampai: TNxDatePicker
    Left = 216
    Top = 53
    Width = 113
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '4/16/2017'
    HideFocus = False
    Date = 42841.000000000000000000
    NoneCaption = 'None'
    TodayCaption = 'Today'
  end
  object cbstatus: TRzComboBox
    Left = 64
    Top = 80
    Width = 265
    Height = 23
    AllowEdit = False
    Style = csDropDownList
    Ctl3D = False
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 15
    ParentCtl3D = False
    TabOrder = 4
    Text = 'Belum Ada Faktur Pajak'
    Items.Strings = (
      'Belum Ada Faktur Pajak'
      'Sudah Ada Faktur Pajak'
      'Semua')
    ItemIndex = 0
  end
end
