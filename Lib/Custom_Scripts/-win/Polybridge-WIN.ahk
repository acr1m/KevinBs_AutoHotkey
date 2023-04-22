#SingleInstance Force
#InstallKeybdHook
#InstallMouseHook

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
;~ #Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,false) ; (,true) -> shows a msgbox indicating success/failure of process
;;~ set the icon references
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\up-down-scroll.ico

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\TrayIconManager-LIB.ahk
;~ #Include %A_ScriptDir%\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=    A_ScriptDir . "\..\-icons\polyBridge-icon-default.ico"
trayIM.iconSuspended := A_ScriptDir . "\..\-icons\polyBridge-icon-suspended.ico"
trayIM.iconPaused :=    A_ScriptDir . "\..\-icons\polyBridge-icon-paused.ico"
trayIM.iconInactive :=  A_ScriptDir . "\..\-icons\polyBridge-icon-stopped.ico"
trayIM.start()
Menu, Tray, Add ; adds a line separator
Menu, Tray, Standard ; adds all the default menu items for debugging

;~ Clipboard :=  A_MyDocuments . "\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk"
;~ E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk

;~ #Include E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK-Main-Method-Library.ahk

global g_PolyBridge_UndoRedoInterval := 10

^CtrlBreak::
{
    MsgBox, % "[" . A_ThisHotkey . "] key was pressed. `n`nExiting Application: " . A_ScriptName . "."
    ExitApp
	return
}

#IfWinActive Poly Bridge ahk_class UnityWndClass ahk_exe polybridge.exe


; mouse button 5 (forward button)
; Tracing Tool
t::
XButton2::
{
	; sends the key [7]
	main_showTooltip(A_ThisHotkey . " has been pressed")
	Send, 7
	return
}

; Bucket Fill
+f::mouseEvent(,{x: 0.741835, y: 0.921228})
; Line Type 1
Numpad1::mouseEvent(, {x: 0.909020, y: 0.921228}, {x: 0.911353, y: 0.837116})
; Line Type 2
Numpad2::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.757009})
; Line Type 3
Numpad3::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.666222})
; Line Type 4
Numpad4::mouseEvent(, {x: 0.909020, y: 0.921228},{x: 0.911353, y: 0.591455})


;------------------------------------------------------------------------
; Pause
q::p
; Increase Playback Speed
w::,
; Decrease Playback Speed
e::.

; Open Settings Menu
Tab::
{
	MouseGetPos, x, y ; store mouse pos in vars x and y
	KeyWait, Tab
	Send, {Esc}
	Sleep, 200
	; click on the settings button
	Send, {Click, 30, 215, Left} 
	; return mouse to initial position
	Send, {Click, %x%, %y%, 0}
	return
}

; Press [Ctrl+S] to save a new timestamp file
^s::
{
	MouseGetPos, x, y ; store mouse pos in vars x and y
	KeyWait, Tab
	Send, {Esc}
	Sleep, 200
	; click on the save button
	Send, {Click, 33, 148, Left}
	Sleep, 100
	; click on the new save slot button
	Send, {Click, 894, 395, Left}
	Sleep, 100
	; click on the new save slot button
	Send, {Click, 1050, 555, Left}
	Sleep, 100
	; return mouse to initial position
	Send, {Click, %x%, %y%, 0}
	return
	return
}


; Press [r] to run simulation
r::Space

; Press [spacebar] to pause/unpause simulation
$Space::p

; Mouse Button 4 (Back Button)
; Tool Wheel
XButton1::a

; Middle Mouse Button
MButton::
{
	Send, {Click down}
	KeyWait, MButton
	Send, {Click up}
	return
}

;remap primary mouse button to include 
	;the left shift key, allowing for automatic
	;dragging of joints.
/* $LButton::
 * {
 * 	if (doubleTap(150)) {
 * 		
 * 		main_showTooltip(A_ThisHotkey . " doubleTapped")
 * 		;~ MsgBox, % A_ThisHotkey . " doubleTapped"
 * 		Send, {Click, 2}
 * 	}
 * 	else {
 * 		
 * 	; 
 * 		main_showTooltip(A_ThisHotkey . " regular")
 * 		;~ MsgBox, % A_ThisHotkey . " regular"
 * 		;~ timeA := A_TickCount
 * 		Send, {Click, down}
 * 		
 * 		; wait for left mouse button to be released ---------
 * 		KeyWait, LButton, T 0.1
 * 		
 * 		; if successfully released, ErrorLevel will be value 0
 * 		if (ErrorLevel == 0)
 * 		{
 * 			KeyWait, z, T 0.15 ; wait for z to be released
 * 			main_showTooltip(A_ThisHotkey . " ErrorLevel == 0, successfully released")
 * 			Send, {Click, up}
 * 		}
 * 		; if not successfully released,
 * 		;  implying that left mouse button 
 * 		;  is held down by user
 * 		;  or
 * 		;  a failure of some other kind
 * 		else if (ErrorLevel == 1)
 * 		{
 * 			main_showTooltip(A_ThisHotkey . " ErrorLevel == 1, NOT released")
 * 			
 * 			; resend left-mouse with Shift modifier held down
 * 			Send, {Click, up}
 * 			Send, {ShiftDown}{Click, down}
 * 			
 * 			; wait for left-mouse to be released --------------
 * 			KeyWait LButton
 * 			
 * 			Send, {ShiftUp}{Click, up}
 * 		}
 * 		
 * 	}
 * 	return
 * }
 */

; Press [z] to Undo (Hold to Repeat)
z::
{
	Send, z
	KeyWait, z, T 0.25 ; wait for key to be released
	if (!ErrorLevel)
	{
		rapidFire(,"z", g_PolyBridge_UndoRedoInterval)
	}
	else
	{
		
	}
	return
}

; Press [y] or [Shift]+[y] to Redo (Hold to Repeat)
+z::
y::
{
	Send, y
	KeyWait, y, T 0.25 ; wait for key to be released
	rapidFire(,"y", g_PolyBridge_UndoRedoInterval)
	return
}
	
