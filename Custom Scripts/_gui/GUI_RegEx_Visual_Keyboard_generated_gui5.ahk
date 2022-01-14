#NoTrayIcon

Gui, Add, Button, x92 y29 w80 h40 , line-break`n\r\n
Gui, Add, Button, x12 y29 w80 h40 , TAB char`n\t
Gui, Add, Button, x12 y69 w80 h40 , WhtSpc char`n\s
Gui, Add, Button, x92 y69 w80 h40 , non-WhtSpc.`n\S
Gui, Add, Button, x12 y139 w80 h30 , word char`n\w
Gui, Add, Button, x92 y139 w80 h30 , non-word char`n\W
Gui, Add, Button, x12 y169 w80 h30 , digit char`n\d
Gui, Add, Button, x92 y169 w80 h30 , non-digit char`n\D
Gui, Add, Button, x12 y199 w80 h30 , Hex char`n\xFF
Gui, Add, Button, x302 y29 w80 h40 , match any`n[\s\S]
Gui, Add, Button, x532 y29 w40 h40 , *
Gui, Add, Button, x532 y74 w40 h40 , +
Gui, Add, Button, x532 y139 w40 h40 , { }
Gui, Add, Button, x532 y204 w40 h40 , ?
Gui, Add, Button, x212 y374 w100 h40 , capture-group`n( )
Gui, Add, Button, x412 y314 w40 h40 , \+
Gui, Add, Button, x372 y314 w40 h40 , \*
Gui, Add, Button, x452 y314 w40 h40 , \?
Gui, Add, Button, x242 y314 w40 h40 , \^
Gui, Add, Button, x202 y314 w40 h40 , \$
Gui, Add, Button, x72 y314 w40 h40 , \\
Gui, Add, Button, x152 y314 w40 h40 , \.
Gui, Add, Button, x282 y314 w40 h40 , \[
Gui, Add, Button, x322 y314 w40 h40 , \]
Gui, Add, Button, x592 y314 w40 h40 , \{
Gui, Add, Button, x632 y314 w40 h40 , \}
Gui, Add, Button, x502 y314 w40 h40 , \(
Gui, Add, Button, x542 y314 w40 h40 , \)
Gui, Add, Button, x112 y314 w40 h40 , \|
Gui, Add, Button, x32 y314 w40 h40 , \/
Gui, Add, Button, x12 y374 w100 h40 , char-set`n[ ]
Gui, Add, Button, x12 y414 w100 h40 , negated char-set`n[^ ]
Gui, Add, Button, x212 y414 w100 h40 , non-capturing group`n(?: )
Gui, Add, Button, x1347 y684 w100 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x12 y464 w100 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x12 y504 w100 h40 , negative lookbehind`n(?<! )
Gui, Add, Button, x212 y464 w100 h40 , positive lookahead`n(?= )
Gui, Add, Button, x212 y504 w100 h40 , negative lookahead`n(?! )
Gui, Add, Button, x112 y554 w100 h40 , named capturing group`n(?<name> )
Gui, Add, Button, x92 y199 w80 h30 , word character `n[A-Za-z0-9_]
Gui, Add, Button, x302 y109 w100 h40 , NoSpc Wrd-Bndry`n\b
Gui, Add, Text, x582 y78 w100 h40 , match 1`, or more`n  (greedy)
Gui, Add, Text, x587 y29 w100 h38 , match 0`,or more`n  (greedy)
Gui, Add, Text, x587 y207 w100 h40 , make 'quantifier' optional (lazy)
Gui, Add, Button, x632 y274 w40 h40 , }
Gui, Add, Button, x592 y274 w40 h40 , {
Gui, Add, Button, x302 y179 w100 h40 , beginning of input stream`n^
Gui, Add, Button, x302 y219 w100 h40 , end of input stream`n$
Gui, Add, Button, x372 y274 w40 h40 , *
Gui, Add, Button, x412 y274 w40 h40 , +
Gui, Add, Button, x452 y274 w40 h40 , ?
Gui, Add, Button, x542 y274 w40 h40 , )
Gui, Add, Button, x502 y274 w40 h40 , (
Gui, Add, Button, x322 y274 w40 h40 , ]
Gui, Add, Button, x282 y274 w40 h40 , [
Gui, Add, Button, x242 y274 w40 h40 , ^
Gui, Add, Button, x202 y274 w40 h40 , $
Gui, Add, Button, x152 y274 w40 h40 , .
Gui, Add, Button, x112 y274 w40 h40 , 
Gui, Add, Button, x72 y274 w40 h40 , \
Gui, Add, Button, x32 y274 w40 h40 , /
Gui, Add, Button, x412 y39 w70 h30 , any`, not-CRLF`n.
Gui, Add, Text, x582 y129 w100 h60 , {4} - exactly 4`n{4`,} - 4 or more`n{1`,4} - 1 to 4
Gui, Add, GroupBox, x275 y-21 w0 h0 , GroupBox
Gui, Add, GroupBox, x530 y61 w0 h0 , 
Gui, Font, S12 CDefault, Verdana
Gui, Font, S12 CDefault, Verdana
Gui, Font, S12 CDefault, JetBrains Mono
Gui, Add, Button, x422 y99 w90 h40 , not-CRLF`n.
Gui, Font, S10 CDefault, JetBrains Mono
Gui, Add, Button, x302 y69 w80 h40 , not-CRLF`n.
; Generated using SmartGUI Creator for SciTE
Gui, Show, w794 h618, Untitled GUI
return

GuiClose:
ExitApp