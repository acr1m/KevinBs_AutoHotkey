#HotkeyInterval 1000 ;one second interval
#Hotstring EndChars -()[]{}: "/\.?!`n
#InstallKeybdHook
#KeyHistory 500  ;(Default is 40, Max is 500)
#MaxHotkeysPerInterval 1000 ;1 thousand keys per above interval
#SingleInstance Force

Menu, Tray, MainWindow
Menu, Tray, Icon, % "E:\Assets\Icons\keyboards\msctf_410.ico"
DetectHiddenWindows, On ;; Allows a script's hidden main window to be detected.
SetTitleMatchMode, 2 ;; 2 = A window's title can contain WinTitle anywhere inside it to be a match.

Lbl_Global_Constants: ;{
global g_PRIMARY_MOUSE := "Left"
global g_SWAP_RETVAL := 
global g_DOUBLE_TAP_LIMIT:= 350 ; n milliseconds
global SCROLL_WHEEL_GRAVITY := 4
;}

Lbl_Global_Variables: ;{
global isAdmin := A_IsAdmin
global isCompiled := A_IsCompiled
global g_oneKey_HasItBeenSet := false
global g_main_lastActiveWindow := ""
global g_scrollWheel_deltaTime
global g_scrollWheel_scrollAmount
global g_scrollWheel_startTime
;}

;; block of #Include libraries and utilities
Lbl_Include_Block:

;; LIBRARIES
#Include %A_ScriptDir%\_lib ;{ 
#Include LIB_Main_Method_Library.ahk
#Include LIB_Emojis_And_Symbols.ahk
#Include LIB_repeatKey().ahk
#Include LIB_time().ahk
#Include LIB_RegEx().ahk
;~ #Include LIB_oneKey_Copy_Paste_Mode.ahk  ;}

;; UTITILITIES
#Include %A_ScriptDir%\_utility ;{ 
#Include UTILITY_Horizontal_Scrolling.ahk
#Include UTILITY_Generate_Lorem_Ipsum.ahk  ;}

;; GUI's
#Include %A_ScriptDir% ;{ 
#Include _gui\GUI_Mouse_Control.ahk 
;~ #Include AHK_Math_Keyboard_v1_2_7.ahk
;~ Run, AHK_Math_Keyboard_.exe  ;}

;; WINDOW/APP CONTEXT SENSITIVE SCRIPTS
#Include %A_ScriptDir%\_win ;{ 
#Include WIN_Windows_Color_Picker.ahk
#Include WIN_Excel.ahk
#Include WIN_Outlook.ahk
#Include WIN_SciTE4AutoHotkey.ahk
#Include WIN_FancyZones.ahk
#Include WIN_Windows_Explorer.ahk
#Include WIN_PowerRun.ahk
#Include WIN_Word.ahk
#Include SmartGUI_WIN.ahk
#Include Sticky-Notes-WIN.ahk   ;}

;; BREAKER-SWITCH - activates when pressing Ctrl+Alt+Shift+{Pause}
^!+CtrlBreak::ExitApp

;; SUB-SCRIPT BREAKER-SWITCH
Pause:: ;{
	DetectHiddenWindows, On ;; Allows a script's hidden main window to be detected.
	SetTitleMatchMode, 2 ;; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
	WinClose, temp_macro.exe
	WinClose, UTILITY_Cut_Copy_Paste_(pause_to_break).exe
	return  ;}

;{ WINDOWS KEY SHORTCUTS & SOFTWARE OPEN/START/RUN SHORTCUTS
;        OPEN FILES, OPEN SOFTWARE, OPEN PROGRAMS, OPEN APPLICATIONS, OPEN APPS
;}

