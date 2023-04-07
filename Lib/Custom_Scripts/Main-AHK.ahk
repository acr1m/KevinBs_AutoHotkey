/* Scintilla Text Editor (SciTE) *********************************************************
 **** Custom AHK Shortcuts ***************************************************************
 ******* (MUST HAVE "SciTE4AutoHotkey-WIN.ahk" ACTIVELY RUNNING FOR THESE TO WORK) *******
 * Ctrl + Alt + U	|= User Properties File		|~(opens user properties file to manage and overwrite built-in editor settings)
 * Ctrl + Alt + B	|= Abbreviations File		|~(opens corresponding abbreviation file matching the active-tab's filetype)
 * Ctrl + Alt + I	|= API File					|~(opens corresponding user.***.api file matching the active-tab)
 * Ctrl + Alt + S	|= SciTE Hotkey File		|~(opens user defined .ahk file to manage hotkeys used for this editor)
 * Ctrl + B			|= Bookmark Current Line	|~(toggles bookmark on current line of text editor)
 * F2 				|= Goto Next Bookmark		|~(moves text caret to next Bookmark)
 * Shift + F2 		|= Goto Previous Bookmark	|~(moves text caret to previous Bookmark)
 */

/* Jump List
 * ;~ Tray Icons and Commands ;{
 * ;~ Lbl_Global_Constants: ;{
 * ;~ Lbl_Global_Variables: ;{
 * ;~ LIBRARIES ;{
 * ;~ UTITILITIES ;{
 * ;~ WINDOW/APP CONTEXT SENSITIVE SCRIPTS ;{
 * ;~ Special Characters
 */

#HotkeyInterval 1000 ;one second interval
#Hotstring EndChars -()[]{}: "/\?!`n
#InstallKeybdHook
#KeyHistory 500  ;(Default is 40, Max is 500)
#MaxHotkeysPerInterval 1000 ;1 thousand keys per above interval
#SingleInstance Force
#Persistent
DetectHiddenWindows, On ;~ Allows a script's hidden main window to be detected.
SetTitleMatchMode, 2 ;~- 2 = A window's title can contain WinTitle anywhere inside it to be a match.


;##########################################################################
;~ Tray Icons and Commands ;{
;##########################################################################
;~ set the icon references
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\key-s04-green.ico
#Include %A_ScriptDir%\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=	"E:\Assets\Icons\_used-icons\key-s04-green.ico"
trayIM.iconSuspended :=	"E:\Assets\Icons\_used-icons\key-s04-blue.ico"
trayIM.iconPaused :=	"E:\Assets\Icons\_used-icons\key-s04-yellow.ico"
trayIM.iconInactive :=	"E:\Assets\Icons\_used-icons\key-s04-red.ico"
;~ trayIM.start(true) ; shows standard tray-icon menu items
trayIM.start()

global g_MenuItemName_ScrollWheelToggle := "Scroll Wheel"
Menu, Tray, Add, % g_MenuItemName_ScrollWheelToggle, % Func("toggleScrollWheelListener")

; change the target function for the menu item "Exit"
tgtFunc_menuExit := Func("exitScript")
Menu, Tray, Add, % "Exit", % tgtFunc_menuExit

;}

/**
 * Rerun this script as admin.
 * Utilizes the included script library "run()-LIB.ahk" method "run_AsAdmin()"
 */

/*
showRunAsAdminMsgBox := false
run_AsAdmin(,showRunAsAdminMsgBox) ; (,true) = show msgbox result
*/


Lbl_Global_Constants: ;{
global g_SCITE_4AHK_EXE := "E:\Software\AutoHotkey_MyInstallation_v01\SciTE\SciTE.exe"
global g_MAIN_AHK_FILE := A_ScriptDir "\Main-AHK.ahk"
;~ MsgBox,,, %g_MAIN_AHK_FILE%, 4
global g_EMOJI_AHK_FILE := "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\Emojis-And-Symbols-LIB.ahk"
global g_PWRRUN_AHK_FILE := "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-win\PowerRun-WIN.ahk"
global g_PRIMARY_MOUSE := "Left"
global g_SWAP_RETVAL :=
global g_DOUBLE_TAP_LIMIT := 350 ; n milliseconds
global g_SCROLL_WHEEL_GRAVITY := 4
#Include %A_ScriptDir%\-lib\WM-List-LIB.ahk ;~ list of WM_COMMANDS
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
global g_b_ScrollWheelListener := true
;}

