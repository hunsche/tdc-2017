object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 296
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 63
    Width = 10
    Height = 13
    Caption = 'IP'
  end
  object Label2: TLabel
    Left = 8
    Top = 111
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label3: TLabel
    Left = 8
    Top = 207
    Width = 37
    Height = 13
    Caption = 'Amount'
  end
  object Label4: TLabel
    Left = 152
    Top = 207
    Width = 72
    Height = 13
    Caption = 'Content length'
  end
  object Label5: TLabel
    Left = 152
    Top = 19
    Width = 90
    Height = 25
    Caption = 'TDC 2017'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 152
    Top = 63
    Width = 39
    Height = 13
    Caption = 'Content'
  end
  object Edit1: TEdit
    Left = 8
    Top = 82
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 130
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 157
    Width = 97
    Height = 17
    Caption = 'Gzip'
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 8
    Top = 226
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 152
    Top = 226
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 152
    Top = 82
    Width = 254
    Height = 119
    TabOrder = 5
  end
  object Button1: TButton
    Left = 8
    Top = 253
    Width = 398
    Height = 40
    Caption = 'Test'
    TabOrder = 6
    OnClick = Button1Click
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 180
    Width = 97
    Height = 17
    Caption = 'Etags'
    TabOrder = 7
  end
  object RadioButton1: TRadioButton
    Left = 309
    Top = 207
    Width = 84
    Height = 17
    Caption = 'Peoples'
    Checked = True
    TabOrder = 8
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 309
    Top = 230
    Width = 84
    Height = 17
    Caption = 'Dogs'
    TabOrder = 9
  end
  object RESTClient1: TRESTClient
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 256
    Top = 106
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 200
    Top = 130
  end
  object RESTResponse1: TRESTResponse
    Left = 312
    Top = 138
  end
end
