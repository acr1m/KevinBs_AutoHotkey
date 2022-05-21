#SingleInstance Force
#Persistent
/* ICONS
 *    "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico"
 *    "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-green_10.ico"
 *    "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-red_10.ico"
 *    "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-yellow_10.ico"
 */

;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico

global icon_isActive :=  "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico"
global icon_isSuspended :=  "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-red_10.ico"
Menu, Tray, Tip, % A_ScriptName . "`nPress [s] while over an image to save to last folder."
;; Menu, MenuName, Add [, MenuItemName, LabelOrSubmenu, Options]
Menu, Tray, Add, Suspend Hotkeys, Lbl_Suspend
Menu, Tray, Add, Pause Script, Lbl_Pause

;; instantiate tray icon manager

;; iconManager := new TrayIconManager()
;; iconManager.icon.ACTIVE := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico"
;; iconManager.icon.SUSPENDED := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-green_10.ico"
;; iconManager.icon.PAUSED := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-yellow_10.ico"
;; iconManager.icon.INACTIVE := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-red_10.ico"


SetTimer, Lbl_UpdateFireFoxIcon, 250
;; SetTimer, iconManager.updateTrayIcon(), 250
return
;; end of auto-execute section--------------------------------------------------

;; #Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\TrayIconManager-LIB.ahk

Lbl_Suspend:
	Suspend, Toggle
	return
Lbl_Pause:
	Pause, Toggle
	return
Lbl_UpdateFireFoxIcon:
	Suspend, Permit
	Pause, Off
	
	if (A_IsSuspended) {
		Menu, Tray, Icon, % icon_isSuspended
	} else if (!A_IsSuspended){
		Menu, Tray, Icon, % icon_isActive
	}
	return



;; #Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\run()-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\mathKbd()-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\Emojis-And-Symbols-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\repeatKey()-LIB.ahk
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