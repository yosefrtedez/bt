object Frm_FilterTglAkun: TFrm_FilterTglAkun
  Left = 826
  Top = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 162
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object RzLabel6: TRzLabel
    Left = 8
    Top = 87
    Width = 33
    Height = 15
    Caption = 'Akun :'
  end
  object LAkun: TRzLabel
    Left = 88
    Top = 91
    Width = 32
    Height = 15
    Caption = 'LAkun'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 337
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
    Top = 124
    Width = 337
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 1
    DesignSize = (
      337
      38)
    object BtnOk: TRzBitBtn
      Left = 252
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
      Left = 172
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
    Top = 56
    Width = 113
    Height = 23
    Date = 41614.629225162040000000
    Format = 'dd/MM/yyyy'
    Time = 41614.629225162040000000
    TabOrder = 2
    FrameHotTrack = True
    FrameVisible = True
    ShowToday = True
  end
  object dtpsampai: TRzDateTimePicker
    Left = 216
    Top = 56
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
    TabOrder = 4
    TabStop = False
    OnClick = BtnSamaClick
  end
  object cbakun: TRzButtonEdit
    Left = 64
    Top = 84
    Width = 265
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 5
    OnButtonClick = cbakunButtonClick
  end
  object QBarang: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_barang where status=1 order by namabarang')
    Params = <>
    Left = 8
    Top = 32
  end
end
