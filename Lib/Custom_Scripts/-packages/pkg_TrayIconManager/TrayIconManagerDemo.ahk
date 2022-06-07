;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico
#Persistent
#Include %A_LineFile%\..\TrayIconManager.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=	"-resources\key-s04-green.ico"
trayIM.iconSuspended :=	"-resources\key-s04-blue.ico"
trayIM.iconPaused :=	"-resources\key-s04-yellow.ico"
trayIM.iconInactive :=	"-resources\key-s04-red.ico"
trayIM.start()
return

/*
Numpad1:: ;; set as Active
	Suspend, Permit
	Pause, Off, true
	ToolTip, % trayIM.setIsPaused(false), 1800, 980
	ToolTip, % trayIM.setIsSuspended(false), 1800, 980
	return
Numpad2:: ;; Lbl_TrayIconManager_Suspend:
	Suspend, Permit
	ToolTip, % trayIM.toggleSuspend(), 1800, 980
	return
Numpad3:: ;; Lbl_TrayIconManager_Pause:
	Suspend, Permit
	Pause, Off, true
	ToolTip, % trayIM.togglePause(), 1800, 980
	return
Numpad0::
	Suspend, Permit
	Pause, Off, true
	ExitApp
	return
*/