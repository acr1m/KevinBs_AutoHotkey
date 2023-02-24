#SingleInstance Force
#Persistent
;; auto-execute section---------------------------------------------------------


global g_keyPress := "k"
global g_goToNextTab := false
global g_sendEsc := true
global g_closeTab := false
global g_timePeriod1 := 1500 ; to allow for the save file explorer window to open
global g_timePeriod2 := 1500
global g_timePeriod3 := 1500
global g_timePeriod4 := 1500

;;;;;; beginning of tray menu setup---------------------------------------------

;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-s10-green.ico
Menu, Tray, Tip, % A_ScriptName . "`nPress [s] while over an image to save to last folder then navigates to next tab."

; add press [k] menu item
global g_menuItemName_k := "Save Link As: presses [k]"
tgtFunc := Func("setKeyPress_k")
Menu, Tray, Add, % g_menuItemName_k, % tgtFunc

; add press [v] menu item
global g_menuItemName_v := "Save Image As: presses [v]"
tgtFunc := Func("setKeyPress_v")
Menu, Tray, Add, % g_menuItemName_v, % tgtFunc

; add the menu item for toggling whether or not to go to next tab
global g_menuItemName_nextTab := "Go To Next Tab"
tgtFunc := Func("toggle_goToNextTab")
Menu, Tray, Add, % g_menuItemName_nextTab, % tgtFunc

; set the ~check~ status for menu items
updateCheckStatusForNextTabMenuItem()

if (g_keyPress == "k")
	Menu, Tray, Check, % g_menuItemName_k
else if (g_keyPress == "v")
	Menu, Tray, Check, % g_menuItemName_v
else {
	Menu, Tray, UnCheck, % g_menuItemName_k
	Menu, Tray, UnCheck, % g_menuItemName_v
}

;;;;;; set the icon references
#Include %A_LineFile%\..\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive := "E:\Assets\Icons\_used-icons\firefox-s10-green.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\firefox-s10-blue.ico"
trayIM.iconPaused := "E:\Assets\Icons\_used-icons\firefox-s10-yellow.ico"
trayIM.iconInactive := "E:\Assets\Icons\_used-icons\firefox-s10-red.ico"
trayIM.start()
;~ return


;;;;;; end of tray menu setup --------------------------------------------------

;;;;;; end of auto-execute section ---------------------------------------------

#Include %A_LineFile%\..\..\-lib\time()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\RegEx()-LIB.ahk


toggle_goToNextTab() {
	g_goToNextTab := !g_goToNextTab
	updateCheckStatusForNextTabMenuItem()
}

updateCheckStatusForNextTabMenuItem() {
	if (g_goToNextTab)
		Menu, Tray, Check, % g_menuItemName_nextTab
	else
		Menu, Tray, UnCheck, % g_menuItemName_nextTab
}

setKeyPress_k() {
	g_keyPress := "k"
	Menu, Tray, Check, % g_menuItemName_k
	Menu, Tray, Uncheck, % g_menuItemName_v
}

setKeyPress_v() {
	g_keyPress := "v"
	Menu, Tray, Check, % g_menuItemName_v
	Menu, Tray, Uncheck, % g_menuItemName_k
}

toggleScrollWheelListener() {

	g_b_ScrollWheelListener := !g_b_ScrollWheelListener

	if (g_b_ScrollWheelListener) {
		Menu, Tray, Check, % g_MenuItemName_ScrollWheelToggle
	}
	else if (!g_b_ScrollWheelListener) {
		Menu, Tray, Uncheck, % g_MenuItemName_ScrollWheelToggle
	}
}



#IfWinActive ahk_exe firefox.exe
;~ $RButton::
	;~ KeyWait, % "RButton"
	;~ firefox_saveImageMacro()
	;~ return
s::
	Loop, 1
	{
		main_showTooltip(A_Index)
		firefox_saveImageMacro()
		if (g_goToNextTab)
			Send, ^{Tab}
		Sleep, 1000
	}
	return
	;;;;;;;;;;;;;;;; last left off changing // adding time period globals into the method below, 
; firefox_saveImageMacro() 
; 	descr: d[right clicks] at current mouse position, 
; 			then hits [v] or [k] (to "save file/image as...", or to "save link as..." (respectively))
;			then waits for g_firefox_saveImageMacro_timePeriod1: (
;   uses global variables 	- g_sendEsc
; 							- g_closeTab 
firefox_saveImageMacro() {
	MouseClick, Right 
	
	; sends either a user designated key (initally intended for either [k] or [v]
	Send, % g_keyPress 
	Sleep, % g_timePeriod1
	
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
	
	;; sleep to allow time for file to finish saving to location?
	;~ Sleep, % (2000)
	
	;; close tab
	if (g_sendEsc)
		Send, {Escape}
	
	if (g_closeTab)
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