#IfWinActive PowerLauncher ahk_exe PowerLauncher.exe
::calmonth::
::month view::
::monthview::
::outlook calendar::
::outlookcalendar::
::view calendar::
::view month::
::viewcalendar::
::viewcalendarmonth::
::viewcalendarmonth::
::viewmonth::
{
	if (WinExist("ahk_exe outlook.exe")){
		Send, {Escape}
		WinActivate
	}
	else {
		SendRaw, outlook isn't currently open
		Sleep, 5000 ;;5 seconds
		Send, +{Home}{Delete}
		Send, .outlook
		Sleep, 2000 ;;2 seconds
		Send, {Enter}
		
		;;TODO - setup a run command to open up outlook if it isn't open
		Sleep, 8000 ;;8 seconds
		if (WinExist("ahk_exe outlook.exe") && !WinActive("ahk_exe outlook.exe")){
			MsgBox, 0x1040, % "Info: Window Found", % "Info: Found Window for Outlook.\n\nSwitching over...", 5
			WinActivate
			outlook_showMonth()
		}
		else if (WinActive("ahk_exe outlook.exe")){
			MsgBox, 0x1040, % "Info: WinActive", % "Info: Found Window for Outlook. Opening Month View.", 5
			outlook_showMonth()
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
Space & m::
	outlook_showMonth()
	return
;;Show Week View
!2::
Space & w::
	outlook_showWeek()
	return
;;Show Today View
!3::
Space & d::
	outlook_showToday()
	return
;;Show Schedule View
!4::
Space & s::
	outlook_showSchedule()
	return
	
	
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive


;;Functions
;;Open Calendar and show Month View
outlook_showMonth(){
	;;open calendar
	Send, ^2
	;;show month view
	Send, ^!4
}
;;Show Week View
outlook_showWeek(){
	;;open calendar
	Send, ^2
	;;show week view
	Send, ^!2
}
;;Show Today View
outlook_showToday(){
	;;open calendar
	Send, ^2
	;;show Today View
	Send, ^t
}
;;Show Schedule View
outlook_showSchedule(){
	;;open calendar
	Send, ^2
	;;show Today View
	Send, ^!5
}