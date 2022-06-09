;~ function library for time operations
;~ -----examples of date formatting (FormatTime) are at the bottom.
#IfWinActive

global g_tC_ShortFormat := "M/d/yyyy" ;~ 4/8/2022
global g_tC_LongFormat := "dddd, MMM d, yyyy" ;~ Friday, Apr, 8, 2022

;~ FormatTime, OutputVar [, YYYYMMDDHH24MISS, Format]
;~ 20171028 == 2017, October, 28, hour-00, min-00, sec-00
;~ MsgBox, % time_difference(20171028, 20220131, , "yyyy`ndd")

/* location of file for custom date calculations
 * (highlight and press Ctrl+Shift+O)
 * E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Time-Calculator-UTILITY.ahk
 */


/* Date Formats (case sensitive)
;~ =============================================================================
;~ Format 	Description
;~ -----------------------------------------------------------------------------
;~ d 		Day of the month without leading zero (1 – 31)
;~ dd 		Day of the month with leading zero (01 – 31)
;~ ddd 		Abbreviated name for the day of the week (e.g. Mon) in the current user's language
;~ dddd 	Full name for the day of the week (e.g. Monday) in the current user's language
;~ M 		Month without leading zero (1 – 12)
;~ MM 		Month with leading zero (01 – 12)
;~ MMM 		Abbreviated month name (e.g. Jan) in the current user's language
;~ MMMM 	Full month name (e.g. January) in the current user's language
;~ y 		Year without century, without leading zero (0 – 99)
;~ yy 		Year without century, with leading zero (00 – 99)
;~ yyyy 	Year with century. For example: 2005
;~ gg 		Period/era string for the current user's locale (blank if none)
;~ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
/* Time Formats (case sensitive)
;~ =============================================================================
;~ Format 	Description
;~ -----------------------------------------------------------------------------
;~ h 		Hours without leading zero; 12-hour format (1 – 12)
;~ hh 		Hours with leading zero; 12-hour format (01 – 12)
;~ H 		Hours without leading zero; 24-hour format (0 – 23)
;~ HH 		Hours with leading zero; 24-hour format (00 – 23)
;~ m 		Minutes without leading zero (0 – 59)
;~ mm 		Minutes with leading zero (00 – 59)
;~ s 		Seconds without leading zero (0 – 59)
;~ ss 		Seconds with leading zero (00 – 59)
;~ S 		Milliseconds without leading zero (0 – 59)
;~ SS 		Milliseconds with leading zero (00 – 59)
;~ t 		Single character time marker, such as A or P (depends on locale)
;~ tt 		Multi-character time marker, such as AM or PM (depends on locale)
;~ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/
/* Standalone Formats
;~ The following formats must be used alone; that is, with no other formats or text present in the Format parameter. These formats are not case sensitive.
;~ =============================================================================
;~ Format 		Description
;~ -----------------------------------------------------------------------------
;~ (Blank) 		4:55 PM Saturday, November 27, 2004
;~ Time 		5:26 PM
;~ ShortDate 	02/29/04
;~ LongDate 	Friday, April 23, 2004
;~ YearMonth 	February, 2004
;~ YDay 		Day of the year without leading zeros (1 – 366)
;~ YDay0 		Day of the year with leading zeros (001 – 366)
;~ WDay 		Day of the week (1 – 7). Sunday is 1.
;~ YWeek 		The ISO 8601 full year and week number. For example: 200453. If the week containing January 1st has four or more days in the new year, it is considered week 1. Otherwise, it is the last week of the previous year, and the next week is week 1. Consequently, both January 4th and the first Thursday of January are always in week 1.
;~ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/


/** time_getDate(p_dateFormat := "yyyyMMdd_t_hhmmss_SS", p_timeStamp := "",  p_showMsg := false)
	Descr:	Gets the date in the specified format as a STRING.
	Return:	STRING
	Params:	p_dateFormat := STRING 
				must use only these characters
				(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
				[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
			p_timeStamp := INTEGER-DATE <YYYYMMDDHH24MISS> (default := A_Now)
			p_showMsg := false
*/
time_getDate(p_dateFormat := "yyyyMMddHHmmss", p_timeStamp := "", p_showMsg := false) {
	
	_retVar := "" ;~ instantiate outputVar scope for return value
	
	_retVar := time_parseDateFormat(p_dateFormat, p_timeStamp)
	
	return _retVar
}

