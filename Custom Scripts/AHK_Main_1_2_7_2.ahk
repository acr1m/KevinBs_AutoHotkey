#Include E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_Main_Method_Library.ahk
#InstallKeybdHook
#InstallMouseHook
#Hotstring EndChars -()[]{}: "/\,.?!`n
Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Keyboards\msctf_410.ico


;~ CONSTANTS
global DOUBLE_TAP_LIMIT:= 350 ; n milliseconds
;used to store/restore clipboard in functions
global g_archivedClipboard :=

;===============================================================================
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

;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 410
;rectangularish keyboard icon
;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 357
;squarish keyboard icon
;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\misc.exe, 905, 0
;~ Menu, Tray, Icon, E:\Assets\Icons\keyboard_icon.png
;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\PUB6INTL.COMMON.DLL, 50

;===============================================================================
;~ #Persistent
;~ SetTimer, ScrollSpeedMonitor, 50
;~ return
;-------------------------------------------------------------------------------
;~ ScrollSpeedMonitor:
;~ ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . scrollAmount ""
;~ return
;===============================================================================
;~ EMOJIS
::beer;::{U+1F37A} ;
:O:check;::
:O:chk::
:O:chk;::
	Send, {U+2714} ;✔ 
	return
:O:chkx::
:O:xmark::
:O:xmark;::
:O:xmrk::
:O:xmrk;::
:O:x;::
:O:x;::
:O:rx::
:O:rx;::
	Send, {U+274C} ;❌
	return
:O:checkbox;::
:O:chkbx::
:O:chkbx;::
:O:chkbox::
:O:chkbox;::
	Send, {U+2705} ;✅
	return
::lol;::lol {U+1F602} ;
::rofl;::rofl {U+1F923} ;藍

::shruggie;::¯\_(ツ)_/¯
::shock;::
::shock1;::
	Send, Σ(°ロ°)
	return
::shock2::
::shock2;::
	Send, (￣□￣;)
	return
::gasp;::
::gasp;::
	Send, (°ロ°) !
	return
::wow;::w(°ｏ°)w
::bliss;::(¯▿¯)
::lenny;::( ͡° ͜ʖ ͡°)
::disapproval;::
::disapprove;::
::lookofd;:: 
::lookod;:: 
::lkofd;:: 
::lod;:: 
	Send, ಠ__ಠ
	return

::`:P;::{U+1F61B} ;
::`;);::{U+1F609} ;
::`:);::{U+1F642} ;
::`;P;::{U+1f61c} ;
;~ ::`;P:: Send {AltDown}{NumpadAdd}1F61C{AltUp}
;~ ::`:P:: Send {AltDown}{NumpadAdd}1F61B{AltUp}

;~ SYMBOLS
::rightarrow::{U+2794} ; ➔
;~ ::rr::{U+2794} ;➔	right arrow 					➔
::rr::{U+27a4} ;my default favorite arrow 		➤	black rightwards arrowhead 		➤
::rrt::{U+27a5} ;my default favorite tab arrow	➥	3d arrow, bottom lighted 		➥
::rre::{U+2B60} ;⭠ 	left triangle-headed arrow 		⭠
:O:rrx::{U+274C} ;❌

::r1::{U+2794} ;➔	right arrow 					➔
::r2::{U+27a2} ;➢	3d arrow, top lighted 			➢
::r3::{U+27a3} ;➣	3d arrow, bottom lighted 		➣
::r4::{U+27a4} ;➤	black rightwards arrowhead 		➤
::r5::{U+27a5} ;➥	3d arrow, bottom lighted 		➥
::r6::{U+27a6} ;➦	3d arrow, bottom lighted 		➦➜
::r7::{U+2B95} ;⮕ 	rightwards black arrow			⮕
::r0::{U+2B62} ;⭢ 	right triangle-headed arrow 	⭢


;MOUSE CONTROL PANEL (HOLD-RIGHT-CLICK)
~RButton::
	;~ Send, {F15}
	;start timer
	mouseControlPanelTimer := A_TickCount
	
	;~ KeyWait, F15, t2
	KeyWait, RButton, t2
	if (ErrorLevel == 1){
		;~ MsgBox % "success"
		Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_GUI_Mouse_Control.exe
		return
	}
	else
		return