main_runHorizScrollingUtility()

return
;~ end of auto-execute section------------------------------------------



;~ block of #Include libraries and utilities
Lbl_Include_Block:

;~ LIBRARIES ;{
#Include %A_ScriptDir%\-lib\Main-Method-Library-LIB.ahk
#Include %A_ScriptDir%\-lib\run()-LIB.ahk
#Include %A_ScriptDir%\-lib\mathKbd()-LIB.ahk
#Include %A_ScriptDir%\-lib\Emojis-And-Symbols-LIB.ahk
#Include %A_ScriptDir%\-lib\repeatKey()-LIB.ahk
#Include %A_ScriptDir%\-lib\time()-LIB.ahk
#Include %A_ScriptDir%\-lib\RegEx()-LIB.ahk
;~ #Include oneKey-Copy-Paste-Mode-LIB.ahk
;}

;~ UTITILITIES ;{
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

global g_pid_horizScroll := ""

main_runHorizScrollingUtility() {

/* 	targetScript :=  A_ScriptDir . "\-utility\Horizontal-Scrolling-UTILITY.ahk",,,g_pid_horizScroll
 * 	;~ MsgBox, %targetScript%
 * 	Run, %A_AhkPath% %targetScript%,,,pid_outVar
 */
	;~ "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Horizontal-Scrolling-UTILITY.exe"

	_file := A_ScriptDir .  "\-shortcuts\Horizontal-Scrolling-UTILITY.exe - Shortcut.lnk"
	Run, explorer %_file%
	g_pid_horizScroll := pid_outVar
	return
}



;~ GUI's ;{
;~ #Include %A_ScriptDir%\-gui\Mouse-Control-GUI.ahk
;~ #Include AHK-Math-Keyboard-v1-2-7.ahk
;~ Run, AHK_Math_Keyboard_.exe
;}

