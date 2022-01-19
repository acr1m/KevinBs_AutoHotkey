;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_red_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_blue_white.ico"
Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_green_white.ico"

;: #Include %A_ScriptDir%\..\-lib\
;: #Include Main-Method-Library-LIB.ahk
;: #Include Emojis-And-Symbols-LIB.ahk
;: #Include repeatKey()-LIB.ahk
;: #Include time()-LIB.ahk
;: #Include RegEx()-LIB.ahk

#IfWinActive, Untitled GUI ahk_exe InternalAHK.exe, \SmartGUI\Grid.gif
;;If window is active

~RButton::
{
	timeOfRButtonDown := A_TickCount
	return
}

w::
Delete::
{
	delta := A_TickCount - timeOfRButtonDown
	if (delta < 1250){
		;; Then target the delete, r-click context, menu command.
		Send, dd{Enter}
	}
	else
		Send, %A_ThisHotkey%
	return
}
d::
{
	delta := A_TickCount - timeOfRButtonDown
	if (delta < 1250){
		;; Then target the duplicate, r-click context, menu command.
		Send, %A_ThisHotkey%{Enter}
	}
	else
		Send, %A_ThisHotkey%
	return
}
c::
{
	delta := A_TickCount - timeOfRButtonDown
	if (delta < 1250){
		;; Then target the change-label, r-click context, menu command.
		Send, %A_ThisHotkey%{Enter}
	}
	else
		Send, %A_ThisHotkey%
	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive
