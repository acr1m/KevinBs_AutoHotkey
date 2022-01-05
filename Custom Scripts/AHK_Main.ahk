#KeyHistory 500  ;(Default is 40, Max is 500)
#SingleInstance Force
#InstallKeybdHook
;~ #InstallMouseHook
#HotkeyInterval 1000 ;one second interval
#MaxHotkeysPerInterval 1000 ;1 thousand keys per above interval
#Hotstring EndChars -()[]{}: "/\.?!`n

Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Keyboards\msctf_410.ico

;~ global isAdmin := A_IsAdmin
isAdmin := A_IsAdmin
;~ global isCompiled := A_IsCompiled
isCompiled := A_IsCompiled
;;;;CONSTANTS
global PRIMARY_MOUSE := "Left"
global SWAP_RETVAL := 
global DOUBLE_TAP_LIMIT:= 350 ; n milliseconds
global oneKey_HasItBeenSet := false
;###############################################################################
#Include %A_ScriptDir%\_lib
#Include LIB_Main_Method_Library.ahk
#Include LIB_Emojis_And_Symbols.ahk
#Include LIB_repeatKey().ahk
;~ #Include LIB_oneKey_Copy_Paste_Mode.ahk


#Include %A_ScriptDir%
;~ #Include AHK_Math_Keyboard_v1_2_7.ahk
;~ Run, AHK_Math_Keyboard_.exe
#Include AHK_GUI_Mouse_Control.ahk

;WINDOW/APP CONTEXT SENSITIVE SCRIPTS
#Include %A_ScriptDir%\_win
#Include WIN_Windows_Color_Picker.ahk
#Include WIN_Excel.ahk
#Include WIN_Outlook.ahk
#Include WIN_SciTE4AutoHotkey.ahk
#Include WIN_FancyZones.ahk
#Include WIN_Explorer.ahk
#Include WIN_PowerRun.ahk
#Include WIN_Word.ahk
;==============================================================================

;==============================================================================
;WINDOWS KEY SHORTCUTS &&
;SOFTWARE OPEN/START/RUN SHORTCUTS
;OPEN FILES, OPEN SOFTWARE, OPEN PROGRAMS, OPEN APPLICATIONS, OPEN APPS
;===============================================================================
^#AppsKey::Run, "AHK_Utility_Mouse_Position_As_Percentage_Tooltip.exe"
#n::Run, "Notepad++"
;~ #a::Run, E:\Software\AutoHotKey\SciTE\SciTE.exe

#IfWinActive
#a::Run, "E:\Software\AutoHotkey_MyInstallation_v01\SciTE\SciTE.exe"
;Voicemeeter 
;Windows Key + S
#s::Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe"
F20::Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe"
;Sound Control Panel
^#s::Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"
;Windows Excel (#a)
;###############################################################################
;~ HOTSTRING END CHARACTERS
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
	
	;~ `n=[enter], `t=[tab]
	;~ ? (question mark): The hotstring will be triggered even when it is 
		;~ inside another word; that is, when the character typed immediately
		;~ before it is alphanumeric. For example, if :?:al::airline is a 
		;~ hotstring, typing "practical " would produce "practicairline ". 
		;~ Use ?0 to turn this option back off.
;===============================================================================
;~ HOTSTRING OPTIONS 
	;~ #Hotstring SE ; •SE stands for SendEvent, which is the default in versions older than 1.0.43.
	;~ #Hotstring SI 
			; •SI stands for SendInput, which typically has superior speed and 
			;reliability than the other modes. Another benefit is that like 
			;SendPlay below, SendInput postpones anything you type during a 
			;hotstring's auto-replacement text. This prevents your keystrokes 
			;from being interspersed with those of the replacement. When 
			;SendInput is u
	;~ #Hotstring SP ; •SP stands for SendPlay, which may allow hotstrings to work in a broader variety of games.
	;~ #Hotstring O  ; omit ending character (for all hotstrings in document underneath this rule)
	;~ #Hotstring O0  ; turn off "omit ending character" (for all hotstrings in document underneath this rule)
	;~ #Hotstring Kn ; key delay (n = milliseconds) between each sent keystroke
	;~ #Hotstring *  ; turn on No Ending Character Required
	;~ #Hotstring *0 ; turn off No Ending Character Required
	;~ #Hotstring R  ; sends output as raw
	;~ #Hotstring C  ; case sensitive
	;~ #Hotstring C0 ; turn off case sensitive
;===============================================================================
;~ HOTKEY PREFIXES
	;~ [$] prefix keeps the hotkey from triggering itself in a loop
	;~ [~] When the hotkey fires, its key's native function will not 
			;be blocked (hidden from the system). 
	;~ [*] Wildcard: Fire the hotkey even if extra modifiers are being held down. This is often used in conjunction with remapping keys or buttons.
;===============================================================================

;MOUSE - SWITCH PRIMARY MOUSE
;MOUSE CONTROL PANEL (HOLD-RIGHT-CLICK)
;~ ~MButton::
	;~ ;if left or right mouse button down, wait for 2 seconds, 
	;~ ;if 2 seconds passed, then set primary mouse to matching button.
	;~ if (GetMouseState("LButton") == true){
		;~ KeyWait, LButton, t2
		;~ if (ErrorLevel == 1){
			;~ PRIMARY_MOUSE := "Left"
			;~ MsgBox, , Primary Mouse, Primary Mouse has been set to LEFT, 2 ;closes in 2 seconds
		;~ }
	;~ }
	;~ else if (GetKeyState("RButton") == true){
		;~ KeyWait, RButton, t2
		;~ if (ErrorLevel == 1){
			;~ PRIMARY_MOUSE := "Right"
			;~ MsgBox, , Primary Mouse, Primary Mouse has been set to RIGHT, 2 ;closes in 2 seconds
		;~ }
	;~ }
	;~ return
^!m::
	;~ assignPrimaryMouseButton()
	;~ swapPrimaryMouseButton()
	return

~*LButton::
/* 
	Suspend, Permit
	if (PRIMARY_MOUSE == "Left"){
		Click, Left Down
		;~ MouseClick, Left,,,,,D
	}
	else if (PRIMARY_MOUSE == "Right"){
		Click, Right Down
		;~ MouseClick, Right,,,,,D
	}
	else{
		Click, Left Down
		;~ MouseClick, Left,,,,,D
	}
*/
	if (PRIMARY_MOUSE == "Right"){
		KeyWait, LButton, t2 ;wait for 2 seconds
		if (ErrorLevel == 1){
			;~ if (WinExist("Mouse Control Panel"))
			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
				WinActivate
			else
				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_GUI_Mouse_Control.exe
				;~ gosub GUI_Mouse_Control
				gosub GuiShow_Mouse_Control
			return
		}
		else
			return
	}
	return
	
/* 
~*LButton Up::
	Suspend, Permit
	if (PRIMARY_MOUSE == "Left"){
		Click, Left Up
		;~ MouseClick, Left
	}
	else if (PRIMARY_MOUSE == "Right"){
		Click, Right Up
		;~ MouseClick, Right
	}
	else{
		Click, Left Up
		;~ MouseClick, Left
	}
	return
 */
~*RButton::
/* 
	Suspend, Permit
	if (PRIMARY_MOUSE == "Right"){
		Click, Left Down
		;~ MouseClick, Left,,,,,D
	}
	else if (PRIMARY_MOUSE == "Left"){
		Click, Right Down
		;~ MouseClick, Right,,,,,D
	}
	else{
		Click, Right Down
		;~ MouseClick, Right,,,,,D
	} 
*/
	;start timer
	mouseControlPanelTimer := A_TickCount
	if (PRIMARY_MOUSE == "Left"){
		KeyWait, RButton, t2 ;wait for 2 seconds
		if (ErrorLevel == 1){
			;~ if (WinExist("Mouse Control Panel"))
			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
				WinActivate
			else
				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_GUI_Mouse_Control.exe
				;~ gosub GUI_Mouse_Control
				gosub GuiShow_Mouse_Control
			return
		}
		else
			return
	}
	return

/* 
~*RButton Up::
	Suspend, Permit
	if (PRIMARY_MOUSE == "Right")
		Click, Left Up
		;~ MouseClick, Left,,,,,U
	else if (PRIMARY_MOUSE == "Left")
		Click, Right Up
		;~ MouseClick, Right,,,,,U
	else
		Click, Right Up
		;~ MouseClick, Right,,,,,U
	return
 */

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;MOUSE WHEEL
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;===============================================================================
/* ;SCROLL SPEED MONITORING (AS TOOLTIP)
 * ;===============================================================================
 * #Persistent
 * SetTimer, ScrollSpeedMonitor, 50
 * return
 * ;-------------------------------------------------------------------------------
 * ScrollSpeedMonitor:
 * ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . scrollAmount ""
 * return
 */
;===============================================================================
~$WheelUp::
	if (A_PriorHotkey == A_ThisHotkey && A_TimeSincePriorHotkey < 500){
		if (A_TimeSincePriorHotkey < 10)
			return
		else if (A_TimeSincePriorHotkey > 10){
			deltaTime := A_TimeSincePriorHotkey + !(A_TimeSincePriorHotkey)
			
			;basically, the closer the delta time is to 0, the higher the number is
			;use a graphing calculator to visualize the control curve
			;https://www.desmos.com/calculator/a688c7bdoi
			;https://www.desmos.com/calculator/730lsilbdz
			;https://www.desmos.com/calculator/ogtxptay3x
			scrollAmount := Ceil(Abs((Log(deltaTime)/Log(1.5))-15))
					
			;~ ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . int ""
			Send, {WheelUp %scrollAmount%}
		}
	}
	return
~$WheelDown::
	if (A_PriorHotkey == A_ThisHotkey && A_TimeSincePriorHotkey < 500){
		if (A_TimeSincePriorHotkey < 10)
			return
		else if (A_TimeSincePriorHotkey > 10){
			deltaTime := A_TimeSincePriorHotkey + !(A_TimeSincePriorHotkey)
			
			;basically, the closer the delta time is to 0, the higher the number is
			;use a graphing calculator to visualize the control curve
			scrollAmount := Ceil(Abs((Log(deltaTime)/Log(1.5))-15))
			
			;~ ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . int ""
			Send, {WheelDown %scrollAmount%}
		}
	}
	return
;==============================================================================
;HOTKEYS
;==============================================================================
~AppsKey::AppsKey
; Shift+Space = Underscore _
+Space:: Send, {_}
+NumpadSub:: Send, {_}
AppsKey & Left::Send, ^#{Left}
AppsKey & Right::Send, ^#{Right}
;~ $s::
	;~ Send, s
	;~ ; wait for "a" key to be pressed down
	;~ KeyWait, a, D
	
	;~ return

;~ ~s & a::Send, ^#{Left}
^+z::Send, ^y
Click, 


;HOLD WINDOWS KEY AND DOUBLE TAP CTRL OR ALT TO MOVE DESKTOPS
~#LCtrl::
	;~ #LCtrl
	if (doubleTap()){
		Send, #^{Left}
	}
	return
~#LAlt::
	;~ #LAlt
	if (doubleTap()){
		Send, #^{Right}
	}
	return

;Window Title & Class Grabber
;this gets the active window Title name and the Class and stores it into the clipboard.
#AppsKey::
{
	myTitle := 
		WinGetTitle, myTitle, A
		WinGetClass, class, A
	tWindow	:= "Active Window Params are as follows.`n"
	tTitle := "• Title:[" myTitle "].`n"
	tClass := "• Class:[" class "].`n"
	Clipboard := "• Title: [" myTitle "]`n• Class: [" class "]`n"
	tContents := "The contents of the clipboard are as follows:`n"

	;thin horizontal line
	hl1 := "────────────────────────`n"
	;thick horizontal line
	hl2 := "========================`n"
	MsgBox,  %tWindow% %hl1% %tTitle% %tClass% %hl2% %tContents% %hl1% %clipboard%
	return
}
;===============================================================================
;===============================================================================




;===============================================================================
;SCREENSHOT HOTKEYS
;===============================================================================
;if double tap, take active window screenshot, else, send ScrollLock
ScrollLock::
	if (doubleTap()){
		SetScrollLockState, Off
		;[Alt+PrtSc] used for ShareX, captures active window region as image.
		Send, !{PrintScreen}
	} else {
		Send, {ScrollLock}
	}
	return
;-------------------------------------------------------------------------------



;===============================================================================
;NOTEPAD++ =====================================================================
#IfWinActive ahk_class Notepad++
{
	; [Middle Mouse Button Click]
	MButton::
	{
/*		If hotkey was triggered within DOUBLE_TAP_LIMIT,
 *		then activate the doubleTap process and reset the 
 *		listener key to false for the next occurence.
 *		DOUBLE_TAP_LIMIT approximately 350 milliseconds atm 
 */
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < DOUBLE_TAP_LIMIT) 
		{
			; Toggle - Viewing of "Document Map", Panel
			Send, !v
		}
		
	;this is the custom hotkey *in-editor* that directly targets the Toggle Workspace Folder: View, commmand
		Send, !b
		return
	}
}

;~ #IfWinActive TI Connect™ CE ahk_class GlassWndClass-GlassWindowClass-4 ahk_exe TI Connect CE.exe
#IfWinActive ahk_exe TI Connect CE.exe
{
	:O?:sto::{→}
	$/::
		SendRaw, 
		return
	^/::
		KeyWait, Ctrl
		Send, /
		return
	^l::
		SendRaw, ⌊
		return
	;duplicate line
	^d::
		Send, {Home 2}
		Send, +{End}
		Send, ^c
		Send, {End}
		Send, {Enter}
		Send, ^v
		return
}

#IfWinActive ahk_class Qt5153QWindowOwnDCIcon ahk_exe HD-Player.exe
;~ $RButton::LButton
;~ $LButton::RButton

#IfWinActive ahk_exe audacity.exe
$+Space::+Space

#IfWinActive Sticky Notes ahk_class ApplicationFrameWindow ahk_exe ApplicationFrameHost.exe
Tab::
	Send, {Space 4}
	return
+Tab::
	Send, {BackSpace 4}
	return
^+Up:: moveCurrentLineUp()
^+Down:: moveCurrentLineDown()


#IfWinActive ahk_exe mixcraft9.exe
^Left::Home
^Right::End

#IfWinActive

