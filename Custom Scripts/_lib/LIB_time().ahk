;; function library for time operations
;; -----examples of date formatting (FormatTime) are at the bottom.
#IfWinActive

 
/* time_getDate(STRING:= dateFormat)
;; Descr:	Gets the date in the specified format.
;; Return:	STRING
;; Params:
;;	p_format: STRING 
;;	must use only these characters
;; 	(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
;; 	[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
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
/* Standalone Formats
;; The following formats must be used alone; that is, with no other formats or text present in the Format parameter. These formats are not case sensitive.
;; =============================================================================
;; Format 		Description
;; -----------------------------------------------------------------------------
;; (Blank) 		4:55 PM Saturday, November 27, 2004
;; Time 		5:26 PM
;; ShortDate 	02/29/04
;; LongDate 	Friday, April 23, 2004
;; YearMonth 	February, 2004
;; YDay 		Day of the year without leading zeros (1 – 366)
;; YDay0 		Day of the year with leading zeros (001 – 366)
;; WDay 		Day of the week (1 – 7). Sunday is 1.
;; YWeek 		The ISO 8601 full year and week number. For example: 200453. If the week containing January 1st has four or more days in the new year, it is considered week 1. Otherwise, it is the last week of the previous year, and the next week is week 1. Consequently, both January 4th and the first Thursday of January are always in week 1.
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
time_getDate(p_str_dateFormat := "yyyy-MM-dd_hh-mm-ss_tt"){
	FormatTime, outputVar, , % p_str_dateFormat
	return % outputVar
}

/* time_translateDate(p_timeShift, p_timeUnit := "Days", p_format := "yyyy-MM-dd_hh-mm-ss_tt")
;; Descr:	Uses [EnvAdd,] command to shift the current date by a given number and unit.
	Return:	STRING	- returns the resulting date-time as a string with the given format.
	Params:	INTEGER	p_timeShift	:=	(any positive or negative integer)
			STRING	p_timeUnit	:=	(default := "Days")
							this	["Seconds" | "Minutes" | "Hours" | "Days" ]
							or...	["s" | "m" | "h" | "d"]
			STRING	p_format 	:=	(default := "yyyy-MM-dd_hh-mm-ss_tt")
*/
time_translateDate(p_timeShift
			, p_timeUnit := "Days"
			, p_format := "yyyy-MM-dd_hh-mm-ss_tt"){
	;; TODO - setup a method to subtract the current date by a given number and output as STRING.
	;; FormatTime, 
	;; v_date := time_getDate("yyyyMMdd")
	;; FormatTime, v_date, % (v_date)
	
	;; METHOD 1
	;; The built-in variable [A_Now] contains the current local time in YYYYMMDDHH24MISS format.
	var1 := A_Now
	EnvAdd, var1, %p_timeShift%, %p_timeUnit%
	
	;; METHOD 2
	;; Make it blank so that the below will use the current timestamp instead.
	var2 := ""
	var2 += p_timeShift, %p_timeUnit%
	
	;; MsgBox, %var1%  ; The answer will be the adjustesd date-time from now.
	;; MsgBox, % "var1 := " . var1 . "`nvar2 := " . var2 . "`n"
	
	FormatTime, outVar, %var2%, %p_format%
	return outVar
}

/* time_sendDate(STRING:= dateFormat)
;; Descr:	Gets the date in the specified format.
;; Return:	STRING
;; Params:
;;	p_format: STRING 
;;	must use only these characters
;; 	(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
;; 	[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
time_sendDate(p_str_dateFormat := "yyyy-MM-dd_hh-mm-ss_tt"){
	outVar := time_getDate(p_str_dateFormat)
	;~ Send, %outVar%
	Send, % outVar
}

/* ;;EXAMPLES
;; FormatTime, TimeString
;; MsgBox, , "FormatTime`, TimeString", The current time and date (time first) is %TimeString%.
;; 
;; FormatTime, TimeString, R
;; MsgBox, , "FormatTime`, TimeString`, R", The current time and date (date first) is %TimeString%.
;; 
;; FormatTime, TimeString,, Time
;; MsgBox, , "FormatTime`, TimeString`,`, Time", The current time is %TimeString%.
;; 
;; FormatTime, TimeString, T12, Time
;; MsgBox, , "FormatTime`, TimeString`, T12`, Time", The current 24-hour time is %TimeString%.
;; 
;; FormatTime, TimeString,, LongDate
;; MsgBox, , "FormatTime`, TimeString`,`, LongDate", The current date (long format) is %TimeString%.
;; 
;; FormatTime, TimeString, 20050423220133, dddd MMMM d, yyyy hh:mm:ss tt
;; MsgBox, , "FormatTime`, TimeString`, 20050423220133`, dddd MMMM d`, yyyy hh:mm:ss tt", The specified date and time, when formatted, is %TimeString%.
;; 
;; FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
;; MsgBox, , "FormatTime`, TimeString`, 200504`, 'Month Name': MMMM`n'Day Name': dddd", %TimeString%
;; 
;; FormatTime, YearWeek, 20050101, YWeek
;; MsgBox, , "FormatTime`, YearWeek`, 20050101`, YWeek", January 1st of 2005 is in the following ISO year and week number: %YearWeek%
*/
