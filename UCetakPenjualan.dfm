object Frm_CetakPenjualan: TFrm_CetakPenjualan
  Left = 405
  Top = 263
  BorderStyle = bsSingle
  Caption = 'Cetak'
  ClientHeight = 269
  ClientWidth = 418
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
  object LNoPenjualan: TRzLabel
    Left = 264
    Top = 80
    Width = 76
    Height = 15
    Caption = 'LNoPenjualan'
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Cetak Penjualan'
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 232
    Width = 418
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      418
      37)
    object BtnPreview: TRzBitBtn
      Left = 255
      Top = 6
      Anchors = [akTop, akRight]
      Caption = 'Preview'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnPreviewClick
    end
    object BtnTutup: TRzBitBtn
      Left = 335
      Top = 6
      Anchors = [akTop, akRight]
      Caption = 'Tutup'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnTutupClick
    end
  end
  object cbpreview: TRzListBox
    Left = 0
    Top = 25
    Width = 418
    Height = 207
    Align = alClient
    ItemHeight = 15
    Items.Strings = (
      'Surat Jalan'
      'Nota Invoice')
    TabOrder = 1
    OnDblClick = cbpreviewDblClick
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 368
    Top = 104
  end
end
