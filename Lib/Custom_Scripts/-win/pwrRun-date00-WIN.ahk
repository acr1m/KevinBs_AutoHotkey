
::??getdate::
::??date::
::??gettoday::
::??today::
	Clipboard := time_translateDate(0,, "M/d/yyyy")
	MsgBox, , % "Today's Date", % "" 
	. "" ;; "Date: " . time_translateDate(0,, "yyy / M-MMM / dd-ddd") 
	. "" ;; "`n`n" 
	. "Today:`t`t" . time_translateDate(0,, "dddd, MMM, d, yyyy")
	. "`nClipboard:`t" . Clipboard
	. "`n`n(this window will close after 5 seconds)"
	, 5 ;; timeout = 5 seconds
	return
			
/* Date Formats (case sensitive)
;; =============================================================================
;; Format 	Description
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
