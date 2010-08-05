unit Scintilla;

// =============================================================================
// Unit: Scintilla
// Description: Scintilla API Interface Unit
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

const
  SCI_GETSELTEXT = 2161;

type
  uptr_t = Longword;
  sptr_t = Longint;

  TNotifyHeader = record
    hwndFrom: Pointer;
    idFrom: Cardinal;
    code: Cardinal;
  end;

  TSCNotification = record
    nmhdr: TNotifyHeader;
    position: Integer;          // SCN_STYLENEEDED, SCN_MODIFIED
    ch: Integer;                // SCN_CHARADDED, SCN_KEY
    modifiers: Integer;         // SCN_KEY
    modificationType: Integer;  // SCN_MODIFIED
    text: PChar;                // SCN_MODIFIED
    length: Integer;            // SCN_MODIFIED
    linesAdded: Integer;        // SCN_MODIFIED
    message: Integer;           // SCN_MACRORECORD
    wParam: uptr_t;             // SCN_MACRORECORD
    lParam: sptr_t;             // SCN_MACRORECORD
    line: Integer;              // SCN_MODIFIED
    foldLevelNow: Integer;      // SCN_MODIFIED
    foldLevelPrev: Integer;     // SCN_MODIFIED
    margin: Integer;            // SCN_MARGINCLICK
    listType: Integer;          // SCN_USERLISTSELECTION
    x: Integer;                 // SCN_DWELLSTART, SCN_DWELLEND
    y: Integer;                 // SCN_DWELLSTART, SCN_DWELLEND
  end;
  PSCNotification = ^TSCNotification;

implementation

end.
