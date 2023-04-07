#Persistent

; set trigger context for RStudio IDE
#IfWinActive RStudio ahk_exe rstudio.exe

; piping shortcut
::>>>::%>%

; (comment/uncomment line)
; remap ctrl q -> ctrl shift c
^q::Send, ^+c

; (duplicate line)
; remap: ctrl d -> alt shift down
^d::Send, !+{Down}


; (shift current line up)
; remap: ctrl shift uparrow -> alt uparrow
^+Up::
{
	Send, {Shift up}{Ctrl up}
	Send, !{Up}
	Send, {Shift down}{Ctrl down}
	return
}

; (shift current line down)
; remap: ctrl shift downarrow -> alt downarrow
^+Down::
{
	Send, {Shift up}{Ctrl up}
	Send, !{Down}
	Send, {Shift down}{Ctrl down}
	return
}

; remove trigger context
#IfWinActive