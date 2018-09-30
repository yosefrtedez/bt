object Frm_SettingBackup: TFrm_SettingBackup
  Left = 496
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Backup & Restore'
  ClientHeight = 162
  ClientWidth = 410
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
  object RzLabel1: TRzLabel
    Left = 8
    Top = 43
    Width = 119
    Height = 15
    Caption = 'Lokasi Penyimpanan :'
  end
  object RzLabel2: TRzLabel
    Left = 8
    Top = 71
    Width = 93
    Height = 15
    Caption = 'Nama File Arsip :'
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Ingin Membackup Data Anda ?'
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
    Top = 121
    Width = 410
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object BtnKeluar: TRzBitBtn
      Left = 12
      Top = 8
      Width = 125
      Caption = 'Batal Keluar'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnKeluarClick
    end
    object BtnSimpan: TRzBitBtn
      Left = 145
      Top = 8
      Width = 128
      Caption = 'Keluar Tanpa Backup'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnSimpanClick
    end
    object BtnBackup: TRzBitBtn
      Left = 280
      Top = 8
      Width = 121
      Caption = 'Backup Dan Keluar'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnBackupClick
    end
  end
  object txtlokasi: TRzButtonEdit
    Left = 136
    Top = 40
    Width = 270
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 2
    AllowKeyEdit = False
    OnButtonClick = txtlokasiButtonClick
  end
  object txtnama: TRzEdit
    Left = 136
    Top = 68
    Width = 270
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 3
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.sql'
    Filter = 'SQL Script|*.sql'
    InitialDir = 'Desktop'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Title = 'Save As'
    Left = 208
    Top = 8
  end
end
