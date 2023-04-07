#SingleInstance Force

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,false) ; (,true) -> shows a msgbox indicating success/failure of process

;~ var1 := A_IsAdmin
;~ var2 := A_Now
;~ var3 := A_Cursor
;~ main_tooltipShowVar([var1, var2, var3])

;;~ set the icon references
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\TrayIconManager-LIB.ahk
;~ #Include %A_ScriptDir%\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=    "E:\Assets\Icons\_used-icons\key-s05-green.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\key-s05-blue.ico"
trayIM.iconPaused :=    "E:\Assets\Icons\_used-icons\key-s05-yellow.ico"
trayIM.iconInactive :=  "E:\Assets\Icons\_used-icons\key-s05-red.ico"		
trayIM.start()

Menu, Tray, Tip, % "[LCtrl+Space] = Send 4 Spaces"
Menu, Tray, Add

global _delayAmount := 0
global _delayMenuItem_checked := ""
global _sendAmount := 1
global _sendMenuItem_Checked := ""

/* for debugging
SetTimer, Lbl_showVar, 200
*/

n := 0
Loop, 21 {
	m := n * 20
	targetFunc := Func("func_SetSpaceDelay").Bind(m)
	Menu, DelayAmountMenu, Add, % "Delay Amount := " . m, % targetFunc
	
	m := n + 1
	targetFunc := Func("func_SetSpaceSendAmount").Bind(m)
	Menu, SendAmountMenu, Add, % "Send Amount := " . m, % targetFunc
	n += 1
}
Menu, Tray, Add, % "Delay Amount", :DelayAmountMenu
Menu, Tray, Add, % "Send Amount", :SendAmountMenu
return





;END OF AUTO-EXECUTE SECTION__________________________


/* sub used for debugging 
*/
Lbl_showVar:
	MouseGetPos, mX, mY
	ToolTip, % "_delayAmount: " . _delayAmount . "`n_sendAmount: " . _sendAmount , mX + 10, mY - 60
	return


func_SetSpaceDelay(p_amount){
	
	if (_delayMenuItem_checked == "") {
		_delayMenuItem_checked := A_ThisMenuItem
	}
	
	Menu, DelayAmountMenu, UnCheck, % _delayMenuItem_checked
	
	_delayAmount := p_amount
	
	Menu, DelayAmountMenu, Check, % A_ThisMenuItem 
	_delayMenuItem_checked := A_ThisMenuItem
	
	return
}

func_SetSpaceSendAmount(p_amount){
	
	if (_sendMenuItem_Checked == "") {
		_sendMenuItem_Checked := A_ThisMenuItem
	}
	
	Menu, SendAmountMenu, UnCheck, % _sendMenuItem_Checked
	
	_sendAmount := p_amount
	
	Menu, SendAmountMenu, Check, % A_ThisMenuItem 
	_sendMenuItem_Checked := A_ThisMenuItem
	
	return
}


<^Space::
	KeyWait, % "LCtrl"
	Loop, % _sendAmount {
		Send, {Space}
		Sleep, % _delayAmount
	}
	return

Pause::
	ExitApp