;; show mouse position tooltip
Lbl_Show_Mouse_Position_Tooltip: ;{ 
^#AppsKey::Run, "AHK_Utility_Mouse_Position_As_Percentage_Tooltip.exe"  ;}

Lbl_Open_NotepadPP: ;{ 
#n::Run, "Notepad++"
;~ #a::Run, E:\Software\AutoHotKey\SciTE\SciTE.exe ;}

Lbl_Open_SciTE: ;{ 
#IfWinActive
#a::Run, "E:\Software\AutoHotkey_MyInstallation_v01\SciTE\SciTE.exe" ;}

Lbl_Open_Voicemeeter: ;{ 
#s::Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe" ;}

Lbl_Open_Windows_Sound_Control_Panel: ;{ 
^#s::Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat" ;}

;; currently on-hold
Lbl_Left_Mouse_Button: ;{
;{ ~*LButton:: ;{ 
;        	if (g_PRIMARY_MOUSE == "Right"){
;        		KeyWait, LButton, t2 ;wait for 2 seconds
;        		if (ErrorLevel == 1){
;        			;~ if (WinExist("Mouse Control Panel"))
;        			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
;        				WinActivate
;        			else
;        				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_GUI_Mouse_Control.exe
;        				;~ gosub GUI_Mouse_Control
;        				gosub GuiShow_Mouse_Control
;        			return
;        		}
;        		else
;        			return
;        	}
;        	return  ;}
;} ;}

;; currently on-hold
Lbl_Right_Mouse_Button: ;{
;{ ~*RButton:: ;{ 
;        	;start timer
;        	mouseControlPanelTimer := A_TickCount
;        	if (g_PRIMARY_MOUSE == "Left"){
;        		KeyWait, RButton, t2 ;wait for 2 seconds
;        		if (ErrorLevel == 1){
;        			;~ if (WinExist("Mouse Control Panel"))
;        			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
;        				WinActivate
;        			else
;        				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_GUI_Mouse_Control.exe
;        				;~ gosub GUI_Mouse_Control
;        				gosub GuiShow_Mouse_Control
;        			return
;        		}
;        		else
;        			return
;        	}
;        	return  ;}
;}
;}


;; shows the amount of scroll-wheel inputs sent as a tooltip following the mouse
Lbl_Run_Scroll_Speed_Tooltip:
#MButton:: ;{ 
	;; Run, % "Autohotkey.exe" A_ScriptDir . "\_gui\GUI_Scroll_Speed_Monitoring.ahk"
	;; "E:\Library\OneDrive\Documents\AutoHotkey\Custom Scripts\_gui\GUI_Scroll_Speed_Monitoring.ahk"
	Run, autohotkey.exe %A_ScriptDir%\_gui\GUI_Scroll_Speed_Monitoring.ahk
	return  ;}
;; this section handles the method of scroll-wheel input-output speed
Lbl_Scroll_Wheel_Speed:
~$WheelUp:: ;{ 
	main_scrollMethod_01()
	return  ;}
~$WheelDown:: ;{ 
	main_scrollMethod_01()
	return  ;}

/**	main_scrollMethod_02()vc
	Descr:	Starting from the time of first ScrollWheel input, output speed
				is gradually increased, as long as A_ThisHotkey is 
				'double-tapped' (i.e., 're-triggered') within a given 
				time_limit up to a given max_output_speed.
	Return:	VOID
	Params:	p_timeLimit := INTEGER (default := 500) 'milliseconds'
			p_
	Notes:	utilizes the global variable g_scrollWheel
*/
main_scrollMethod_02(p_timeLimit := 500){
;{ NOTES...
;   scrollWheel range  = [1, 100]
;       I want the mouse to speed up, the longer the wheel has been 'active'.
;       there'd be a lifetime for the max_delta to be active.
;       if the lifetime isn't 'restored' before it runs out, 
;       then it should turn off. 
;   parameters:
;       wheelTimeActive - delta of current lifetime
;       wheelLifeTime - limit of 'admissible' time to elapse 
;       				to still trigger buildup.
;       wheelOutputAmount - 
;       wheelBuildupAmount - amount to build the OutputAmount by.
;}
	
	return
}

/**	main_scrollMethod_01()
	Descr:	Utilizes a logarithmic function for scroll input that goes faster
				when the value of A_TimeSincePriorHotkey is lower. 
	Return:	VOID
	Params:	p_elapsedTimeLimit := INTEGER (default := 500)
	Notes:	
*/
main_scrollMethod_01(p_elapsedTimeLimit := 500){
	if (doubleTap(p_elapsedTimeLimit)){
		if (A_TimeSincePriorHotkey > 10){
			g_scrollWheel_deltaTime := A_TimeSincePriorHotkey + !(A_TimeSincePriorHotkey)
			g_scrollWheel_scrollAmount := Ceil(Abs((Log(g_scrollWheel_deltaTime)/Log(1.5))-15)) ;; https://www.desmos.com/calculator/ogtxptay3x
			if (g_scrollWheel_scrollAmount > 30)
				g_scrollWheel_scrollAmount := 30
			;~ ToolTip % "g_scrollWheel_deltaTime: `t" . g_scrollWheel_deltaTime . "`nint:`t" . int ""
			Send, {A_ThisHotkey %g_scrollWheel_scrollAmount%}
		}
	}
	return
}

;; pass-through 
~AppsKey::AppsKey

;; single-tap = {underscore} and double-tap = {hyphen, i.e., minus}
+Space::_shift_space(shiftSpaceTapCounter)

_shift_space(ByRef p_counter){
	p_counter++
	
	;; when shift+space is hit twice, send -
	if (p_counter == 2 && doubleTap(g_DOUBLE_TAP_LIMIT)){
		Send, -
		return
	} else if (p_counter == 3 && doubleTap(g_DOUBLE_TAP_LIMIT)){
		
		return
	} else {
		Send, {_}
		return
	}
}

;; make the NumpadSub key function exactly like the 'hyphen'-key
+NumpadSub:: Send, {_}

;; swipe to desktop to the left
AppsKey & Left::Send, ^#{Left}

;; swipe to desktop to the right
AppsKey & Right::Send, ^#{Right}

;; undo command
^+z::Send, ^y

;HOLD WINDOWS KEY AND DOUBLE TAP CTRL OR ALT TO MOVE DESKTOPS
;~ #LCtrl
~#LCtrl::
{	if (doubleTap()){
		Send, #^{Left}
	}
	return
}

/** swipes to right desktop when double tapping Left-Alt while holding the windows key down.
*/
~#LAlt::
{	if (doubleTap()){
		Send, #^{Right}
	}
	return
}

;; opens ahk window spy utility gui
#AppsKey::Run, autohotkey.exe %A_AhkPath%\..\WindowSpy.ahk


/**	main_windowTitleAndClassGrabber() [DEPRECATED]
	Descr:	this gets the active window Title name and the Class and stores it into the clipboard.
	Return:	VOID, (sets STRING to Clipboard)
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	[DEPRECATED]
*/
main_windowTitleAndClassGrabber(){
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

;; SCREENSHOT HOTKEYS

;; if double tap, take active window screenshot, else, send ScrollLock
ScrollLock:: ;{ 
	if (doubleTap()){
		SetScrollLockState, Off
		;[Alt+PrtSc] used for ShareX, captures active window region as image.
		Send, !{PrintScreen}
	} else {
		Send, {ScrollLock}
	}
	return  ;}

;NOTEPAD++ 
#IfWinActive ahk_class Notepad++
{
	; [Middle Mouse Button Click]
	MButton::
	{
/*		If hotkey was triggered within g_DOUBLE_TAP_LIMIT,
 *		then activate the doubleTap process and reset the 
 *		listener key to false for the next occurence.
 *		g_DOUBLE_TAP_LIMIT approximately 350 milliseconds atm 
 */
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < g_DOUBLE_TAP_LIMIT) 
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

#IfWinActive ahk_class Qt5153QWindowOwnDCIcon ahk_exe HD-Player.exe ;{ 
;~ $RButton::LButton
;~ $LButton::RButton  ;}

#IfWinActive ahk_exe audacity.exe ;{ 
$+Space::+Space
  ;}

#IfWinActive ahk_exe mixcraft9.exe ;{ 
^Left::Home
^Right::End
  ;}
  
#IfWinActive

;; ctrl+insert - types out the date in a pre-defined format that is changeable
Lbl_Insert_Date: ;{
^Insert::
	;~ time_sendDate("yyyy")
	time_sendDate()
	return  ;}