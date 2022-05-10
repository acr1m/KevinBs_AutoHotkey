#SingleInstance Force
#IfWinActive ahk_exe firefox.exe

s::firefox_saveImageMacro()

Lbl_firefox_saveImageMacro:
	firefox_saveImageMacro(1500)
	return

firefox_saveImageMacro(waitTime := 1500) {
	MouseClick, Right 
	Send, v
	Sleep, % waitTime
	Send, !s
	Sleep, % (waitTime / 3)
	Send, y
	Sleep, % (waitTime / 3)
	Send, {Escape}
	Send, ^w
}

#IfWinActive