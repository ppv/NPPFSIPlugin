unit ConfigForm;

// =============================================================================
// Unit: ConfigForm
// Description: Source for the UI for configuration management
//
// Copyright 2010 Prapin Peethambaran
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// =============================================================================

interface

uses
  Forms, Classes, Controls, ExtCtrls, StdCtrls, ComCtrls, Dialogs;

type
  TFrmConfiguration = class(TForm)
    pnlBase: TPanel;
    grpFSISettings: TGroupBox;
    grpEditorSettings: TGroupBox;
    cmdSave: TButton;
    cmdCancel: TButton;
    lblFSIBinaryPath: TLabel;
    txtFSIBinary: TEdit;
    lblFSIBinaryArgs: TLabel;
    txtFSIBinaryArgs: TEdit;
    cmdSelectBinary: TButton;
    chkConvertToTabs: TCheckBox;
    lblConvertTabsToSpaces: TLabel;
    lblTabLength: TLabel;
    updnTabLength: TUpDown;
    txtTabLength: TEdit;
    dlgFSIBinarySelect: TOpenDialog;
    lblEchoText: TLabel;
    chkEchoText: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure chkConvertToTabsClick(Sender: TObject);
    procedure chkConvertToTabsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmdSelectBinaryClick(Sender: TObject);
    procedure cmdSaveClick(Sender: TObject);
  private
    procedure initialize;
    procedure doOnConvertToTabsCheckBoxStateChange;
    procedure saveConfiguration;
  end;

implementation

uses
  // standard units
  SysUtils,
  // plugin units
  Config, Constants;

{$R *.dfm}


{ TFrmConfiguration }

procedure TFrmConfiguration.FormShow(Sender: TObject);
begin
  initialize;
  doOnConvertToTabsCheckBoxStateChange;
end;

procedure TFrmConfiguration.chkConvertToTabsClick(Sender: TObject);
begin
  doOnConvertToTabsCheckBoxStateChange;
end;

procedure TFrmConfiguration.chkConvertToTabsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  doOnConvertToTabsCheckBoxStateChange;
end;

procedure TFrmConfiguration.cmdSelectBinaryClick(Sender: TObject);
begin
  if FileExists(txtFSIBinary.Text) then
    dlgFSIBinarySelect.FileName := txtFSIBinary.Text;

  if (dlgFSIBinarySelect.Execute) then
    txtFSIBinary.Text := dlgFSIBinarySelect.FileName;
end;

procedure TFrmConfiguration.cmdSaveClick(Sender: TObject);
begin
  saveConfiguration;
end;

procedure TFrmConfiguration.initialize;
begin
  txtFSIBinary.Text := Configuration.FSIPath;
  txtFSIBinaryArgs.Text := Configuration.FSIArgs;
  chkConvertToTabs.Checked := Configuration.ConvertTabsToSpacesInFSIEditor;
  txtTabLength.Text := IntToStr(Configuration.TabLength);
  chkEchoText.Checked := Configuration.EchoNPPTextInEditor;
end;

procedure TFrmConfiguration.doOnConvertToTabsCheckBoxStateChange;
begin
  txtTabLength.Enabled := chkConvertToTabs.Checked;
  updnTabLength.Enabled := chkConvertToTabs.Checked;
end;

procedure TFrmConfiguration.saveConfiguration;
begin
  Configuration.FSIPath := txtFSIBinary.Text;
  Configuration.FSIArgs := txtFSIBinaryArgs.Text;
  Configuration.ConvertTabsToSpacesInFSIEditor := chkConvertToTabs.Checked;
  if (chkConvertToTabs.Checked) then
    Configuration.TabLength := StrToInt(txtTabLength.Text)
  else
    Configuration.TabLength := DEFAULT_TAB_LENGTH;
  Configuration.EchoNPPTextInEditor := chkEchoText.Checked;

  Configuration.SaveToConfigFile;
end;

end.
