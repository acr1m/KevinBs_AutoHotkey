;~ Scripted by Kevin A Boykin
;~ July 4th, 2021


#InstallKeybdHook
#InstallMouseHook

;~ This script is considered "active" on start
	; [A_IsSuspended] is a built in variable that could possibly
	; be used as an alternative to custom variables to save a tiny
	; bit of memory space. 
	isActive := true


; Suspend: toggles the hotkeys for the entire script, 
; 	unless "suspend" command is listed in the first line 
; 	of the hotkey/hotstring subroutine.

; TOGGLE (SPACEBAR = CLICK) MODE
; Ctrl+Shift+Space
	^Space::
	Suspend Permit ; makes this hotkey exempt from suspension.
	if isActive
	{
		Suspend On	; turn off hotkeys so spacebar can be used to 
					; close the msgbox.
		isActive := false
		MsgBox, , Space = Left Click,Turned OFF
	}
	else
	{
		isActive := true
		MsgBox, , Space = Left Click,Turned ON
		Suspend Off	; delayed suspend so that the spacebar can be used 
					; to close the msgbox before it turns into mouseclicks.
	}
	return



;Space = Press Primary Mouse Button
	Space::
		Send {Click, Down}
		KeyWait Space
	return

;Space Up = Release Primary Mouse Button
	Space Up::	Send {Click, Up}



