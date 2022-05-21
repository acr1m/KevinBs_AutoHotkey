#SingleInstance Force
#Persistent
;; auto-execute section--------------------------------------------------
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico
Menu, Tray, Tip, % A_ScriptName . "`nPress [s] while over an image to save to last folder."

;; set the icon references
#Include %A_LineFile%\..\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-green_10.ico"
trayIM.iconPaused := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-yellow_10.ico"
trayIM.iconInactive := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-red_10.ico"
gosub, Lbl_TrayIconManager_Start
return
#Include %A_LineFile%\..\..\-lib\TrayIconManager-Labels-LIB.ahk
;; end of auto-execute section--------------------------------------------------

#Include %A_LineFile%\..\..\-lib\time()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\RegEx()-LIB.ahk


#IfWinActive ahk_exe firefox.exe

s::firefox_saveImageMacro()

Lbl_firefox_saveImageMacro:
	firefox_saveImageMacro(3500)
	return

firefox_saveImageMacro(waitTime := 1500) {
	MouseClick, Right 
	Send, v
	Sleep, % waitTime
	
	;; check file name and replace if "unknown" is present
	if (checkFileName("unknown")) {
		time_sendDate("yyyyMMdd_HHmmss")
	}
	
	;; save
	Send, !s
	Sleep, % (waitTime / 3)
	
	;; overwrite?
	Send, y
	Sleep, % (waitTime / 3)
	
	;; close tab
	Send, {Escape}
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