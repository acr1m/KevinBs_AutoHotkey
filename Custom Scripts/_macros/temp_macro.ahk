Pause::ExitApp


;; ahk v1 syntax
/* NumpadSub::
 * {
 * 	SetKeyDelay, 200
 * 	Click, Left 3
 * 	Send, ^c
 * 	Sleep, 200
 * 	Send, !{Tab}
 * 	Sleep, 300
 * 	Send, ^v{Home}
 * 	Send, ^{Right 2}+{End}
 * 	;~ Send, [
 * 	Send, {End}
 * 	Send, {Enter}
 * 	return
 * }
 * 
 * NumpadAdd::
 * {
 * 	SetKeyDelay, 200
 * 	Click, Left 3
 * 	Send, ^c
 * 	Sleep, 200
 * 	Send, !{Tab}
 * 	Sleep, 300
 * 	Send, ^v{Home}
 * 	Send, ^{Right 2}+{End}
 * 	Send, [
 * 	Send, {End}
 * 	Send, {Enter}
 * 	return
 * }
 */


/* NumpadSub::
 * 	SetKeyDelay, 200
 * 	Send, !m
 * 	Sleep, 500
 * 	Send, !u!d{Right}{Enter}
 * 	return
 * 	
 * NumpadSub::
 * 	SetKeyDelay, 10
 * 	Send, !1
 * 	Send, !s
 * 	return
 */
 
;; ahk v2 syntax
/* NumpadSub::
 * {
 * 	SetKeyDelay "200"
 * 	Click "Left 3"
 * 	Send "^c"
 * 	Sleep "200"
 * 	Send "!{Tab}"
 * 	Sleep "300"
 * 	Send "^v^+{Left}[{End}{Enter}"
 * 	;;Click "Right"
 * 	;;Send "{Click 3}"
 * 	return
 * }
 */