;MOUSE WHEEL
~$WheelUp::
	if (A_PriorHotkey == A_ThisHotkey && A_TimeSincePriorHotkey < 500){
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
	return
~$WheelDown::
		if (A_PriorHotkey == A_ThisHotkey && A_TimeSincePriorHotkey < 500){
		deltaTime := A_TimeSincePriorHotkey + !(A_TimeSincePriorHotkey)
		
		;basically, the closer the delta time is to 0, the higher the number is
		;use a graphing calculator to visualize the control curve
		scrollAmount := Ceil(Abs((Log(deltaTime)/Log(1.5))-15))
		
		;~ ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . int ""
		Send, {WheelDown %scrollAmount%}
	}
	return

~AppsKey::AppsKey
;~ HOTKEYS
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



;==============================================================================
;WINDOWS KEY SHORTCUTS &&
;SOFTWARE OPEN/START/RUN SHORTCUTS
;OPEN FILES, OPEN SOFTWARE, OPEN PROGRAMS, OPEN APPLICATIONS, OPEN APPS
;===============================================================================
^#AppsKey::Run, E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_Utility_Mouse_Position_As_Percentage_Tooltip.exe
;Open/Run Notepad++
;WindowsKey + N
#n::Run, Notepad++
;WindowsKey + a → h → k = Open/Run AutoHotkey Editor (SciTE4AutoHotkey.exe)
#a::Run, E:\Software\AutoHotKey\SciTE\SciTE.exe
;Voicemeeter 
;Windows Key + S
#s::Run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe
F20::Run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe
;Sound Control Panel
^#s::Run "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"

#IfWinExist ahk_class XLMAIN ahk_exe EXCEL.EXE
#x::WinActivate ; Activates the window found by the above #IfWin directive.
#IfWinActive
#x::
Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
return

;~ #x::Run, https://d.docs.live.net/72d27cf0d2cf4c8e/Documents/Time_Stamps_Main_v5.xlsm
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

; target any File Browswer / Windows Explorer window
#IfWinActive ahk_class CabinetWClass ahk_exe Explorer.EXE 
{
	; [Middle Mouse Button Click]
	MButton::
		; If hotkey was triggered within DOUBLE_TAP_LIMIT,
			; then activate the doubleTap process and reset the 
			; listener key to false for the next occurence.
			; DOUBLE_TAP_LIMIT approximately 350 milliseconds atm
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < DOUBLE_TAP_LIMIT) {
			; Toggle Left Folder Navigation Panel
			Send, !vn{Enter}	
		}
		; Toggle Right Preview Panel
		Send, !p	
		return
	;copy file address, file path + file name
	^+c::
		KeyWait, Ctrl
		KeyWait, Shift
		Clipboard := 
		Send, {Alt}hcp
		ClipWait
		Clipboard := SubStr(Clipboard, 2, -1)
		;~ Clipboard := thisClipNoQuotations
		;~ MsgBox, %Clipboard%
		return
}		

#IfWinActive ahk_class XLMAIN ahk_exe EXCEL.EXE
{
	+WheelUp::
		SetScrollLockState, On
		Send, {Left}
		SetScrollLockState, Off
		return	
	
	+WheelDown::
		SetScrollLockState, On
		Send, {Right}
		SetScrollLockState, Off
		return
			
	^Enter::Send, {F2}
	;Activate Draw Border Tool
	^w::
	{ 
		;~ Send, {Alt}
		;~ Send, hbw
		Send, {Alt}hbw
		KeyWait, Alt
		Sleep, 10
		;~ Send, {Escape}
		return
	}
	
	;adds a top border to the first few columns in a single row in excel
	;using the current regular thickness border style
	^e::
	{
		SetKeyDelay, 50
		Send, {Home}
		Send, {Shift down}
		Send, {Right 8}
		Send, {Shift up}
		Send, {Alt}hbp
		Sleep, 30
		Send, {Home}
		KeyWait, Home
		;~ Send, {Escape}
		SetKeyDelay, Default
		return
	}
	
	;TIME-STAMP FUNCTION
	Insert::
	{
		SetKeyDelay, 100
		
		clipHolder := ClipboardAll
		Clipboard := "=now()"
		
		Send, ^v
		KeyWait, Ctrl
		
		Send, ^c
		KeyWait, Ctrl		
		
		Send, {Alt}
		KeyWait, Alt
		Send, h
		KeyWait, h
		Send, v
		KeyWait, v
		Send, v
		KeyWait, v
		Send, {Escape}
		KeyWait, Escape
		Send, {Escape}
		
		;~ Clipboard := clipHolder
		
		SetKeyDelay, Default
		return
	}
	
	;EDIT SELECTED CELL FORMULA  - ENCAPSULATE ITS FORMULA WITH "IFERROR,IF" STATEMENT
	^+i::
		;archive/save the clipboard's contents and clear
		clipArchive := ClipboardAll
		Clipboard :=
		;edit cell contents
			Send, {F2} 
		;select all except the begging "=" sign
			Send, {Home}{Right}{ShiftDown}{End}{ShiftUp} 
		;cut
			Send, ^x 
		;wait for clipboard to have content before proceeding
			ClipWait, 1 ;wait for 1 second
			if ErrorLevel 
			{
				MsgBox, The attempt to copy text onto the clipboard failed.
				return
			}
		;text
			Send, IFERROR(IF((
		;past cell's contents as inner formula
			Send, ^v
			Send, )>0,(
		;past cell's contents as inner formula, again
			Send, ^v
		;closing statement parentheses and empty string values
		;for output in case false or error 
			Send, ),`"`"),`"`")
		;confirm new cell contents by hitting enter
			Send, {Enter}
		;restore clipboard's previous contents
			Clipboard := clipArchive
		return
	
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

