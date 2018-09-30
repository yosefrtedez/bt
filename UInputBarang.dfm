object Frm_InputBarang: TFrm_InputBarang
  Left = 189
  Top = 86
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Data Barang / Persediaan'
  ClientHeight = 416
  ClientWidth = 656
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 379
    Width = 656
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 3
    DesignSize = (
      656
      37)
    object BtSave: TRzBitBtn
      Left = 573
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtSaveClick
    end
    object BtClose: TRzBitBtn
      Left = 493
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
      OnClick = BtCloseClick
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Barang / Persediaan'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      656
      25)
    object cbaktif: TRzCheckBox
      Left = 576
      Top = 3
      Width = 64
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Aktif'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 0
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 169
    Width = 656
    Height = 210
    ActivePage = TabSheet1
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    TabOrientation = toBottom
    TabStyle = tsRoundCorners
    FixedDimension = 21
    object TabSheet1: TRzTabSheet
      Caption = 'Data'
      object Label6: TLabel
        Left = 7
        Top = 97
        Width = 73
        Height = 15
        Caption = 'Stok Minimal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 16
        Width = 89
        Height = 16
        AutoSize = False
        Caption = 'Dalam Stok'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 169
        Top = 16
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
      object Label20: TLabel
        Left = 169
        Top = 97
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
      object Label10: TLabel
        Left = 7
        Top = 124
        Width = 105
        Height = 15
        Caption = 'Harga Beli Terakhir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 7
        Top = 152
        Width = 99
        Height = 15
        Caption = 'Harga Jual Satuan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 169
        Top = 152
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
      object Label26: TLabel
        Left = 169
        Top = 124
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
        Left = 343
        Top = 16
        Width = 110
        Height = 15
        Caption = 'Harga Pokok Satuan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 505
        Top = 16
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
        Top = 43
        Width = 146
        Height = 16
        AutoSize = False
        Caption = 'Telah dipesan ke Supplier'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 169
        Top = 43
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
        Top = 70
        Width = 146
        Height = 16
        AutoSize = False
        Caption = 'Telah dipesan Pelanggan'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 169
        Top = 70
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
      object Label22: TLabel
        Left = 343
        Top = 124
        Width = 98
        Height = 15
        Caption = 'Pajak Pembelian :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 343
        Top = 151
        Width = 96
        Height = 15
        Caption = 'Pajak Penjualan :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object LPajakPembelian: TRzLabel
        Left = 472
        Top = 128
        Width = 94
        Height = 15
        Caption = 'LPajakPembelian'
        Visible = False
      end
      object LPajakPenjualan: TRzLabel
        Left = 456
        Top = 152
        Width = 92
        Height = 15
        Caption = 'LPajakPenjualan'
        Visible = False
      end
      object txtStok: TRzNumericEdit
        Left = 179
        Top = 13
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 0
        DisplayFormat = '#,#0.##'
      end
      object txtMin: TRzNumericEdit
        Left = 179
        Top = 94
        Width = 158
        Height = 23
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txtbeli: TRzNumericEdit
        Left = 179
        Top = 121
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 4
        DisplayFormat = '#,#0.##'
      end
      object txtjual: TRzNumericEdit
        Left = 179
        Top = 149
        Width = 158
        Height = 23
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        TabOnEnter = True
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txthpp: TRzNumericEdit
        Left = 529
        Top = 13
        Width = 110
        Height = 23
        TabStop = False
        Color = clYellow
        FocusColor = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = '#,#0.##'
      end
      object txtpo: TRzNumericEdit
        Left = 179
        Top = 40
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 1
        DisplayFormat = '#,#0.##'
      end
      object txtso: TRzNumericEdit
        Left = 179
        Top = 67
        Width = 158
        Height = 23
        TabStop = False
        Color = clYellow
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        ReadOnlyColor = clYellow
        TabOnEnter = True
        TabOrder = 2
        DisplayFormat = '#,#0.##'
      end
      object txtpajakbeli: TRzButtonEdit
        Left = 443
        Top = 121
        Width = 198
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
        OnKeyPress = txtpajakbeliKeyPress
        AllowKeyEdit = False
        OnButtonClick = txtpajakbeliButtonClick
      end
      object txtpajakjual: TRzButtonEdit
        Left = 443
        Top = 148
        Width = 198
        Height = 23
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 7
        OnKeyPress = txtpajakjualKeyPress
        AllowKeyEdit = False
        OnButtonClick = txtpajakjualButtonClick
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Kode Akun'
      object GBAkun: TRzGroupBox
        Left = 0
        Top = 49
        Width = 654
        Height = 135
        Align = alClient
        Caption = 'Kode Akun'
        TabOrder = 1
        object RzLabel11: TRzLabel
          Left = 8
          Top = 47
          Width = 75
          Height = 15
          Caption = 'Harga Pokok :'
        end
        object RzLabel15: TRzLabel
          Left = 8
          Top = 20
          Width = 68
          Height = 15
          Caption = 'Persediaan :'
        end
        object LAkunHpp: TRzLabel
          Left = 560
          Top = 47
          Width = 54
          Height = 15
          Caption = 'LAkunHpp'
          Visible = False
        end
        object LAkunPersediaan: TRzLabel
          Left = 560
          Top = 20
          Width = 94
          Height = 15
          Caption = 'LAkunPersediaan'
          Visible = False
        end
        object txtakunhpp: TRzButtonEdit
          Left = 160
          Top = 44
          Width = 369
          Height = 23
          FrameHotTrack = True
          FrameVisible = True
          ReadOnlyColor = clYellow
          TabOnEnter = True
          TabOrder = 1
          OnKeyPress = txtakunhppKeyPress
          AllowKeyEdit = False
          OnButtonClick = txtakunhppButtonClick
        end
        object txtakunpersediaan: TRzButtonEdit
          Left = 160
          Top = 17
          Width = 369
          Height = 23
          FrameHotTrack = True
          FrameVisible = True
          ReadOnlyColor = clYellow
          TabOnEnter = True
          TabOrder = 0
          OnKeyPress = txtakunpersediaanKeyPress
          AllowKeyEdit = False
          OnButtonClick = txtakunpersediaanButtonClick
        end
      end
      object RzPanel4: TRzPanel
        Left = 0
        Top = 0
        Width = 654
        Height = 49
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object GBTipe: TRzRadioGroup
          Left = 0
          Top = 0
          Width = 654
          Height = 49
          Align = alClient
          Caption = 'Tipe Barang'
          Columns = 2
          ItemHotTrack = True
          Items.Strings = (
            'Persediaan'
            'Non - Persediaan')
          SpaceEvenly = True
          TabOrder = 0
          OnClick = GBTipeClick
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Satuan Lain'
      object DBGHarga: TNextGrid
        Left = 0
        Top = 0
        Width = 654
        Height = 184
        Align = alClient
        GridLinesColor = clSilver
        GridLinesStyle = lsActiveHorzOnly
        HeaderSize = 25
        HeaderStyle = hsOutlook
        InputSize = 25
        Options = [goGrid, goHeader]
        RowSize = 25
        TabOrder = 0
        TabStop = True
        WantTabs = True
        OnCellClick = DBGHargaCellClick
        OnCellDblClick = DBGHargaCellDblClick
        OnExit = DBGHargaExit
        OnSelectionMove = DBGHargaSelectionMove
        object NxTextColumn1: TNxTextColumn
          Color = clYellow
          DefaultWidth = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Header.Color = clSkyBlue
          Header.Caption = 'Satuan'
          ParentFont = False
          Position = 0
          SortType = stAlphabetic
          Width = 135
        end
        object NxNumberColumn3: TNxNumberColumn
          Alignment = taCenter
          DefaultValue = '0'
          DefaultWidth = 60
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Header.Color = clSkyBlue
          Header.Caption = 'x'
          Header.Alignment = taCenter
          Options = [coCanClick, coCanInput, coCanSort, coEditing, coEditorAutoSelect, coPublicUsing]
          ParentFont = False
          Position = 1
          SortType = stNumeric
          Width = 60
          FormatMask = '#,#0.##'
          Increment = 1.000000000000000000
          Precision = 0
          SpinButtons = False
        end
        object NxImageColumn1: TNxImageColumn
          Alignment = taCenter
          Color = clYellow
          DefaultValue = '0'
          DefaultWidth = 30
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Header.Color = clSkyBlue
          ParentFont = False
          Position = 2
          SortType = stNumeric
          Width = 30
          Images = DM.PicDel
        end
        object NxNumberColumn1: TNxNumberColumn
          DefaultValue = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Header.Caption = 'nosatuan'
          ParentFont = False
          Position = 3
          SortType = stNumeric
          Visible = False
          Increment = 1.000000000000000000
          Precision = 0
        end
      end
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 25
    Width = 656
    Height = 144
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    object LSatuan: TRzLabel
      Left = 409
      Top = 12
      Width = 43
      Height = 15
      Caption = 'LSatuan'
      Visible = False
    end
    object LID: TLabel
      Left = 424
      Top = 44
      Width = 89
      Height = 16
      AutoSize = False
      Caption = 'LID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 7
      Top = 12
      Width = 69
      Height = 15
      Caption = 'Kode Barang'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 169
      Top = 12
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
    object Label12: TLabel
      Left = 169
      Top = 40
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
    object Label23: TLabel
      Left = 473
      Top = 12
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
    object Label13: TLabel
      Left = 351
      Top = 12
      Width = 38
      Height = 15
      Caption = 'Satuan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 7
      Top = 40
      Width = 32
      Height = 15
      Caption = 'Nama'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 7
      Top = 67
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
      Left = 169
      Top = 67
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
    object LKelompokBarang: TRzLabel
      Left = 400
      Top = 72
      Width = 98
      Height = 15
      Caption = 'LKelompokBarang'
      Visible = False
    end
    object Label29: TLabel
      Left = 7
      Top = 94
      Width = 37
      Height = 15
      Caption = 'Field 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 169
      Top = 94
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
    object Label31: TLabel
      Left = 7
      Top = 121
      Width = 37
      Height = 15
      Caption = 'Field 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 169
      Top = 121
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
    object txtkode: TRzEdit
      Left = 179
      Top = 9
      Width = 158
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      ReadOnlyColor = clYellow
      TabOnEnter = True
      TabOrder = 0
    end
    object txtnama: TRzEdit
      Left = 179
      Top = 37
      Width = 462
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 2
    end
    object txtsatuan: TRzButtonEdit
      Left = 483
      Top = 9
      Width = 158
      Height = 23
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 1
      OnKeyPress = txtsatuanKeyPress
      AllowKeyEdit = False
      OnButtonClick = txtsatuanButtonClick
    end
    object txtkelompokbarang: TRzButtonEdit
      Left = 179
      Top = 64
      Width = 158
      Height = 23
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 3
      OnKeyPress = txtkelompokbarangKeyPress
      AllowKeyEdit = False
      OnButtonClick = txtkelompokbarangButtonClick
    end
    object txtfield1: TRzEdit
      Left = 179
      Top = 91
      Width = 462
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 4
    end
    object txtfield2: TRzEdit
      Left = 179
      Top = 118
      Width = 462
      Height = 23
      FocusColor = clInfoBk
      FrameHotTrack = True
      FrameVisible = True
      TabOnEnter = True
      TabOrder = 5
    end
  end
  object QSatuan: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_satuan order by namasatuan')
    Params = <>
    Left = 560
    Top = 34
  end
  object QKategori: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select * from tbl_kategori order by namakategori')
    Params = <>
    Left = 520
    Top = 2
  end
end
