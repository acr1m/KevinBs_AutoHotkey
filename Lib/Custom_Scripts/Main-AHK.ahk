#HotkeyInterval 1000 ;one second interval
#Hotstring EndChars -()[]{}: "/\.?!`n
#InstallKeybdHook
#KeyHistory 500  ;(Default is 40, Max is 500)
#MaxHotkeysPerInterval 1000 ;1 thousand keys per above interval
#SingleInstance Force


Menu, Tray, MainWindow
Menu, Tray, Click, 1
Menu, Tray, Default, 
;; Menu, Tray, Icon, % "E:\Assets\Icons\keyboards\msctf_410.ico"
;; the next line is a compiler-directive that assigns the default .exe icon
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\keyboard_keys\case_upper\A.ico
Menu, Tray, Icon, % "E:\Assets\Icons\keyboard_keys\case_upper\A.ico"

DetectHiddenWindows, On ;; Allows a script's hidden main window to be detected.
SetTitleMatchMode, 2 ;;- 2 = A window's title can contain WinTitle anywhere inside it to be a match.
CurrentTheme_obj := new CurrentTheme ;;creates a new CurrentTheme-class-object

/**
 * Rerun this script as admin.
 * 
 * Utilizes the included script library "run()-LIB.ahk" method "run_AsAdmin()"
 * 
 */
run_AsAdmin(,true)

Lbl_Global_Constants: ;{
global g_SCITE_4AHK_EXE := "E:\Software\AutoHotkey_MyInstallation_v01\SciTE\SciTE.exe"
global g_MAIN_AHK_FILE := A_ScriptDir "\Main-AHK.ahk"
;; MsgBox,,, %g_MAIN_AHK_FILE%, 4
global g_EMOJI_AHK_FILE := "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\Emojis-And-Symbols-LIB.ahk"
global g_PWRRUN_AHK_FILE := "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-win\PowerRun-WIN.ahk"
global g_PRIMARY_MOUSE := "Left"
global g_SWAP_RETVAL := 
global g_DOUBLE_TAP_LIMIT := 350 ; n milliseconds
global g_SCROLL_WHEEL_GRAVITY := 4
#Include %A_ScriptDir%\-lib\WM-List-LIB.ahk ;; list of WM_COMMANDS
;}

Lbl_Global_Variables: ;{
global isAdmin := A_IsAdmin
global isCompiled := A_IsCompiled
global g_oneKey_HasItBeenSet := false
global g_main_lastActiveWindow := ""
global g_scrollWheel_deltaTime
global g_scrollWheel_scrollAmount
global g_scrollWheel_startTime
global g_genericTapperCount := 0
global g_b_capsLockState := GetKeyState("CapsLock", "T")
global pid_horizScroll
;}


main_runHorizScrollingUtility()

;; block of #Include libraries and utilities
Lbl_Include_Block:

