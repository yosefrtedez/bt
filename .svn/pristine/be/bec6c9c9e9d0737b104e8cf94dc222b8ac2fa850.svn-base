object Frm_FilterTglBarangGudang: TFrm_FilterTglBarangGudang
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 186
  ClientWidth = 371
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
    Left = 96
    Top = 32
    Width = 30
    Height = 15
    Caption = 'Dari :'
  end
  object RzLabel4: TRzLabel
    Left = 248
    Top = 32
    Width = 47
    Height = 15
    Caption = 'Sampai :'
  end
  object LBarang: TRzLabel
    Left = 120
    Top = 91
    Width = 44
    Height = 15
    Caption = 'LBarang'
    Visible = False
  end
  object LGudang: TRzLabel
    Left = 288
    Top = 112
    Width = 47
    Height = 15
    Caption = 'LGudang'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 371
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
    Top = 148
    Width = 371
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 1
    DesignSize = (
      371
      38)
    object BtnOk: TRzBitBtn
      Left = 286
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
      Left = 206
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
    TabOrder = 2
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
    TabOrder = 4
    TabStop = False
    OnClick = BtnSamaClick
  end
  object txtbarang: TRzButtonEdit
    Left = 96
    Top = 84
    Width = 265
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 5
    OnButtonClick = txtbarangButtonClick
  end
  object cbbarang: TRzCheckBox
    Left = 8
    Top = 87
    Width = 81
    Height = 17
    Caption = 'Barang'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 6
    TabStop = False
    OnClick = cbbarangClick
  end
  object txtgudang: TRzButtonEdit
    Left = 96
    Top = 111
    Width = 265
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 7
    OnButtonClick = txtgudangButtonClick
  end
  object cbgudang: TRzCheckBox
    Left = 8
    Top = 114
    Width = 81
    Height = 17
    Caption = 'Gudang'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 8
    TabStop = False
    OnClick = cbgudangClick
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
