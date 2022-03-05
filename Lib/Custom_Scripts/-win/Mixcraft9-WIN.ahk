#IfWinActive ahk_exe mixcraft9.exe
;;If window is active

;; #Include %A_ScriptDir%\..\-lib\Main-Method-Library-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk


;; mixcraft9_Toggle_G := new SwitchHandlerForKeys
;; global mixcraft9_Toggle_G := new SwitchHandlerForKeys
class mixcraft9_Toggle_G extends SwitchHandlerForKeys { 
}

$g::
{
	; obj.isActive default is false
	if (mixcraft9_Toggle_G.isActive) {
		Send, ``
		;; MsgBox, , % "mixcraft9_Toggle_G.isActive", % "mixcraft9_Toggle_G.isActive = " . mixcraft9_Toggle_G.isActive
	}
	
	else if (!mixcraft9_Toggle_G.isActive) {
		Send, g
		;; MsgBox, , % "mixcraft9_Toggle_G.isActive", % "mixcraft9_Toggle_G.isActive = " . mixcraft9_Toggle_G.isActive
	}
	mixcraft9_Toggle_G.toggleState()
	return
}





;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive