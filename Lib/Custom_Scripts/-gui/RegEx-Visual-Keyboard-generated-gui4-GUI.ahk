#NoTrayIcon

Gui, Font, S8 CDefault, JetBrains Mono
Gui, Add, Button, x142 y24 w100 h40 , line-break ch.`n\r\n
Gui, Add, Button, x12 y24 w100 h40 , TAB char`n\t
Gui, Add, Button, x12 y64 w100 h40 , WhtSpc char`n\s
Gui, Add, Button, x142 y64 w100 h40 , non-WhtSpc ch.`n\S
Gui, Add, Button, x12 y129 w100 h40 , word char`n\w
Gui, Add, Button, x142 y129 w100 h40 , non-word char`n\W
Gui, Add, Button, x12 y169 w100 h40 , digit char`n\d
Gui, Add, Button, x142 y169 w100 h40 , non-digit char`n\D
Gui, Add, Button, x12 y224 w100 h40 , Hex char`n\xFF
Gui, Add, Button, x282 y24 w100 h40 , match any`n[\s\S]
Gui, Add, Button, x532 y24 w40 h40 , *
Gui, Add, Button, x532 y69 w40 h40 , +
Gui, Add, Button, x532 y134 w40 h40 , { }
Gui, Add, Button, x532 y199 w40 h40 , ?
Gui, Add, Button, x212 y369 w100 h40 , capture-group`n( )
Gui, Add, Button, x412 y309 w40 h40 , \+
Gui, Add, Button, x372 y309 w40 h40 , \*
Gui, Add, Button, x452 y309 w40 h40 , \?
Gui, Add, Button, x242 y309 w40 h40 , \^
Gui, Add, Button, x202 y309 w40 h40 , \$
Gui, Add, Button, x72 y309 w40 h40 , \\
Gui, Add, Button, x152 y309 w40 h40 , \.
Gui, Add, Button, x282 y309 w40 h40 , \[
Gui, Add, Button, x322 y309 w40 h40 , \]
Gui, Add, Button, x592 y309 w40 h40 , \{
Gui, Add, Button, x632 y309 w40 h40 , \}
Gui, Add, Button, x502 y309 w40 h40 , \(
Gui, Add, Button, x542 y309 w40 h40 , \)
Gui, Add, Button, x112 y309 w40 h40 , \|
Gui, Add, Button, x32 y309 w40 h40 , \/
Gui, Add, Button, x12 y369 w100 h40 , char-set`n[ ]
Gui, Add, Button, x12 y409 w100 h40 , negated char-set`n[^ ]
Gui, Add, Button, x212 y409 w100 h40 , non-capturing group`n(?: )
Gui, Add, Button, x1352 y689 w100 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x12 y459 w100 h40 , positive lookbehind`n(?<= )
Gui, Add, Button, x12 y499 w100 h40 , negative lookbehind`n(?<! )
Gui, Add, Button, x212 y459 w100 h40 , positive lookahead`n(?= )
Gui, Add, Button, x212 y499 w100 h40 , negative lookahead`n(?! )
Gui, Add, Button, x112 y549 w100 h40 , named capturing group`n(?<name> )
Gui, Add, Button, x142 y224 w100 h40 , word character `n[A-Za-z0-9_]
Gui, Add, Button, x282 y124 w100 h60 , NoSpc Wrd-Bndry`n\b
Gui, Add, Text, x582 y73 w100 h40 +Left, match 1`, or more`n  (greedy)
Gui, Font, S8 CDefault, JetBrains Mono
Gui, Font, S7 CDefault, JetBrains Mono
Gui, Font, S9 CDefault, JetBrains Mono
Gui, Font, S8 CDefault, JetBrains Mono
Gui, Add, Text, x587 y24 w100 h38 +Left, match 0`,or more`n  (greedy)
Gui, Add, Text, x587 y202 w100 h40 , make 'quantifier' optional (lazy)
Gui, Add, Button, x632 y269 w40 h40 , }
Gui, Add, Button, x592 y269 w40 h40 , {
Gui, Add, Button, x282 y184 w100 h60 , beginning of input stream`n^
Gui, Add, Button, x402 y184 w100 h60 , end of input stream`n$
Gui, Add, Button, x372 y269 w40 h40 , *
Gui, Add, Button, x412 y269 w40 h40 , +
Gui, Add, Button, x452 y269 w40 h40 , ?
Gui, Add, Button, x542 y269 w40 h40 , )
Gui, Add, Button, x502 y269 w40 h40 , (
Gui, Add, Button, x322 y269 w40 h40 , ]
Gui, Add, Button, x282 y269 w40 h40 , [
Gui, Add, Button, x242 y269 w40 h40 , ^
Gui, Add, Button, x202 y269 w40 h40 , $
Gui, Add, Button, x152 y269 w40 h40 , .
Gui, Add, Button, x112 y269 w40 h40 , 
Gui, Add, Button, x72 y269 w40 h40 , \
Gui, Add, Button, x32 y269 w40 h40 , /
Gui, Add, Button, x282 y64 w100 h60 , match any except line-break chars`n.
Gui, Font, S8 CDefault, JetBrains Mono
Gui, Add, Text, x582 y124 w100 h60 , {4} - exactly 4`n{4`,} - 4 or more`n{1`,4} - 1 to 4
Gui, Add, GroupBox, x7 y3 w100 h106 , GroupBox
Gui, Add, GroupBox, x7 y110 w100 h107 , GroupBox
Gui, Add, GroupBox, x280 y4 w100 h250 , GroupBox
Gui, Add, GroupBox, x529 y109 w100 h77 , 
Gui, Add, GroupBox, x530 y56 w-81 h-213 , 
Gui, Add, GroupBox, x528 y54 w100 h61 , 
Gui, Add, GroupBox, x530 y7 w100 h63 , 
Gui, Add, GroupBox, x529 y179 w100 h77 , 
Gui, Add, GroupBox, x6 y349 w100 h252 , GroupBox
; Generated using SmartGUI Creator for SciTE
Gui, Show, w800 h624, Untitled GUI
return

GuiClose:
ExitApp