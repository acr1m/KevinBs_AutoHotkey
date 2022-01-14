;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_red_white.ico"
;: Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_blue_white.ico"
Menu, Tray, Icon, % "E:\Assets\Icons\key_circle_green_white.ico"

;: #Include %A_ScriptDir%\..\_lib\
;: #Include LIB_Main_Method_Library.ahk
;: #Include LIB_Emojis_And_Symbols.ahk
;: #Include LIB_repeatKey().ahk
;: #Include LIB_time().ahk
;: #Include LIB_RegEx().ahk

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
