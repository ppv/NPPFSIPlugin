object FrmAbout: TFrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'About FSI Plugin For Notepad++'
  ClientHeight = 138
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 138
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 427
    DesignSize = (
      413
      138)
    object lblAuthorCaption: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 19
      Caption = 'Author:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAuthorName: TLabel
      Left = 75
      Top = 8
      Width = 45
      Height = 19
      Caption = 'Prapin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblVersionCaption: TLabel
      Left = 8
      Top = 33
      Width = 59
      Height = 19
      Caption = 'Version:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblVersionString: TLabel
      Left = 75
      Top = 33
      Width = 51
      Height = 19
      Caption = '1.1.1.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblURLCaption: TLabel
      Left = 8
      Top = 58
      Width = 37
      Height = 19
      Caption = 'Web:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblURL: TLabel
      Left = 75
      Top = 58
      Width = 184
      Height = 19
      Caption = 'http://www.prapinpv.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblURLClick
      OnMouseEnter = lblURLMouseEnter
      OnMouseLeave = lblURLMouseLeave
    end
    object cmdOK: TButton
      Left = 162
      Top = 94
      Width = 89
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
  end
end
