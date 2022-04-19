
;; LAlt & Space::Send, - {hyphen}
<!Space::Send, -

;; single-tap = _ {underscore}
+Space::
	Send, {_}
	return


/**
 * This sub handles allows user to press...
 *       9 and 0 (either order)
 *         xor
 *       Numpad7 and Numpad8 (either order)
 *   and sends "()" then places text-cursor inside parentheses. 
 * 
 * Implementation Notes:
 *		- Set g_parenthesisWaitTime to the number of seconds you wish 
 *			to wait for tab-input after entering parentheses. 
 * 
 * API Notes:	
 *		Hotkey Options/Flags
 *			$ := only trigger on physical key-press
 *			* := allow triggering with extra modifers (ctrl, shift, alt)
 * 
 */

global g_waitingForTabPress ;; as boolean 
	;; (Note: because this is not in the auto-execute section at the top, this variable can not be assigned a value on this line)

$*9:: 9 ;
$*0:: 0
9 & 0:: sendParentheses()
0 & 9:: sendParentheses()
$*Numpad7:: Numpad7
$*Numpad8:: Numpad8
Numpad7 & Numpad8:: sendParentheses()
Numpad8 & Numpad7:: sendParentheses()
$Tab:: sendTab()

sendParentheses(tSeconds := 5) {	
	
	Send, {LShift Down}90{LShift Up}{Left}
	
	g_waitingForTabPress := true
	
	KeyWait, Tab, D T%tSeconds% ;; wait tSeconds for the Tab key to be pressed, this currently keeps the hotkey from sending multiple sets of parenthesis groups.
	
	if (ErrorLevel == 1) ;; if Tab wasn't pressed in time
		g_waitingForTabPress := false
	return
}


sendTab() {
	if (g_waitingForTabPress) {
		Send, ^{Right}
		g_waitingForTabPress := false
	}
	else {
		Send, {Tab}
		g_waitingForTabPress := false
	}
	return
}

