object Frm_FilterGudang: TFrm_FilterGudang
  Left = 543
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter'
  ClientHeight = 122
  ClientWidth = 344
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
  object RzLabel6: TRzLabel
    Left = 8
    Top = 39
    Width = 48
    Height = 15
    Caption = 'Gudang :'
  end
  object LGudang: TRzLabel
    Left = 88
    Top = 43
    Width = 47
    Height = 15
    Caption = 'LGudang'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 344
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
    Top = 84
    Width = 344
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 2
    DesignSize = (
      344
      38)
    object BtnOk: TRzBitBtn
      Left = 259
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
      Left = 179
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
  object cbgudang: TRzButtonEdit
    Left = 64
    Top = 36
    Width = 273
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOnEnter = True
    TabOrder = 1
    OnKeyPress = cbgudangKeyPress
    OnButtonClick = cbgudangButtonClick
  end
  object QBarang: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_barang where status=1 order by namabarang')
    Params = <>
    Left = 296
    Top = 8
  end
end
