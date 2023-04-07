class TrayIconManager {
	
	scriptInstanceHandle := ""
	isSuspended := false
	isPaused := false
	iconVal := 0
	iconActive := ""
	iconSuspended := ""
	iconPaused := ""
	iconInactive := ""
	iconExit := "-resources\x-s01.ico"
	
	start() {
		Menu, Tray, Icon, % this.iconActive,, 1 ;; 1 indicates to turn off AHK default icon updates
		Menu, Tray, NoStandard
		
		tgt_suspend := ObjBindMethod(this, "toggleSuspend")
		Menu, Tray, Add, % "Suspend Hotkeys", % tgt_suspend
		Menu, Tray, Icon, % "Suspend Hotkeys", % this.iconSuspended
		
		tgt_pause := ObjBindMethod(this, "togglePause")
		Menu, Tray, Add, % "Pause Script", % tgt_pause
		Menu, Tray, Icon, % "Pause Script", % this.iconPaused
		
		tgt_exit := ObjBindMethod(this, "exitScript")
		Menu, Tray, Add, % "Exit", % tgt_exit
		Menu, Tray, Icon, % "Exit", % this.iconExit
		
		tgt_update := ObjBindMethod(this, "updateTrayIcon")
		SetTimer, % tgt_update, 250
	}
	
	exitScript() {
		ExitApp
		return
	}
	
	updateTrayIcon() {
		this.iconVal := 0
		if (this.isSuspended) {
			this.iconVal += 1
		}
		if (this.isPaused) {
			this.iconVal += 2
		}
		this.setTrayIcon()
		return
	}
	
	setTrayIcon(p_iconFile := "") {
		if (this.iconVal <= 0) {
			Menu, Tray, Icon, % this.iconActive,,1
		} else if (this.iconVal == 1) {
			Menu, Tray, Icon, % this.iconSuspended,,1
		} else if (this.iconVal == 2) {
			Menu, Tray, Icon, % this.iconPaused,,1
		} else if (this.iconVal >= 3) {
			Menu, Tray, Icon, % this.iconInactive,,1
		}
		
		if (p_iconFile) {
			Menu, Tray, Icon, % p_iconFile,,1
		}
		return
	}
	
	togglePause() {
		this.isPaused := !this.isPaused
		this.applyIsPaused()
		return this.iconVal
	}
	
	setIsPaused(p_boolean) {
		this.isPaused := p_boolean
		this.applyIsPaused()
		return this.iconVal
	}
	
	applyIsPaused() {
		if (this.isPaused) {
			Menu, Tray, Check, % "Pause Script"
			this.updateTrayIcon()
			Pause, On, true
		} else {
			Menu, Tray, UnCheck, % "Pause Script"
			this.updateTrayIcon()
			Pause, Off, true
		}
		return
	}
	
	toggleSuspend() {
		this.isSuspended := !this.isSuspended
		this.applyIsSuspended()
		return this.iconVal
	}
	
	setIsSuspended(p_boolean) {
		this.isSuspended := p_boolean
		this.applyIsSuspended()
		return this.iconVal
	}
	
	applyIsSuspended() {
		if (this.isSuspended) {
			Menu, Tray, Check, % "Suspend Hotkeys"
			this.updateTrayIcon()
			Suspend, On
		} else {
			Menu, Tray, UnCheck, % "Suspend Hotkeys"
			this.updateTrayIcon()
			Suspend, Off
		}
		return
	}
}