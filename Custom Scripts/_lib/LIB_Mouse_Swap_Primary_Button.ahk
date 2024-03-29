;@description: This file script is a testing ground for DLL files and functions.
;@reference: 

;~ Swap left and right mouse buttons

;~WINDOWS RUN COMMAND:> rundll32.exe User32.dll,SwapMouseButton

;~ DllFile may be omitted when calling a function that resides in User32.dll, 
	;~ Kernel32.dll, ComCtl32.dll, or Gdi32.dll. For example, 
	;~ "User32\IsWindowVisible" produces the same result as "IsWindowVisible".


;IF TRUE, MOUSE IS SWAPPED,  (Left = Right)
;IF FALSE, MOUSE IS DEFAULT, (Left = Left)
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiContent:
gosub, GuiListA
;~ gosub, GuiToolTipA
SetTimer, UpdateGui, 2000
return

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiListA:
Gui, MouseSwapVariables:Add, ListView, r5 w250 vNone gLabelFoobar, Global Variable|Value
Gui, MouseSwapVariables:Default
LV_Add("", "PRIMARY_MOUSE", (PRIMARY_MOUSE))
LV_ModifyCol()
LV_ModifyCol(2)
return

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiToolTipA:
ToolTip % "PRIMARY_MOUSE = " . PRIMARY_MOUSE
return

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UpdateGui:
;~ Gui, MouseSwapVariables:Show, w263 h282, Mouse Swap Variables
return

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LabelFoobar:
return
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MouseSwapVariablesGuiClose:
ExitApp

#IfWinActive Mouse Swap Variables
Pause::
;~ Gui, MouseSwapVariables:Destroy
ExitApp
#IfWinActive
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* assignPrimaryMouseButton()
 * @descr - This function sets the primary mouse button to either Left or Right by using
 *				windows rundll32.exe➔User32.dll\SwapMouseButton function.
 * @default - Will default to Left Mouse Button if parameter is undefined. 
 * @params - p_str must be either "Left" or "Right".
 * @errors - stored in variable (ErrorLevel).
 * 		0	- no error
 * 		-1	- 
 * 		1	- 
 * 		2	- 
 * 		3	- 
 */
assignPrimaryMouseButton(p_str := "Left"){
	;set global var for monitoring state of mouse
	global PRIMARY_MOUSE := p_str
	mouseStateIsRight := swapPrimaryMouseButton()
	
	Loop {
		;if mouseStateIsRight and param is "Right", then do nothing and return
		if (mouseStateIsRight == true && p_str == "Right"){
			;success
			ErrorLevel := 0
			return true
		}
		;if mouseStateIsRight is false and param is "Left", then do nothing and return
		else if (!mouseStateIsRight == false && p_str == "Left"){
			;success
			ErrorLevel := 0
			return true
		}
		;if mouseStateIsRight, but trying to set as "Left", then swap again and repeat
		else if (mouseStateIsRight == true && p_str == "Left"){
			;error 1, swap and repeat loop
			ErrorLevel := 1
			mouseStateIsRight := swapPrimaryMouseButton()
			continue
		}
		;if mouseStateIsRight == false, then primary mouse is left button
		else if (!mouseStateIsRight == false && p_str == "Right"){
			;error 1, swap and repeat loop
			ErrorLevel := 1
			mouseStateIsRight := swapPrimaryMouseButton()
			continue
		}
		else if (!p_str){
			;error 2
			ErrorLevel := 2
			retVal := "p_str is undefined"
			return retVal
		}
		else if (p_str != "Left" || p_str != "Right"){
			;error 3
			ErrorLevel := 3
			retVal := "Error: passed value must be equal to [Left] or [Right]"
			return retVal
		}
		else{
			;error, all attempts failed
			ErrorLevel := -1
			return false
		}
	}
}
swapPrimaryMouseButton(){
	boolVal := DllCall("User32\SwapMouseButton")
	/*
	;returns
		- true: if mouse is swapped (Right Click = Left Click)
		- false: if mouse is not swapped (Left Click = Left Click)
	*/
	
	;set global var for monitoring state of mouse
	if (boolVal == false){
		;~ ErrorLevel := 0
		PRIMARY_MOUSE := "Left"
	}
	else if (boolVal == true){
		;~ ErrorLevel := 0
		PRIMARY_MOUSE := "Right"
	}
	else {
		;~ ErrorLevel := 1
	}
	retVal := boolVal
	
	return retVal
}

;Open the Mouse Properties dialog window

;WINDOWS RUN COMMAND:> rundll32.exe Shell32.dll,Control_RunDLL main.cpl @0,0
;~ DllCall("User32", 