object Frm_SettingDatabase: TFrm_SettingDatabase
  Left = 590
  Top = 290
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Open Database'
  ClientHeight = 154
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzLabel1: TRzLabel
    Left = 11
    Top = 64
    Width = 91
    Height = 15
    Caption = 'Server Nama / IP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object RzLabel2: TRzLabel
    Left = 11
    Top = 91
    Width = 29
    Height = 15
    Caption = 'Port :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 121
    Width = 385
    Height = 33
    Align = alBottom
    BorderOuter = fsNone
    GradientColorStop = clSkyBlue
    TabOrder = 5
    object BtnBatal: TRzBitBtn
      Left = 223
      Top = 5
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
      ImageIndex = 1
    end
    object BtnOK: TRzBitBtn
      Left = 304
      Top = 5
      Caption = 'OK'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnOKClick
      ImageIndex = 0
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Open Database'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cblokal: TRzRadioButton
    Left = 8
    Top = 32
    Width = 115
    Height = 17
    Caption = 'Local Database'
    TabOrder = 1
    TabStop = True
    OnClick = cblokalClick
  end
  object cbserver: TRzRadioButton
    Left = 144
    Top = 32
    Width = 177
    Height = 17
    Caption = 'Server Database'
    TabOrder = 2
    TabStop = True
    OnClick = cbserverClick
  end
  object txthost: TRzEdit
    Left = 120
    Top = 61
    Width = 257
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
  end
  object txtport: TRzNumericEdit
    Left = 120
    Top = 88
    Width = 105
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 4
    DisplayFormat = '#0'
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 336
    Top = 8
  end
end
