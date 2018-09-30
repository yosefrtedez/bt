object FBarang: TFBarang
  Left = 438
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filter Persediaan'
  ClientHeight = 185
  ClientWidth = 432
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
  object Label1: TLabel
    Left = 7
    Top = 35
    Width = 96
    Height = 15
    Caption = 'Kelompok Barang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 113
    Top = 35
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 7
    Top = 62
    Width = 27
    Height = 15
    Caption = 'Jenis'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 113
    Top = 62
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 7
    Top = 89
    Width = 46
    Height = 15
    Caption = 'Supplier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 113
    Top = 89
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 7
    Top = 116
    Width = 23
    Height = 15
    Caption = 'Tipe'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 113
    Top = 116
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 247
    Top = 62
    Width = 40
    Height = 15
    Caption = 'Status :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object LKelompokBarang: TLabel
    Left = 151
    Top = 35
    Width = 98
    Height = 15
    Caption = 'LKelompokBarang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LKontak: TLabel
    Left = 127
    Top = 95
    Width = 43
    Height = 15
    Caption = 'LKontak'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Filter Persediaan'
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
    Top = 147
    Width = 432
    Height = 38
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 8
    VisualStyle = vsClassic
    DesignSize = (
      432
      38)
    object BtnOk: TRzBitBtn
      Left = 347
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
      Left = 267
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
  object txtkelompokbarang: TRzButtonEdit
    Left = 123
    Top = 32
    Width = 206
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 1
    OnKeyPress = txtkelompokbarangKeyPress
    AllowKeyEdit = False
    OnButtonClick = txtkelompokbarangButtonClick
  end
  object txtkontak: TRzButtonEdit
    Left = 123
    Top = 86
    Width = 206
    Height = 23
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 5
    OnKeyPress = txtkontakKeyPress
    AllowKeyEdit = False
    OnButtonClick = txtkontakButtonClick
  end
  object cbjenis: TRzComboBox
    Left = 123
    Top = 59
    Width = 118
    Height = 23
    Style = csDropDownList
    Ctl3D = False
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 15
    ParentCtl3D = False
    TabOrder = 3
    Items.Strings = (
      'Semua'
      'Di Beli'
      'Di Jual'
      'Di Simpan')
  end
  object cbtipe: TRzComboBox
    Left = 123
    Top = 113
    Width = 118
    Height = 23
    Style = csDropDownList
    Ctl3D = False
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 15
    ParentCtl3D = False
    TabOrder = 7
    Text = 'Semua'
    Items.Strings = (
      'Semua'
      'Non Konsinyasi'
      'Konsinyasi')
    ItemIndex = 0
  end
  object cbstatus: TRzComboBox
    Left = 299
    Top = 59
    Width = 118
    Height = 23
    Style = csDropDownList
    Ctl3D = False
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 15
    ParentCtl3D = False
    TabOrder = 4
    Text = 'Semua'
    Items.Strings = (
      'Semua'
      'Tidak Aktif'
      'Aktif')
    ItemIndex = 0
  end
  object CBKelompokBarang: TRzCheckBox
    Left = 339
    Top = 35
    Width = 78
    Height = 17
    Caption = 'Semua'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 2
    OnClick = CBKelompokBarangClick
  end
  object CBSupplier: TRzCheckBox
    Left = 339
    Top = 89
    Width = 78
    Height = 17
    Caption = 'Semua'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 6
    OnClick = CBSupplierClick
  end
end
