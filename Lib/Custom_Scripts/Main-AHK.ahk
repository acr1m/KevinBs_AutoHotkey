/* Jump List
 * ;; Lbl_Global_Constants: ;{
 * ;; Lbl_Global_Variables: ;{
 * ;; LIBRARIES ;{
 * ;; UTITILITIES ;{
 * ;; WINDOW/APP CONTEXT SENSITIVE SCRIPTS ;{
 */

#HotkeyInterval 1000 ;one second interval
#Hotstring EndChars -()[]{}: "/\?!`n
#InstallKeybdHook
#KeyHistory 500  ;(Default is 40, Max is 500)
#MaxHotkeysPerInterval 1000 ;1 thousand keys per above interval
#SingleInstance Force
#Persistent
#Include %A_ScriptDir%\-lib\TrayIconManager-LIB.ahk

;; set the icon references
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\main-ahk-icon-green_2.ico
trayIM := new TrayIconManager()
trayIM.iconActive := "E:\Assets\Icons\_used-icons\main-ahk-icon-green_2.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\main-ahk-icon-blue_2.ico"
trayIM.iconPaused := "E:\Assets\Icons\_used-icons\main-ahk-icon-yellow_2.ico"
trayIM.iconInactive := "E:\Assets\Icons\_used-icons\main-ahk-icon-red_2.ico"
trayIM.start()

DetectHiddenWindows, On ;; Allows a script's hidden main window to be detected.
SetTitleMatchMode, 2 ;;- 2 = A window's title can contain WinTitle anywhere inside it to be a match.
CurrentTheme_obj := new CurrentTheme ;;creates a new CurrentTheme-class-object

/**
 * Rerun this script as admin.
 * Utilizes the included script library "run()-LIB.ahk" method "run_AsAdmin()"
 */
run_AsAdmin(,false) ; (,true) = show msgbox result

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



return
;; end of auto-execute section------------------------------------------



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
;~ #Include oneKey-Copy-Paste-Mode-LIB.ahk  
;}

;; UTITILITIES ;{
#Include %A_ScriptDir%\-utility\ShareX-Hotkeys-ScreenCapturing-UTILITY.ahk
#Include %A_ScriptDir%\-utility\Generate-Lorem-Ipsum-UTILITY.ahk
#Include %A_ScriptDir%\-utility\Time-Calculator-UTILITY.ahk
;}

/** 	
 * Note
 *   Re-factoring as a run-time script instead of included 
 *   into Main-AHK.ahk
 * Jump To File
 *   E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Horizontal-Scrolling-UTILITY.ahk
 * Why?
 *   It's common for an application to handle it's own 
 *   Shift+Scrolling (horizontal scrolling) so we are going to 
 *   seperate this script so that the status (OFF/ON) of this utility 
 *   (Side-Scrolling a.k.a. Horizontal-Scrolling) is visible in the 
 *   toolbar of the taskbar. 
*/
main_runHorizScrollingUtility() {
	targetScript :=  A_ScriptDir . "\-utility\Horizontal-Scrolling-UTILITY.ahk",,,pid_horizScroll
	;; MsgBox, %targetScript%
	
	Run, %A_AhkPath% %targetScript%,,,pid_outVar
	pid_horizScroll := pid_outVar
	return
}



;; GUI's ;{
;; #Include %A_ScriptDir%\-gui\Mouse-Control-GUI.ahk 
;~ #Include AHK-Math-Keyboard-v1-2-7.ahk
;~ Run, AHK_Math_Keyboard_.exe  
;}

