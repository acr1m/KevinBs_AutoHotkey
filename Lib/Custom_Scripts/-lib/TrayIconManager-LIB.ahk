#SingleInstance Force
#Persistent

im := {}
im.scriptInstanceHandle := A_ScriptHwnd
im.iconVal := 0
im.iconActive := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico"
im.iconSuspended := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-green_10.ico"
im.iconPaused := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-yellow_10.ico"
im.iconInactive := "E:\Assets\Icons\_used-icons\firefox-01-256-base-02-red_10.ico"
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\firefox-01-256-base-02-blue_10.ico
Menu, Tray, Icon, % im.iconActive

outStr := im.scriptInstanceHandle
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

Lbl_updateTrayIcon: 
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
	ToolTip, % o.iconVal, % x+15, % y+15
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

/* 
 * class TrayIconManager {
 * 	
 * 	scriptInstanceHandle := ""
 * 	iconVal := 0
 * 	iconActive := ""
 * 	iconSuspended := ""
 * 	iconPaused := ""
 * 	iconInactive := ""
 * 	
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
 *  */
 * 	
 * 	updateTrayIcon() {
 * 		this.iconVal := 0
 * 		if (A_IsSuspended) {
 * 			this.iconVal += 1
 * 		}
 * 		if (A_IsPaused) {
 * 			this.iconVal += 2
 * 		}
 * 		this.setTrayIcon()
 * 		return
 * 	}
 * 	
 * /* 	setTrayIcon() {
 * 		if (this.icn.val <= 0) {
 * 			Menu, Tray, Icon, % this.icn.ACTIVE
 * 		} else if (this.icn.val == 1) {
 * 			Menu, Tray, Icon, % this.icn.SUSPENDED
 * 		} else if (this.icn.val == 2) {
 * 			Menu, Tray, Icon, % this.icn.PAUSED
 * 		} else if (this.icn.val >= 3) {
 * 			Menu, Tray, Icon, % this.icn.INACTIVE
 * 		}
 * 		return
 * 	}
 *  */
 *  
 * 	setTrayIcon() {
 * 		if (this.iconVal <= 0) {
 * 			Menu, Tray, Icon, % this.iconACTIVE
 * 		} else if (this.iconVal == 1) {
 * 			Menu, Tray, Icon, % this.iconSUSPENDED
 * 		} else if (this.iconVal == 2) {
 * 			Menu, Tray, Icon, % this.iconPAUSED
 * 		} else if (this.iconVal >= 3) {
 * 			Menu, Tray, Icon, % this.iconINACTIVE
 * 		}
 * 		return
 * 	}
 * } */
