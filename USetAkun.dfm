object Frm_SetAkun: TFrm_SetAkun
  Left = 557
  Top = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Frm_SetAkun'
  ClientHeight = 176
  ClientWidth = 436
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 135
    Width = 436
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    object BtnSimpan: TRzBitBtn
      Left = 341
      Top = 8
      Caption = 'Lanjutkan'
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
      Left = 256
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Tes'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 25
    Width = 436
    Height = 110
    Align = alClient
    BorderOuter = fsPopup
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 16
      Top = 43
      Width = 50
      Height = 15
      Caption = 'Account :'
    end
    object LNoAkun: TRzLabel
      Left = 152
      Top = 43
      Width = 47
      Height = 15
      Caption = 'LNoAkun'
      Visible = False
    end
    object LJudul1: TRzLabel
      Left = 1
      Top = 1
      Width = 434
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'Ke :'
    end
    object txtke: TRzButtonEdit
      Left = 96
      Top = 40
      Width = 321
      Height = 23
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 0
      OnKeyPress = txtkeKeyPress
      AllowKeyEdit = False
      OnButtonClick = txtkeButtonClick
    end
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 360
    Top = 9
  end
end
