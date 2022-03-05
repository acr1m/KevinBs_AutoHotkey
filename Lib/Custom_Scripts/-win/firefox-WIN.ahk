#IfWinActive ahk_exe firefox.exe
;;If window is active

!q:: ;{
	KeyWait, Alt
	KeyWait, Ctrl
	KeyWait, Shift
	KeyWait, LWin
	
	Send, {AppsKey}
	Sleep, 100
	Send, {Down 10}{Enter}
	return
;}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive
