#NoTrayIcon

Gui, Font, S8 CDefault, JetBrains Mono
Gui, Add, Text, x22 y89 w110 h30 , word character `n[A-Za-z0-9_]
Gui, Add, Text, x22 y9 w110 h50 , whitespace `n(spaces`, tabs`,`nline breaks)
Gui, Add, Text, x22 y149 w110 h30 , character set`n      negated
Gui, Add, Text, x132 y39 w90 h20 +Center, Match Any
Gui, Add, Text, x302 y19 w160 h40 +Center, Reserved Characters`n+*?^$\.[]{}()|/


Gui, Font, S10 CDefault, JetBrains Mono
Gui, Add, Button, x22 y59 w40 h30 , \s
Gui, Add, Button, x62 y59 w40 h30 , \S
Gui, Add, Button, x22 y119 w40 h30 , \w
Gui, Add, Button, x62 y119 w40 h30 , \W
Gui, Add, Button, x22 y179 w40 h30 , [⋯]
Gui, Add, Button, x22 y239 w40 h30 , \d
Gui, Add, Button, x22 y299 w40 h30 , \S
Gui, Add, Button, x62 y179 w40 h30 , [^⋯]
Gui, Add, Button, x62 y239 w40 h30 , \D
Gui, Add, Button, x142 y59 w60 h30 , [\s\S]
Gui, Add, Button, x132 y179 w60 h30 , ( )
Gui, Add, Button, x192 y179 w60 h30 , (?: )

Gui, Add, Button, x132 y209 w60 h30 , (?<= )
Gui, Add, Button, x192 y209 w60 h30 , (?= )


Gui, Add, Button, x132 y239 w60 h30 , (?<! )
Gui, Add, Button, x192 y239 w60 h30 , (?! )
Gui, Add, Button, x132 y269 w120 h30 , (?<name> )
Gui, Add, Button, x132 y119 w60 h30 , \t
Gui, Add, Button, x192 y119 w60 h30 , \r\n
Gui, Add, Button, x162 y149 w60 h30 , [\r\n]
Gui, Add, Button, x252 y119 w90 h30 , Hex char`n\xFF
; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h379, Untitled GUI
return

GuiClose:
ExitApp

