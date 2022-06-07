;; function library for time operations
;; -----examples of date formatting (FormatTime) are at the bottom.
#IfWinActive

global g_tC_ShortFormat := "M/d/yyyy" ;; 4/8/2022
global g_tC_LongFormat := "dddd, MMM d, yyyy" ;; Friday, Apr, 8, 2022

;; FormatTime, OutputVar [, YYYYMMDDHH24MISS, Format]
;; 20171028 == 2017, October, 28, hour-00, min-00, sec-00
;; MsgBox, % time_difference(20171028, 20220131, , "yyyy`ndd")

/* location of file for custom date calculations
 * (highlight and press Ctrl+Shift+O)
 * E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Time-Calculator-UTILITY.ahk
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
;; S 		Milliseconds without leading zero (0 – 59)
;; SS 		Milliseconds with leading zero (00 – 59)
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


/** time_getDate(p_dateFormat := "yyyyMMdd_t_hhmmss_SS", p_date := "",  p_showMsg := false)
	Descr:	Gets the date in the specified format as a STRING.
	Return:	STRING
	Params:	p_dateFormat := STRING 
				must use only these characters
				(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
				[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
			p_date := INTEGER-DATE <YYYYMMDDHH24MISS> (default := A_Now)
			p_showMsg := false
*/
time_getDate(p_dateFormat := "yyyyMMddHHmmss", p_date := "", p_showMsg := false) {
	
	_outputVar := "" ;; instantiate outputVar scope for return value
	
	if (p_date == "")
		p_date := A_Now
	
	;; SS = Milliseconds with leading zero (000 – 999)
	if (RegExMatch(p_dateFormat, "SS")) {
		FormatTime, _outputVar, p_date, % p_dateFormat
		_outputVarBeforeReplace := _outputVar
		_outputVar := RegExReplace(_outputVar, "SS", A_MSec, _outputVarCount, 1, 1)
		if (p_showMsg == true) {
			_outStr := "_outputVar ""SS"":`n"
			_outStr .= "BEFORE RegExReplace =`t" . _outputVarBeforeReplace . "`n"
			_outStr .= "AFTER RegExReplace =`t" . _outputVar . "`n"
			MsgBox, , % A_ScriptName, % _outStr
		}
	}
	
	;; S  = Milliseconds without leading zero (0 – 999)
	else if (RegExMatch(p_dateFormat, "S")) {
		_ms := A_MSec + 0 ;; removes the leading zeros.
		FormatTime, _outputVar, p_date, % p_dateFormat
		_outputVarBeforeReplace := _outputVar
		_outputVar := RegExReplace(_outputVar, "S", _ms, _outputVarCount, 1, 1)
		if (p_showMsg == true) {
			_outStr := "_outputVar ""S"":`n"
			_outStr .= "BEFORE RegExReplace =`t" . _outputVarBeforeReplace . "`n"
			_outStr .= "AFTER RegExReplace =`t" . _outputVar . "`n"
			MsgBox, , % A_ScriptName, % _outStr
		}
	}
	
	;; normal case-scenario (Millisecond tag "S" does not exist)
	else {
		FormatTime, _outputVar, % p_date, % p_dateFormat
		if (p_showMsg == true) {
			MsgBox, , % A_ScriptName, % "_outputVar ''default'': " . _outputVar
		}
	}
	
	return % _outputVar
}

/** time_sendDate(p_dateFormat := "yyyyMMdd_t_hhmmss_SS", p_date := "")
	Descr:	Sends resulting date (STRING) as keyboard strokes, using the specified format.
	Return:	VOID
	Params:
		p_format := STRING (default := "yyyyMMdd_t_hhmmss_SS")
			must use only these characters
			(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")
			[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
		p_date := INTEGER-DATE <YYYYMMDDHH24MISS> (default := A_Now)
*/
time_sendDate(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
	
	if (p_date == "") {
		p_date := A_Now
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
time_translateDate(p_timeShift, p_timeUnit := "Days", p_format := "yyyyMMddHHmmss", p_appendMilliSeconds := false) {
	
	;; METHOD 1
	;; The built-in variable [A_Now] contains the current local time in YYYYMMDDHH24MISS format.
	d0 := A_Now
	d1 := d0
	;; EnvAdd, d1, % p_timeShift, % p_timeUnit
	d1 += p_timeShift, %p_timeUnit%
	
	outVar1 := time_getDate(p_format, d1)
	if (p_appendMilliSeconds) {
		outVar1 .= "_" . A_MSec
	}
	
	;; MsgBox, , % A_ScriptName, % "time_translateDate(), outVar1:== " . outVar1
	
	;; outVar1 := time_getDate(p_format, d1, true)
	;; return time_getDate(p_format, d1)
	
	;; FormatTime, outVar1, % d1, % p_format
	
	return outVar1
	
	/* ;; METHOD 2
	;; Make it blank so that the below will use the current timestamp instead.
	;; d2 := ""
	;; d2 += p_timeShift, %p_timeUnit%
	;; FormatTime, outVar, % d2, % p_format
	;; outVar2 := time_getDate(p_format, d2)
	
	;; MsgBox, %d1%  ; The answer will be the adjustesd date-time from now.
	outStr := "d1 := " . d1 . "`n"
	outStr .= "d2 := " . d2 . "`n"
	outStr .= "outVar1 := " . outVar1 . "`n"
	outStr .= "outVar2 := " . outVar2 . "`n"
	MsgBox, , % A_ScriptName, % outStr
	;; return outVar2
	return time_getDate(p_format, d2)
	 */
}

/**	time_difference(p_date, p_initialDate := "", p_timeUnit := "Days", p_format := "yyyy-MM-dd_hh-mm-ss_tt")
	Descr:	Returns the time difference from the 'p_date' to the 'p_initialDate'.
	Return:	FORMATTED-DATE
	Params:	INTEGER-DATE	p_date := YYYYMMDDHH24MISS
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
	
	;; subtract, outputToVar,     by this amount, by these units
	;; EnvSub, timeDifferenceAmount, %p_date%, %p_timeUnit%
	EnvSub, timeDifferenceAmount, %p_date%, %p_timeUnit%
	
	;; FormatTime, retVal, %timeDifferenceAmount%, %p_format%
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

/**	time_parseDateFormat(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
	Descr:	Replaces ["yyyy", "yyy", "yy", "y"] tags specified in p_dateFormat
		with its matching FormatTime representation.
	Return:	the converted format-sub as a String.
	Params:	p_dateFormat := "yyyyMMddHHmmss"
			p_date := ""
	Notes:	Used in the parsing process of time_getDate()
*/
time_parseDateFormat(p_dateFormat := "yyyyMMddHHmmss_SS", p_date := "") {
	
	_outVar := ""
	_outVar2 := ""
	_regexHaystack := p_dateFormat
	(p_date == "") ? p_date := A_Now : ; else, do-nothing

	_outVar2 := time_parseLoop(p_dateFormat)
	
	return _outVar2
}

time_parseLoop(p_haystack, p_needles := "") {
	_outVar := ""
	_regexHaystack := p_haystack
	if (p_needles == "") {
		_regexNeedle := ["yyyy", "yyy", "yy", "y"
		, "MMMM", "MMM", "MM", "M"
		, "dddd", "ddd", "dd", "d"
		, "HH", "H", "hh", "h"
		, "mm", "m"
		, "ss", "s"
		, "SS", "S"]
	}
	
	Loop, % _regexNeedle.Length() {
		
		_regexCurrentPos := ""
		_formattedDateNumber := ""
		_regexResult := RegExMatch(_regexHaystack, "P)" . _regexNeedle[A_Index], _regexCurrentPos) ; the "P)" is an option-flag for RegExMatch Position-Mode, yielding the length, and the position of match under . 
		_regexCurrentPos := _regexResult
		
		;; MsgBox, , % A_ScriptName, % "_regexNeedle[A_Index] = " . _regexNeedle[A_Index] "`n"
			;; . "_regexCurrentPos := _regexResult: " . _regexCurrentPos . " := " . _regexResult
		
		if (_regexResult) {
			
			if (_regexNeedle[A_Index] == "d") {
				_matchResult := RegExMatch(_regexHaystack, "iP)((day)|(december)|(dd)|(ddd)|(dddd))", , _regexCurrentPos)
				if (_matchResult) {
					continue
				}
				else if (!_matchResult) {
					FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
				}
			}
			else if (_regexNeedle[A_Index] == "m") {
				_matchResult := RegExMatch(_regexHaystack, "iP)(.*?day\b)|(arch)|(ay)|(ber)|(m)", , _regexCurrentPos)
				if (_matchResult) {
					continue
				}
				else if (!_matchResult) {
					FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
				}
			}
			else if (_regexNeedle[A_Index] == "s") {
				_matchResult := RegExMatch(_regexHaystack, "iP)(sday)|(?<=(?:augu))|(eptember)", , _regexCurrentPos)
				if (_matchResult) {
					continue
				}
				else if (!_matchResult) {
					FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
				}
			}
			else if (_regexNeedle[A_Index] == "SS") {
				_formattedDateNumber := A_MSec
			}
			else if (_regexNeedle[A_Index] == "S") {
				_formattedDateNumber := A_MSec + 0 ; removes leading zeros from string output of resulting number value
			}
			else {
				FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
			}
		}
		
		_regexHaystack := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
	}
	
	_outVar := _regexHaystack
	return _outVar
}

/*
;;;;
;;;;/**	time_parseYear(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["yyyy", "yyy", "yy", "y"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseYear(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["yyyy", "yyy", "yy", "y"]
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	_outVar := time_parseLoop(_regexHaystack, _regexNeedle)
;;;;	
;;;;	return _outVar
;;;;}
;;;;
;;;;/**	time_parseMonth(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["MMMM", "MMM", "MM", "M"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseMonth(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["MMMM", "MMM", "MM", "M"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
;;;;/**	time_parseDay(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["dddd", "ddd", "dd", "d"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseDay(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["dddd", "ddd", "dd", "d"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
;;;;/**	time_parseHour(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["HH", "H", "hh", "h"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseHour(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["HH", "H", "hh", "h"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
;;;;/**	time_parseMinute(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["mm", "m"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseMinute(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["mm", "m"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
;;;;/**	time_parseSecond(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["ss", "s"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Used in the parsing process of time_getDate()
;;;;*/
;;;;time_parseSecond(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["ss", "s"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
;;;;/**	time_parseMillisecond(p_dateFormat := "yyyyMMddHHmmss", p_date := "")
;;;;	Descr:	Replaces ["SS", "S"] tags specified in p_dateFormat
;;;;		with its matching FormatTime representation.
;;;;	Return:	the converted format-sub as a String.
;;;;	Params:	p_dateFormat := "yyyyMMddHHmmss"
;;;;			p_date := ""
;;;;	Notes:	Since FormatTime does not include a Millisecond Format-Option, 
;;;;		this method uses RegExReplace() to swap the "SS" or "S" tag with the 
;;;;		millisecond value held in the environment variable A_MSec.
;;;;		Used in the parsing process of time_getDate() .
;;;;*/
;;;;time_parseMillisecond(p_dateFormat := "yyyyMMddHHmmss", p_date := "") {
;;;;	_outVar := ""
;;;;	_regexHaystack := p_dateFormat
;;;;	_regexNeedle := ["SS", "S"]
;;;;	
;;;;	(p_date == "") ? p_date := A_Now : ; else, do-nothing
;;;;	
;;;;	Loop, % _regexNeedle.Length() {
;;;;		if (RegExMatch(_regexHaystack, _regexNeedle[A_Index])) {
;;;;			FormatTime, _formattedDateNumber, % p_date, % _regexNeedle[A_Index]
;;;;			_outVar := RegExReplace(_regexHaystack, _regexNeedle[A_Index], _formattedDateNumber, , 1, 1)
;;;;			return _outVar
;;;;		}
;;;;	}
;;;;}
;;;;
*/

timeCalc_getDateWithClipboard(v_daysFromNow := "", v_format := "M/d/yyyy") {
	if (v_daysFromNow == "") ;; if arg is empty, then set to default
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
	return retVar ;; returns a string of the date with the given v_format
}

timeCalc_difference() {
	v_days := time_difference(20171028,, "Days")
	v_years := Round(time_difference(20171028,, "Days")/365)
	;; v_days := Mod(v_days,(v_years * 365))
	v_days := Mod(v_days, (v_years * 365))
	MsgBox, % "years: " v_years "`ndays: " v_days
}

timeCalc_showDateMessage(v_daysFromNow, v_format, v_clipOutput, v_timeOut := 15) {
	MsgBox, , % A_ScriptName , % ""
	. "" ;; "Date: " . time_translateDate(0,, "yyy / M-MMM / dd-ddd") 
	. "Today:`t`t" . time_translateDate(0,, g_tC_LongFormat)
	. "`n`nDays From Now:`t" . v_daysFromNow 
	. "`nDate:`t`t" . time_translateDate(v_daysFromNow,, g_tC_LongFormat)
	. "`n`nClipboard:`t" . v_clipOutput
	. "`n`n(this window will close after " . v_timeOut . " seconds)"
	, % v_timeOut ;; timeout = 5 seconds
	return
}

/** ;;EXAMPLES
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
