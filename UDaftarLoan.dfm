object Frm_DaftarKasbon: TFrm_DaftarKasbon
  Left = 399
  Top = 118
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Rincian Cash Advance'
  ClientHeight = 495
  ClientWidth = 1010
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
    Width = 1010
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = '           Rincian Cash Advance'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BtnUpdate: TRzToolButton
      Left = 932
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
    object BtnKontak: TRzToolButton
      Left = 0
      Top = 0
      Width = 30
      ImageIndex = 5
      Images = DM.IL16
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnClick = BtnKontakClick
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 454
    Width = 1010
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    DesignSize = (
      1010
      41)
    object BtnSelesai: TRzBitBtn
      Left = 922
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
      TabOrder = 3
      OnClick = BtnSelesaiClick
    end
    object BtnEdit: TRzBitBtn
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
      TabOrder = 0
      OnClick = BtnEditClick
    end
    object BtnApprove: TRzBitBtn
      Left = 177
      Top = 8
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
    object BtnPembayaran: TRzBitBtn
      Left = 824
      Top = 8
      Width = 89
      Anchors = [akTop, akRight]
      Caption = 'Pembayaran'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnPembayaranClick
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
      TabOrder = 4
      OnClick = BtnBaruClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 1010
    Height = 300
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
      PopupMenu = PopupMenu1
      OnDblClick = dbgdataDBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = dbgdataDBTableView1CellClick
      DataController.DataSource = DSData
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '#,#0.##'
          Kind = skSum
          Column = dbgdataDBTableView1sisa
        end>
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
      object dbgdataDBTableView1kodeloan: TcxGridDBColumn
        Caption = 'No. Ref'
        DataBinding.FieldName = 'kodeloan'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object dbgdataDBTableView1tgltransaksi: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object dbgdataDBTableView1Column2: TcxGridDBColumn
        Caption = 'Kontak'
        DataBinding.FieldName = 'namakontak'
        Visible = False
        GroupIndex = 0
        Options.ShowCaption = False
      end
      object dbgdataDBTableView1Column1: TcxGridDBColumn
        Caption = 'Keperluan'
        DataBinding.FieldName = 'keperluan'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object dbgdataDBTableView1total: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object dbgdataDBTableView1bayar: TcxGridDBColumn
        Caption = 'Terbayar'
        DataBinding.FieldName = 'bayar'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object dbgdataDBTableView1sisa: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'sisa'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object dbgdataDBTableView1approve: TcxGridDBColumn
        Caption = 'Approve'
        DataBinding.FieldName = 'approve'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 30
      end
      object dbgdataDBTableView1iscancel: TcxGridDBColumn
        Caption = 'Cancel'
        DataBinding.FieldName = 'iscancel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 30
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object dbgdetail: TcxGrid
    Left = 0
    Top = 325
    Width = 1010
    Height = 129
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object cxGridDBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu2
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridDBTableView1CellClick
      DataController.DataSource = DS_Pembayaran
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glHorizontal
      object cxGridDBTableView1tanggal: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgltransaksi'
        HeaderAlignmentHorz = taCenter
        Width = 139
      end
      object cxGridDBTableView1koderef: TcxGridDBColumn
        Caption = 'Referensi'
        DataBinding.FieldName = 'kodepembayaranloan'
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
      object cxGridDBTableView1jumlah: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'total'
        HeaderAlignmentHorz = taCenter
        Width = 171
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT a.* FROM'
      '(SELECT a.*,b.namakontak FROM'
      
        '(SELECT a.*,IFNULL(SUM(b.total),0)AS bayar,(a.total-IFNULL(SUM(b' +
        '.total),0))AS sisa FROM'
      '(SELECT * FROM tbl_loan)AS a'
      
        'LEFT JOIN tbl_pembayaranloan AS b ON b.noloan=a.noloan GROUP BY ' +
        'a.noloan,a.kodeloan,a.tgltransaksi,a.nokontak,a.namauser,a.nokas' +
        ',a.nokastransit,a.total)AS a'
      
        'LEFT JOIN tbl_kontak AS b ON b.nokontak=a.nokontak ORDER BY a.tg' +
        'ltransaksi)AS a WHERE a.sisa>0')
    Params = <>
    Left = 840
    Top = 56
    object QDatanoloan: TLargeintField
      FieldName = 'noloan'
      ReadOnly = True
    end
    object QDatakodeloan: TStringField
      FieldName = 'kodeloan'
      ReadOnly = True
      Size = 15
    end
    object QDatatgltransaksi: TDateField
      FieldName = 'tgltransaksi'
      ReadOnly = True
      DisplayFormat = 'dd MMM yyyy'
    end
    object QDatanokontak: TLargeintField
      FieldName = 'nokontak'
      ReadOnly = True
    end
    object QDatanamauser: TStringField
      FieldName = 'namauser'
      ReadOnly = True
      Size = 50
    end
    object QDatatotal: TFloatField
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatabayar: TFloatField
      FieldName = 'bayar'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatasisa: TFloatField
      FieldName = 'sisa'
      ReadOnly = True
      DisplayFormat = '#,#0.##'
    end
    object QDatanamakontak: TStringField
      FieldName = 'namakontak'
      Size = 50
    end
    object QDatanoakunca: TLargeintField
      FieldName = 'noakunca'
      ReadOnly = True
    end
    object QDatanokas: TLargeintField
      FieldName = 'nokas'
      ReadOnly = True
    end
    object QDatanokastransit: TLargeintField
      FieldName = 'nokastransit'
      ReadOnly = True
    end
    object QDataapprove: TSmallintField
      FieldName = 'approve'
      ReadOnly = True
    end
    object QDatacair: TSmallintField
      FieldName = 'cair'
      ReadOnly = True
    end
    object QDataiscancel: TSmallintField
      FieldName = 'iscancel'
      ReadOnly = True
    end
    object QDatakeperluan: TStringField
      FieldName = 'keperluan'
      ReadOnly = True
      Size = 255
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
  object QPembayaran: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'SELECT * FROM tbl_pembayaranloan where noloan=:noloan')
    Params = <
      item
        DataType = ftUnknown
        Name = 'noloan'
        ParamType = ptUnknown
      end>
    DataSource = DSData
    Left = 640
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'noloan'
        ParamType = ptUnknown
      end>
    object QPembayarannopembayaranloan: TLargeintField
      FieldName = 'nopembayaranloan'
    end
    object QPembayarannoloan: TLargeintField
      FieldName = 'noloan'
    end
    object QPembayarantgltransaksi: TDateField
      FieldName = 'tgltransaksi'
    end
    object QPembayarantotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '#,#0.##'
    end
    object QPembayarannamauser: TStringField
      FieldName = 'namauser'
      Size = 50
    end
    object QPembayarannokontak: TLargeintField
      FieldName = 'nokontak'
      ReadOnly = True
    end
    object QPembayarannoakunca: TLargeintField
      FieldName = 'noakunca'
      ReadOnly = True
    end
    object QPembayarannokas: TLargeintField
      FieldName = 'nokas'
      ReadOnly = True
    end
  end
  object DS_Pembayaran: TDataSource
    DataSet = QPembayaran
    Left = 644
    Top = 392
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 128
    object Ubah1: TMenuItem
      Caption = 'Ubah'
      OnClick = Ubah1Click
    end
    object Hapus1: TMenuItem
      Caption = 'Hapus'
      OnClick = Hapus1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 336
    Top = 384
    object Hapus2: TMenuItem
      Caption = 'Hapus'
      OnClick = Hapus2Click
    end
  end
end
