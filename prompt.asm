; **********************************************************************
; prompt.asm        Handles the prompt line at the top of the page
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
;
; **********************************************************************

; Position on top row of true status pane
statusX = 22

; clearStatus        Clears the status line
;
; on exit:
;   A   undefined
;   X   undefined
;   Y   undefined
{
.L0 EQUB 0
.*clearStatus               ; Clear the status line
    LDX #<L0                ; A simple empty status message, fall through to showStatus
    LDY #>L0
}

; showStatus        Shows status line at top right of screen
;
; on entry:
;   XY  Address of status text, 0 terminated
;
; on exit:
;   A   undefined
;   X   undefined
;   Y   undefined
.showStatus
{
    TXA                         ; Save XY to stack
    PHA
    TYA
    PHA

    LDX #<TX                    ; Move cursor to 21,0 & set white text
    LDY #>TX
    JSR writeString

    PLA                         ; Restore XY from stack & store in tempAddr3
    STA tempAddr3+1             ; remembering it's in reverse order
    PLA
    STA tempAddr3

    JSR L0

    LDX #<TE                    ; Move cursor to 0,1
    LDY #>TE
    JMP writeString

.L0 LDX #40-statusX             ; Max chars to write
    LDY #0
.L1 LDA (tempAddr3),Y           ; Next char
    BEQ L2                      ; End of string

    JSR oswrch                  ; Write char
    INY
    DEX
    BNE L1                      ; Loop until we hit max chars
    RTS

.L2 LDA #' '
.L3 JSR oswrch
    DEX
    BNE L3
    RTS

.TX EQUB 31,21,0,135,0          ; TAB(21,0), WhiteText
.TE EQUB 31,0,1,0               ; TAB(0,1)
}
