unit Config;

// =============================================================================
// Unit: Config
// Description: Plugin config management.
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

type

  /// <summary>
  /// Stores, retrieves and manages configuration for the plugin.
  /// </summary>
  TConfiguration = class
  private
    _configFile: String;
    _fsiPath: String;
    _fsiArgs: String;
    _convertTabsToSpacesInFSIEditor: Boolean;
    _tabLength: Integer;
    _echoNPPTextInEditor: Boolean;
  private
    procedure initializeConfiguration;
  public
    constructor Create;
    destructor Destroy; override;
  public
    procedure LoadFromConfigFile;
    procedure SaveToConfigFile;
  public
    property ConfigFile: String read _configFile;
    property FSIPath: String read _fsiPath write _fsiPath;
    property FSIArgs: String read _fsiArgs write _fsiArgs;
    property ConvertTabsToSpacesInFSIEditor: Boolean read _convertTabsToSpacesInFSIEditor write _convertTabsToSpacesInFSIEditor;
    property TabLength: Integer read _tabLength write _tabLength;
    property EchoNPPTextInEditor: Boolean read _echoNPPTextInEditor write _echoNPPTextInEditor;
  end;

  /// <summary>
  /// Gets the singleton instance of the config manager.
  /// </summary>
  function Configuration: TConfiguration;

implementation

uses
  // standard units
  SysUtils, IniFiles,
  // NPP interface
  NPP,
  // plugin units
  Constants;

var
  _configuration: TConfiguration;

function Configuration: TConfiguration;
begin
  if (not Assigned(_configuration)) then
    _configuration := TConfiguration.Create;

  Result := _configuration;
end;

{ TConfiguration }

{$REGION 'Constructor & Destructor'}

constructor TConfiguration.Create;
begin
  initializeConfiguration;
  loadFromConfigFile;
end;

destructor TConfiguration.Destroy;
begin
  saveToConfigFile;

  inherited;
end;

{$ENDREGION}

{$REGION 'Public Methods'}

procedure TConfiguration.LoadFromConfigFile;
var
  configINI: TIniFile;
begin
  if FileExists(_configFile) then
  begin
    configINI := TIniFile.Create(_configFile);
    try
      _fsiPath := configINI.ReadString(CONFIG_FSI_SECTION_NAME, CONFIG_FSI_SECTION_BINARY_KEY_NAME, DEFAULT_FSI_BINARY);
      _fsiArgs := configINI.ReadString(CONFIG_FSI_SECTION_NAME, CONFIG_FSI_SECTION_BINARYARGS_KEY_NAME, EmptyStr);
      _convertTabsToSpacesInFSIEditor := configINI.ReadBool(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_SECTION_TABTOSPACES_KEY_NAME, True);
      _tabLength := configINI.ReadInteger(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_SECTION_TABLENGTH_KEY_NAME, DEFAULT_TAB_LENGTH);
      _echoNPPTextInEditor := configINI.ReadBool(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_ECHO_NPP_TEXT_KEY_NAME, True);
    finally
      configINI.Free;
    end;
  end;
end;

procedure TConfiguration.SaveToConfigFile;
var
  configINI: TIniFile;
begin
  configINI := TIniFile.Create(_configFile);
  try
    configINI.WriteString(CONFIG_FSI_SECTION_NAME, CONFIG_FSI_SECTION_BINARY_KEY_NAME, _fsiPath);
    configINI.WriteString(CONFIG_FSI_SECTION_NAME, CONFIG_FSI_SECTION_BINARYARGS_KEY_NAME, _fsiArgs);
    configINI.WriteBool(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_SECTION_TABTOSPACES_KEY_NAME, _convertTabsToSpacesInFSIEditor);
    configINI.WriteInteger(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_SECTION_TABLENGTH_KEY_NAME, _tabLength);
    configINI.WriteBool(CONFIG_FSIEDITOR_SECTION_NAME, CONFIG_FSIEDITOR_ECHO_NPP_TEXT_KEY_NAME, _echoNPPTextInEditor);
  finally
    configINI.Free;
  end;
end;

{$ENDREGION}

{$REGION 'Private methods'}

procedure TConfiguration.initializeConfiguration;
begin
  _configFile := GetPluginConfigDirectory + PathDelim + FSI_PLUGIN_CONFIG_FILE_NAME;
  _fsiPath := DEFAULT_FSI_BINARY;
  _convertTabsToSpacesInFSIEditor := True;
  _tabLength := DEFAULT_TAB_LENGTH;
  _echoNPPTextInEditor := True;
end;

{$ENDREGION}

end.
