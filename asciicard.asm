; **********************************************************************
; Splash loading page
; 1K for holding screen chars for refresh
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
    CPU     0       ; 6502

start = &0400               ; Base of Teletext screen
    ORG     start-2         ; Start 2 bytes earlier so we can inject the load address for the prg file format
    GUARD   start+(25*40)   ; Guard against going over teletext screen size
    EQUW    start           ; Load address 0400 in prg file format

; Each line must be 40 bytes long
    ; A usual thing in teletext, a status line & double height text as a banner
    EQUS 134, "Project Area51                   ",130,"v0.01"
    EQUS 132, 157, 135, 141, "      Teletext ASCII Text Mode      "
    EQUS 132, 157, 135, 141, "      Teletext ASCII Text Mode      "
    EQUS "                                        "
    EQUS "     0 1 2 3 4 5 6 7 8 9 A B C D E F    "
    EQUS " 2x ", &20, &20, &20, &21, &20, &22, &20, &23, &20, &24, &20, &25, &20, &26, &20, &27, &20, &28, &20, &29, &20, &2a, &20, &2b, &20, &2c, &20, &2d, &20, &2e, &20, &2f, "    "
    EQUS " 3x ", &20, &30, &20, &31, &20, &32, &20, &33, &20, &34, &20, &35, &20, &36, &20, &37, &20, &38, &20, &39, &20, &3a, &20, &3b, &20, &3c, &20, &3d, &20, &3e, &20, &3f, "    "
    EQUS " 4x ", &20, &40, &20, &41, &20, &42, &20, &43, &20, &44, &20, &45, &20, &46, &20, &47, &20, &48, &20, &49, &20, &4a, &20, &4b, &20, &4c, &20, &4d, &20, &4e, &20, &4f, "    "
    EQUS " 5x ", &20, &50, &20, &51, &20, &52, &20, &53, &20, &54, &20, &55, &20, &56, &20, &57, &20, &58, &20, &59, &20, &5a, &20, &5b, &20, &5c, &20, &5d, &20, &5e, &20, &5f, "    "
    EQUS " 6x ", &20, &60, &20, &61, &20, &62, &20, &63, &20, &64, &20, &65, &20, &66, &20, &67, &20, &68, &20, &69, &20, &6a, &20, &6b, &20, &6c, &20, &6d, &20, &6e, &20, &6f, "    "
    EQUS " 7x ", &20, &70, &20, &71, &20, &72, &20, &73, &20, &74, &20, &75, &20, &76, &20, &77, &20, &78, &20, &79, &20, &7a, &20, &7b, &20, &7c, &20, &7d, &20, &7e, &20, &7f, "    "
    EQUS " Ax ", &20, &a0, &20, &a1, &20, &a2, &20, &a3, &20, &a4, &20, &a5, &20, &a6, &20, &a7, &20, &a8, &20, &a9, &20, &aa, &20, &ab, &20, &ac, &20, &ad, &20, &ae, &20, &af, "    "
    EQUS " Bx ", &20, &b0, &20, &b1, &20, &b2, &20, &b3, &20, &b4, &20, &b5, &20, &b6, &20, &b7, &20, &b8, &20, &b9, &20, &ba, &20, &bb, &20, &bc, &20, &bd, &20, &be, &20, &bf, "    "
    EQUS " Cx ", &20, &c0, &20, &c1, &20, &c2, &20, &c3, &20, &c4, &20, &c5, &20, &c6, &20, &c7, &20, &c8, &20, &c9, &20, &ca, &20, &cb, &20, &cc, &20, &cd, &20, &ce, &20, &cf, "    "
    EQUS " Dx ", &20, &d0, &20, &d1, &20, &d2, &20, &d3, &20, &d4, &20, &d5, &20, &d6, &20, &d7, &20, &d8, &20, &d9, &20, &da, &20, &db, &20, &dc, &20, &dd, &20, &de, &20, &df, "    "
    EQUS " Ex ", &20, &e0, &20, &e1, &20, &e2, &20, &e3, &20, &e4, &20, &e5, &20, &e6, &20, &e7, &20, &e8, &20, &e9, &20, &ea, &20, &eb, &20, &ec, &20, &ed, &20, &ee, &20, &ef, "    "
    EQUS " Fx ", &20, &f0, &20, &f1, &20, &f2, &20, &f3, &20, &f4, &20, &f5, &20, &f6, &20, &f7, &20, &f8, &20, &f9, &20, &fa, &20, &fb, &20, &fc, &20, &fd, &20, &fe, &20, &ff, "    "
    EQUS " Ax ", 154, &a0, &20, &a1, &20, &a2, &20, &a3, &20, &a4, &20, &a5, &20, &a6, &20, &a7, &20, &a8, &20, &a9, &20, &aa, &20, &ab, &20, &ac, &20, &ad, &20, &ae, &20, &af, "    "
    EQUS " Bx ", 154, &b0, &20, &b1, &20, &b2, &20, &b3, &20, &b4, &20, &b5, &20, &b6, &20, &b7, &20, &b8, &20, &b9, &20, &ba, &20, &bb, &20, &bc, &20, &bd, &20, &be, &20, &bf, "    "
    EQUS " Cx ", 154, &c0, &20, &c1, &20, &c2, &20, &c3, &20, &c4, &20, &c5, &20, &c6, &20, &c7, &20, &c8, &20, &c9, &20, &ca, &20, &cb, &20, &cc, &20, &cd, &20, &ce, &20, &cf, "    "
    EQUS " Dx ", 154, &d0, &20, &d1, &20, &d2, &20, &d3, &20, &d4, &20, &d5, &20, &d6, &20, &d7, &20, &d8, &20, &d9, &20, &da, &20, &db, &20, &dc, &20, &dd, &20, &de, &20, &df, "    "
    EQUS " Ex ", 154, &e0, &20, &e1, &20, &e2, &20, &e3, &20, &e4, &20, &e5, &20, &e6, &20, &e7, &20, &e8, &20, &e9, &20, &ea, &20, &eb, &20, &ec, &20, &ed, &20, &ee, &20, &ef, "    "
    EQUS " Fx ", 154, &f0, &20, &f1, &20, &f2, &20, &f3, &20, &f4, &20, &f5, &20, &f6, &20, &f7, &20, &f8, &20, &f9, &20, &fa, &20, &fb, &20, &fc, &20, &fd, &20, &fe, &20, &ff, "    "
    EQUS "                                        "
    ; Bottom "status" line, used for fast text nav etc.
    ; Here a (C) on bottom left & url on right to test we
    ; show the bottom of the screen correctly
    EQUS "(C) 2021 Peter Mount          Area51.dev"
.end

    SAVE "asciicard.prg", start-2, end
