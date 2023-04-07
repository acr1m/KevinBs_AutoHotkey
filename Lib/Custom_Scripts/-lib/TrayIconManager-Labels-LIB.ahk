Lbl_TrayIconManager_Start:
	Menu, Tray, NoStandard
	Menu, Tray, Add, % "Suspend Hotkeys", Lbl_TrayIconManager_Suspend
	Menu, Tray, Add, % "Pause Script", Lbl_TrayIconManager_Pause
	Menu, Tray, Add, % "Exit", Lbl_TrayIconManager_Exit
	SetTimer, Lbl_TrayIconManager_SetTimer, 250
	return
	
Lbl_TrayIconManager_SetTimer:
	trayIM.updateTrayIcon()
	return

Lbl_TrayIconManager_Suspend:
	Menu, Tray, ToggleCheck, % "Suspend Hotkeys"
	trayIM.toggleSuspend()
	trayIM.updateTrayIcon()
	Suspend, Toggle
	return
	
Lbl_TrayIconManager_Pause:
	Menu, Tray, ToggleCheck, % "Pause Script"
	trayIM.togglePause()
	trayIM.updateTrayIcon()
	Pause, Toggle
	return
	
Lbl_TrayIconManager_Exit:
	ExitApp
	return