;~ WINDOW/APP CONTEXT SENSITIVE SCRIPTS ;{
#Include %A_ScriptDir%\-win\Windows-Color-Picker-WIN.ahk
#Include %A_ScriptDir%\-win\Excel-WIN.ahk
#Include %A_ScriptDir%\-win\Outlook-WIN.ahk
;~ #Include %A_ScriptDir%\-win\SciTE4AutoHotkey-WIN.ahk
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

;~ BREAKER-SWITCH - activates when pressing Ctrl+Alt+Shift+{Pause}
^!+CtrlBreak::exitScript()

;~ SUB-SCRIPT BREAKER-SWITCH
~Pause:: ;{
	gosub, % "Lbl_CloseScripts"
	return  ;}

exitScript() {
	gosub, % "Lbl_CloseScripts"
	;~ WinClose, g_pid_horizScroll
	WinClose, % "Horizontal-Scrolling-UTILITY.exe"
	ExitApp
	return
}

toggleScrollWheelListener() {

	g_b_ScrollWheelListener := !g_b_ScrollWheelListener

	if (g_b_ScrollWheelListener) {
		Menu, Tray, Check, % g_MenuItemName_ScrollWheelToggle
	}
	else if (!g_b_ScrollWheelListener) {
		Menu, Tray, Uncheck, % g_MenuItemName_ScrollWheelToggle
	}
}

Lbl_CloseScripts:
	DetectHiddenWindows, On ;~ Allows a script's hidden main window to be detected.
	SetTitleMatchMode, 2 ;~ 2 = A window's title can contain WinTitle anywhere inside it to be a match.
	WinClose, % "temp-macro.exe"
	WinClose, % "Cut-Copy-Paste-(pause-to-break)-UTILITY.exe"
	return

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*	OPEN / START / RUN  - HOTKEYS
	WINDOWS-KEY
	OPEN FILES, OPEN SOFTWARE, OPEN PROGRAMS, OPEN APPLICATIONS, OPEN APPS
*/

Lbl_Run_Copy_Paste_Simple:
^F23::
	_file := A_ScriptDir . "\-shortcuts\Cut-Copy-Paste-(pause-to-break)-UTILITY.exe-Shortcut.lnk"
	Run, explorer %_file%
	return

Lbl_Run_Temp_Macro:
^F24::
	_file := A_ScriptDir . "\-shortcuts\temp-macro.exe-Shortcut.lnk"
	Run, explorer %_file%
	return

;~ show mouse position tooltip
Lbl_Run_Mouse_Position_Tooltip:
^#AppsKey::Run, "AHK-Utility-Mouse-Position-As-Percentage-Tooltip.exe"

Lbl_Run_NotepadPP:
#n::Run, "Notepad++"
;~ #a::Run, E:\Software\AutoHotKey\SciTE\SciTE.exe


#IfWinActive ;~ if any window is active


;~ [WINDOWS+A] <=> MY_WINDOWS_HOTKEY-SEQUENCE_LISTENER;~


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

myWindowsAEventHandler = new windowsAEventHandler ;~ instantiate a clone of a class

;~ run SciTE4AutoHotkey
#a::
	Run, % g_SCITE_4AHK_EXE ;~ global variable, defined at top of this script
	Run, "E:\Assets\Windows 10 Settings\Custom Toolbars\AHK-Exe\SciTE4AutoHotkey-WIN.exe - Shortcut.lnk"
	return

;~ run Voicemeeter
#s::
	if (doubleTap()) {

		storedTitleMatchMode := A_TitleMatchMode
		SetTitleMatchMode, 1

		; opens Volume Mixer and moves it to a location on the main window
		Run, % "sndvol"
		o := {title:"Volume Mixer ahk_class #32770 ahk_exe sndvol.exe", x:10, y:160, w:1200, h: 350}
		WinWait, % o.title, , 2 ; wait for 2 seconds max
		WinMove, % o.title, , o.x, o.y, o.w, o.h

		; opens Sound control panel and moves it to a location on the main window
		Run, % "rundll32.exe Shell32.dll,Control_RunDLL Mmsys.cpl,,0"
		o := {title:"Sound ahk_class #32770 ahk_exe rundll32.exe", x:10, y:520, w:414, h:462} ; KeyA can be a variable reference (KeyA_Var) or encapped with quotes as a string "KeyA_CharName"
		WinWait, % o.title, , 2 ; wait for 2 seconds max
		WinMove, % o.title, , o.x, o.y, o.w, o.h
		SetTitleMatchMode, % storedTitleMatchMode

	} else {
		Run, "C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe"
	}

	return


;~ run Windows Sound Control Panel
^#s::Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"

;~ shows the amount of scroll-wheel inputs sent as a tooltip following the mouse
Lbl_Run_Scroll_Speed_Tooltip:
#MButton:: ;{
	/*
	;~ Run, % "Autohotkey.exe" A_ScriptDir . "\-gui\GUI-Scroll-Speed-Monitoring.ahk"
	;~ "E:\Library\OneDrive\Documents\AutoHotkey\Custom Scripts\-gui\GUI-Scroll-Speed-Monitoring.ahk"
	;~ Run, autohotkey.exe %A_ScriptDir%\-gui\Scroll-Speed-Monitoring-GUI.ahk
	*/

	; toggle the global variable "g_b_ScrollWheelListener", which is referenced by ⌈~$WheelUp⌋ and ⌈~$WheelDown⌋ hotkey methods
	g_b_ScrollWheelListener := !g_b_ScrollWheelListener
	main_ShowTooltip(g_b_ScrollWheelListener)
	return  ;}
;~ this section handles the method of scroll-wheel input-output speed
Lbl_Scroll_Wheel_Speed:

~$WheelUp:: ;{
	if (g_b_ScrollWheelListener){
		i := main_scrollMethod_01() - 1
		main_showToolTip(i)
		Send, {Blind}{WheelUp %i%}
	}
	return
;}

~$WheelDown:: ;{
	if (g_b_ScrollWheelListener){
		i := main_scrollMethod_01() - 1
		;~ main_scrollMethod_01()
		main_showToolTip(i)
		Send, {Blind}{WheelDown %i%}
	}
	return
;}