;; WINDOW/APP CONTEXT SENSITIVE SCRIPTS ;{
#Include %A_ScriptDir%\-win\Windows-Color-Picker-WIN.ahk
#Include %A_ScriptDir%\-win\Excel-WIN.ahk
#Include %A_ScriptDir%\-win\Outlook-WIN.ahk
;; #Include %A_ScriptDir%\-win\SciTE4AutoHotkey-WIN.ahk
#Include %A_ScriptDir%\-win\FancyZones-WIN.ahk
#Include %A_ScriptDir%\-win\Windows-Explorer-WIN.ahk
#Include %A_ScriptDir%\-win\PowerRun-WIN.ahk
#Include %A_ScriptDir%\-win\pwrRun-date01-WIN.ahk
#Include %A_ScriptDir%\-win\Word-WIN.ahk
#Include %A_ScriptDir%\-win\SmartGUI-WIN.ahk
#Include %A_ScriptDir%\-win\Sticky-Notes-WIN.ahk 
#Include %A_ScriptDir%\-win\firefox-WIN.ahk 
#Include %A_ScriptDir%\-win\IntelliJ-WIN.ahk 
#Include %A_ScriptDir%\-win\Mixcraft9-WIN.ahk
#Include %A_ScriptDir%\-win\GenshinImpact-WIN.ahk
#Include %A_ScriptDir%\-win\Notepad-WIN.ahk
#Include %A_ScriptDir%\-win\ShareX-WIN.ahk
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

Lbl_Run_Voicemeeter:
#s::Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe"

Lbl_Run_Windows_Sound_Control_Panel: 
^#s::Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"

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

;; Redo (alternative command)
^+z::Send, ^y

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
	:o:L1::L₁
	:o:L2::L₂
	:o:L3::L₃
	:o:L4::L₄
	:o:L5::L₅
	:o:L6::L₆
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
	time_sendDate("yyyyMMdd_HHmmss")
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

;; double-tap windows key to switch languages (like hitting Win+Space)
<#Space::Send, {Alt down}{LWin down}{Space}{LWin up}{Alt up}

;; change powerrun launch-hotkey from win+space to win+alt+space 
!<#Space::Send,  {Alt down}{LWin down}{Space}{LWin up}{Alt up}

;; pass-through 
~AppsKey::AppsKey

;; LAlt & Space::Send, - {hyphen}
<!Space::Send, -

;; single-tap = _ {underscore}
+Space::
	Send, {_}
	return


/*
 * API Notes:	
 *		Hotkey Options/Flags
 *			$ := only trigger on physical key-press
 *			* := allow triggering with extra modifers (ctrl, shift, alt)
 */

global g_waitingForTabPress ;; as boolean 
;; (Note: because this is not in the auto-execute section at the top, 
;;    this variable can not be assigned a value on this line)

;; Sends "+" or "()"
NumpadAdd::
	numpad0_isDown := GetKeyState("Numpad0", "P")
	numpad0_isUp := !numpad0_isDown
	
	if (numpad0_isDown)	{
		Send, {BackSpace}{(}{)}{Left}
	}
	else {
		main_sendIfPressed()
	}
	return
NumpadAdd up::
	main_sendIfReleased()
	return

$Tab::
	sendTab()
	return

NumpadDot::
	numpad0_isDown := GetKeyState("Numpad0", "P")
	numpad0_isUp := !numpad0_isDown
	
	if (numpad0_isDown) {
		Send, {BackSpace}{,}
	}
	else {
		main_sendIfPressed()
	}
	return
NumpadDot up::
	main_sendIfReleased()
	return




main_sendIfPressed(p_hotkey := "") {
	if (p_hotkey == "") {
		p_hotkey := A_ThisHotkey
	}
	keyIsDown := GetKeyState(p_hotkey, "P")
	if (keyIsDown) {
		Send, {%p_hotkey% down}
	}
	return
}

main_sendIfReleased(p_hotkey := "") {
	if (p_hotkey == "") {
		p_hotkey := A_ThisHotkey
	}
	keyIsUp := !GetKeyState(p_hotkey, "P")
	if (keyIsUp) {
		Send, {Blind}{%p_hotkey% up}
	}
	return
}


sendParentheses(tSeconds := 5) {
	
	Send, {(}{)}{Left}
	
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

#IfWinActive yEd Live ahk_class MozillaWindowClass ahk_exe firefox.exe

;; select "palette"
^MButton up::
{
	MouseGetPos, x, y
	MouseClick, Left, 1737, 196, 1
	MouseMove, % x, % y
	return
}

;; select "properties"
^RButton up::
{
	MouseGetPos, x, y
	MouseClick, Left, 1602, 196, 1
	MouseMove, % x, % y
	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive