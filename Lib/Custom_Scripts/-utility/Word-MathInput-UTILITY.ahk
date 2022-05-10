#IfWinActive ahk_exe WINWORD.EXE

#Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk

Tab::Send, {Right}
+Tab::Send, {Left}

:SE:int::\int{Space} ; SE = send event mode
;; :SE:theta::\theta

Right & NumpadDiv:: Send, \sqrt{Space 2}{Left}
Right & Numpad8:: Send, +6{Space}{Left}



; doubletap p for the plus sign
/* $p::
 * 	if (doubleTap()) {
 * 		Send, {BackSpace}+=
 * 	} else {
 * 		Send, p
 * 	}
 * 	return
 */

NumpadMult::
	SendRaw, ⋅
	return

;; math-input, insert square root and edit inner expression.
;; ?::Send, \sqrt{Space 2}{Left}

/* ;; Shift+p
 * $+p::
 * 	if (p_presses > 0) ; SetTimer already started, so we log the keypress instead.
 * 	{
 * 		p_presses += 1
 * 		return
 * 	}
 * 	; Otherwise, this is the first press of a new series. Set count to 1 and start
 * 	; the timer:
 * 	p_presses := 1
 * 	SetTimer, Lbl_sendP, -250 ; Wait for more presses within a 250 millisecond window.
 * 	return
 * 
 * Lbl_sendP:
 * 	if (p_presses = 1) ; The key was pressed once.
 * 	{
 * 		Send, {Blind}p
 * 	}
 * 	else if (p_presses = 2) ; The key was pressed twice.
 * 	{
 * 		SendRaw, +
 * 	}
 * 	else if (p_presses > 2)
 * 	{
 * 		SendRaw, +
 * 	}
 * 	; Regardless of which action above was triggered, reset the count to
 * 	; prepare for the next series of presses:
 * 	p_presses := 0
 * 	return
 */

#IfWinActive