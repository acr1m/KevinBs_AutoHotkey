#InstallKeybdHook
#InstallMouseHook

;~ CONSTANTS
	doubleTapLimit:= 350 ; n milliseconds

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

;NOTEPAD++ ==================================================================
#IfWinActive ahk_class Notepad++
	; [Middle Mouse Button Click]
	MButton::
	{
/*		If hotkey was triggered within doubleTapLimit,
 *		then activate the doubleTap process and reset the 
 *		listener key to false for the next occurence.
 *		doubleTapLimit approximately 350 milliseconds atm 
 */
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < doubleTapLimit) 
		{
			; Toggle - Viewing of "Document Map", Panel
			Send, !v
		}
		
	;this is the custom hotkey *in-editor* that directly targets the Toggle Workspace Folder: View, commmand
		Send, !b
		return
	}
#IfWinActive ; end specific window targeting


;==================================================================================================
;WINDOWS KEY SHORTCUTS &&
;SOFTWARE OPEN/START/RUN SHORTCUTS
;==================================================================================================
;Open/Run Notepad++
;WindowsKey + N
#n::
{
	Run, Notepad++
	return
}
;WindowsKey + a → h → k = Open/Run AutoHotkey Editor (SciTE4AutoHotkey.exe)
#a::
{
	Run, E:\Software\AutoHotKey\SciTE\SciTE.exe
	return
}
;Voicemeeter 
;Windows Key + S
#s::
{
	Run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeter.exe
	return
}
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
;==================================================================================================

; target any File Browswer / Windows Explorer window
#IfWinActive ahk_class CabinetWClass ahk_exe Explorer.EXE 
	; [Middle Mouse Button Click]
	MButton::
		
		; If hotkey was triggered within doubleTapLimit,
			; then activate the doubleTap process and reset the 
			; listener key to false for the next occurence.
			; doubleTapLimit approximately 350 milliseconds atm
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < doubleTapLimit) {
			
			; Toggle Left Folder Navigation Panel
			Send, !vn{Enter}	
			}
		
		; Toggle Right Preview Panel
		Send, !p	
		return
		
#IfWinActive ; end specific window targeting

#IfWinActive ahk_class XLMAIN ahk_exe EXCEL.EXE
{
	;Activate Draw Border Tool
	^w::
	{ 
		;~ Send, {Alt}
		;~ Send, hbw
		Send, {Alt}hbw
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
		KeyWait, Alt
		KeyWait, h
		KeyWait, b
		KeyWait, p
		Send, {Home}
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
		;~ Sleep, 50
		Send, ^c
		
		Send, {Alt}hvv
		;~ Sleep, 300
		KeyWait, Alt
		KeyWait, h
		KeyWait, v
		KeyWait, v
		Send, {Escape}
		
		;~ Clipboard := clipHolder
		
		SetKeyDelay, Default
		return
	}
}
#IfWinActive ; end specific window targeting


;~ #IfWinActive TI Connect™ CE ahk_class GlassWndClass-GlassWindowClass-4 ahk_exe TI Connect CE.exe
#IfWinActive ahk_exe TI Connect CE.exe
{
	:O:sto::{→}
	$/::
		SendRaw, 
		return
	^/::
		KeyWait, Ctrl
		Send, /
		return
		
}
#IfWinActive ; end specific window targeting
