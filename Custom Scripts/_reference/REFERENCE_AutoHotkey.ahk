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
;===============================================================================
;===============================================================================
;~ DIRECTIVES 
	SendMode, Event				;~ sets all hotkeys below to use SendEvent
	;~ SendMode, Input				;~ sets all hotkeys below to use SendInput
	SetKeyDelay, 30				;~ set all hotkeys below to have a delay of n milliseconds, 0.00n seconds
	;~ SetKeyDelay, 200				;~ set all hotkeys below to have a delay of n milliseconds, 0.00n seconds
	;~ #Hotstring SE K200			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SE K50			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SI 			;~ sets all hotstrings below to use SendInput (the default)
	#Hotstring SE 			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SP 			;~ sets all hotstrings below to use SendPlay (instead of SendInput)
	#Hotstring K30			;~ which will allow a key delay of n milliseconds, 0.00n seconds
	#Hotstring B			;~ activate automatic backspacing (the default)
	#Hotstring O 			;~ [O] omit ending-character trail space
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
		;the [;] has been removed from the hotstring ending characters
		;the ['] has been removed from the hotstring ending characters
	#Hotstring EndChars -()[]{}: "/\,.?!`n
;===============================================================================
;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 410
;~ C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE

;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\OMICAUT.DLL, 203
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\OMICAUT_203.ico

;~ Menu, Tray, Icon, 
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\MSACCESS_289.ico
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\misc_902.ico

;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\MSACCESS_677.ico
Menu, Tray, Icon, E:\Assets\Icons\math_ruler_.bmp

;sqrt(a)
;~ C:\Program Files\Microsoft Office\root\Office16\misc.exe, 902

;circle(fx)
;~ C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE, 677

;===============================================================================