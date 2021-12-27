;~ Scripted by Kevin A Boykin
;~ July 4th, 2021


#InstallKeybdHook
#InstallMouseHook

;~ This script is considered "active" on start
isActive := true


;~ Suspend ;~ toggles the hotkeys for the entire script, unless "suspend" command is listed in the first line of the hotkey/hotstring subroutine.


^Space::
Suspend Permit ;~ makes this hotkey exempt from suspension.
if isActive
{
	Suspend On	;~ turn off hotkeys so spacebar can be used to close the msgbox.
	isActive := false
	;~ MsgBox, Turned OFF Space = Left Click`nOFF`nisActive: %isActive%
	MsgBox, , Space = Left Click,Turned OFF
}
else
{
	isActive := true
	;~ MsgBox, Turned ON Space = Left Click`nON`nisActive: %isActive%
	MsgBox, , Space = Left Click,Turned ON
	Suspend Off	;~ delayed suspend so that the spacebar can be used to close the msgbox before it turns into mouseclicks.
}
return



;~ Space::LButton
Space::
Send {Click, Down}
KeyWait Space
return

;~ Space Up::
Space Up::Send {Click, Up}



