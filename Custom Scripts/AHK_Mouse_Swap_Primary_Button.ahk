;@description: This file script is a testing ground for DLL files and functions.
;@reference: 

;~ Swap left and right mouse buttons

;~WINDOWS RUN COMMAND:> rundll32.exe User32.dll,SwapMouseButton

;~ DllFile may be omitted when calling a function that resides in User32.dll, 
	;~ Kernel32.dll, ComCtl32.dll, or Gdi32.dll. For example, 
	;~ "User32\IsWindowVisible" produces the same result as "IsWindowVisible".

;IF TRUE, MOUSE IS SWAPPED,  (Left = Right)
;IF FALSE, MOUSE IS DEFAULT, (Left = Left)

DllCall("User32\SwapMouseButton")
assignPrimaryMouseButton(primaryButton := "Left"){
	if (DllCall("User32\SwapMouseButton")){
		
	}
	else if (){
		
	}
	else{
		
	}
}


;Open the Mouse Properties dialog window

;WINDOWS RUN COMMAND:> rundll32.exe Shell32.dll,Control_RunDLL main.cpl @0,0
;~ DllCall("User32", 