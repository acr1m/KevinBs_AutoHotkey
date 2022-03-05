; target any File Browswer / Windows Explorer window


lbl_w_Windows_Explorer:
#IfWinActive ahk_class CabinetWClass ahk_exe Explorer.EXE 

;; Scroll left.
+WheelUp::
	Send, {Left}
	return
	
;; Scroll right.
+WheelDown::  
	Send, {Right}
	return

; [Middle Mouse Button Click]
MButton::
{
	; If hotkey was triggered within g_DOUBLE_TAP_LIMIT,
		; then activate the doubleTap process and reset the 
		; listener key to false for the next occurence.
		; g_DOUBLE_TAP_LIMIT approximately 350 milliseconds atm
	if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < g_DOUBLE_TAP_LIMIT) {
		; Toggle Left Folder Navigation Panel
		Send, !vn{Enter}
	}
	; Toggle Right Preview Panel
	Send, !p
	return
}
;copy file address, file path + file name
;Ctrl
^+c::
{
/* 	KeyWait, Ctrl
 * 	KeyWait, Shift
 * 	Clipboard := 
 * 	Send, +{AppsKey}a
 * 	ClipWait
 * 	Clipboard := SubStr(Clipboard, 2, -1)
 */

	KeyWait, Ctrl
	KeyWait, Shift
	Clipboard := 
	Send, {Alt}hcp
	ClipWait
	Clipboard := SubStr(Clipboard, 2, -1)
	
	return
}


!l::
{
	;;view, List Mode
	Send, ^+5
	return
}


global g_fileExplorer_CtrlMButton_Toggle

^MButton::
	;; if true
	if(g_fileExplorer_CtrlMButton_Toggle) {
		;; show list view
		Send, ^+5
	}
	;; if false
	else if(!g_fileExplorer_CtrlMButton_Toggle) {
		;; show details view
		Send, ^+6
	}
	main_toggleVar(g_fileExplorer_CtrlMButton_Toggle, false)
	
	return

/*
class FileExplorerWin_Ctrl_MButton extends SwitchHandlerForKeys {
	;; inherits 'isActive' which should be 'false' at initializiation	
	
	showCurrentState() {
		if (isActive == false || isActive == true) {
			MsgBox, isActive is %isActive%
		}
		return retVal
	}
}
*/

;; check_ToggleState(p_key_string := "") {
	;; static s_fileExplorer_CtrlMButton_Toggle := 0
	;; return
;; }
#IfWinActive