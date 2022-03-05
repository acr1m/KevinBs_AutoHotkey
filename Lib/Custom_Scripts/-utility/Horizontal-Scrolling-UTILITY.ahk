#IfWinActive
/* Descr:	This script handles horizontal mouse wheel scrolling when the user hold down the Shift key.
 */

SetTimer, Lbl_UpdateIcon, 250
	return

Lbl_UpdateIcon:
	Suspend, Permit
	Pause, Off, true

	if (A_IsSuspended) {
		Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-red-2.ico"
	} else if (!A_IsSuspended){
		Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-green-2.ico"
	}
	
	return

CapsLock & LShift::
	Suspend, Permit
/*	DESCRIPTION: if double-tap left shift while holding CapsLock down, then toggle 
	 the suspend state of the Horizontal-Scrolling-UTILITY.ahk 
	
	; #Include %A_ScriptDir%\-utility\Horizontal-Scrolling-UTILITY.ahk
	
	NOTE: The built-in variable A_IsSuspended contains 1 if the script 
	 is suspended and 0 otherwise.
*/
	/*
	if (doubleTap()) {
		;; Sends a Suspend command to another script.
		
		DetectHiddenWindows, On
		ID_FILE_SUSPEND := 65404
		;; WM_COMMAND := 0x0111 ; already included from "WM-List-LIB.ahk"
		
		if (WinExist("ahk_pid" pid_horizScroll)) {
			horizontalScrollingUtility_setTrayIcon_Suspend()
			PostMessage, %WM_COMMAND%, %ID_FILE_SUSPEND%,,, ahk_pid %pid_horizScroll%
		} else {
			MsgBox, 48, Main-AHK.ahk - CapsLock & LShift::, ERROR: unable to to find WinExist("ahk_pid pid_horizScroll") `npid_horizScroll = %pid_horizScroll%
		}
		
		
	}
	*/
	if (doubleTap()) {
		;; Set tray icon and toggle suspend
		
		; if suspended, activate and set active icon
		if (A_IsSuspended) {
			Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-green-2.ico", , 1
			Suspend, Off
		} 
		; if active, suspend and set suspended icon
		else if (!A_IsSuspended) {
			Suspend, On
			Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-red-2.ico", , 1
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
	Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-red-2.ico"
}

/**
 * Used to set the Default icon of this script "Horizontal-Scrolling-UTILITY.ahk"
 * 
 * This is needed because if the icon is not set before it is suspended, then it will show the default "suspended-icon". (I think... ¯\_(ツ)_/¯)
 */
horizontalScrollingUtility_setTrayIcon_Active() {
	Menu, Tray, Icon, % "E:\Assets\Icons\side-scroll-horizontal-scrolling-green-2.ico"
}