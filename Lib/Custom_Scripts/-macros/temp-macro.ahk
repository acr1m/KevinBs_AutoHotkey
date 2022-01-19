
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_red_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_blue_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_green_white.ico"
Menu, Tray, Icon, % "E:\Assets\Icons\voicemeeter_resources\VoicemeeterMacroButtons_100.ico"

#SingleInstance Force

#Include %A_ScriptDir%\..\-lib
#Include Main-Method-Library-LIB.ahk
#Include Emojis-And-Symbols-LIB.ahk
#Include repeatKey()-LIB.ahk
#Include time()-LIB.ahk
#Include RegEx()-LIB.ahk


global macroSwitch_M1 := false
global macroSwitch_M2 := false
global macroSwitch_M3 := false
global macroSwitch_M4 := false
global macroSwitch_M5 := false

Pause::ExitApp

;; temp start
Lbl_Temp_Macros:


Lbl_Date_Calculator:
^Insert:: ;{ 
	n := 1000
	d := "Days"
	Clipboard := time_translateDate(n, d, "MMMM d, yyyy")
	MsgBox, , % "title", % "message " . time_translateDate(n, d, "MMMM d, yyyy hh:mm:ss")
	return  ;}



/* _______________     _______________ 
  || CapsLock    ||   || Tab         ||
  ||_____________|| + ||_____________|| = 4-Spaces
  |/_____________\|   |/_____________\|
*/

;; Tab::return
;; Tab Up::pasteClipboard("	")

/* _______________     _______________ 
  || CapsLock    ||   || Tab         ||
  ||_____________|| + ||_____________|| = 4-Spaces
  |/_____________\|   |/_____________\|
*/
/* _______________     _______________     _______________ 
  || Shift       ||   || CapsLock    ||   || Tab         ||
  ||_____________|| + ||_____________|| + ||_____________|| = 4-Backspaces
  |/_____________\|   |/_____________\|   |/_____________\|
*/

/* 	- Allow Tab to function like normal on Down trigger, 
		despite being a custom-combination modifier-key for Tab+Space.
	- Also, if CapsLock is ON, 
		- Tab sends 4-Spaces 
		- Shift+Tab sends 4-Backspaces.
*/

/* $*Tab::
{	capsLockIsOn := GetKeyState("CapsLock", "T")
	if (capsLockIsOn){ ;; if CapsLock is ON
		shiftIsDown := GetKeyState("Shift", "P")
		if (shiftIsDown){ ;; if Shift is DOWN
			Send, {Home}{Delete 4}^{Right}
		} else if (!shiftIsDown){ ;; if Shift is UP
			Send, {Space 4}
		}
	} else if (!capsLockIsOn){ ;; if CapsLock is OFF
		Send, {Tab}
	}
	return
}
*/

;; Block the trigger of Shift+Tab Down, only allowing input to send when Tab is released.
/* $+Tab::return
 */
 
/* $+Tab Up::
;; {	KeyWait, Tab
;; 	KeyWait, Shift, D
;; 	Send, +{Tab}
;; 	return 
;; }
*/

/* The hotkey-set below sends 4-spaces when Tab+Space is pressed
;; and sends 4-Backspaces when Tab+Space is pressed while Shift is held down.
;; 
                 _______     ____________ 
                || Tab ||   || Spacebar ||
                ||_____|| + ||__________|| = 4-Spaces
                |/_____\|   |/__________\| 
   _________     _______     ____________ 
  || Shift ||   || Tab ||   || Spacebar ||
  ||_______|| + ||_____|| + ||__________|| = 4-Backspaces
  |/_______\|   |/_____\|   |/__________\|
*/

/* Tab & Space::
{
;; 		The option, 'P', retrieves the 'physical-state' of the key,
;; 			i.e., whether the user is actually holding it down.
;; 	
;;
	
	ks := GetKeyState("Shift", "P")
	OutputDebug, START OF BLOCK,`tks = %ks%
	if (!ks){ ;; if shift is up
		;; ks := GetKeyState("Shift")
		;; OutputDebug, shift is UP,`t`tks = %ks%
		Send, {Space 4}
	} else if (ks){ ;; if shift is down
		;; ks := GetKeyState("Shift")
		;; OutputDebug, shift is DOWN,`t`tks = %ks%
		Send, {Home}{Delete 4}^{Right}
	}
	
	;; ks := GetKeyState("Shift", "P")
	;; OutputDebug, END OF BLOCK,`t`tks = %ks%
	return
} 
*/

;; Macro Buttons on Razer Black Widow Keyboard (M1~M5)
;; ┌──────────┬──────────┬──────────┬──────────┬──────────┐
;; │ M1 = F20 │ M2 = F21 │ M3 = F22 │ M4 = F23 │ M5 = F24 │
;; └──────────┴──────────┴──────────┴──────────┴──────────┘

/** parse the whole document
   ______     _____ 
  || FN || + || 7 || 
  ||____||   ||___||
  |/____\|   |/___\|
*/
F19::macro_00()

/** macro_save_resourceHacker_00
   ______ 
  || M1 || 
  ||____|| 
  |/____\| 
*/
F20::macro_save_iconConvert_00()

;; macro for saving files from (https://online-converting.com/image/)
macro_save_iconConvert_00(){
	;; switch the boolean state
	macroSwitch_M1 := (!macroSwitch_M1)
	
	while (macroSwitch_M1){
		;; open the save dialog
		Send, {Enter}
		;; WinWait, ahk_class #32770 ahk_exe firefox.exe
		;; WinActivate
		Sleep, 2000
		
		;; check the filename
		Clipboard :=
		copySelection()
		ClipWait
		
		if (Clipboard == "Z.ico"){
			Send, !s
			Send, !y
			Sleep, 400
			MsgBox, , % "title", % "hit end of list"
			
			;: Exit
			return
		}
		;; send the file-type and save
		Send, !s
		Send, !y
		Sleep, 400
		Send, {Tab 3}
	}
	return
}


macro_f20_02(){
	macroSwitch_M1 := !macroSwitch_M1
	while (macroSwitch_M1){
		Send, {Right}
		Sleep, 100
	}
}

;; macro for saving resources from Resouce Hacker application
macro_save_resourceHacker_00(){
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

macro_00(){
	;; outVar := RegExReplace(regex_parseDocumentForFunctions(), "\\", "line`")
	;; MsgBox, % "Clipboard Contents on the next line...`n" . outVar
	Clipboard := regex_parseDocumentForFunctions("`r`n")
	
	
	MsgBox, % Clipboard
	
	return
}

/* ______ 
  || M2 || remove whitespace characters
  ||____||
  |/____\|
*/
F21::
{
	regex_convertText_SciTE_API(true)
	return
}

/* ______      ______     _____                          
  || M3 ||░░░░|| FN ||░░░|| 0 || sort lines
  ||____||░OR░||____||░+░||___|| 
  |/____\|░░░░|/____\|░░░|/___\| 
*/            
F22::
{
	regex_selection_sortAndPaste()
	return
}
/* ______      ______     _____ 
  || M4 ||░░░░|| FN ||░░░|| - || parse document
  ||____||░OR░||____||░+░||___||
  |/____\|░░░░|/____\|░░░|/___\|
*/
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
/* ______ 
  || M5 || parse document
  ||____||
  |/____\|
*/
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









