#IfWinActive ahk_exe PowerLauncher.exe
::??calmonth::
::??month view::
::??monthview::
::??outlook calendar::
::??outlookcalendar::
::??view calendar::
::??view month::
::??viewcalendar::
::??viewcalendarmonth::
::??viewcalendarmonth::
::??viewmonth::
{
	if (WinExist("ahk_exe outlook.exe")){
		pwrRun_clearText()
		Send, {Escape}
		WinActivate, ahk_exe outlook.exe
		WinWaitActive, ahk_exe outlook.exe
		outlook_showMonth()
	}
	;; attempt to open Outlook and then show month view
	else {
		SetKeyDelay, 2
		;~ Send, !{Space}
		SendRaw, looks like outlook isn't currently open...
		Sleep, 1500 ;; 1.5 seconds
		Send, ^a{Delete}
		SendRaw, let's try opening it
		Sleep, 1500 ;; 1.5 seconds
		Send, ^a{Delete}
		SendRaw, .outlook
		Sleep, 1000	;; 1 second
		Send, {Enter}
		WinWait, ahk_exe outlook.exe, , 20 ;; wait a maximum of 20 seconds
		
		if (ErrorLevel){
			MsgBox, , % "Error", % "Outlook is taking too long to open.`n`nExiting method.", 3
			return
		}
		
		;; attempt to activate and wait for it to become active
		WinActivate, ahk_exe outlook.exe
		WinWaitActive, ahk_exe outlook.exe
		SetKeyDelay, 10 ; back to the Default value (10)
		
		;; if it's in the background
		if (WinExist("ahk_exe outlook.exe") && !WinActive("ahk_exe outlook.exe")){
			MsgBox, 0x1040, % "Info: Window Found", % "Info: Found Window for Outlook.\n\nSwitching over...", 3
			WinActivate, ahk_exe outlook.exe
			outlook_showMonth()
			return
		}
		;; if it's already active
		else if (WinActive("ahk_exe outlook.exe")){
			MsgBox, 0x1040, % "Info: WinActive", % "Info: Found Window for Outlook. Opening Month View.", 3
			WinActivate, ahk_exe outlook.exe
			outlook_showMonth()
			return
		}
		;; if it still doesn't exist
		else if (!WinExist("ahk_exe outlook.exe")){
			MsgBox, 0x1010, % "Error: Window Not Found", % "Error: Window for Outlook does not exist.", 3
			return
		} else {
			MsgBox, 0x1010, % "Error: Unknown", % "Something went wrong... ¯\_(ツ)_/¯", 3
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
	;~ WinActivate, ahk_exe outlook.exe
	;~ return
;~ }

#IfWinActive ahk_exe outlook.exe
;;If window is active

Space::Send, {Space}

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