;~ _shift_space() - handles the output of the shift+space hotkey
_shift_space() {
	;~ check for prior-hotkey and handle the current times tapped
	if (A_PriorHotkey != A_ThisHotkey) {
		if (doubleTap(g_DOUBLE_TAP_LIMIT)) {
			g_genericTapperCount := 1
			Send, {_}
			return
		}
	} else if (A_PriorHotkey == A_ThisHotkey) {
		g_genericTapperCount := 2
		;~ when shift+space is hit twice, send -
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

;~ make the NumpadSub key function exactly like the 'hyphen'-key
+NumpadSub:: Send, {_}

;~ swipe to desktop to the left
AppsKey & Left::Send, ^#{Left}

;~ swipe to desktop to the right
AppsKey & Right::Send, ^#{Right}

;~ Redo (alternative command)
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

;~ opens ahk window spy utility gui
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

;~ this targets the script-debug\-window from the tray-icon
#IfWinActive E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom-Scripts\AHK-Main.ahk - AutoHotkey v1.1.33.10 ahk_class AutoHotkey ahk_exe AutoHotkey.exe
k:: ;{
	Send, ^k
	return
;}
Space::F5


;~Re-declare any window as an acceptable
;~case-scenario before exit.
#IfWinActive

#IfWinActive

;~ ctrl+insert - types out the date in a pre-defined format that is changeable
Lbl_Insert_Date: ;{
^Insert::
	;~ time_sendDate("yyyy")
	time_sendDate("yyyyMMdd_HHmmss_SS")
	return  ;}

;~ open ShareX - main window
XButton1::
	Send, !^+9
	;~ Send, +{PrintScreen}
	;~ Run, explorer E:\Library\OneDrive\Documents\ShareX\Screenshots
	return

;~ open screenshots folder
;~ XButton1 = MButton4 = Mouse-Back-Button
+XButton1::
	;~ Send, !^+9
	if (WinExist("E:\Library\OneDrive\Documents\ShareX\Screenshots"))
		WinActivate
	else
		Run, explorer E:\Library\OneDrive\Documents\ShareX\Screenshots
	return

;~ re-map 'back-mouse-button' to 'PrintScreen'
;~ XButton2 = MButton5 = Mouse-Forward-Button
*XButton2::
	Send, {Blind}{PrintScreen}
	return

;~ i want to add a tab function, when i hold capslock and press tab, it pastes a tab character down...
Lbl_CapsLock_Functionality:

;{ By default,
;       {CapsLock down} => Toggles CapsLockState && Sends {CapsLock down}
;       {CapsLock up}   => Sends {CapsLock up}
;}

CapsLock::
	SetStoreCapslockMode, Off

	;~ (functionally bypasses the {CapsLock down} key-stroke)
	SetCapsLockState, % g_b_capsLockState
	;~ functionally renders the {CapsLock down} action inert
	;~ SetCapsLockState, % !GetKeyState("CapsLock", "T") ;~ requires [v1.1.30+]
	return

CapsLock up::
	SetStoreCapslockMode, Off

	;~ toggle the current global-CapsLock-state and set current-state to stored-global-state
	g_b_capsLockState := !g_b_capsLockState
	SetCapsLockState, % g_b_capsLockState

	;~ caps_initKeyState := GetKeyState("CapsLock", "T") ;~ requires [v1.1.30+]
	;~ SetCapsLockState, % !caps_initKeyState

	return

CapsLock & Tab::
	SetStoreCapslockMode, Off
	pasteClipboard("	")
	return


/* ;~ Double-tap windows key to switch languages (like hitting Win+Space)
 * ;~~~ Retrofitted code from - https://www.autohotkey.com/docs/commands/SetTimer.htm
 * ;~ LWin up::Send, {LWin up}
 * LWin::
 *
 * 	/*
 * 	_isLWinDown := {"LWin": GetKeyState("LWin", "P")
 * 		, "LWin (virtual)": GetKeyState("LWin")}
 * 	main_tooltipShowVar(_isLWinDown)
 * 	*/
 *
 * /*
 * 	if (GetKeyState("LWin", "P")) {
 * 		Send, {LWin down}
 * 	}
 *
 *  */
 * 	/*
 * 	if (!GetKeyState("LWin", "P")) {
 * 		Send, {LWin up}
 * 	}
 * 	*/
 *
 * 	KeyWait, LWin
 * 	if (lwin_pressCount > 0) ; SetTimer already started, so we log the keypress instead.
 * 	{
 * 		lwin_pressCount += 1
 * 		return
 * 	}
 * 	; Otherwise, this is the first press of a new series. Set count to 1 and start
 * 	; the timer:
 * 	lwin_pressCount := 1
 * 	SetTimer, Lbl_LWin, % (-1 * g_DOUBLE_TAP_LIMIT) ; Wait for more presses within a 400 millisecond window.
 * 	return
 *
 * Lbl_LWin:
 * 	if (lwin_pressCount == 1) ; The key was pressed once.
 * 	{
 * 		;~ windows key - send a regular windows key press
 * 		KeyWait, LWin
 * 		Send, {LWin}
 * 	}
 * 	else if (lwin_pressCount == 2) ; The key was pressed twice.
 * 	{
 * 		;~ win+space - change windows keyboard language
 * 		KeyWait, LWin
 * 		Send, #{Space}
 * 	}
 * 	else if (lwin_pressCount > 2)
 * 	{
 * 		;~ win+space - change windows keyboard language
 * 		KeyWait, LWin
 * 		Send, #{Space}
 * 	}
 * 	; Regardless of which action above was triggered, reset the count to
 * 	; prepare for the next series of presses:
 * 	lwin_pressCount := 0
 * 	return
 */


/*
 * <#Space::Send, {Alt down}{LWin down}{Space}{LWin up}{Alt up}
 * !<#Space::Send,  {Alt down}{LWin down}{Space}{LWin up}{Alt up}
 */

;~ Blind pass-through
~AppsKey::AppsKey

/*
 * ;~ LAlt & Space::Send, - {hyphen}
 * <!Space::Send, -
 */

;~ single-tap = _ {underscore}
+Space::
	Send, {_}
	return


/*
 * API Notes:
 *		Hotkey Options/Flags
 *			$ := only trigger on physical key-press
 *			* := allow triggering with extra modifers (ctrl, shift, alt)
 */

global g_waitingForTabPress ;~ as boolean
;~ (Note: because this is not in the auto-execute section at the top,
;~    this variable can not be assigned a value on this line)

;~ Sends "+" or "()"
NumpadAdd::
	numpad0_isDown := GetKeyState("Numpad0", "P") ; checks and returns if physically held down

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
	numpad0_isDown := GetKeyState("Numpad0", "P") ; checks and returns if physically held down


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

	KeyWait, Tab, D T%tSeconds% ;~ wait tSeconds for the Tab key to be pressed, this currently keeps the hotkey from sending multiple sets of parenthesis groups.

	if (ErrorLevel == 1) ;~ if Tab wasn't pressed in time
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

;~ select "palette"
^MButton up::
{
	MouseGetPos, x, y
	MouseClick, Left, 1737, 196, 1
	MouseMove, % x, % y
	return
}

;~ select "properties"
^RButton up::
{
	MouseGetPos, x, y
	MouseClick, Left, 1602, 196, 1
	MouseMove, % x, % y
	return
}
;~Re-declare any window as an acceptable
;~case-scenario before exit.
#IfWinActive

;###############################################
;~ Special Characters
;###############################################
;~ ⁛  ⁘  ⁙  ⁜  ※  ↳  ↪  ⇒  ⇨
;~ !+ () = 【】 <--> !+9 【or】 !+0
;~ !+ [] = 「」 <--> !+[ 「or」 !+]
;~ ^+ [] = 『』 <--> ^+[ {or} ^+]
;~ !+ <> = 〈〉 <--> !+, {or} !+.
;~ ^+ <> = 《》 <--> !+, {or} !+.
;~ !+
;~ []{}「」『』〈〉《》
!+9::Send, % "【"
!+0::Send, % "】"
;~ !+[::Send, % "「" ; U+300C double-width
;~ !+]::Send, % "」" ; U+300D double-width
!+[::Send, % "｢" ; U+FF62 single-width
!+]::Send, % "｣" ; U+FF63 single-width
^+[::Send, % "『"
^+]::Send, % "』"
!+,::Send, % "〈"
!+.::Send, % "〉"
^+,::Send, % "《"
^+.::Send, % "》"

::??home address;::
::??homeaddress;::
::??address;::
::??home;::
::??apt;::
	_fileAddress := "E:\Library\OneDrive\Documents\Personal\_txt\homeaddress.txt"
	_file := FileOpen(_fileAddress, "r")
	if (IsObject(_file) == false) {
		;~ MsgBox, , % A_ScriptName, % "!IsObject(_file): " . !IsObject(_file)
		main_showTooltip(A_ScriptName . "  IsObject(_file): " . IsObject(_file))
	}
	_str := _file.Read()
	Clipboard := _str
	Send, %_str%
	_file.Close
	return

:o:??tab;::
	;~ Send, {U+0x0009} ;~ sends {TAB}-Character
	pasteClipboard("	")
	return


+CapsLock::selectedTextToUpperCase() ; UPPER CASE
!+CapsLock::selectedTextToTitleCase() ; Title Case
!CapsLock::selectedTextToLowerCase() ; lower case

selectedTextToUpperCase() {
	str := copySelection(,false)
	if (str != "") {
		StringUpper, outVar, str
		pasteClipboard(outVar)
	}
	return
}

selectedTextToTitleCase() {
	str := copySelection(,false)
	if (str != "") {
		StringUpper, outVar, str, T ; converts to TitleCase
		pasteClipboard(outVar)
	}
	return
}

selectedTextToLowerCase() {
	str := copySelection(,false)
	if (str != "") {
		StringLower, outVar, str
		pasteClipboard(outVar)
	}
	return
}




CapsLock & Enter::
	;~ pasteClipboard("A+013")
	tempVar := ClipboardAll ; store clipboard
	Clipboard := "`n"
	Send, ^v
	Clipboard := tempVar ; restore clipboard
	return



; outputs a square root symbol "√" if Numpad0 is held down when NumpadDiv [/] is pressed
NumpadDiv::
	numpad0_isDown := GetKeyState("Numpad0", "P") ; checks and returns if physically held down

	if (numpad0_isDown) {
		Send, {BackSpace}{ASC 251}
	}
	else {
		main_sendIfPressed()
	}
	return
NumpadDiv up::
	main_sendIfReleased()
	return

; outputs a circumflex "^" if Numpad0 is held down when NumpadMult [*] is pressed
NumpadMult::
	numpad0_isDown := GetKeyState("Numpad0", "P") ; checks and returns if physically held down

	if (numpad0_isDown) {
		Send, {BackSpace}{^}
	}
	else {
		main_sendIfPressed()
	}
	return
NumpadMult up::
	main_sendIfReleased()
	return


;;██████████████████████████████████████████████████████████████████████████████
;~ Greek Letters
;;██████████████████████████████████████████████████████████████████████████████
{
;~ #Hotstring C ;~ [C] case sensitive
;~ letters are automatically replaced/matched with Capitalization of replaced string.
#Hotstring ?	;~ turns on "if-suffix" trigger
::alpha;::α
::beta;::β
::gamma;::γ
::delta;::δ
::epsilon;::ε
::zeta;::ζ
::eta;::η
::theta;::θ
::iota;::ι
::kappa;::κ
::lambda;::λ
::mu;::μ
::nu;::ν
::xi;::ξ
::omicron;::ο
::pi;::π
::rho;::ρ
::sigma;::σ
::fsigma;::ς
::sigmaf;::ς
::tau;::τ
::upsilon;::υ
::phi;::φ
::chi;::χ
::psi;::ψ
::omega;::ω
::+-;::±
::^3;::³
::^2;::²
::^1;::¹
::half;::½
::1/2;::½
::quarter;::¼
::1/4;::¼
::3/4;::¾
;~ #Hotstring C0 ;~ [C0] turn off case sensitive
#Hotstring ?0	;~ turns off "if-suffix" trigger

#Hotstring C0 O0 ?0 *0		;~ Reset Hotstring directives
}
;;██████████████████████████████████████████████████████████████████████████████
