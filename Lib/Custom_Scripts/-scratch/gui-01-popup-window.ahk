#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\WM-List-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,false) ; (,true) -> shows a msgbox indicating success/failure of process

gosub, Lbl_BuildGui



Lbl_BuildGui:
	;~ Gui, +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
	Gui, +AlwaysOnTop +Owner  ; +Owner avoids a taskbar button.
	Gui, -MaximizeBox -MinimizeBox
	;~ Gui, +AlwaysOnTop -SysMenu +Owner  ; +Owner avoids a taskbar button.
	Gui, Add, Text,, Some text to display.
	Gui, Add, Button, gNonCaptureGroup, % "(?:)"

	guiTitle := "Title of Window"
	Gui, Show, NoActivate, % guiTitle ; NoActivate avoids deactivating the currently active window.
	;~ Gui, +SysMenu
	;~ Gui, -Disabled
	;~ Gui, +Enabled

	;~ prevWin := gui_getLastWindow()
	global prevWin := {title: "", handle: "", control: ""} 
	gui_getLastWindow(prevWin)
	;~ main_showTooltip(prevWin)
	return

gui_getLastWindow(ByRef winObj) {
	winObj := {title: "", handle: "", control: ""} ; g_pw stands for `global_previousWindow`
	
	WinWait, , , 0.5, % guiTitle ; waits 10 seconds for any active window that is not this Gui window.
	winObj.handle := WinExist("A") ; returns the last found window
	
	WinGetActiveTitle, outVar ; set the title
	winObj.title := outVar
	
	ControlGetFocus, outVar ; set the focused (target) control id to use with WM_MESSAGE
	winObj.control := outVar
	
	;~ main_showTooltip(obj)
	
	msg := "winObj: " . winObj 
	msg .= "`n" . "winObj.title := " . winObj.title
	msg .= "`n" . "winObj.handle := " . winObj.handle
	msg .= "`n" . "winObj.control := " . winObj.control
	;~ MsgBox, , % A_ScriptName, % msg
	main_showTooltip(msg, 1000)
	
	return winObj
}

Pause::
	ExitApp
GuiEscape:
GuiClose:
	ExitApp
	

NonCaptureGroup:
	
	msg := "prevWin object`n"
	for key, val in prevWin {
		msg .= key . " := " . val . "`n"
	}
	main_showTooltip(msg, 1000)
	
	mainString := "(?:)"
	stringLength := StrLen(mainString)
	msg := mainString . " := " . stringLength
	main_showTooltip(msg, 1000)
  	
 	Loop %stringLength% {
		;~ charVal := Asc(SubStr(mainString, %A_Index%))
		str := SubStr(mainString, A_Index)
		charVal := Asc(str)		
		tgtControl := prevWin.control
			msg := str . "`n" . charVal . "`n" . tgtControl
			main_showTooltip(msg, 1000)
		
		PostMessage, 0x102, %charVal%, 1, %tgtControl%
		;~ PostMessage, %WM_CHAR%, %charVal%, 1, %tgtControl%
		
		;~ PostMessage, 0x100, %charVal%, 1, %tgtControl%
		;~ PostMessage, %WM_KEYDOWN%, %charVal%, 1, %tgtControl%
		
		Sleep, 1000
	}
 
	return
	
	
	
	
