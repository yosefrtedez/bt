object Frm_Variabel: TFrm_Variabel
  Left = 401
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Input Faktur Pajak'
  ClientHeight = 166
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Width = 349
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Input Faktur Pajak'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 25
    Width = 349
    Height = 104
    Align = alClient
    Caption = 'Faktur Pajak'
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 8
      Top = 27
      Width = 81
      Height = 15
      Caption = 'Nomor Faktur :'
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 54
      Width = 39
      Height = 15
      Caption = 'Range :'
    end
    object txtkode: TRzEdit
      Left = 104
      Top = 24
      Width = 233
      Height = 23
      FrameVisible = True
      TabOrder = 0
    end
    object txtrange: TRzNumericEdit
      Left = 104
      Top = 51
      Width = 65
      Height = 23
      TabStop = False
      Color = clYellow
      FrameHotTrack = True
      FrameVisible = True
      ReadOnly = True
      ReadOnlyColor = clYellow
      TabOrder = 1
      DisplayFormat = ',0;(,0)'
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 129
    Width = 349
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      349
      37)
    object BtnBatal: TRzBitBtn
      Left = 186
      Top = 6
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
    object BtnOK: TRzBitBtn
      Left = 266
      Top = 6
      Anchors = [akTop, akRight]
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
    end
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 16
    Top = 96
  end
end
