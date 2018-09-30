object Frm_MenuLaporan: TFrm_MenuLaporan
  Left = 259
  Top = 79
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Report'
  ClientHeight = 642
  ClientWidth = 1212
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 15
  object PnMain: TRzPanel
    Left = 473
    Top = 0
    Width = 739
    Height = 642
    Align = alClient
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 0
    object frxPreview1: TfrxPreview
      Left = 0
      Top = 0
      Width = 739
      Height = 642
      Align = alClient
      BackColor = clWhite
      OutlineColor = clMenuBar
      OutlineVisible = False
      OutlineWidth = 120
      ThumbnailVisible = False
      UseReportHints = True
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 642
    Align = alLeft
    BorderOuter = fsNone
    TabOrder = 1
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 137
      Height = 642
      Align = alClient
      Color = clWhite
      ParentColor = False
      TabOrder = 0
      object RzBitBtn1: TRzBitBtn
        Left = 8
        Top = 120
        Width = 113
        Height = 105
        Caption = 'Lap. Penjualan dan Piutang'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = RzBitBtn1Click
        ImageIndex = 36
        Images = DM.I64
        Layout = blGlyphTop
      end
      object RzBitBtn2: TRzBitBtn
        Left = 8
        Top = 232
        Width = 113
        Height = 105
        Caption = 'Lap. Pembelian dan Hutang'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = RzBitBtn2Click
        ImageIndex = 35
        Images = DM.I64
        Layout = blGlyphTop
      end
      object RzBitBtn6: TRzBitBtn
        Left = 8
        Top = 458
        Width = 113
        Height = 103
        Caption = 'Lap. Lainnya'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = RzBitBtn6Click
        ImageIndex = 34
        Images = DM.I64
        Layout = blGlyphTop
      end
      object RzBitBtn4: TRzBitBtn
        Left = 8
        Top = 344
        Width = 113
        Height = 105
        Caption = 'Lap. Barang'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = RzBitBtn4Click
        ImageIndex = 33
        Images = DM.I64
        Layout = blGlyphTop
      end
      object RzBitBtn3: TRzBitBtn
        Left = 8
        Top = 8
        Width = 113
        Height = 105
        Caption = 'Lap. Keuangan'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = RzBitBtn3Click
        ImageIndex = 32
        Images = DM.I64
        Layout = blGlyphTop
      end
    end
  end
  object RzPanel4: TRzPanel
    Left = 137
    Top = 0
    Width = 336
    Height = 642
    Align = alLeft
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 2
    object LJudul: TRzPanel
      Left = 0
      Top = 0
      Width = 336
      Height = 23
      Align = alTop
      BorderOuter = fsNone
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object RzPanel2: TRzPanel
      Left = 0
      Top = 610
      Width = 336
      Height = 32
      Align = alBottom
      BorderOuter = fsNone
      Color = clWindow
      TabOrder = 1
      object cbpreview: TRzCheckBox
        Left = 8
        Top = 8
        Width = 115
        Height = 17
        Caption = 'Preview'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 0
      end
    end
    object PGFinancial: TRzPageControl
      Left = 8
      Top = 31
      Width = 288
      Height = 274
      ActivePage = TabCashBank
      TabIndex = 2
      TabOrder = 2
      TabStyle = tsRoundCorners
      FixedDimension = 21
      object TabFinansial: TRzTabSheet
        Color = clWhite
        Caption = 'Lap. Keuangan'
        object MemoKeuangan: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Laba Rugi'
            'Neraca'
            'Neraca Saldo'
            'Buku Besar')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoKeuanganDblClick
        end
      end
      object TabLedger: TRzTabSheet
        Color = clWhite
        Caption = 'Buku Besar'
        object MemoBukuBesar: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Daftar Akun'
            'Jurnal - Semua Transaksi'
            'Jurnal - Jurnal Umum')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoBukuBesarDblClick
        end
      end
      object TabCashBank: TRzTabSheet
        Color = clWhite
        Caption = 'Kas dan Bank'
        object MemoKas: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Lap. Kas Harian'
            'Lap. Penerimaan Lain'
            'Lap. Pengeluaran Lain')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoKasDblClick
        end
      end
    end
    object PGSales: TRzPageControl
      Left = 16
      Top = 215
      Width = 288
      Height = 274
      ActivePage = TabSales
      TabIndex = 0
      TabOrder = 3
      TabStyle = tsRoundCorners
      FixedDimension = 21
      object TabSales: TRzTabSheet
        Color = clWhite
        Caption = 'Penjualan'
        object MemoPenjualan: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Lap. Penjualan By Faktur'
            'Lap. Penjualan By Invoice'
            'Lap. Penjualan'
            'Lap. Penjualan By Omset'
            'Lap. Penjualan By Customer'
            'Lap. Penjualan By Gudang'
            'Lap. Penjualan By Sales'
            'Lap. Penjualan By Tester'
            'Lap. Penjualan By Product Reguler'
            'Lap. Penjualan By Product Tester')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoPenjualanDblClick
        end
      end
      object TabReceivable: TRzTabSheet
        Color = clWhite
        Caption = 'Piutang Usaha'
        object MemoPiutang: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Lap. Piutang Usaha - Rangkuman'
            'Lap. Piutang Usaha - Rincian'
            'Lap. Pembayaran Piutang Usaha')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoPiutangDblClick
        end
      end
    end
    object PGPurchase: TRzPageControl
      Left = 16
      Top = 271
      Width = 288
      Height = 274
      ActivePage = TabPurchase
      TabIndex = 0
      TabOrder = 4
      TabStyle = tsRoundCorners
      FixedDimension = 21
      object TabPurchase: TRzTabSheet
        Color = clWhite
        Caption = 'Pembelian'
        object MemoPembelian: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Lap. Pembelian By Invoice'
            'Lap. Pembelian By Supplier')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoPembelianDblClick
        end
      end
      object TabPayable: TRzTabSheet
        Color = clWhite
        Caption = 'Hutang Usaha'
        object MemoHutangUsaha: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Hutang Usaha - Rangkuman'
            'Hutang Usaha - Rincian')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoHutangUsahaDblClick
        end
      end
    end
    object PGProduct: TRzPageControl
      Left = 24
      Top = 319
      Width = 288
      Height = 274
      ActivePage = TabInventory
      TabIndex = 0
      TabOrder = 5
      TabStyle = tsRoundCorners
      FixedDimension = 21
      object TabInventory: TRzTabSheet
        Color = clWhite
        Caption = 'Persediaan'
        object MemoPersediaan: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Lap. Stok Barang - Total'
            'Lap. Stok Barang - Rincian'
            'Lap. Stok Barang - Rangkuman')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoPersediaanDblClick
        end
      end
      object TabProductAnalys: TRzTabSheet
        Color = clWhite
        TabVisible = False
        Caption = 'Analisa Barang'
        object MemoAnalisa: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object PGOther: TRzPageControl
      Left = 24
      Top = 359
      Width = 288
      Height = 274
      ActivePage = TabName
      TabIndex = 0
      TabOrder = 6
      TabStyle = tsRoundCorners
      FixedDimension = 21
      object TabName: TRzTabSheet
        Color = clWhite
        Caption = 'Nama dan Alamat'
        object MemoKaryawan: TRzListBox
          Left = 0
          Top = 0
          Width = 284
          Height = 246
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 15
          Items.Strings = (
            'Daftar Customer - Lengkap'
            'Daftar Customer - Sederhana'
            'Daftar Supplier - Lengkap'
            'Daftar Supplier - Sederhana')
          ParentFont = False
          TabOrder = 0
          OnDblClick = MemoKaryawanDblClick
        end
      end
    end
  end
end
