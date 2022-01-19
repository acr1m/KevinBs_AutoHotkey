;~ #Include %A-ScriptDir%\..\LIB\LIB-Main-Method-Library.ahk

#IfWinActive ahk_class SciTEWindow ahk_exe SciTE.exe

;; "|" - puts the caret inside of quotes when double-tapped
~+':: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

;; %|% - puts the caret inside of percents when double-tapped
~+5:: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

Lbl_Toggle_Current_Fold: ;{ 
^MButton::
	Send, {Alt}vc
	return  ;}

Lbl_Toggle_All_Folds: ;{ 
^+MButton::
	Send, {Alt}va
	return  ;}

#IfWinActive
