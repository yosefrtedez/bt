object Frm_DaftarBarang1: TFrm_DaftarBarang1
  Left = 397
  Top = 246
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Data Barang'
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
    Caption = 'Data Barang'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 1211
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
  end
  object PnBarang: TRzPanel
    Left = 0
    Top = 25
    Width = 1289
    Height = 570
    Align = alClient
    BorderOuter = fsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsCustom
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object dbgdata: TcxGrid
      Left = 0
      Top = 0
      Width = 1289
      Height = 570
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Blue'
      object dbgdataDBTableView1: TcxGridDBTableView
        OnDblClick = dbgdataDBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
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
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glHorizontal
        object dbgdataDBTableView1kodebarang: TcxGridDBColumn
          Caption = 'Kode Barang'
          DataBinding.FieldName = 'kodebarang'
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object dbgdataDBTableView1namabarang: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'namabarang'
          HeaderAlignmentHorz = taCenter
          Width = 322
        end
        object dbgdataDBTableView1kelompokbarang: TcxGridDBColumn
          Caption = 'Kelompok Barang'
          DataBinding.FieldName = 'kelompokbarang'
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
        object dbgdataDBTableView1Column1: TcxGridDBColumn
          Caption = 'Tipe'
          DataBinding.FieldName = 'tipe'
          HeaderAlignmentHorz = taCenter
          Width = 122
        end
        object dbgdataDBTableView1tersedia: TcxGridDBColumn
          Caption = 'Tersedia'
          DataBinding.FieldName = 'total'
          HeaderAlignmentHorz = taCenter
          Width = 97
        end
        object dbgdataDBTableView1kodesatuan: TcxGridDBColumn
          Caption = 'Unit'
          DataBinding.FieldName = 'kodesatuan'
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object dbgdataDBTableView1hargajual: TcxGridDBColumn
          Caption = 'Harga Jual'
          DataBinding.FieldName = 'hargajual'
          HeaderAlignmentHorz = taCenter
          Width = 98
        end
        object dbgdataDBTableView1Column2: TcxGridDBColumn
          Caption = 'Aktif'
          DataBinding.FieldName = 'aktif'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
        end
      end
      object dbgdataLevel1: TcxGridLevel
        GridView = dbgdataDBTableView1
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
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
      TabOrder = 0
      OnClick = BtnSelesaiClick
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 424
    Top = 264
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT g.*,IFNULL(h.kelompokbarang,'#39#39')AS kelompokbarang FROM '
      
        '(SELECT c.*,CONCAT(d.kodesatuan,'#39'('#39',ROUND(c.faktor),'#39')'#39')AS kodes' +
        'atuan FROM '
      '(SELECT a.*,tersedia DIV faktor AS total FROM'
      
        '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia,IFNU' +
        'LL(h.nogudang,0)AS nogudang FROM '
      
        '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan' +
        ',hargajual,1 AS faktor,case when tipebarang=0 then '#39'Persediaan'#39' ' +
        'when tipebarang=1 then '#39'Non-Persediaan'#39'  end as tipe,aktif FROM ' +
        'tbl_barang'
      'UNION'
      
        'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b' +
        '.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '#39'Pe' +
        'rsediaan'#39' when a.tipebarang=1 then '#39'Non-Persediaan'#39' end as tipe,' +
        'aktif FROM'
      
        '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajua' +
        'l,tipebarang,aktif FROM tbl_barang)AS a'
      'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang '
      'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g'
      
        'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROU' +
        'P BY g.nobarang,h.nogudang,g.nosatuan,g.faktor)AS a)AS c '
      'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan)AS g '
      
        'LEFT JOIN tbl_kelompokbarang AS h ON h.nokelompokbarang=g.nokelo' +
        'mpokbarang'
      'ORDER BY g.namabarang')
    Params = <>
    Left = 384
    Top = 260
    object QDatanobarang: TLargeintField
      FieldName = 'nobarang'
      ReadOnly = True
    end
    object QDatakodebarang: TStringField
      FieldName = 'kodebarang'
      ReadOnly = True
      Size = 15
    end
    object QDatanamabarang: TStringField
      FieldName = 'namabarang'
      ReadOnly = True
      Size = 100
    end
    object QDatanokelompokbarang: TLargeintField
      FieldName = 'nokelompokbarang'
      ReadOnly = True
    end
    object QDatanosatuan: TLargeintField
      FieldName = 'nosatuan'
      ReadOnly = True
    end
    object QDatahargajual: TFloatField
      FieldName = 'hargajual'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatafaktor: TFloatField
      FieldName = 'faktor'
      ReadOnly = True
    end
    object QDatatersedia: TFloatField
      FieldName = 'tersedia'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatatotal: TLargeintField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatakodesatuan: TStringField
      FieldName = 'kodesatuan'
      ReadOnly = True
      Size = 62
    end
    object QDatakelompokbarang: TStringField
      FieldName = 'kelompokbarang'
      ReadOnly = True
      Size = 100
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 14
    end
    object QDataaktif: TSmallintField
      FieldName = 'aktif'
    end
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 176
    Top = 265
  end
end
