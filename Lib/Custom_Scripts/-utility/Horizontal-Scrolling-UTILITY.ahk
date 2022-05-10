#SingleInstance Force

global horizontalScrollingUtility_icon_Active := "E:\Assets\Icons\side-scroll-horizontal-scrolling-green-2.ico"
global horizontalScrollingUtility_icon_Suspended := "E:\Assets\Icons\side-scroll-horizontal-scrolling-red-2.ico"


#IfWinActive
/* Descr:	This script handles horizontal mouse wheel scrolling when the user hold down the Shift key.
 */

SetTimer, Lbl_UpdateIcon, 250
	return

Lbl_UpdateIcon:
	Suspend, Permit
	Pause, Off, true

	if (A_IsSuspended) {
		Menu, Tray, Icon, % horizontalScrollingUtility_icon_Suspended
	} else if (!A_IsSuspended){
		Menu, Tray, Icon, % horizontalScrollingUtility_icon_Active
	}
	
	return

/* Toggle Suspension and Icon State
 * 
 * What Activates This Sub?
 *   Hold CapsLock & Double-Tap Left-Shift
 * Description
 *   Toggles the state of suspension for this script process. <"Horizontal-Scrolling-UTILITY.ahk">
 * Remarks
 *   The built-in variable %A_IsSuspended% contains "1" if the script 
 *   is suspended and "0" otherwise.
 */
CapsLock & LShift::
	Suspend, Permit
	if (doubleTap()) {
		;; Set tray icon and toggle suspend
		
		; activate it
		if (A_IsSuspended) {
			Menu, Tray, Icon, % horizontalScrollingUtility_icon_Active, , 1
			Suspend, Off
		} 
		; suspend it
		else if (!A_IsSuspended) {
			Suspend, On
			Menu, Tray, Icon, % horizontalScrollingUtility_icon_Suspended, , 1
		}
		
	}
	return


;; mainLib := A_ScriptDir . "\..\-lib\Main-Method-Library-LIB.ahk"
;; MsgBox, % mainLib

;; #Include %mainLib%
#Include %A_ScriptDir%\..\-lib\Main-Method-Library-LIB.ahk


;; Scroll left.
+WheelUp::
	scrollAmount := main_scrollMethod_01()
	
	horiz_scrollWheel_controlVal := 0x114
	ControlGetFocus, outputVar_control, A
	;; Loop 4  ; <-- Increase this value to scroll faster.
	Loop %scrollAmount%  ; <-- Increase this value to scroll faster.
	{
		;; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
		;~ SendMessage, 0x114, 0, 0, %outputVar_control%, A  
		
		;~ SendMessage, %horiz_scrollWheel_controlVal%, SB_LINELEFT, 0, %outputVar_control%, A
		SendMessage, %horiz_scrollWheel_controlVal%, 0, 0, %outputVar_control%, A
	}
	return
	
;; Scroll right.
+WheelDown::  
	scrollAmount := main_scrollMethod_01()
	
	horiz_scrollWheel_controlVal := 0x114
	ControlGetFocus, outputVar_control, A
	;; Loop 4 ;; <-- Increase this value to scroll faster.
	Loop %scrollAmount% ;; <-- Increase this value to scroll faster.
	{	
		;; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
		;~ SendMessage, 0x114, 1, 0, %outputVar_control%, A  
		
		;~ SendMessage, %horiz_scrollWheel_controlVal%, SB_LINERIGHT, 0, %outputVar_control%, A
		SendMessage, %horiz_scrollWheel_controlVal%, 1, 0, %outputVar_control%, A
	}
	return

#IfWinActive ahk_exe firefox.exe

;; Scroll left.
+WheelUp::
	scrollAmount := main_scrollMethod_01()
	Send, +{WheelUp %scrollAmount%}
	return

;; Scroll right.
+WheelDown::
	scrollAmount := main_scrollMethod_01()
	Send, +{WheelDown %scrollAmount%}
	return

#IfWinActive

/**
 * Used to set the suspend icon of this script "Horizontal-Scrolling-UTILITY.ahk"
 * 
 * This is needed because if the icon is not set before it is suspended, then it will show the default "suspended-icon". (I think... ¯\_(ツ)_/¯)
 */
horizontalScrollingUtility_setTrayIcon_Suspend() {
	Menu, Tray, Icon, % horizontalScrollingUtility_icon_Suspended
}

/**
 * Used to set the Default icon of this script "Horizontal-Scrolling-UTILITY.ahk"
 * 
 * This is needed because if the icon is not set before it is suspended, then it will show the default "suspended-icon". (I think... ¯\_(ツ)_/¯)
 */
horizontalScrollingUtility_setTrayIcon_Active() {
	Menu, Tray, Icon, % horizontalScrollingUtility_icon_Active
}