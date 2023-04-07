#NoTrayIcon

Gui, Font, S10 CDefault, JetBrains Mono
Gui, Add, GroupBox, x10 y2 w234 h103 , Whitespace (WhtSpc)
Gui, Add, Button, x121 y-2 w120 h40 , line-break`n\r\n
Gui, Add, Button, x-3 y9 w120 h40 , TAB`n\t
Gui, Add, Button, x-2 y41 w120 h40 , WhtSpc char`n\s
Gui, Add, Button, x121 y60 w120 h40 , non-WhtSpc char`n\S
Gui, Add, GroupBox, x6 y110 w259 h63 , Word Characters
Gui, Add, Button, x-2 y126 w120 h40 , word char`n\w
Gui, Add, Button, x121 y126 w120 h40 , non-word char`n\W
Gui, Add, Text, x180 y131 w120 h40 , word character `n[A-Za-z0-9_]
Gui, Add, GroupBox, x6 y175 w177 h62 , Numbers
Gui, Add, Button, x-2 y190 w120 h40 , digit char`n\d
Gui, Add, Button, x121 y190 w120 h40 , non-digit char`n\D
Gui, Add, Button, x22 y289 w120 h40 , Hex char`n\xFF
Gui, Add, Text, x922 y309 w170 h50 , Reserved Characters`n+*?^$\.[]{}()|/
Gui, Add, Button, x270 y4 w120 h40 , match any`n[\s\S]
Gui, Add, GroupBox, x285 y74 w120 h205 , Quantifiers
Gui, Add, Button, x290 y94 w120 h40 , 0`, or more`n*
Gui, Add, Button, x290 y124 w120 h40 , at least 1`, or more`n+
Gui, Add, Button, x290 y154 w120 h40 , {4} - exactly 4`n{4`,} - 4 or more`n{1`,4} - 1 to 4`n{ }
Gui, Add, Button, x290 y214 w120 h40 , make optional or lazy`n?
Gui, Add, GroupBox, x532 y19 w420 h230 , Groups
Gui, Add, Button, x542 y39 w200 h40 , char-set`n[ ]
Gui, Add, Button, x542 y79 w200 h40 , capture-group`n( )
Gui, Add, Button, x542 y119 w200 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x542 y159 w200 h40 , negative lookbehind`n(?<! )
Gui, Add, Button, x612 y199 w200 h40 , named capturing group`n(?<name> )
Gui, Add, Button, x742 y119 w200 h40 , positive lookahead`n(?= )
Gui, Add, Button, x742 y159 w200 h40 , negative lookahead`n(?! )
Gui, Add, Button, x742 y39 w200 h40 , negated-set`n[^ ]
Gui, Add, Button, x742 y79 w200 h40 , non-capturing group`n(?: )
Gui, Add, Button, x262 y299 w30 h30 , \+
Gui, Add, Button, x1052 y259 w120 h40 , Hex char`n\xFF
Gui, Add, Button, x172 y299 w30 h30 , \*
Gui, Add, Button, x322 y359 w30 h30 , \?
Gui, Add, Button, x232 y299 w30 h30 , \^
Gui, Add, Button, x202 y299 w30 h30 , \$
Gui, Add, Button, x202 y329 w30 h30 , \\
Gui, Add, Button, x292 y359 w30 h30 , \.
Gui, Add, Button, x382 y299 w30 h30 , \[
Gui, Add, Button, x412 y299 w30 h30 , \]
Gui, Add, Button, x382 y329 w30 h30 , \{
Gui, Add, Button, x412 y329 w30 h30 , \}
Gui, Add, Button, x322 y299 w30 h30 , \(
Gui, Add, Button, x352 y299 w30 h30 , \)
Gui, Add, Button, x252 y359 w30 h30 , \|
Gui, Add, Button, x172 y329 w30 h30 , \/
Gui, Add, Button, x502 y269 w200 h40 , char-set`n[ ]
Gui, Add, Button, x502 y309 w200 h40 , negated-set`n[^ ]
; Generated using SmartGUI Creator for SciTE
Gui, Show, w1194 h591, Untitled GUI
return

GuiClose:
ExitApp