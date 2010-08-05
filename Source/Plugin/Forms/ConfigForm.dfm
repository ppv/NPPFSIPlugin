object FrmConfiguration: TFrmConfiguration
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configuration'
  ClientHeight = 241
  ClientWidth = 544
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
    Width = 544
    Height = 241
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      544
      241)
    object grpFSISettings: TGroupBox
      Left = 8
      Top = 8
      Width = 526
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      Caption = 'FSI'
      TabOrder = 2
      DesignSize = (
        526
        81)
      object lblFSIBinaryPath: TLabel
        Left = 16
        Top = 21
        Width = 59
        Height = 13
        Caption = 'Binary Path:'
      end
      object lblFSIBinaryArgs: TLabel
        Left = 16
        Top = 48
        Width = 56
        Height = 13
        Caption = 'Arguments:'
      end
      object txtFSIBinary: TEdit
        Left = 83
        Top = 18
        Width = 399
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'Fully qualified name of the FSI binary'
      end
      object txtFSIBinaryArgs: TEdit
        Left = 83
        Top = 45
        Width = 399
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TextHint = 'Arguments for the FSI binary'
      end
      object cmdSelectBinary: TButton
        Left = 489
        Top = 16
        Width = 26
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '...'
        TabOrder = 1
        OnClick = cmdSelectBinaryClick
      end
    end
    object grpEditorSettings: TGroupBox
      Left = 8
      Top = 95
      Width = 526
      Height = 105
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Editor'
      TabOrder = 3
      object lblConvertTabsToSpaces: TLabel
        Left = 16
        Top = 24
        Width = 116
        Height = 13
        Caption = 'Convert tabs to spaces:'
      end
      object lblTabLength: TLabel
        Left = 24
        Top = 52
        Width = 58
        Height = 13
        Caption = 'Tab Length:'
      end
      object lblEchoText: TLabel
        Left = 16
        Top = 82
        Width = 139
        Height = 13
        Caption = 'Echo text from NPP in editor:'
      end
      object chkConvertToTabs: TCheckBox
        Left = 144
        Top = 23
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = chkConvertToTabsClick
        OnKeyUp = chkConvertToTabsKeyUp
      end
      object updnTabLength: TUpDown
        Left = 118
        Top = 48
        Width = 17
        Height = 21
        Associate = txtTabLength
        Min = 1
        Max = 20
        Position = 1
        TabOrder = 2
        Thousands = False
      end
      object txtTabLength: TEdit
        Left = 87
        Top = 48
        Width = 31
        Height = 21
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 1
        Text = '1'
      end
      object chkEchoText: TCheckBox
        Left = 167
        Top = 81
        Width = 17
        Height = 17
        TabOrder = 3
        OnClick = chkConvertToTabsClick
        OnKeyUp = chkConvertToTabsKeyUp
      end
    end
    object cmdSave: TButton
      Left = 378
      Top = 207
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = cmdSaveClick
    end
    object cmdCancel: TButton
      Left = 459
      Top = 207
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dlgFSIBinarySelect: TOpenDialog
    DefaultExt = 'exe'
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 16
    Top = 200
  end
end
