
Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_red_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_blue_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_green_white.ico"
#SingleInstance Force

#Include %A_ScriptDir%\..\_lib
#Include LIB_Main_Method_Library.ahk
#Include LIB_Emojis_And_Symbols.ahk
#Include LIB_repeatKey().ahk
#Include LIB_time().ahk
#Include LIB_RegEx().ahk

Pause::ExitApp
global macroSwitch_M1 := false
global macroSwitch_M2 := false
global macroSwitch_M3 := false
global macroSwitch_M4 := false
global macroSwitch_M5 := false
;;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;; temp start
Tab::Tab
~Tab & Space::
{
	ks := GetKeyState("Shift")
	OutputDebug, START OF BLOCK,`tks = %ks%
	;; if shift is up
	if (!GetKeyState("Shift")){
		ks := GetKeyState("Shift")
		OutputDebug, shift is UP,`t`tks = %ks%
	        Send, {Space 4}
	}
	;; if shift is down
	else if (GetKeyState("Shift")){
		ks := GetKeyState("Shift")
		OutputDebug, shift is DOWN,`t`tks = %ks%
		Send, {Delete 4}
	}
	ks := GetKeyState("Shift")
	OutputDebug, END OF BLOCK,`t`tks = %ks%
	return
}
;: temp end
;;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;; Macro Buttons on Razer Black Widow Keyboard (M1~M5)
;; ┌──────────┬──────────┬──────────┬──────────┬──────────┐
;; │ M1 = F20 │ M2 = F21 │ M3 = F22 │ M4 = F23 │ M5 = F24 │
;; └──────────┴──────────┴──────────┴──────────┴──────────┘

;; M1 - parse the whole document
F20::macro_f20_01()

macro_f20_02(){
	macroSwitch_M1 := !macroSwitch_M1
	while (macroSwitch_M1){
		Send, {Right}
		Sleep, 100
	}
}
macro_f20_01(){
	;; switch the boolean state
	macroSwitch_M1 := (!macroSwitch_M1)
	
	while (macroSwitch_M1){
		;; open the save dialog
		Send, {AppsKey}{Down}{Enter}
		Sleep, 500
		
		;; check the filename
		Clipboard :=
		copySelection()
		ClipWait
		if (Clipboard == "PNG40082..*"){
			Send, {End}{BackSpace 3}.png{Enter}y
			Sleep, 400
			MsgBox, , % "title", % "hit end of list"
			
			;: Exit
			return
		}
		;; send the file-type and save
		Send, {End}{BackSpace 3}.png{Enter}y
		Sleep, 400
		Send, {Down}
	}
	return
}

macro_f20_00(){
	;; outVar := RegExReplace(regex_parseDocumentForFunctions(), "\\", "line`")
	;; MsgBox, % "Clipboard Contents on the next line...`n" . outVar
	Clipboard := regex_parseDocumentForFunctions("`r`n")
	
	
	MsgBox, % Clipboard
	
	return
}
;; M2 - remove whitespace characters
;; prep for "user.ahk.api" documentation
F21::
{
	regex_convertText_SciTE_API(true)
	return
}

;; M3 - sort lines
F22::
{
	regex_selection_sortAndPaste()
	return
}
;; M4 - parse document
F23::
{	
	Clipboard := regex_parseDocumentForFunctions("`r`n")
	;: MsgBox, % Clipboard
	;;: regex_selection_removeCommentDelimiters()
	;;: regex_selection_swapLineBreaksAndTabs("\\n", "\\t")
	
	regex_clipboard_removeCommentDelimiters()
	;: MsgBox, % Clipboard
	
	;: regex_clipboard_swapLineBreaksAndTabs("\\n", "\\t")
	;: MsgBox, % Clipboard
	;;: regex_selection_sortAndPaste()
	
	;: regex_clipboard_sort()
	;: MsgBox, % Clipboard
	
	FileAppend, %Clipboard%, E:\Library\OneDrive\Documents\AutoHotkey\SciTE\user2.ahk.api
	return
}
F24::
{	
	Clipboard := regex_parseDocumentForFunctions("`r`n")
	;: MsgBox, % Clipboard
	;;: regex_selection_removeCommentDelimiters()
	;;: regex_selection_swapLineBreaksAndTabs("\\n", "\\t")
	
	regex_clipboard_removeCommentDelimiters()
	;: MsgBox, % Clipboard
	
	regex_clipboard_swapLineBreaksAndTabs("\\n", "\\t")
	;: MsgBox, % Clipboard
	;;: regex_selection_sortAndPaste()
	
	;: regex_clipboard_sort()
	;: MsgBox, % Clipboard
	
	FileAppend, %Clipboard%, E:\Library\OneDrive\Documents\AutoHotkey\SciTE\user3.ahk.api
	return
}

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









