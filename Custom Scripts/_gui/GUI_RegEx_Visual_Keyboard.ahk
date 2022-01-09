#Include %A_ScriptDir%\..\_lib
#Include LIB_Main_Method_Library.ahk
#Include LIB_repeatKey().ahk


#NoTrayIcon

Gui, Add, Text, x182 y136 w88 h31 +Center, word character `n[A-Za-z0-9_]
Gui, Add, Text, x486 y19 w125 h44 +Center, Reserved Characters`n+*?^$\.[]{}()|/
Gui, Add, Button, x17 y64 w100 h40 , whitespace char`n\s
Gui, Add, Button, x117 y64 w120 h40 , non-whitespace char`n\S
Gui, Add, Button, x17 y131 w80 h40 , word char`n\w
Gui, Add, Button, x97 y131 w80 h40 , non-word char`n\W
Gui, Add, Button, x417 y54 w120 h40 , char-set`n[ ]
Gui, Add, Button, x17 y195 w80 h40 , digit char`n\d
Gui, Add, Button, x557 y54 w120 h40 , negated-set`n[^ ]
Gui, Add, Button, x97 y195 w80 h40 , non-digit char`n\D
Gui, Add, Button, x272 y9 w130 h50 , match any`n[\s\S]
Gui, Add, Button, x417 y94 w120 h40 , capture-group`n( )
Gui, Add, Button, x557 y94 w120 h40 , non-capturing group`n(?: )
Gui, Add, Button, x417 y154 w120 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x557 y154 w120 h40 , positive lookahead`n(?= )
Gui, Add, Button, x557 y194 w120 h40 , negative lookahead`n(?! )
Gui, Add, Button, x467 y254 w160 h40 , named capturing group`n(?<name> )
Gui, Add, Button, x17 y24 w60 h40 , TAB`n\t
Gui, Add, Button, x77 y24 w80 h40 , line break`n\r\n
Gui, Add, Button, x17 y247 w80 h40 , Hex char`n\xFF
Gui, Add, Button, x417 y194 w120 h40 , negative lookbehind`n(?<! )
Gui, Add, GroupBox, x12 y7 w234 h103 , Whitespace
Gui, Add, GroupBox, x404 y-33 w0 h309 , GroupBox
Gui, Add, GroupBox, x11 y115 w259 h63 , Word Characters
Gui, Add, GroupBox, x11 y180 w177 h62 , Numbers
Gui, Add, GroupBox, x412 y8 w274 h293 , 
Gui, Add, Button, x292 y219 w100 h60 , make optional or lazy`n?
Gui, Add, GroupBox, x283 y79 w116 h205 , Quantifiers
Gui, Add, Button, x292 y99 w100 h30 , 0`, or more`n*
Gui, Add, Button, x292 y129 w100 h30 , at least 1`, or more`n+
Gui, Add, Button, x292 y159 w100 h60 , {4} - exactly 4`n{4`,} - 4 or more`n{1`,4} - 1 to 4`n{ }
; Generated using SmartGUI Creator for SciTE
Gui, Show, w700 h312, Untitled GUI
return

GuiClose:
ExitApp