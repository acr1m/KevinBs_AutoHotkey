
SetKeyDelay, 50

;~ Delay and Sleep time is in milliseconds (100 = .1 seconds)

;~ ^Numpad1 Up::
	;~ KeyWait, Control
NumpadSub::
	Sleep, 100 ; wait a brief moment to ensure no keys are being pressed
	Send, 5 ; open the "Header Footer Edit window"
	Sleep, 3000 ; wait for the "Header Footer Edit window" to load/open
	Send, m ; navigate to "math slides" preset
	Sleep, 100 ; give it a short moment
	Send, {Tab}h ; navigate to "right header text" box
	Send, {BackSpace} ; remove previous text
return

NumpadEnter Up::
	Send, {Tab 4}k ; navigate and select the "OK" button
	Sleep, 1500 ; wait a second for window to close and update file
	Send, ^s ; save file
	Sleep, 1000 ; wait for file to save
	Send, ^{Tab} ; tab to next document
	;~ Sleep, 300 ; wait for document to load
	;~ Hotkey, ^Numpad1, ^Numpad1 Up ; prep next document's header/footer window.
	
	Sleep, 300 ; wait a brief moment to ensure no keys are being pressed
	Send, 5 ; open the "Header Footer Edit window"
	Sleep, 3000 ; wait for the "Header Footer Edit window" to load/open
	Send, m ; navigate to "math slides" preset
	Sleep, 100 ; give it a short moment
	Send, {Tab}h ; navigate to "right header text" box
	Send, {BackSpace} ; remove previous text
	
return

;~ ^Numpad0::
	;~ KeyWait, Control
	;~ MsgBox, "message from ^Numpad0 routine"
	;~ prep next document's header/footer window
	;~ separation of down and up events to ensure activation of hotkey function
	;~ Hotkey, ^Numpad3
;~ return

;~ ^Numpad3::
	;~ KeyWait, Control
	;~ MsgBox, "message from ^Numpad3 routine"
;~ return



;~ 3.5 could'nt print 
;~ 3.4.8
;~ 3.04.02
