object formStockAdd: TformStockAdd
  Left = 633
  Top = 312
  BorderIcons = [biSystemMenu]
  Caption = 'Stock Add'
  ClientHeight = 441
  ClientWidth = 624
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object lbl1: TLabel
    Left = 8
    Top = 93
    Width = 43
    Height = 21
    Caption = 'Name'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl11: TLabel
    Left = 8
    Top = 157
    Width = 62
    Height = 21
    Caption = 'Quantity'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescription: TLabel
    Left = 8
    Top = 221
    Width = 84
    Height = 21
    Caption = 'Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image: TLabel
    Left = 416
    Top = 93
    Width = 46
    Height = 21
    Caption = 'Image'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object img1: TImage
    Left = 416
    Top = 137
    Width = 105
    Height = 105
    Proportional = True
    Stretch = True
  end
  object TypeofItem: TLabel
    Left = 8
    Top = 285
    Width = 93
    Height = 21
    Caption = 'Type of Item'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 84
    Align = alTop
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 622
    object lblStockAddName: TLabel
      Left = 192
      Top = 17
      Width = 219
      Height = 32
      Caption = 'Add/Remove Items'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object nome1: TEdit
    Left = 8
    Top = 128
    Width = 177
    Height = 23
    TabOrder = 1
  end
  object nome2: TEdit
    Left = 8
    Top = 192
    Width = 177
    Height = 23
    TabOrder = 2
  end
  object nome3: TEdit
    Left = 8
    Top = 256
    Width = 177
    Height = 23
    TabOrder = 3
  end
  object btnsave: TButton
    Left = 446
    Top = 360
    Width = 75
    Height = 41
    Caption = 'save'
    Font.Charset = ANSI_CHARSET
    Font.Color = clChartreuse
    Font.Height = -12
    Font.Name = 'Small Fonts'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnsaveClick
  end
  object btnSelectImage: TButton
    Left = 416
    Top = 248
    Width = 105
    Height = 35
    Caption = 'Select Image'
    TabOrder = 5
    OnClick = btnSelectImageClick
  end
  object cbbnome5: TComboBox
    Left = 8
    Top = 312
    Width = 177
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Items.Strings = (
      'Ingredients'
      'Drink'
      'Pizza')
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Images|*.jpg;*.jpeg;*.png;*.bmp|All Archives|*.*'
    Left = 520
    Top = 256
  end
end
