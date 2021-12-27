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
	
	;WindowsKey + N = Open/Run Notepad++
	#n::
		Run, Notepad++
	return
	
	;WindowsKey + a → h → k = Open/Run AutoHotkey Editor (SciTE4AutoHotkey.exe)
	#a::
		;~ KeyWait, h, D T3	;wait 3 seconds for the key to be pressed down
		;~ KeyWait, k, D T3	;wait 3 seconds for the key to be pressed down
		
		; debugging
		;~ s := %A_ScriptDir% "`\SciTE.exe - Shortcut"
		;~ MsgBox, About to Run E:\Software\AutoHotKey\SciTE\SciTE.exe
		; end debugging
		
		;~ Run "SciTE.exe - Shortcut"
		Run, E:\Software\AutoHotKey\SciTE\SciTE.exe
	return

; FUNCTIONS / PROCEDURES
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
		secondHit := false
		
		; If hotkey was triggered within doubleTapLimit,
		; then activate the doubleTap process and reset the 
		; listener key to false for the next occurence.
		; doubleTapLimit approximately 350 milliseconds atm
		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < doubleTapLimit) {
			secondHit := true
			}
		if (secondHit == true){
			secondHit := false
			Send, !vn{Enter}	; Toggle Left Folder Navigation Panel
			Send, !p
			}
		else {
			Send, !p	; Toggle Right Preview Panel
			}
		return
#IfWinActive ; end specific window targeting



















;;;;;;; MESSAGE BOX REFERENCE;;;;;;;;;;;;
;~ MsgBox This is the 1-parameter method. Commas (,) do not need to be escaped.
;~ MsgBox, 4, , This is the 3-parameter method. Commas (,) do not need to be escaped.
;~ MsgBox, 4, , Do you want to continue? (Press YES or NO)
;~ IfMsgBox No
    ;~ return
;~ MsgBox, 4, , 4-parameter method: this MsgBox will time out in 5 seconds.  Continue?, 5
;~ IfMsgBox Timeout
    ;~ MsgBox You didn't press YES or NO within the 5-second period.
;~ else IfMsgBox No
    ;~ return
    
;~ ; By preceding any parameter with "% ", it becomes an expression. In the following example,
;~ ; math is performed, a pseudo-array element is accessed, and a function is called.  All these
;~ ; items are concatenated via the "." operator to form a single string displayed by MsgBox:
;~ MsgBox % "New width for object #" . A_Index . " is: " . RestrictWidth(ObjectWidth%A_Index% * ScalingFactor)

;~ ; The following example alerts the user that a MsgBox is going to steal focus (in case the user is typing).
;~ SplashTextOn,,, A MsgBox is about to appear.
;~ Sleep 3000
;~ SplashTextOff
;~ MsgBox The backup process has completed.
