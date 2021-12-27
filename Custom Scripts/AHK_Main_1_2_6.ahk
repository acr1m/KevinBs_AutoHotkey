﻿#InstallKeybdHook
#InstallMouseHook

;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 410

;rectangularish keyboard icon
;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 357

;squarish keyboard icon
;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\misc.exe, 905, 0
;~ Menu, Tray, Icon, E:\Assets\Icons\keyboard_icon.png

;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\PUB6INTL.COMMON.DLL, 50

Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Keyboards\msctf_410.ico

;~ CONSTANTS
global DOUBLE_TAP_LIMIT:= 350 ; n milliseconds

;~ EMOJIS
	:*:'beer':: {U+1F37A}
	:*:'shruggie'::¯\_(ツ)_/¯
	:*:'lol'::lol  {U+1F602}
	:*:'rofl'::rofl  {U+1F923}
	;~ :*:'`;P':: Send {AltDown}{NumpadAdd}1F61C{AltUp}
	:*:'`;P':: {U+1f61c}
	;~ :*:'`:P':: Send {AltDown}{NumpadAdd}1F61B{AltUp}
	:*:'`:P':: {U+1F61B}
	:*:'`;)':: {U+1F609}
	:*:'`:)':: {U+1F642}

;~ HOTKEYS
	; Shift+Space = Underscore _
	+Space:: Send, {_}
	+NumpadSub:: Send, {_}
	AppsKey & Left::Send, ^#{Left}
	AppsKey & Right::Send, ^#{Right}



;==============================================================================
;WINDOWS KEY SHORTCUTS &&
;SOFTWARE OPEN/START/RUN SHORTCUTS
;===============================================================================
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
#x::Run, E:\Library\OneDrive\Documents\Spreadsheets\Time_Stamps_v3.xlsm
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
#IfWinActive


doubleTap(p_timeLimit := -1){
	if(p_timeLimit != -1){
		;~ outText := "double tap time limit = p_timeLimit: " . p_timeLimit
	}
	if (p_timeLimit == -1){
		p_timeLimit := DOUBLE_TAP_LIMIT
		;~ outText := "double tap time limit = DOUBLE_TAP_LIMIT: " . DOUBLE_TAP_LIMIT
	}
	if  (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < p_timeLimit){
		;~ MsgBox, %outText% ; for debugging
		return true
	} 
	else {
		return false
	}
}
