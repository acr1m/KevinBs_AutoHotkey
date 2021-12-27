#IfWinActive PowerLauncher ahk_exe PowerLauncher.exe
::monthview::
::calmonth::
::viewmonth::
::viewcalendarmonth::
::viewcalendar::
::outlookcalendar::
::outlook calendar::
{
	if (WinExist("ahk_exe outlook.exe")){
		WinActivate
	}
	else {
		SendRaw, outlook isn't currently open
		;;TODO - setup a run command to open up outlook if it isn't open
		Send, .outlook{enter}
		Sleep, 10000 ;10 seconds
		if (WinExist("ahk_exe outlook.exe") && !WinActive("ahk_exe outlook.exe")){
			WinActivate
		}
		else if (WinActive("ahk_exe outlook.exe")){
			continue
		}
		else if (!WinExist("ahk_exe outlook.exe")){
			MsgBox, 0x1010, % "Error: Window Not Found", % "Error: Window for Outlook does not exist.", 5
		}
		else {
			MsgBox, 0x1010, % "Error: Unknown", % "Something went wrong... ¯\_(ツ)_/¯", 5
			return
		}
	}
}

#IfWinActive
;;If window doesn't exist
;~ #^!+Enter::
;~ {
	;~ Run, 
	;~ return
;~ }

#IfWinExist ahk_exe outlook.exe
;;If window does exist

;~ #^!+Enter::
;~ {
	;~ WinActivate
	;~ return
;~ }

#IfWinActive ahk_exe outlook.exe
;;If window is active

;;Open Calendar and show Month View
!1::
^m::
!m::
{
	;;open calendar
	Send, ^2
	;;show month view
	Send, ^!4
	return
}
;;Show Week View
!2::
!w::
^w::
{
	;;open calendar
	Send, ^2
	;;show week view
	Send, ^!2
	return
}
;;Show Today View
!3::
!w::
^w::
{
	;;open calendar
	Send, ^2
	;;show Today View
	Send, ^t
	return
}
;;Show Schedule View
!4::
{
	;;open calendar
	Send, ^2
	;;show Today View
	Send, ^!5
	return
}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive