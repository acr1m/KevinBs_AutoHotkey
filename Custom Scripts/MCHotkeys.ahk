#InstallKeybdHook
#KeyHistory





;~ Variables
;~ =====================================
;~ this is the initial state
isShiftDown:= 0
;~ shiftOutput:= {ShiftUp}


;~ =====================================
;~ active window information
;~ • Title: [Minecraft]
;~ • Class: [ApplicationFrameWindow]



;~ F2::Suspend On
;~ F3::Suspend Off
;~ Pause::Pause ; Assigns the Pause/Break button to execute the Pause() method.

#IfWinActive, Minecraft
F2::Suspend, Toggle		;Hotkeys are toggled
#IfWinActive, Minecraft
r:: Send, {w down}
#IfWinActive, Minecraft
c:: Send, {LShift down}
#IfWinActive, Minecraft
x:: Send, {w down}{LCtrl down}


;~ $LShift::

	;~ isShiftDown := Abs(isShiftDown - 1) ; this expression will "toggle" the boolean value from 0 <=> 1 and vice versa.

	;~ to simulate holding down the Left Shift key
	;~ while (isShiftDown) {
		;~ Send, {LShift Down} ; to simulate holding down the key
		;~ Sleep, 100 ; wait for (10 = 0.01 seconds)
	;~ }
	;~ if (isShiftDown!) {
		;~ Send, {LShift Up}
	;~ }
;~ return
