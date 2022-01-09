#NoTrayIcon

Gui, Add, Text, x173 y141 w109 h49 +Center, word character `n[A-Za-z0-9_]
Gui, Add, Text, x486 y21 w125 h44 +Center, Reserved Characters`n+*?^$\.[]{}()|/
Gui, Add, Button, x22 y69 w100 h40 , whitespace char`n\s
Gui, Add, Button, x122 y69 w120 h40 , non-whitespace char`n\S
Gui, Add, Button, x22 y136 w80 h40 , word char`n\w
Gui, Add, Button, x102 y136 w80 h40 , non-word char`n\W
Gui, Add, Button, x422 y59 w120 h40 , char-set`n[ ]
Gui, Add, Button, x22 y200 w80 h40 , digit char`n\d
Gui, Add, Button, x562 y59 w120 h40 , negated-set`n[^ ]
Gui, Add, Button, x102 y200 w80 h40 , non-digit char`n\D
Gui, Add, Button, x283 y24 w104 h44 , match any`n[\s\S]
Gui, Add, Button, x422 y99 w120 h40 , capture-group`n( )
Gui, Add, Button, x562 y99 w120 h40 , non-capturing group`n(?: )
Gui, Add, Button, x422 y159 w120 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x562 y159 w120 h40 , positive lookahead`n(?= )
Gui, Add, Button, x562 y199 w120 h40 , negative lookahead`n(?! )
Gui, Add, Button, x472 y259 w160 h40 , named capturing group`n(?<name> )
Gui, Add, Button, x22 y29 w60 h40 , TAB`n\t
Gui, Add, Button, x82 y29 w80 h40 , line break`n\r\n
Gui, Add, Button, x22 y252 w80 h40 , Hex char`n\xFF
Gui, Add, Button, x422 y199 w120 h40 , negative lookbehind`n(?<! )
Gui, Add, GroupBox, x17 y12 w234 h103 , Whitespace
Gui, Add, GroupBox, x409 y-28 w-80 h309 , GroupBox
Gui, Add, GroupBox, x16 y120 w259 h63 , Word Characters
Gui, Add, GroupBox, x16 y185 w177 h62 , Numbers
Gui, Add, GroupBox, x417 y13 w274 h293 , 
; Generated using SmartGUI Creator for SciTE
Gui, Show, w706 h318, Untitled GUI
return

GuiClose:
ExitApp