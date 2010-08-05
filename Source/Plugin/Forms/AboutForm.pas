unit AboutForm;

// =============================================================================
// Unit: AboutForm
// Description: Source for the About dialog
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
  // standard units
  Forms, Classes, Controls, ExtCtrls, StdCtrls;

type
  TFrmAbout = class(TForm)
    pnlBase: TPanel;
    lblAuthorCaption: TLabel;
    lblAuthorName: TLabel;
    cmdOK: TButton;
    lblVersionCaption: TLabel;
    lblVersionString: TLabel;
    lblURLCaption: TLabel;
    lblURL: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lblURLMouseEnter(Sender: TObject);
    procedure lblURLMouseLeave(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
  private
    function getBuildNumber: String;
  end;

implementation

uses
  // standard units
  Windows, SysUtils, ShellApi,
  // plugin units
  Constants
  ;

{$R *.dfm}

procedure TFrmAbout.FormShow(Sender: TObject);
begin
  lblAuthorName.Caption := FSI_PLUGIN_AUTHOR;
  lblVersionString.Caption := GetBuildNumber;
  lblURL.Caption := FSI_PLUGIN_URL;
end;

procedure TFrmAbout.lblURLClick(Sender: TObject);
begin
  ShellAPI.ShellExecute(0, 'Open', PChar(lblURL.Caption), Nil, Nil, SW_SHOWNORMAL);
end;

procedure TFrmAbout.lblURLMouseEnter(Sender: TObject);
begin
  lblURL.Cursor := crHandPoint;
end;

procedure TFrmAbout.lblURLMouseLeave(Sender: TObject);
begin
  lblURL.Cursor := crDefault;
end;

{$WARN SYMBOL_PLATFORM OFF}

function TFrmAbout.getBuildNumber: String;
var
  fileVersionInfoSize, dummy, fileInfoLength: Cardinal;
  buffer: PByte;
  fileInfo: PVSFixedFileInfo;
begin
  fileVersionInfoSize := GetFileVersionInfoSize(PChar(FSI_PLUGIN_MODULE_FILENAME), dummy);

  if (fileVersionInfoSize > 0) then
  begin
    buffer := AllocMem(fileVersionInfoSize);
    try
      if (Win32Check(GetFileVersionInfo(PChar(FSI_PLUGIN_MODULE_FILENAME), 0, fileVersionInfoSize, buffer))) then
      begin
        if VerQueryValue(buffer, PChar('\'), Pointer(fileInfo), fileInfoLength) then
        begin
          with fileInfo^ do
          begin
            Result := IntToStr(dwFileVersionMS shr 16);
            Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
            Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
            Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
          end;
        end;
      end;
    finally
      FreeMem(buffer);
    end;
  end;
end;

{$WARN SYMBOL_PLATFORM ON}

end.
