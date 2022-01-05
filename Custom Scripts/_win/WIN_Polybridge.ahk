#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook
#Include E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_Main_Method_Library.ahk

global g_PolyBridge_UndoRedoInterval := 10

#IfWinActive Poly Bridge ahk_class UnityWndClass ahk_exe polybridge.exe
Menu, Tray, Icon, E:\Assets\Icons\2021-12-07_18-58-57-669_explorer_GsROHzIJNG.jpg

;✔ TODO - make hotkeys for the tracing tool commands
;✔ TODO - figure out how to get percentage of mousePos relative to client window
;✔ TODO - make a method for handling mouse events
;✔		➥ method should save current mouse position,
;✔		➥ then, send a variadic series of click events at x,y position,
;✔		➥ then, restore saved mouse position.

;========================================================================
;TRACING TOOL
;------------------------------------------------------------------------
;mouse button 5 (forward button)
XButton2::7 ;tracing tool

;~ bucket fill
+f::mouseEvent(,{x: 0.741835, y: 0.921228})
; line type 1
Numpad1::mouseEvent(, {x: 0.909020, y: 0.921228}, {x: 0.911353, y: 0.837116})
;line type 2
Numpad2::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.757009})
;line type 3
Numpad3::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.666222})
;line type 4
Numpad4::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.591455})


;------------------------------------------------------------------------

q::p ;pause
w::, ;increase playback speed
e::. ;decrease playback speed
Tab::t
t::7 

;toggle simulation
r::Space

;pause
$Space::p

;mouse button 4 (back button)
XButton1::a ;tool wheel


MButton::
	Send, {Click, down}
	KeyWait, MButton
	Send, {Click, up}
	return

;remap primary mouse button to include 
	;the left shift key, allowing for automatic
	;dragging of joints.
LButton::
	if (doubleTap(150)){
		Send, {Click, 2}
	}
	else {
		;~ timeA := A_TickCount
		Send, {Click, down}
		KeyWait, LButton, T0.1
		if (ErrorLevel == 0)
			Send, {Click, up}
		else if (ErrorLevel == 1){
			Send, {Click, up}
			Send, {ShiftDown}{Click, down}
			KeyWait LButton
			Send, {ShiftUp}{Click, Up}
		}
	}
	return

z::
	Send, z
	Sleep, 250
	rapidFire(,"z", g_PolyBridge_UndoRedoInterval)
	return
+z::
y::
	Send, y
	Sleep, 250
	rapidFire(,"y", g_PolyBridge_UndoRedoInterval)
	return
	
