#IfWinActive, ahk_class ConsoleWindowClass
^v:: ;command prompt - send the clipboard
if InStr(vText, "`r")
	vText := SubStr(vText, 1, InStr(vText, "`r")-1)
if InStr(vText, "`n")
	vText := SubStr(vText, 1, InStr(vText, "`n")-1)
SendInput, % "{Text}" vText ;note: {Text} requires AHK v1.1.27+
return

^a:: ;command prompt - select all
PostMessage, 0x111, 65525,,, A ;WM_COMMAND := 0x111
return

^c:: ;command prompt - copy
PostMessage, 0x111, 65520,,, A ;WM_COMMAND := 0x111
return
#IfWinActive
