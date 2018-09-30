object Frm_DataAkun: TFrm_DataAkun
  Left = 256
  Top = 52
  Width = 472
  Height = 658
  BorderIcons = [biSystemMenu]
  Caption = 'Data Akun (Perkiraan)'
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
  PixelsPerInch = 96
  TextHeight = 15
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Akun (Perkiraan)'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 578
    Width = 456
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      456
      41)
    object BtnBatal: TRzBitBtn
      Left = 289
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
      Left = 369
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
      Left = 10
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
    object BtnEdit: TRzBitBtn
      Left = 90
      Top = 8
      Caption = 'Edit'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnEditClick
    end
  end
  object dbgdata: TcxGrid
    Left = 0
    Top = 25
    Width = 456
    Height = 553
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
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsdata
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
      object dbgdataDBTableView1kodeakun: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodeakun'
        Width = 165
      end
      object dbgdataDBTableView1namaakun: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namaakun'
        Width = 298
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select c.*,d.namaklasifikasi from'
      '(select a.*,b.namasubklasifikasi from'
      '(select * from tbl_akun where aktif=1)as a'
      
        'left join tbl_subklasifikasi as b on b.nosubklasifikasi=a.nosubk' +
        'lasifikasi and b.noklasifikasi=a.noklasifikasi)as c'
      
        'left join tbl_klasifikasi as d on d.noklasifikasi=c.noklasifikas' +
        'i  order by c.kodeakun')
    Params = <>
    Left = 48
    Top = 104
    object QDatanoakun: TLargeintField
      FieldName = 'noakun'
      ReadOnly = True
    end
    object QDatanoklasifikasi: TLargeintField
      FieldName = 'noklasifikasi'
      Required = True
    end
    object QDatanosubklasifikasi: TLargeintField
      FieldName = 'nosubklasifikasi'
      ReadOnly = True
    end
    object QDatanamaakun: TStringField
      FieldName = 'namaakun'
      ReadOnly = True
      Size = 50
    end
    object QDatakas: TSmallintField
      FieldName = 'kas'
      ReadOnly = True
    end
    object QDataaktif: TSmallintField
      FieldName = 'aktif'
      ReadOnly = True
    end
    object QDatanamasubklasifikasi: TStringField
      FieldName = 'namasubklasifikasi'
      ReadOnly = True
      Size = 50
    end
    object QDatanamaklasifikasi: TStringField
      FieldName = 'namaklasifikasi'
      Size = 50
    end
    object QDatakodeakun: TStringField
      FieldName = 'kodeakun'
      ReadOnly = True
      Size = 10
    end
  end
  object dsdata: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
