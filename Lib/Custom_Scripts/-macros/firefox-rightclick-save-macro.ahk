#SingleInstance Force
#Persistent
;; auto-execute section--------------------------------------------------
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-s10-green.ico
Menu, Tray, Tip, % A_ScriptName . "`nPress [s]  while over an image to save to last folder then navigates to next tab."

;; set the icon references
#Include %A_LineFile%\..\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive := "E:\Assets\Icons\_used-icons\firefox-s10-green.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\firefox-s10-blue.ico"
trayIM.iconPaused := "E:\Assets\Icons\_used-icons\firefox-s10-yellow.ico"
trayIM.iconInactive := "E:\Assets\Icons\_used-icons\firefox-s10-red.ico"
trayIM.start()
return
;; end of auto-execute section--------------------------------------------------

#Include %A_LineFile%\..\..\-lib\time()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\RegEx()-LIB.ahk


#IfWinActive ahk_exe firefox.exe
;~ $RButton::
	;~ KeyWait, % "RButton"
	;~ firefox_saveImageMacro()
	;~ return
s::
	Loop, 1
	{
		main_showTooltip(A_Index)
		firefox_saveImageMacro(true)
		Send, ^{Tab}
		Sleep, 1000
	}
	return
	
firefox_saveImageMacro(p_sendEsc := false, p_closeTab := false) {
	MouseClick, Right 
	Send, v
	Sleep, % 3000
	
	;; check file name and replace if "unknown" is present
	if (checkFileName("unknown")) {
		time_sendDate("yyyyMMdd_HHmmss")
	}
	
	Sleep, % (500)
	;; save
	Send, !s
	
	Sleep, % (350)
	;; overwrite?
	Send, y
	
	Sleep, % (2000)
	;; close tab
	if (p_sendEsc)
		Send, {Escape}
	
	if (p_closeTab)
		Send, ^w
}

checkFileName(p_str := "") {
	outVar := false
	Send, ^c ;; copy
	if RegExMatch(Clipboard, p_str) {
		outVar := true
	}
	else {
		outVar := false
	}
	return outVar
}

#IfWinActive