;; LIBRARIES ;{
#Include %A_ScriptDir%\-lib\Main-Method-Library-LIB.ahk
#Include %A_ScriptDir%\-lib\run()-LIB.ahk
#Include %A_ScriptDir%\-lib\mathKbd()-LIB.ahk
#Include %A_ScriptDir%\-lib\Emojis-And-Symbols-LIB.ahk
#Include %A_ScriptDir%\-lib\repeatKey()-LIB.ahk
#Include %A_ScriptDir%\-lib\time()-LIB.ahk
#Include %A_ScriptDir%\-lib\RegEx()-LIB.ahk
;~ #Include oneKey-Copy-Paste-Mode-LIB.ahk  ;}

;; UTITILITIES ;{
#Include %A_ScriptDir%\-utility\ShareX-Hotkeys-ScreenCapturing-UTILITY.ahk
#Include %A_ScriptDir%\-utility\Generate-Lorem-Ipsum-UTILITY.ahk ;}

/** 	
 * NOTE: Re-factoring as a run-time script instead of included 
 *  into Main-AHK.ahk
 * JUMP: E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Horizontal-Scrolling-UTILITY.ahk
 * WHY: It's common for an application to handle it's own 
 *  Shift+Scrolling (horizontal scrolling) so we are going to 
 *  seperate this script so that the status (OFF/ON) of this utility 
 *  (Side-Scrolling a.k.a. Horizontal-Scrolling) is visible in the 
 *  toolbar of the taskbar. 
*/
main_runHorizScrollingUtility() {	
	;; #Include %A_ScriptDir%\-utility\Horizontal-Scrolling-UTILITY.ahk
	;; Run, %A_ScriptDir%\-utility\Horizontal-Scrolling-UTILITY.ahk,,,pid_horizScroll
	;; targetScript :=  %A_ScriptDir%\-utility\Horizontal-Scrolling-UTILITY.ahk,,,pid_horizScroll
	targetScript :=  A_ScriptDir . "\-utility\Horizontal-Scrolling-UTILITY.ahk",,,pid_horizScroll
	;; MsgBox, %targetScript%
	
	Run, %A_AhkPath% %targetScript%,,,pid_outVar
	pid_horizScroll := pid_outVar
	return
}



;; GUI's ;{
#Include %A_ScriptDir%\-gui\Mouse-Control-GUI.ahk 
;~ #Include AHK-Math-Keyboard-v1-2-7.ahk
;~ Run, AHK_Math_Keyboard_.exe  ;}

;; WINDOW/APP CONTEXT SENSITIVE SCRIPTS ;{
#Include %A_ScriptDir%\-win\Windows-Color-Picker-WIN.ahk
#Include %A_ScriptDir%\-win\Excel-WIN.ahk
#Include %A_ScriptDir%\-win\Outlook-WIN.ahk
;; #Include %A_ScriptDir%\-win\SciTE4AutoHotkey-WIN.ahk
#Include %A_ScriptDir%\-win\FancyZones-WIN.ahk
#Include %A_ScriptDir%\-win\Windows-Explorer-WIN.ahk
#Include %A_ScriptDir%\-win\PowerRun-WIN.ahk
#Include %A_ScriptDir%\-win\Word-WIN.ahk
#Include %A_ScriptDir%\-win\SmartGUI-WIN.ahk
#Include %A_ScriptDir%\-win\Sticky-Notes-WIN.ahk 
#Include %A_ScriptDir%\-win\firefox-WIN.ahk 
#Include %A_ScriptDir%\-win\IntelliJ-WIN.ahk 
#Include %A_ScriptDir%\-win\Mixcraft9-WIN.ahk
;}



;==BREAKER SWITCH AND SUB-SCRIPTS=====================================

;; BREAKER-SWITCH - activates when pressing Ctrl+Alt+Shift+{Pause}
^!+CtrlBreak::ExitApp

;; SUB-SCRIPT BREAKER-SWITCH
Pause:: ;{
	DetectHiddenWindows, On ;; Allows a script's hidden main window to be detected.
	SetTitleMatchMode, 2 ;; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
	WinClose, temp-macro.exe
	WinClose, Cut-Copy-Paste-(pause-to-break)-UTILITY.exe
	return  ;}


	
	

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*	OPEN / START / RUN  - HOTKEYS
	WINDOWS-KEY
	OPEN FILES, OPEN SOFTWARE, OPEN PROGRAMS, OPEN APPLICATIONS, OPEN APPS
*/

;{ !^+Space:: ;{
;       	global g_hyphenSpacingStatus
;       	
;       	;; if g_hyphenSpacingStatus hasn't been initialized yet...
;       	if (g_hyphenSpacingStatus == "") {
;       		g_hyphenSpacingStatus := "OFF"
;       	}
;       	
;       	if (g_hyphenSpacingStatus == "ON") {
;       		
;       		;; if successfully closed, g_hyphenSpacingStatus := "OFF"
;       		if (Close_Hyphen_Spacing_UTILITY()) {
;       			g_hyphenSpacingStatus := "OFF"
;       		}
;       		
;       		MsgBox, , g_hyphenSpacingStatus = %g_hyphenSpacingStatus%, 2
;       		
;       	} 
;       	else if (g_hyphenSpacingStatus == "OFF") {
;       		
;       		;; if successfully opened, g_hyphenSpacingStatus := "ON"
;       		if (Run_Hyphen_Spacing_UTILITY()) {
;       			g_hyphenSpacingStatus := "ON"
;       		}
;       		
;       		MsgBox, , g_hyphenSpacingStatus = %g_hyphenSpacingStatus%, 2
;       		
;       	}
;       	
;       	return ;}
;       	
;       Close_Hyphen_Spacing_UTILITY() {
;       	
;       	;; if it does exist, then close it
;       	if (WinExist("Hyphen-Spacing-UTILITY.ahk")) {
;       		WinClose, Hyphen-Spacing-UTILITY.ahk
;       	}
;       	
;       	;; check for success/failure
;       	if (ErrorLevel == 0) {
;       		;; success
;       		retVal := true
;       	}
;       	else if (ErrorLevel != 0) {
;       		;; fail
;       		retVal := false
;       	}
;       	
;       	return retVal
;       }
;       
;       Run_Hyphen_Spacing_UTILITY() {
;       	s_file := A_ScriptDir "\-utility\Hyphen-Spacing-UTILITY.ahk"
;       	
;       	;; if it doesn't exist, then run it
;       	if (!WinExist("Hyphen-Spacing-UTILITY.ahk")) {
;       		Run, autohotkey.exe %s_file%
;       	}
;       	
;       	;; check for success/failure
;       	if (ErrorLevel == 0) {
;       		;; success
;       		retVal := true
;       	}
;       	else if (ErrorLevel != 0) {
;       		;; fail
;       		retVal := false
;       	}
;       	
;       	return retVal
;       }
;}

Lbl_Run_Copy_Paste_Simple:
^F23::
	v_file := A_ScriptDir . "\-shortcuts\Cut-Copy-Paste-(pause-to-break)-UTILITY.exe-Shortcut.lnk"
	Run, explorer %v_file%
	return

Lbl_Run_Temp_Macro:
^F24::
	v_file := A_ScriptDir . "\-shortcuts\temp-macro.exe-Shortcut.lnk"
	Run, explorer %v_file%
	return

;; show mouse position tooltip
Lbl_Run_Mouse_Position_Tooltip:
^#AppsKey::Run, "AHK-Utility-Mouse-Position-As-Percentage-Tooltip.exe"

Lbl_Run_NotepadPP:
#n::Run, "Notepad++"
;~ #a::Run, E:\Software\AutoHotKey\SciTE\SciTE.exe


#IfWinActive ;; if any window is active 


;; [WINDOWS+A] <=> MY_WINDOWS_HOTKEY-SEQUENCE_LISTENER;;


class windowsAEventHandler {
	
	; this is the constructor method for this class
	;
	; Equivalent to... <Java>
	;	public static void className(p1, p2){this.p1 = p1; this.p2 = p2;}
	__New(param1, param2) {
		this.property1 := param1
		this.property2 := param2 
	}
	
	toMessageBox() {
		MsgBox, , % "windowsAEventHandler", % "hello from windowsAEventHandler Class `n" . this.Name . "`nend of output-string." ; 
	}
	
}

myWindowsAEventHandler = new windowsAEventHandler ;; instantiate a clone of a class


#a::Run, % g_SCITE_4AHK_EXE ;; global variable, defined at top of this script


/* #a::	
 * 	SetTimer, % windowsAEventHandler, 3000 ; 1000 = 1 second
 * 	KeyWait a ;; wait for a to be released before completely exiting this thread.
 * 	return
 * 
 * 
 * 
 * #a up::
 * 
 * 	Run, % g_SCITE_4AHK_EXE ;; global variable, defined at top of this script
 */





Lbl_Run_Voicemeeter:
#s::Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe"

Lbl_Run_Windows_Sound_Control_Panel: 
^#s::Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"

;; currently on-hold
Lbl_Left_Mouse_Button: ;{
;{ ~*LButton:: ;{ 
;        	if (g_PRIMARY_MOUSE == "Right") {
;        		KeyWait, LButton, t2 ;wait for 2 seconds
;        		if (ErrorLevel == 1) {
;        			;~ if (WinExist("Mouse Control Panel"))
;        			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
;        				WinActivate
;        			else
;        				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK-GUI-Mouse-Control.exe
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
;        	if (g_PRIMARY_MOUSE == "Left") {
;        		KeyWait, RButton, t2 ;wait for 2 seconds
;        		if (ErrorLevel == 1) {
;        			;~ if (WinExist("Mouse Control Panel"))
;        			if (WinExist("Mouse Control Panel ahk_class AutoHotkeyGUI"))
;        				WinActivate
;        			else
;        				;~ Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK-GUI-Mouse-Control.exe
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
	;; Run, % "Autohotkey.exe" A_ScriptDir . "\-gui\GUI-Scroll-Speed-Monitoring.ahk"
	;; "E:\Library\OneDrive\Documents\AutoHotkey\Custom Scripts\-gui\GUI-Scroll-Speed-Monitoring.ahk"
	Run, autohotkey.exe %A_ScriptDir%\-gui\GUI-Scroll-Speed-Monitoring.ahk
	return  ;}
;; this section handles the method of scroll-wheel input-output speed
Lbl_Scroll_Wheel_Speed:

~$WheelUp:: ;{ 
	i := main_scrollMethod_01() - 1
	Send, {Blind}{WheelUp %i%}
	return  
;}
	
~$WheelDown:: ;{ 
	i := main_scrollMethod_01() - 1
	main_scrollMethod_01()
	Send, {Blind}{WheelDown %i%}
	return  
;}





;; _shift_space() - handles the output of the shift+space hotkey
_shift_space() {
	;; check for prior-hotkey and handle the current times tapped
	if (A_PriorHotkey != A_ThisHotkey) {
		if (doubleTap(g_DOUBLE_TAP_LIMIT)) {
			g_genericTapperCount := 1
			Send, {_}
			return
		}
	} else if (A_PriorHotkey == A_ThisHotkey) {
		g_genericTapperCount := 2
		;; when shift+space is hit twice, send -
		if (doubleTap(g_DOUBLE_TAP_LIMIT)) {
			Send, {Backspace}-
			g_genericTapperCount := 0
			return
		} else {
			Send, {_}
			g_genericTapperCount := 1
			return
		}
	} else {
		Send, {_}
		g_genericTapperCount := 1
		return
	}
}

;; make the NumpadSub key function exactly like the 'hyphen'-key
+NumpadSub:: Send, {_}

;; swipe to desktop to the left
AppsKey & Left::Send, ^#{Left}

;; swipe to desktop to the right
AppsKey & Right::Send, ^#{Right}

;; undo commandv
^+z::Send, ^y

;; re-map default Windows-Key behavior, [LWin] => WinPaste, [LWin+z] => [LWin]
Lbl_WindowsKey_Paste:
;; LWin Up::MsgBox, , % "LWin", % "LWin: Up`nTickCount = " . A_TickCount . "`nA_Now = " . A_Now, 0

;{ ;; LWin::
;       	;; return
;       ;; $LWin Up::Send, #v
;       
;       ;; LControl & LWin Up::
;       ;; $!LWin::
;       	;; Send, {LWin}
;       	;; MsgBox, % "Send, {LWin}"
;       	;; return
;}

;HOLD WINDOWS KEY AND DOUBLE TAP CTRL OR ALT TO MOVE DESKTOPS
;~ #LCtrl
~#LCtrl::
{	if (doubleTap()) {
		Send, #^{Left}
	}
	return
}

/** swipes to right desktop when double tapping Left-Alt while holding the windows key down.
*/
~#LAlt::
{	if (doubleTap()) {
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
main_windowTitleAndClassGrabber() {
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

;; this targets the script-debug\-window from the tray-icon
#IfWinActive E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom-Scripts\AHK-Main.ahk - AutoHotkey v1.1.33.10 ahk_class AutoHotkey ahk_exe AutoHotkey.exe
k:: ;{
	Send, ^k
	return
;}
Space::F5


;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive

#IfWinActive

;; ctrl+insert - types out the date in a pre-defined format that is changeable
Lbl_Insert_Date: ;{
^Insert::
	;~ time_sendDate("yyyy")
	time_sendDate()
	return  ;}

;; open ShareX - main window
XButton1::
	Send, !^+9
	;; Send, +{PrintScreen}
	;; Run, explorer E:\Library\OneDrive\Documents\ShareX\Screenshots
	return

;; open screenshots folder
;; XButton1 = MButton4 = Mouse-Back-Button
+XButton1::
	;; Send, !^+9
	if (WinExist("E:\Library\OneDrive\Documents\ShareX\Screenshots"))
		WinActivate
	else
		Run, explorer E:\Library\OneDrive\Documents\ShareX\Screenshots
	return

;; re-map 'back-mouse-button' to 'PrintScreen'
;; XButton2 = MButton5 = Mouse-Forward-Button
*XButton2::
	Send, {Blind}{PrintScreen}
	return

;; i want to add a tab function, when i hold capslock and press tab, it pastes a tab character down...
Lbl_CapsLock_Functionality:

;{ By default, 
;       {CapsLock down} => Toggles CapsLockState && Sends {CapsLock down}
;       {CapsLock up}   => Sends {CapsLock up}
;}

CapsLock::
	SetStoreCapslockMode, Off
	
	;; (functionally bypasses the {CapsLock down} key-stroke)
	SetCapsLockState, % g_b_capsLockState
	;; functionally renders the {CapsLock down} action inert
	;; SetCapsLockState, % !GetKeyState("CapsLock", "T") ;; requires [v1.1.30+]
	return

CapsLock up::
	SetStoreCapslockMode, Off
	
	;; toggle the current global-CapsLock-state and set current-state to stored-global-state
	g_b_capsLockState := !g_b_capsLockState
	SetCapsLockState, % g_b_capsLockState
	
	;; caps_initKeyState := GetKeyState("CapsLock", "T") ;; requires [v1.1.30+]
	;; SetCapsLockState, % !caps_initKeyState
	
	return

CapsLock & Tab::
	SetStoreCapslockMode, Off	
	pasteClipboard("	")
	return




;; Retrofitted code from - https://www.autohotkey.com/docs/commands/SetTimer.htm
LWin::
	KeyWait, LWin
	if (lwin_pressCount > 0) ; SetTimer already started, so we log the keypress instead.
	{
		lwin_pressCount += 1
		return
	}
	; Otherwise, this is the first press of a new series. Set count to 1 and start
	; the timer:
	lwin_pressCount := 1
	SetTimer, Lbl_LWin, % (-1 * g_DOUBLE_TAP_LIMIT) ; Wait for more presses within a 400 millisecond window.
	return

Lbl_LWin:
	if (lwin_pressCount == 1) ; The key was pressed once.
	{
		;; windows key - send a regular windows key press
		KeyWait, LWin
		Send, {LWin}
	}
	else if (lwin_pressCount == 2) ; The key was pressed twice.
	{
		;; win+space - change windows keyboard language
		KeyWait, LWin
		Send, #{Space}
	}
	else if (lwin_pressCount > 2)
	{
		;; win+space - change windows keyboard language
		KeyWait, LWin
		Send, #{Space}
	}
	; Regardless of which action above was triggered, reset the count to
	; prepare for the next series of presses:
	lwin_pressCount := 0
	return

;; 2022-02-08_01-00-46_PM - adding new functionality
;; todo - double-tap windows key to switch languages (like hitting Win+Space)
;; <#Space::Send, !<#{Space}
<#Space::Send, {Alt down}{LWin down}{Space}{LWin up}{Alt up}

;; 2022-02-08_01-02-00_PM
;; todo - change powerrun launch-hotkey from win+space to win+alt+space 
!<#Space::Send,  {Alt down}{LWin down}{Space}{LWin up}{Alt up}

;; LAlt & Space::Send, -
<!Space::Send, -

;; pass-through 
~AppsKey::AppsKey

;; single-tap = {underscore} and double-tap = {hyphen, i.e., minus}
+Space::
	;; shiftSpaceTapCounter := g_genericTapperCount
	;; _shift_space(shiftSpaceTapCounter)
	;; _shift_space()
	Send, {_}
	return
