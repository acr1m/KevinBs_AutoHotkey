;; #SingleInstance Force
;; #Persistent


/* outStr := im.scriptInstanceHandle
outStr .= "`n" . im.iconVal
outStr .= "`n" . im.iconActive
outStr .= "`n" . im.iconSuspended
outStr .= "`n" . im.iconPaused
outStr .= "`n" . im.iconInactive
MsgBox, % outStr

SetTimer, Lbl_updateTrayIcon, 250
return

^!Numpad0::
	Suspend, Permit
	Suspend, Toggle
	gosub, Lbl_updateTrayIcon
	return
^!Numpad1::
	Pause, Toggle
	Suspend, Permit
	gosub, Lbl_updateTrayIcon
	return
 */


/* Lbl_updateTrayIcon: 
{
	Suspend, Permit
	Pause, Off, true
	
	im.iconVal := 0
	if (A_IsSuspended) {
		im.iconVal += 1
	}
	if (A_IsPaused) {
		im.iconVal += 2
	}
	setTrayIcon(im)
	return
}

setTrayIcon(o) {
	Suspend, Permit
	Pause, Off, true
	
	MouseGetPos, x, y
	ToolTip, % o.iconVal, % 1700, % 400
	if (o.iconVal <= 0) {
		Menu, Tray, Icon, % o.iconActive
	} else if (o.iconVal == 1) {
		Menu, Tray, Icon, % o.iconSuspended
	} else if (o.iconVal == 2) {
		Menu, Tray, Icon, % o.iconPaused
	} else if (o.iconVal >= 3) {
		Menu, Tray, Icon, % o.iconInactive
	}
	return
}
 */


class TrayIconManager {
	
	scriptInstanceHandle := ""
	isSuspended := false
	isPaused := false
	iconVal := 0
	iconActive := ""
	iconSuspended := ""
	iconPaused := ""
	iconInactive := ""
	
	start() {
		Menu, Tray, Icon, % this.iconActive,, 1 ;; 1 indicates to turn off AHK default icon updates
		Menu, Tray, NoStandard
		
		tgt_suspend := ObjBindMethod(this, "toggleSuspend")
		Menu, Tray, Add, % "Suspend Hotkeys", % tgt_suspend
		
		tgt_pause := ObjBindMethod(this, "togglePause")
		Menu, Tray, Add, % "Pause Script", % tgt_pause
		
		tgt_exit := ObjBindMethod(this, "exitScript")
		Menu, Tray, Add, % "Exit", % tgt_exit
		
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
	
	setTrayIcon() {
		if (this.iconVal <= 0) {
			Menu, Tray, Icon, % this.iconACTIVE,,1
		} else if (this.iconVal == 1) {
			Menu, Tray, Icon, % this.iconSUSPENDED,,1
		} else if (this.iconVal == 2) {
			Menu, Tray, Icon, % this.iconPAUSED,,1
		} else if (this.iconVal >= 3) {
			Menu, Tray, Icon, % this.iconINACTIVE,,1
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
	
/* 	
 * 	__New() {
 * 		this.scriptInstanceHandle := A_ScriptHwnd
 * 		return
 * 	}
 * 	
 * /* 	startTimer(p_milliseconds) {
 * 		objMethodRef_updateTrayIcon := ObjBindMethod(this, "updateTrayIcon")
 * 		SetTimer, % objMethodRef_updateTrayIcon, % p_milliseconds
 * 		return
 * 	}
 *  */
 * 	
 * /* 	scriptInstanceHandle {
 * 		get {
 * 			return this.scriptInstanceHandle
 * 		}
 * 		set {
 * 			return this.scriptInstanceHandle := A_ScriptHwnd
 * 		}
 * 	}
 *  */
 * 	
 * /* 	icn.val[i] {
 * 		get {
 * 			return this.icn.val
 * 		}
 * 		set {
 * 			return this.icn.val := [i]
 * 		}
 * 	}
 *  */
 *  
 * /* 	icn.ACTIVE[] {
 * 		get {
 * 			return this.icn.ACTIVE
 * 		}
 * 		set {
 * 			return this.icn.ACTIVE := value
 * 		}
 * 	}
 * 	icn.SUSPENDED[str] {
 * 		get {
 * 			return this.icn.SUSPENDED
 * 		}
 * 		set {
 * 			return this.icn.SUSPENDED := str
 * 		}
 * 	}
 * 	icn.PAUSED[str] {
 * 		get {
 * 			return this.icn.PAUSED
 * 		}
 * 		set {
 * 			return this.icn.PAUSED := str
 * 		}
 * 	}
 * 	icn.INACTIVE[str] {
 * 		get {
 * 			return this.icn.INACTIVE
 * 		}
 * 		set {
 * 			return this.icn.INACTIVE := str
 * 		}
 * 	}
 */

}