/** time_sendDate(p_dateFormat := "yyyyMMdd_t_hhmmss_SS", p_timeStamp := "")
	Descr:	Sends resulting date (STRING) as keyboard strokes, using the specified format.
	Return:	VOID
	Params:
		p_format := STRING (default := "yyyyMMdd_t_hhmmss_SS")
			must use only these characters
			(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
			[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
		p_timeStamp := INTEGER-DATE <YYYYMMDDHH24MISS> (default := A_Now)
*/
time_sendDate(p_dateFormat := "yyyyMMddHHmmss", p_timeStamp := "") {
	
	if (p_timeStamp == "") {
		p_timeStamp := A_Now
	}
	
	outVar := time_getDate(p_dateFormat, p_date)
	;~ Send, %outVar%
	Send, % outVar
}

/** time_translateDate(p_timeShift, p_timeUnit := Days, p_format := "yyyyMMdd_t_hhmmss_SS")
	Descr:	Uses [EnvAdd,] command to shift the current date by a given number and unit.
	Return:	STRING	- returns the resulting date-time as a string with the given format.
			Example := 20220604_P_030837_286
	Params:	INTEGER	p_timeShift	:=	(any positive or negative integer)
			TIME-UNIT	p_timeUnit	:=	(default := Days)
				this	[Seconds|Minutes|Hours|Days]
				or...	[s|m|h|d]
			STRING	p_format 	:=	(default := "yyyyMMdd_t_hhmmss_SS")
	Remarks: Does not currently work with "S" or "SS" millisecond tags. 
*/
time_translateDate(p_timeShift, p_timeUnit := "Days", p_format := "yyyyMMddHHmmss") {
	
	;~ METHOD 1
	;~ The built-in variable [A_Now] contains the current local time in YYYYMMDDHH24MISS format.
	_timeStamp0 := A_Now
	_timeStamp1 := _timeStamp0
	;~ EnvAdd, _timeStamp1, % p_timeShift, % p_timeUnit
	_timeStamp1 += p_timeShift, %p_timeUnit%
	
	;~ _retVar1 := time_getDate(p_format, _timeStamp1)
	_retVar1 := "_timeStamp1:`t" . _timeStamp1 . "`n"
	_retVar1 .= "`t`t`t`t`t" . time_parseDateFormat(p_format, _timeStamp1)
	
	;~ MsgBox, , % A_ScriptName, % "time_translateDate(), _retVar1:== " . _retVar1
	
	;~ _retVar1 := time_getDate(p_format, _timeStamp1)
	;~ return time_getDate(p_format, _timeStamp1)
	
	;~ FormatTime, _retVar1, % _timeStamp1, % p_format
	
	return _retVar1
	
	/* ;~ METHOD 2
	;~ Make it blank so that the below will use the current timestamp instead.
	;~ _timeStamp2 := ""
	;~ _timeStamp2 += p_timeShift, %p_timeUnit%
	;~ FormatTime, outVar, % _timeStamp2, % p_format
	;~ _retVar2 := time_getDate(p_format, _timeStamp2)
	
	;~ MsgBox, %_timeStamp1%  ; The answer will be the adjustesd date-time from now.
	outStr := "_timeStamp1 := " . _timeStamp1 . "`n"
	outStr .= "_timeStamp2 := " . _timeStamp2 . "`n"
	outStr .= "_retVar1 := " . _retVar1 . "`n"
	outStr .= "_retVar2 := " . _retVar2 . "`n"
	MsgBox, , % A_ScriptName, % outStr
	;~ return _retVar2
	return time_getDate(p_format, _timeStamp2)
	 */
}

/**	time_difference(p_date, p_initialDate := "", p_timeUnit := "Days", p_format := "yyyy-MM-dd_hh-mm-ss_tt")
	Descr:	Returns the time difference from the 'p_date' to the 'p_initialDate'.
	Return:	FORMATTED-DATE
	Params:	INTEGER-DATE	p_timeStamp := YYYYMMDDHH24MISS
			INTEGER-DATE	p_initialDate := (default := A_Now) || YYYYMMDDHH24MISS
			STRING	p_timeUnit	:=	(default := "Days")
				this	["Seconds" | "Minutes" | "Hours" | "Days" ]
				or...	["s" | "m" | "h" | "d"]
			STRING	p_format :=	FORMATTED-DATE
			[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
	Notes:	____How_to_or_when_is_this_used____
*/
time_difference(p_date, p_initialDate := "", p_timeUnit := "Days", p_format := "yyyyMMddHHmmss") {
	
	if (p_initialDate == "")
		p_initialDate := A_Now
	
	timeDifferenceAmount := p_initialDate
	
	;~ subtract, outputToVar,     by this amount, by these units
	;~ EnvSub, timeDifferenceAmount, %p_date%, %p_timeUnit%
	EnvSub, timeDifferenceAmount, %p_date%, %p_timeUnit%
	
	;~ FormatTime, retVal, %timeDifferenceAmount%, %p_format%
	retVal := Abs(timeDifferenceAmount)
	return retVal
}

/**	time_differenceInDays(p_date, p_initialDate := A_Now)
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used____
*/
time_differenceInDays(p_date, p_initialDate := "") {
	
	if (p_initialDate == "")
		p_initialDate := A_Now
	
	retVal := time_difference(p_date, p_initialDate, "Days")
	return retVal
}

/**	time_differenceInHours(p_date, p_initialDate := "")
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used____
*/
time_differenceInHours(p_date, p_initialDate := "") {
	
	if (p_initialDate == "")
		p_initialDate := A_Now
	
	retVal := time_difference(p_date, p_initialDate, "Hours")
	return retVal
}

/**	time_differenceInMinutes(p_date, p_initialDate := "")
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used____
*/
time_differenceInMinutes(p_date, p_initialDate := "") {
	
	if (p_initialDate == "")
		p_initialDate := A_Now
	
	retVal := time_difference(p_date, p_initialDate, "Minutes")
	return retVal
}

/**	time_differenceInSeconds(p_date, p_initialDate := "")
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used____
*/
time_differenceInSeconds(p_date, p_initialDate := "") {
	
	if (p_initialDate == "")
		p_initialDate := A_Now
	
	retVal := time_difference(p_date, p_initialDate, "Seconds")
	return retVal
}

/**	time_parseDateFormat(p_dateFormat := "yyyyMMddHHmmss", p_timeStamp := "")
	Descr:	Replaces ["yyyy", "yyy", "yy", "y"] tags specified in p_dateFormat
		with its matching FormatTime representation.
	Return:	the converted format-sub as a String.
	Params:	p_dateFormat := "yyyyMMddHHmmss"
			p_timeStamp := ""
	Notes:	Used in the parsing process of time_getDate()
*/
time_parseDateFormat(p_dateFormat := "yyyyMMddHHmmss_SS", p_timeStamp := "") {
	
	_retVar := ""
	_retVar2 := ""
	_regexHaystack := p_dateFormat
	(p_timeStamp == "") ? p_timeStamp := A_Now : ; else, do-nothing

	_retVar2 := time_parseLoop(p_dateFormat, p_timeStamp)
	
	return _retVar2
}

/**	time_parseLoop(p_formatString, p_formatTags := "", p_timeStamp := "")
	Descr:	Loops through all 
	Return:	STRING (formatted time-stamp as STRING)
	Params:	p_formatString ;~(the STRING text to search through)
			p_formatTags := "" ;~(STRING-ARRAY, will iterate and search each specified tag)
				➤ example: p_formatTags := myArray := ["yy", "MM", "dd", "HH", "mm", "ss", "SS"]
			p_timeStamp := "" ;~(default := A_Now)
	Notes:	Called from time_parseDateFormat().
*/
time_parseLoop(p_formatString, p_formatTags := "", p_timeStamp := "") {
	_retVar := ""
	_regexHaystack := p_formatString
	if (p_formatTags == "") {
		_regexNeedle := ["yyyy", "yyy", "yy", "y"
		, "MMMM", "MMM", "MM", "M"
		, "dddd", "ddd", "dd", "d"
		, "HH", "H", "hh", "h"
		, "mm", "m"
		, "ss", "s"
		, "SS", "S"]
	}
	(p_timeStamp == "") ? p_timeStamp := A_Now : ; else, do-nothing

	
	Loop, % _regexNeedle.Length() {
		
		_regexCurrentPos := ""
		_formattedDateNumber := ""
		RegExMatch(_regexHaystack, "O)" . _regexNeedle[A_Index], _rgxMatch) ;~returns <Object.Match> as _rgxMatch
		_regexCurrentPos := _rgxMatch.Pos(0) + _rgxMatch.Len(0)
		
		;~ MsgBox, , % A_ScriptName, % "_regexNeedle[A_Index] = " . _regexNeedle[A_Index] "`n"
			;~ . "_regexCurrentPos := _regexResult: " . _regexCurrentPos . " := " . _regexResult
		
		if (_regexResult) {
			
			if (_regexNeedle[A_Index] == "d") {
				_matchResult := RegExMatch(_regexHaystack, "iO)((day)|(december)|(dd)|(ddd)|(dddd))", , _regexCurrentPos)
				if (_matchResult)
					continue
				else if (!_matchResult)
					FormatTime, _formattedDateNumber, % p_timeStamp, % _regexNeedle[A_Index]
			}
			else if (_regexNeedle[A_Index] == "m") {
				_matchResult := RegExMatch(_regexHaystack, "iO)(.*?day\b)|(arch)|(ay)|(ber)|(m)", , _regexCurrentPos)
				if (_matchResult)
					continue
				else if (!_matchResult)
					FormatTime, _formattedDateNumber, % p_timeStamp, % _regexNeedle[A_Index]
			}
			else if (_regexNeedle[A_Index] == "s") {
				_matchResult := RegExMatch(_regexHaystack, "iO)(sday)|(?<=(?:augu))|(eptember)", , _regexCurrentPos)
				if (_matchResult)
					continue
				else if (!_matchResult)
					FormatTime, _formattedDateNumber, % p_timeStamp, % _regexNeedle[A_Index]
			}
			else if (_regexNeedle[A_Index] == "SS")
				_formattedDateNumber := A_MSec
			else if (_regexNeedle[A_Index] == "S")
				_formattedDateNumber := A_MSec + 0 ; removes leading zeros from string output of resulting number value
			else
				FormatTime, _formattedDateNumber, % p_timeStamp, % _regexNeedle[A_Index]
		}
		
		_regexHaystack := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
	}
	
	_retVar := _regexHaystack
	return _retVar
}


