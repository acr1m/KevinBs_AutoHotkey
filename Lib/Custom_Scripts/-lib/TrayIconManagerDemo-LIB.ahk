;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico
#Persistent
#Include %A_LineFile%\..\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=	"E:\Assets\Icons\_used-icons\key-s4-green.ico"
trayIM.iconSuspended :=	"E:\Assets\Icons\_used-icons\key-s4-blue.ico"
trayIM.iconPaused :=	"E:\Assets\Icons\_used-icons\key-s4-yellow.ico"
trayIM.iconInactive :=	"E:\Assets\Icons\_used-icons\key-s4-red.ico"
trayIM.start()
return

/* 
Numpad0:: ;; set as Active
	Suspend, Permit
	Pause, Off, true
	ToolTip, % trayIM.setIsPaused(false), 1700, 400
	ToolTip, % trayIM.setIsSuspended(false), 1700, 400
	return
Numpad1:: ;; Lbl_TrayIconManager_Suspend:
	Suspend, Permit
	ToolTip, % trayIM.toggleSuspend(), 1700, 400
	return
Numpad2:: ;; Lbl_TrayIconManager_Pause:
	Suspend, Permit
	Pause, Off, true
	ToolTip, % trayIM.togglePause(), 1700, 400
	return
Numpad3::
	Suspend, Permit
	Pause, Off, true
	ExitApp
	return
 */