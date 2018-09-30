object Frm_DataBarang: TFrm_DataBarang
  Left = 481
  Top = 25
  Width = 608
  Height = 691
  BorderIcons = [biSystemMenu]
  Caption = 'Data Barang'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 592
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
    ParentFont = False
    TabOrder = 0
    object BtnGudang: TRzToolButton
      Left = 436
      Top = 0
      Width = 78
      ImageIndex = 6
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alRight
      Caption = 'Gudang'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnGudangClick
    end
    object BtnUpdate: TRzToolButton
      Left = 514
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
    object ATipe1: TRzLabel
      Left = 339
      Top = 2
      Width = 36
      Height = 15
      Caption = 'ATipe1'
      Visible = False
    end
    object LGudang: TRzLabel
      Left = 288
      Top = 8
      Width = 47
      Height = 15
      Caption = 'LGudang'
      Visible = False
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 611
    Width = 592
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      592
      41)
    object BtnBatal: TRzBitBtn
      Left = 426
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
      TabOrder = 2
      OnClick = BtnBatalClick
    end
    object BtnOk: TRzBitBtn
      Left = 506
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
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object BtnBaru: TRzBitBtn
      Left = 16
      Top = 8
      Caption = 'Baru'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnBaruClick
    end
    object BtnUbah: TRzBitBtn
      Left = 96
      Top = 8
      Caption = 'Ubah'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnUbahClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 592
    Height = 586
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object dbgdataDBTableView1: TcxGridDBTableView
      OnDblClick = dbgdataDBTableView1DblClick
      OnKeyDown = dbgdataDBTableView1KeyDown
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
        Width = 109
      end
      object dbgdataDBTableView1namabarang: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'namabarang'
        HeaderAlignmentHorz = taCenter
        Width = 237
      end
      object dbgdataDBTableView1Column2: TcxGridDBColumn
        Caption = 'Tipe'
        DataBinding.FieldName = 'tipe'
        HeaderAlignmentHorz = taCenter
      end
      object dbgdataDBTableView1tersedia: TcxGridDBColumn
        Caption = 'Stok'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object dbgdataDBTableView1Column1: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'kodesatuan'
        HeaderAlignmentHorz = taCenter
        Width = 88
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      
        'SELECT c.*,CONCAT(d.kodesatuan,'#39'('#39',ROUND(c.faktor),'#39')'#39')AS kodesa' +
        'tuan FROM '
      '(SELECT a.*,tersedia DIV faktor AS total FROM'
      
        '(SELECT g.*,IFNULL(SUM(h.masuk)-SUM(h.keluar),0)AS tersedia FROM' +
        ' '
      
        '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,nosatuan' +
        ',hargajual,1 AS faktor,case when tipebarang=0 then '#39'Persediaan'#39' ' +
        'when tipebarang=1 then '#39'Non-Persediaan'#39' else '#39'Service'#39' end as ti' +
        'pe FROM tbl_barang'
      'UNION'
      
        'SELECT a.nobarang,a.kodebarang,a.namabarang,a.nokelompokbarang,b' +
        '.nosatuan,a.hargajual,b.faktor,case when a.tipebarang=0 then '#39'Pe' +
        'rsediaan'#39' when a.tipebarang=1 then '#39'Non-Persediaan'#39' else '#39'Servic' +
        'e'#39' end as tipe FROM'
      
        '(SELECT nobarang,kodebarang,namabarang,nokelompokbarang,hargajua' +
        'l,tipebarang FROM tbl_barang)AS a'
      'LEFT JOIN tbl_barangharga AS b ON b.nobarang=a.nobarang '
      'WHERE nosatuan IS NOT NULL ORDER BY nobarang,faktor)AS g'
      
        'LEFT JOIN tbl_bukubesarbarang AS h ON h.nobarang=g.nobarang GROU' +
        'P BY g.nobarang,g.nosatuan,g.faktor)AS a)AS c '
      'LEFT JOIN tbl_satuan AS d ON d.nosatuan=c.nosatuan'
      'ORDER BY c.namabarang')
    Params = <>
    Left = 56
    Top = 112
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
      Required = True
    end
    object QDatahargajual: TFloatField
      FieldName = 'hargajual'
      ReadOnly = True
    end
    object QDatafaktor: TFloatField
      FieldName = 'faktor'
      ReadOnly = True
    end
    object QDatatipe: TStringField
      FieldName = 'tipe'
      ReadOnly = True
      Size = 14
    end
    object QDatatersedia: TFloatField
      FieldName = 'tersedia'
      ReadOnly = True
    end
    object QDatatotal: TLargeintField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatakodesatuan: TStringField
      FieldName = 'kodesatuan'
      ReadOnly = True
      Size = 67
    end
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
  object Q1: TZQuery
    Connection = DM.con
    Params = <>
    Left = 72
    Top = 192
  end
  object Q2: TZQuery
    Connection = DM.con
    Params = <>
    Left = 72
    Top = 224
  end
end
