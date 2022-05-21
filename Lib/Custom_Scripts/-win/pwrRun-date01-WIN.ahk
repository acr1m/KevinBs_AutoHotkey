
#IfWinActive ahk_exe PowerToys.PowerLauncher.exe
::??getNow::
	SetTimer, Lbl_getNow, -250
	return
::??getDate::
::??date::
	SetTimer, Lbl_getDateWithClipboard, -250
	return
::??getToday::
::??today::
	SetTimer, Lbl_getToday, -250
	return

#IfWinActive
::??getNow;::
	SetTimer, Lbl_getNow, -250
	return
::??getDate;::
	SetTimer, Lbl_getDateWithClipboard, -250 ;; wait 250 milliseconds and then do sub once
	return
::??getToday;::
	SetTimer, Lbl_getToday, -250 ;; wait 250 milliseconds and then do sub once
	return


Lbl_getDateWithClipboard:
	Clipboard := timeCalc_getDateWithClipboard(Clipboard, "ddd, M/d/yyyy")
	return

Lbl_getToday:
	Clipboard := timeCalc_getToday("ddd, M/d/yyyy")
	return

Lbl_getNow:
	Clipboard := timeCalc_getToday("ddd, M/d/yyyy, hh:mm:ss_tt")
	return

/* Date Formats (case sensitive)
;; =============================================================================
;; Format 	Description
;; "ddd, M/d/yyyy" = Fri, 4/8/2022
;; -----------------------------------------------------------------------------
;; d 		Day of the month without leading zero (1 – 31)
;; dd 		Day of the month with leading zero (01 – 31)
;; ddd 		Abbreviated name for the day of the week (e.g. Mon) in the current user's language
;; dddd 	Full name for the day of the week (e.g. Monday) in the current user's language
;; M 		Month without leading zero (1 – 12)
;; MM 		Month with leading zero (01 – 12)
;; MMM 		Abbreviated month name (e.g. Jan) in the current user's language
;; MMMM 	Full month name (e.g. January) in the current user's language
;; y 		Year without century, without leading zero (0 – 99)
;; yy 		Year without century, with leading zero (00 – 99)
;; yyyy 	Year with century. For example: 2005
;; gg 		Period/era string for the current user's locale (blank if none)
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
/* Time Formats (case sensitive)
;; =============================================================================
;; Format 	Description
;; "h:m:st" = 4:15P
;; "hh:mm:ss_tt" = 04:19:14_PM
;; -----------------------------------------------------------------------------
;; h 		Hours without leading zero; 12-hour format (1 – 12)
;; hh 		Hours with leading zero; 12-hour format (01 – 12)
;; H 		Hours without leading zero; 24-hour format (0 – 23)
;; HH 		Hours with leading zero; 24-hour format (00 – 23)
;; m 		Minutes without leading zero (0 – 59)
;; mm 		Minutes with leading zero (00 – 59)
;; s 		Seconds without leading zero (0 – 59)
;; ss 		Seconds with leading zero (00 – 59)
;; t 		Single character time marker, such as A or P (depends on locale)
;; tt 		Multi-character time marker, such as AM or PM (depends on locale)
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
