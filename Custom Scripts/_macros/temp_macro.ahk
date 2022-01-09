#Include %A_ScriptDir%\..\_lib
#Include LIB_Main_Method_Library.ahk
#Include LIB_Emojis_And_Symbols.ahk
#Include LIB_repeatKey().ahk
#Include LIB_time().ahk
#Include LIB_RegEx().ahk

Pause::ExitApp

;; macro buttons on Razer Black Widow Keyboard (M1~M5)
;; M1 - F20
;; M2 - F21
;; M3 - F22
;; M4 - F23
;; M5 - F24

;; M1 (keyboard)
;; F20::

;; M2 (keyboard)
F20::
	copySelection()
	Clipboard := RegEx_SwapLineBreaks()
    Clipboard := RegEx_SwapTabs()
	Clipboard := RegExReplace(Clipboard, "(?:/\*\*)|(?:\*/)")
	Clipboard := RegExReplace(Clipboard, "(?:;; ?)")
	return
F21::
	;; outVar := RegExReplace(RegEx_parseDocumentForFunctions(), "\\", "line`")
	;; MsgBox, % "Clipboard Contents on the next line...`n" . outVar
	RegEx_parseDocumentForFunctions()
	return



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









