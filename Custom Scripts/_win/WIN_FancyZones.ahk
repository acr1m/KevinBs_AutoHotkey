;~ #Include %A_ScriptDir%\..\LIB\LIB_Main_Method_Library.ahk
;~ #Include %A_ScriptDir%\..\LIB\LIB_repeatKey().ahk
#IfWinActive ahk_exe FancyZonesEditor.exe
;;If window is active


NumpadSub::
	;;reduce window to minimin size possible 64x 72y
	
	;; 1r 2c
	
	wndWidth := 960
	wndHeight := 1040
	fancyZones_setSize(wndWidth, wndHeight)
	fancyZones_setPos(wndWidth, wndHeight)
	
	;;Create a new floating-window-zone and select it.
	Send, ^{Tab}{Space}^{Tab}+{Tab}

	;; 2r 2c
	Loop, 4
	{
		fancyZones_setSize(960, 520)
		Send, ^{Tab}{Space}^{Tab}+{Tab}
	}
	;; 1r 3c
	Loop, 3
	{
		fancyZones_setSize(640, 1040)
		Send, ^{Tab}{Space}^{Tab}+{Tab}
	}
	;; 2r 3c
	Loop, 6
	{
		fancyZones_setSize(640, 520)
		Send, ^{Tab}{Space}^{Tab}+{Tab}
	}

	;;select next pre-existing floating-window-zone.
	;~ Send, {Tab}

	return

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive

;;used for debugging
;~ Pause::ExitApp


;;FUNCTIONS
;;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;;reduces window to minimin size possible 64x 72y
fancyZones_resetSize(){
	SendMode, Input
	repeatShiftKey("Left", 150, 2)
	;~ repeatShiftKey("Right", 10, 2)
	repeatShiftKey("Down", 150, 2)
	;~ repeatShiftKey("Up", 10, 2)
	;;size is now at 164x 172y
}

;;increase to evenly divisible number by 10's based
;;off of target window size. 
fancyZones_prepSize(param_w, param_h){
	SendMode, Input
	;;assign increment amounts of width and height
		;;get single digit, remainder value 
		;;e.g. Mod(436, 10) = 6
		;;divide that by 2
		;;e.g. 6 / 2 = 3
		;;incrAmnt = 3
	incrAmnt_w := Floor(Abs(Mod((param_w - 64), 10) / 2))
	incrAmnt_h := Floor(Abs(Mod((param_h - 72), 10) / 2))
	
	;;increments width by 2, one to four times, going from width=64 to width=72
	;;;;if w = 400, incrAmnt_w should be 3
	repeatCtrlShiftKey("Right", incrAmnt_w, 2)

	;;increments height by 2, one to four times, going from height=72 to height=80
	;;;;if h = 400, incrAmnt_h should be 4
	repeatCtrlShiftKey("Up", incrAmnt_h, 1)
	
	return [incrAmnt_w, incrAmnt_h]
}

fancyZones_setSize(w := 400, h := 400){
	SendMode, Input
	fancyZones_resetSize()
	
	incrAmnt := fancyZones_prepSize(w, h)
	incAmount1 := incrAmnt[1]
	incAmount2 := incrAmnt[2]
	Sleep, 1
	;~ MsgBox, %incrAmnt[%]%`, %incrAmnt[1]%
	;~ MsgBox, % "incrAmnt[1] = " . incrAmnt[1] . "`nincrAmnt[2] = " . incrAmnt[2] "`nend"
	;;w = 10(x)+ 70
	;;w - 70 = 10x
	x := Floor(Abs((w - 64) / 10))
	y := Floor(Abs((h - 72) / 10))
	repeatShiftKey("Right", x, 2)
	repeatShiftKey("Up", y, 2)
	Sleep, 400
	SendMode, Event
}

fancyZones_resetPos(){
	repeatKey("Left", 300)
	repeatKey("Up", 300)
}
fancyZones_setPos(p_loopWidth, p_loopHeight){
	fancyZones_resetPos()
	;; p_loopIteration starts at a value of 1
	screenHeight := 1040
	screenWidth := 1920
	maxRows := screenHeight / p_loopHeight
	maxColumns := screenWidth / p_loopWidth
	;;set x pos where each col is, then do it again for each row
	Loop, maxRows
	{
		iterationXPos := (p_loopIteration - 1) * (screenWidth / p_loopWidth)
	}
	iterationYPos := (p_loopIteration - 1) * (screenHeight / p_loopWidth)
	repeatCtrlKey("Right", iterationXPos)
	
}