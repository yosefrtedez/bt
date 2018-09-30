object Frm_DaftarKirimTerimaBarang: TFrm_DaftarKirimTerimaBarang
  Left = 148
  Top = 134
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Daftar Pengiriman / Penerimaan Antar Gudang'
  ClientHeight = 636
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Transaksi Pengiriman / Penerimaan Antar Gudang'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1133
      Top = 0
      Width = 78
      ImageIndex = 1
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnUpdateClick
    end
    object BtnFilter: TRzToolButton
      Left = 1211
      Top = 0
      Width = 78
      ImageIndex = 2
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Filter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnFilterClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1289
      41)
    object BtnSelesai: TRzBitBtn
      Left = 1201
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Selesai'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnSelesaiClick
    end
    object BtnHapus: TRzBitBtn
      Left = 8
      Top = 8
      Caption = 'Hapus'
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnHapusClick
    end
    object BtnApprove: TRzBitBtn
      Left = 1117
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Approve'
      Color = clGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnApproveClick
    end
    object BtnCetak: TRzBitBtn
      Left = 1033
      Top = 8
      Anchors = [akTop, akRight]
      Caption = 'Cetak'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnCetakClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1289
    Height = 570
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object dbgdataDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = dbgdataDBTableView1CellClick
      OnCellDblClick = dbgdataDBTableView1CellDblClick
      DataController.DataSource = DSData
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tgl. Kirim'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 127
      end
      object dbgdataDBTableView1kodepenyesuaian: TcxGridDBColumn
        Caption = 'No. Pengiriman'
        DataBinding.FieldName = 'kodepenyesuaian'
        HeaderAlignmentHorz = taCenter
        Width = 172
      end
      object dbgdataDBTableView1ket: TcxGridDBColumn
        Caption = 'Dari Gudang'
        DataBinding.FieldName = 'gudangdari'
        HeaderAlignmentHorz = taCenter
        Width = 218
      end
      object dbgdataDBTableView1keterangan: TcxGridDBColumn
        Caption = 'Ke Gudang'
        DataBinding.FieldName = 'gudangke'
        HeaderAlignmentHorz = taCenter
        Width = 324
      end
      object dbgdataDBTableView1kodepenerimaanbarang: TcxGridDBColumn
        Caption = 'No. Penerimaan'
        DataBinding.FieldName = 'kodepenerimaanbarang'
        HeaderAlignmentHorz = taCenter
        Width = 266
      end
      object dbgdataDBTableView1tglpenerimaanbarang: TcxGridDBColumn
        Caption = 'Tgl. Penerimaan'
        DataBinding.FieldName = 'tglpenerimaanbarang'
        HeaderAlignmentHorz = taCenter
        Width = 180
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,ifnull(b.namagudang,'#39'Gudang Utama'#39') as gudangke from'
      
        '(select a.*,ifnull(b.namagudang,'#39'Gudang Utama'#39') as gudangdari fr' +
        'om'
      
        '(select a.*,b.nopenerimaanbarang,b.kodepenerimaanbarang,b.tglpen' +
        'erimaanbarang from'
      
        '(select * from tbl_penyesuaian where tgltransaksi between :tkd a' +
        'nd :tks and tipe = 2)as a'
      
        'left join tbl_penerimaanbarang as b on b.nopengiriman=a.nopenyes' +
        'uaian)as a'
      'left join tbl_gudang as b on b.nogudang=a.nogudangdari)as a'
      
        'left join tbl_gudang as b on b.nogudang=a.nogudangke order by a.' +
        'tgltransaksi')
    Params = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    Left = 840
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tkd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tks'
        ParamType = ptUnknown
      end>
    object QDatanopenyesuaian: TLargeintField
      FieldName = 'nopenyesuaian'
      ReadOnly = True
    end
    object QDatakodepenyesuaian: TStringField
      FieldName = 'kodepenyesuaian'
      ReadOnly = True
      Size = 15
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDataketerangan: TMemoField
      FieldName = 'keterangan'
      BlobType = ftMemo
    end
    object QDatanogudangdari: TLargeintField
      FieldName = 'nogudangdari'
      ReadOnly = True
    end
    object QDatanogudangke: TLargeintField
      FieldName = 'nogudangke'
      ReadOnly = True
    end
    object QDatatipe: TSmallintField
      FieldName = 'tipe'
      ReadOnly = True
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QDatakodepenerimaanbarang: TStringField
      FieldName = 'kodepenerimaanbarang'
      Size = 15
    end
    object QDatatglpenerimaanbarang: TDateField
      FieldName = 'tglpenerimaanbarang'
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatagudangdari: TStringField
      FieldName = 'gudangdari'
      ReadOnly = True
      Size = 50
    end
    object QDatagudangke: TStringField
      FieldName = 'gudangke'
      Size = 50
    end
    object QDatanopenerimaanbarang: TLargeintField
      FieldName = 'nopenerimaanbarang'
      ReadOnly = True
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 844
    Top = 88
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 32
    Top = 128
  end
end
