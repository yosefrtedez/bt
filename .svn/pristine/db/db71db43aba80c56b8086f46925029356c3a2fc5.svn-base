object Frm_DataKontak: TFrm_DataKontak
  Left = 273
  Top = 42
  BorderStyle = bsSingle
  Caption = 'Data Kontak'
  ClientHeight = 644
  ClientWidth = 513
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
    Top = 0
    Width = 513
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Data Kontak'
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
    Top = 603
    Width = 513
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      513
      41)
    object BtnBatal: TRzBitBtn
      Left = 346
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
      Left = 426
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
    object BtnUbah: TRzBitBtn
      Left = 90
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
    Width = 513
    Height = 578
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
      object dbgdataDBTableView1kodekontak: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'kodekontak'
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object dbgdataDBTableView1namakontak: TcxGridDBColumn
        Caption = 'Nama'
        DataBinding.FieldName = 'namakontak'
        HeaderAlignmentHorz = taCenter
        Width = 284
      end
      object dbgdataDBTableView1Pos: TcxGridDBColumn
        Caption = 'Tipe'
        DataBinding.FieldName = 'Pos'
        HeaderAlignmentHorz = taCenter
        Width = 121
      end
    end
    object dbgdataLevel1: TcxGridLevel
      GridView = dbgdataDBTableView1
    end
  end
  object QData: TZQuery
    Connection = DM.con
    SQL.Strings = (
      'select a.*,b.kodematauang from'
      
        '(select *,case when tipekontak=0 then '#39'Customer'#39' when tipekontak' +
        '=1 then '#39'Supplier'#39' else '#39'Sales'#39' end as Pos from tbl_kontak)as a'
      'left join tbl_matauang as b on b.nomatauang=a.nomatauang')
    Params = <>
    Left = 48
    Top = 104
  end
  object DSData: TDataSource
    DataSet = QData
    Left = 48
    Top = 136
  end
end
