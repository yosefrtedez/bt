object Frm_FilterKontak: TFrm_FilterKontak
  Left = 352
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 155
  ClientWidth = 368
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
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel3: TRzLabel
    Left = 96
    Top = 32
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
  object RzLabel4: TRzLabel
    Left = 248
    Top = 32
    Width = 47
    Height = 15
    Caption = 'Sampai :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object LKontak: TRzLabel
    Left = 104
    Top = 95
    Width = 52
    Height = 15
    Caption = 'Supplier :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 368
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
    Top = 117
    Width = 368
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    DesignSize = (
      368
      38)
    object BtnOk: TRzBitBtn
      Left = 283
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
      Left = 203
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
    Left = 96
    Top = 56
    Width = 113
    Height = 23
    Date = 41614.629225162040000000
    Format = 'dd/MM/yyyy'
    Time = 41614.629225162040000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    FrameHotTrack = True
    FrameVisible = True
    ShowToday = True
  end
  object dtpsampai: TRzDateTimePicker
    Left = 248
    Top = 56
    Width = 113
    Height = 23
    Date = 41614.629225162040000000
    Format = 'dd/MM/yyyy'
    Time = 41614.629225162040000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    FrameHotTrack = True
    FrameVisible = True
    ShowToday = True
  end
  object BtnSama: TRzButton
    Left = 216
    Top = 56
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
  object txtkontak: TRzButtonEdit
    Left = 96
    Top = 84
    Width = 265
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    FrameHotTrack = True
    FrameVisible = True
    ParentFont = False
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 5
    AllowKeyEdit = False
    OnButtonClick = txtkontakButtonClick
  end
  object cbkontak: TRzCheckBox
    Left = 8
    Top = 87
    Width = 81
    Height = 17
    Caption = 'Customer :'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 4
    TabStop = False
    OnClick = cbkontakClick
  end
  object QCustomer: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_customer where status=1 order by namacustomer')
    Params = <>
    Left = 8
    Top = 32
  end
end
