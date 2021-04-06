; **********************************************************************
; Teletext emulator - public entry points
;
;  Copyright 2021 Peter Mount
;
;  Licensed under the Apache License, Version 2.0 (the "License");
;  you may not use this file except in compliance with the License.
;  You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
;  Unless required by applicable law or agreed to in writing, software
;  distributed under the License is distributed on an "AS IS" BASIS,
;  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;  See the License for the specific language governing permissions and
;  limitations under the License.
; **********************************************************************

; teletextInit      Initialise emulator
;
; on exit:
;   A   undefined
;   X   undefined
;   Y   undefined
;
teletextInit = &C000

; osascii           Write A to the screen. CR will start a new line instead of
;                   moving the cursor to the start of the current line.
;
; on entry:
;   A   Character to write
;
; on exit:
;   A   preserved
;   X   preserved
;   Y   preserved
;
osascii = teletextInit + 3

; osnewl            Move cursor to the start of the next line
;
; on exit:
;   A   set to &0D
;   X   preserved
;   Y   preserved
;
osnewl = osascii + 4

; oswrch            Write A to the screen, handling any control sequences
;
; on entry:
;   A   Character to write
;
; on exit:
;   A   preserved
;   X   preserved
;   Y   preserved
;
oswrch = osnewl + 7

; writeString       Write null terminated string at XY.
;                   This routine will terminate at the first null in the string
;                   that is not part of an extended char sequence.
;
;                   e.g. 'hello world',0 is a simple string
;
;                   31, 0, 10, 'hello world', 0 is also valid but the first 0 is
;                   part of the 31,x,y sequence so does not terminate the string.
;
; on entry:
;   XY  Address of string to write
;
; on exit:
;   A   preserved
;   X   preserved
;   Y   preserved
;

writeString = oswrch + 3

; refreshScreen     Refreshes the screen. Used when builk updating textRam
;                   e.g. loading the screen from disk.
;
; on exit:
;   A   undefined
;   X   undefined
;   Y   undefined
;
refreshScreen   = writeString + 3

; The status line is the right half of the top line, usually used for showing
; a filename, page name etc on Viewdata based sites.
;
; clearStatus   Clears the status area
clearStatus     = refreshScreen + 3

; showStatus    Writes a null terminated string in the status area. The text will be left justified
;               and limited to the status area.
showStatus      = clearStatus + 3

; Get cursor position in X,Y
getPos          = showStatus + 3

; Set cursor to position in X,Y
setPos          = getPos + 3
