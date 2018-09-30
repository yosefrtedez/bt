object Frm_FilterAkun: TFrm_FilterAkun
  Left = 524
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 171
  ClientWidth = 340
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
    Top = 72
    Width = 48
    Height = 15
    Caption = 'Tanggal :'
  end
  object RzLabel3: TRzLabel
    Left = 64
    Top = 48
    Width = 30
    Height = 15
    Caption = 'Dari :'
  end
  object RzLabel4: TRzLabel
    Left = 216
    Top = 48
    Width = 47
    Height = 15
    Caption = 'Sampai :'
  end
  object RzLabel6: TRzLabel
    Left = 8
    Top = 103
    Width = 26
    Height = 15
    Caption = 'Kas :'
  end
  object LAkun: TRzLabel
    Left = 88
    Top = 107
    Width = 32
    Height = 15
    Caption = 'LAkun'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Color = 16744448
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 8
      Width = 39
      Height = 23
      Caption = 'Filter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 133
    Width = 340
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 5
    DesignSize = (
      340
      38)
    object BtnOk: TRzBitBtn
      Left = 255
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
      Left = 175
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
  object dtpdari: TRzDateTimePicker
    Left = 64
    Top = 72
    Width = 113
    Height = 23
    Date = 41614.629225162040000000
    Format = 'dd/MM/yyyy'
    Time = 41614.629225162040000000
    TabOrder = 1
    FrameHotTrack = True
    FrameVisible = True
    ShowToday = True
  end
  object dtpsampai: TRzDateTimePicker
    Left = 216
    Top = 72
    Width = 113
    Height = 23
    Date = 41614.629225162040000000
    Format = 'dd/MM/yyyy'
    Time = 41614.629225162040000000
    TabOrder = 3
    FrameHotTrack = True
    FrameVisible = True
    ShowToday = True
  end
  object BtnSama: TRzButton
    Left = 184
    Top = 72
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
  object cbakun: TRzButtonEdit
    Left = 64
    Top = 100
    Width = 265
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 4
    OnKeyPress = cbakunKeyPress
    AllowKeyEdit = False
    OnButtonClick = cbakunButtonClick
  end
  object QBarang: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_barang where status=1 order by namabarang')
    Params = <>
    Left = 8
    Top = 48
  end
end