timeCalc_getDateWithClipboard(v_daysFromNow := "", v_format := "M/d/yyyy") {
	if (v_daysFromNow == "") ;~ if arg is empty, then set to default
		v_daysFromNow := Clipboard
	retVar := timeCalc_getDate(v_daysFromNow, v_format)
	return retVar
}

timeCalc_getToday(v_format := "M/d/yyyy") {
	retVar := timeCalc_getDate(0, v_format)
	return retVar
}

timeCalc_getDate(v_daysFromNow := 0, v_format := "M/d/yyyy") {
	retVar := time_translateDate(v_daysFromNow,,v_format)
	timeCalc_showDateMessage(v_daysFromNow, v_format, retVar, 15)
	return retVar ;~ returns a string of the date with the given v_format
}

timeCalc_difference() {
	v_days := time_difference(20171028,, "Days")
	v_years := Round(time_difference(20171028,, "Days")/365)
	;~ v_days := Mod(v_days,(v_years * 365))
	v_days := Mod(v_days, (v_years * 365))
	MsgBox, % "years: " v_years "`ndays: " v_days
}

timeCalc_showDateMessage(v_daysFromNow, v_format, v_clipOutput, v_timeOut := 15) {
	MsgBox, , % A_ScriptName , % ""
	. "" ;~ "Date: " . time_translateDate(0,, "yyy / M-MMM / dd-ddd") 
	. "Today:`t`t" . time_translateDate(0,, g_tC_LongFormat)
	. "`n`nDays From Now:`t" . v_daysFromNow 
	. "`nDate:`t`t" . time_translateDate(v_daysFromNow,, g_tC_LongFormat)
	. "`n`nClipboard:`t" . v_clipOutput
	. "`n`n(this window will close after " . v_timeOut . " seconds)"
	, % v_timeOut ;~ timeout = 5 seconds
	return
}

/** ;~EXAMPLES
;~ FormatTime, TimeString
;~ MsgBox, , "FormatTime`, TimeString", The current time and date (time first) is %TimeString%.
;~ 
;~ FormatTime, TimeString, R
;~ MsgBox, , "FormatTime`, TimeString`, R", The current time and date (date first) is %TimeString%.
;~ 
;~ FormatTime, TimeString,, Time
;~ MsgBox, , "FormatTime`, TimeString`,`, Time", The current time is %TimeString%.
;~ 
;~ FormatTime, TimeString, T12, Time
;~ MsgBox, , "FormatTime`, TimeString`, T12`, Time", The current 24-hour time is %TimeString%.
;~ 
;~ FormatTime, TimeString,, LongDate
;~ MsgBox, , "FormatTime`, TimeString`,`, LongDate", The current date (long format) is %TimeString%.
;~ 
;~ FormatTime, TimeString, 20050423220133, dddd MMMM d, yyyy hh:mm:ss tt
;~ MsgBox, , "FormatTime`, TimeString`, 20050423220133`, dddd MMMM d`, yyyy hh:mm:ss tt", The specified date and time, when formatted, is %TimeString%.
;~ 
;~ FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
;~ MsgBox, , "FormatTime`, TimeString`, 200504`, 'Month Name': MMMM`n'Day Name': dddd", %TimeString%
;~ 
;~ FormatTime, YearWeek, 20050101, YWeek
;~ MsgBox, , "FormatTime`, YearWeek`, 20050101`, YWeek", January 1st of 2005 is in the following ISO year and week number: %YearWeek%
*/
