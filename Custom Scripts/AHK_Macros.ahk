#Include %A_ScriptDir%
#InstallKeybdHook
#InstallMouseHook
#SingleInstance Force
SendMode, Input
;~ SendMode, Event

;lil test with passing key name variables

/* ;~ myKey := "Down"
 * ;~ myKey := "+k" ; <---- doesn't work, can't have modifiers sent
 * 				 ; along with key name
 * str := GetKeyName(myKey)
 * num1 := GetKeyVK(myKey)
 * num2 := GetKeySC(myKey)
 * outStr := "" str . ", " . num1 . ", " . num2 . ""
 * MsgBox % "Here's the outputs for myKey...`n" . outStr . "."
 */


;~ repeatShiftKey("b", 5)
;~ repeatCtrlKey("Right", 50)
;~ repeatAltKey("Right", 5)
;~ repeatCtrlShiftKey("b", 5)
;~ repeatAltShiftKey("b", 5)
;~ repeatCtrlAltShiftKey("b", 5)

/* Fixed issue why the macro script wouldn't work in editint the fancy zones of 
 * powertoys. It was because SciTE was not running in Administrator mode and 
 * PowerToys was, so SciTE scripts didn't have the clearance to operate while 
 * PowerToys window was active. 
 */
 
/* ;;TEST
 * ;~ Numpad1::Send, {Left 5}			; worked in editor, like send event
 * ;~ Numpad2::SendEvent, {Left 5}	; worked in editor, seemed smooth, might end up slower
 * ;~ Numpad3::SendInput, {Left 5}	; worked in editor, seemed like fastest one
 * ;~ Numpad4::SendPlay, {Left 5}		; did not work in editor.
 * ;~ Numpad5::SendRaw, {Left 5}		; worked in editor, it typed out "{Left 5}"
 */


NumpadSub::
	;;reduce window to minimin size possible 64x 72y
	repeatShiftKey("Down", 100, 2)
	repeatShiftKey("Left", 100, 2)
	;;increase
	repeatCtrlShiftKey("Right", 3, 2)
	repeatCtrlShiftKey("Up", 4, 1)
	repeatShiftKey("Right", 36, 1)
	repeatShiftKey("Up", 32, 1)
	Send, {Tab}
    return

Pause::ExitApp



