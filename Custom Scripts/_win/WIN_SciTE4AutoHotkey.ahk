;~ #Include %A_ScriptDir%\..\LIB\LIB_Main_Method_Library.ahk



#IfWinActive ahk_class SciTEWindow ahk_exe SciTE.exe
;; "|" - puts the caret inside of quotes when double-tapped
~+'::
	if (doubleTap(350))
		Send, {Left}
	return
;; %|% - puts the caret inside of percents when double-tapped
~+5::
	if (doubleTap(350))
		Send, {Left}
	return
#IfWinActive
