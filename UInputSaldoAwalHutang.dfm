object Frm_InputSaldoAwalHutang: TFrm_InputSaldoAwalHutang
  Left = 456
  Top = 151
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entri Saldo Awal Hutang Usaha'
  ClientHeight = 195
  ClientWidth = 332
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
  object RzLabel1: TRzLabel
    Left = 9
    Top = 33
    Width = 46
    Height = 15
    Caption = 'Supplier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel4: TRzLabel
    Left = 9
    Top = 61
    Width = 68
    Height = 15
    Caption = 'Tgl. Tranaksi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel18: TRzLabel
    Left = 9
    Top = 88
    Width = 47
    Height = 15
    Caption = 'No. Nota'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel2: TRzLabel
    Left = 9
    Top = 116
    Width = 27
    Height = 15
    Caption = 'Nilai'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel6: TRzLabel
    Left = 113
    Top = 33
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel7: TRzLabel
    Left = 113
    Top = 61
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel8: TRzLabel
    Left = 113
    Top = 88
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel9: TRzLabel
    Left = 113
    Top = 116
    Width = 3
    Height = 15
    Caption = ':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object LKontak: TRzLabel
    Left = 129
    Top = 33
    Width = 43
    Height = 15
    Caption = 'LKontak'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LID: TRzLabel
    Left = 297
    Top = 33
    Width = 17
    Height = 15
    Caption = 'LID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BorderOuter = fsNone
    Caption = 'Entri Saldo Awal Hutang Usaha'
    Color = 16744448
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    GradientColorStyle = gcsMSOffice
    ParentFont = False
    TabOrder = 0
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 158
    Width = 332
    Height = 37
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 5
    DesignSize = (
      332
      37)
    object BtSave: TRzBitBtn
      Left = 245
      Top = 7
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
      Left = 165
      Top = 7
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
  object txtpembelian: TRzEdit
    Left = 120
    Top = 85
    Width = 201
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    FrameHotTrack = True
    FrameVisible = True
    ParentFont = False
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 3
  end
  object txtnilai: TRzNumericEdit
    Left = 120
    Top = 113
    Width = 201
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    FrameHotTrack = True
    FrameVisible = True
    ParentFont = False
    TabOnEnter = True
    TabOrder = 4
    IntegersOnly = False
    DisplayFormat = '#,#0.##'
  end
  object dtpfaktur: TRzDateTimeEdit
    Left = 120
    Top = 58
    Width = 201
    Height = 23
    EditType = etDate
    Format = 'dd MMM yyyy'
    Color = clWhite
    FrameHotTrack = True
    FrameVisible = True
    ReadOnlyColor = clYellow
    TabOrder = 2
  end
  object txtkontak: TRzEdit
    Left = 120
    Top = 31
    Width = 201
    Height = 23
    TabStop = False
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    FrameHotTrack = True
    FrameVisible = True
    ParentFont = False
    ReadOnly = True
    ReadOnlyColor = clYellow
    TabOnEnter = True
    TabOrder = 1
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 264
    Top = 8
  end
end
