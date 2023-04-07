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