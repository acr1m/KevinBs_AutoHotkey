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
	
	
/* 	; sent this hotkey into AHK_Math_Keyboard ;[Ctrl+p] -> {+}
 * 	^p:: 
 * 		KeyWait, p ;wait for key to be released to avoid triggering
 * 						;in combination with {Shift}
 * 		Send, {+} ;[Shift+=] -> {=}
 * 		return ;exit method
 */
	

;NOTEPAD++ ==================================================================
	;WindowsKey + N = Open/Run Notepad++
	#n::
		Run, Notepad++
		return
#IfWinActive ahk_class Notepad++
	; [Middle Mouse Button Click]
	MButton::
		
/*		If hotkey was triggered within doubleTapLimit,
 *		then activate the doubleTap process and reset the 
 *		listener key to false for the next occurence.
 *		doubleTapLimit approximately 350 milliseconds atm 
 */
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < doubleTapLimit) {
			
			; Toggle - Viewing of "Document Map", Panel
			;~ Send, !vfff{Enter} ;turned off 2021_10_13_19.53
			Send, !v
			}
			
/*		Toggle Viewing of "Folder as Workspace", Panel
		;this is the "alt, Top Tollbar Menu" navigation sequence to the command"
		
		;this is the "alt, Top Tollbar Menu" navigation sequence to the command"
		Send, !vdd{Enter} ;turned off 2021_10_13_19.53
*/		
	;this is the custom hotkey *in-editor* that directly targets the Toggle Workspace Folder: View, commmand
		Send, !b
		return
		
#IfWinActive ; end specific window targeting


	;WindowsKey + a → h → k = Open/Run AutoHotkey Editor (SciTE4AutoHotkey.exe)
	#a::
		;~ KeyWait, h, D T3	;wait 3 seconds for the key to be pressed down
		;~ KeyWait, k, D T3	;wait 3 seconds for the key to be pressed down
		
		;debugging
		;~ s := %A_ScriptDir% "`\SciTE.exe - Shortcut"
		;~ MsgBox, About to Run E:\Software\AutoHotKey\SciTE\SciTE.exe
		;end debugging
		
		Run, E:\Software\AutoHotKey\SciTE\SciTE.exe
		return

;Window Title & Class Grabber
	;this gets the active window Title name and the Class and stores it into the clipboard.
	#AppsKey::
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
	
	;TIME-STAMP FUNCTION
	Insert::
	{
		SetKeyDelay, 100
		
		clipHolder := ClipboardAll
		;~ Clipboard := ;null
		
		Send, =now(){Enter}
		;~ Sleep, 50
		Send, {NumpadUp}
		;~ Sleep, 50
		
		;~ SetKeyDelay, 100
		Send, ^c
		ClipWait 	;when clipboard contents == true
		
		Send, ^!v
		;~ Sleep, 300
		
		Send, v
		;~ Sleep, 100
		Send, {Enter}
		
		Clipboard := clipHolder
		SetKeyDelay, Default
		return
	}
}
#IfWinActive ; end specific window targeting