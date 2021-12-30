#IfWinActive ahk_exe FancyZonesEditor.exe
;;If window is active

#^!+Enter::
{
	NumpadSub::
	;;reduce window to minimin size possible 64x 72y
	;~ fancyZones_setSize(430, 400)
	;~ fancyZones_setSize(1050/3, 1640/3)
	;~ fancyZones_setSize(1640/3, 1050/3)
	fancyZones_setSize(700, 300)

	Send, {Tab}
    return

	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.

#IfWinActive

Pause::ExitApp

;;reduces window to minimin size possible 64x 72y
fancyZones_resetSize(){
	SendMode, Input
	repeatShiftKey("Down", 100, 2)
	repeatShiftKey("Left", 100, 2)
}

;;increase to evenly divisible number by 10's
fancyZones_prepSize(){
	SendMode, Input
	repeatCtrlShiftKey("Right", 3, 2)
	repeatCtrlShiftKey("Up", 4, 1)
}

fancyZones_setSize(w := 480, h := 270){
	SendMode, Input
	fancyZones_resetSize()
	fancyZones_prepSize()
	;;w = 10(x)+ 70
	;;w - 70 = 10x
	x := (w - 70) / 10
	y := (h - 80) / 10
	repeatShiftKey("Right", x, 1)
	repeatShiftKey("Up", y, 1)
	Sleep, 200
	SendMode, Event
}

