#InstallKeybdHook
#InstallMouseHook
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
Numpad1::Send, {Left 5}			; worked in editor, like send event
Numpad2::SendEvent, {Left 5}	; worked in editor, seemed smooth, might end up slower
Numpad3::SendInput, {Left 5}	; worked in editor, seemed like fastest one
Numpad4::SendPlay, {Left 5}		; did not work in editor.
Numpad5::SendRaw, {Left 5}		; worked in editor, it typed out "{Left 5}"


NumpadSub::
	repeatShiftKey("Down", 100, 2)
	repeatShiftKey("Left", 100, 2)
	repeatCtrlShiftKey("Right", 3, 2)
	repeatCtrlShiftKey("Up", 4, 1)
	repeatShiftKey("Right", 36, 1)
	repeatShiftKey("Up", 32, 1)
	return
a
/* METHOD LIST
 * 
 * repeatShiftKey()
 * repeatCtrlKey()
 * repeatAltKey()
 * repeatCtrlShiftKey()
 * repeatAltShiftKey()
 * repeatCtrlAltShiftKey()
 * 
 * Parameters
 * 		p_key := "K"
 * 		p_keyPressAmount := 1
 * 		p_delayAmount := -1
 * 		p_pressDuration := -1
 * 
 * Description
 * 	repeatKeyepeat command method does a bunch of one 
 * 		thing over and over again
 */

repeatKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, {p_key p_keyPressAmount}
	Send, {%p_key% %p_keyPressAmount%}
	return
}
repeatShiftKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, +{%p_key% %p_keyPressAmount%}
	return
}
repeatCtrlKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, ^{%p_key% %p_keyPressAmount%}
	return
}
repeatAltKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, !{%p_key% %p_keyPressAmount%}
	return
}
repeatCtrlShiftKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, ^+{%p_key% %p_keyPressAmount%}
	return
}
repeatAltShiftKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, !+{%p_key% %p_keyPressAmount%}
	return
}
repeatCtrlAltShiftKey(p_key := "K", p_keyPressAmount := 1, p_delayAmount := -1, p_pressDuration := -1){
	SetKeyDelay, %p_delayAmount%, %p_pressDuration%
	;~ MsgBox, % p_key
	;~ Send, +{p_key p_keyPressAmount}
	Send, ^!+{%p_key% %p_keyPressAmount%}
	return
}

ExitApp

