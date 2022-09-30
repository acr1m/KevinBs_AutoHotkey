;~ function library for time operations
;~ -----examples of date formatting (FormatTime) are at the bottom.

#IfWinActive

global g_tC_ShortFormat := "M/d/yyyy" ;~ 4/8/2022
global g_tC_LongFormat := "dddd, MMM d, yyyy" ;~ Friday, Apr, 8, 2022

;; FOR DEBUGGING PURPOSES
	;~ MsgBox, % time_translateDate(-3, ,"yyyy-MM-dd")
	;~ MsgBox, % time_getDate("yyyyMMdd_HHmmss_SS")
	;~ MsgBox, % time_getDate("M/d/yy,  dddd, SS")
	;~ MsgBox, % time_getDate("M/d/yy,  dddd, H:m:s S")
	;~ MsgBox, % time_getDate("M/d/y")
;;___________________________________________________________



/** 
	time_getDate(p_dateFormat := "yyyyMMdd_t_hhmmss_SS", p_timeStamp := "",  p_showMsg := false)
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
	_timeStamp1 += p_timeShift, %p_timeUnit% ;~ shift the date-value of _timeStamp1 by the desired amount of given units.
	
	;; _retVar1 := time_getDate(p_format, _timeStamp1)
	;; _retVar1 := "_timeStamp1:    " . _timeStamp1 . ""
	_retVar1 := time_parseDateFormat(p_format, _timeStamp1)
	
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
	_regexHaystack := p_dateFormat
	(p_timeStamp == "") ? p_timeStamp := A_Now : ; else, do-nothing
	/*	REMARK
		  By this point, the parameter, p_timeStamp, should be a 
		  Formatted-Date-Object 「as an INTEGER value」 equal to the value of 
		  the current-time 「held within the built-in variable 『A_Now』」 or the 
		  value of the argument 「if it was defined in the method-call for this
		  current instance」.
		EXAMPLE
		  p_timeStamp = 20050423220133
	*/
	
	;; REMARK: leave the 3rd param 【p_formatTags】 blank to use default list of tag characters.
	_retVar := time_parseLoop(p_dateFormat, p_timeStamp) 
	
	;; TESTING the passing of an argument for the param p_formatTags.
	;~ formatTags := ["y", "M", "d", "H", "h", "m", "s", "S"]
	;~ _retVar := time_parseLoop(p_dateFormat, p_timeStamp, formatTags) 
	
	return _retVar
}

/**	time_parseLoop(p_formatString, p_timeStamp := "", p_formatTags := "")
	Descr:	Loops through all 
	Return:	STRING (formatted time-stamp as STRING)
	Params:	p_formatString ;~(the STRING text to search through)
			p_timeStamp := "" ;~(default := A_Now)
			p_formatTags := "" ;~(STRING-ARRAY, will iterate and search each specified tag)
				➤ example: p_formatTags := myArray := ["yy", "MM", "dd", "HH", "mm", "ss", "SS"]
	Notes:	Called from time_parseDateFormat().
*/
time_parseLoop(p_formatString, p_timeStamp := "", p_formatTags := "") {
	
	/* Here's how the below algorithm works...
	 * Vocabulary:
	 *			_underscorePrefix	==	Intended as a private local variable (hopefully with a descriptive enough name).
	 *			_rgxMatch			==	The main object that holds the regex match results.
	 *			_regexCurrentPos	==	Used to control the position of an imaginary text-cursor to step through 
	 *									and parse each character/tag/flag present in parameter variable <p_formatTags: Array.String>.
	 *			_outVar 			==	Functions as the "replace text" for RegExReplace().
	 * 									(FormatTime command is used to set the value of this during each loop).
	 *			_varName			 ==	Description (Remark).
	 * Process:
	 * 			Loops through an array of strings that function as format 'tags', defined in the p_formatTags method parameter.
	 *
	 * 			Each loop-iteration, the current A_Index iteration of the loop is used to access a corresponding key:value pair of the <p_formatTags> array.
	 *
	 *			Then, RegExMatch() is used to see if the "tag" identity/value is present within the parameter <p_formatString>. 
	 *				RegExMatch() returns an object, _rgxMatch, that contains position and length values of the overall matching group (if any).
	 *
	 *			An if-block algorithm is used to short-circuit the current loop-iteration if the <_currentTag> in question is part of any known conflicting words or formatting options.
	 * 
	 *			Finally, if no issues were found with the location and identity of the tag and its surrounding characters, 
	 *				then the tag is formatted and saved as a temporary String, _formattedTxt, which is used to replace the tag itself from the 
	 *				text and into its corresponding date-style text and is used to replace
	 *			
	 *				=> _regexHaystack := RegExReplace(_regexHaystack, _currentTag, _formattedTxt, , 1, 1)
	 *			
	 */
	 
	_retVar := ""
	_regexHaystack := p_formatString
	_regexNeedle := []
	
	if (p_formatTags == "") {
		_regexNeedle := ["yyyy", "yyy", "yy", "y"
		, "HH", "H", "hh", "h"
		, "mm", "m"
		, "ss", "s"
		, "SS", "S"
		, "MMMM", "MMM", "MM", "M"
		, "dddd", "ddd", "dd", "d"
		, "tt", "t"]
	}
	; if argument for format tags exist, then copy the tag list into an array
	else {
		for k, v in p_formatTags {
			_regexNeedle[k] := v
			;; _regexNeedle.Push(v) ;~ alternative style, same outcome
		}
	}
	(p_timeStamp == "") ? p_timeStamp := A_Now : ; else, do-nothing

	
	Loop, % _regexNeedle.Length() {
		
		_regexCurrentPos := ""
		_outVar := ""
		_formattedTxt := ""
		_rgxMatch := ""
		_currentTag := _regexNeedle[A_Index]
		
		/* Description of Match Object methods
			* _rgxMatch.Pos(0) => returns the position of match group \0 (which is the overall match group)
			* _rgxMatch.Len(0) => returns the length of match group \0 (which is the overall match group)
		*/
		
		RegExMatch(_regexHaystack, "O)" . _currentTag, _rgxMatch) ; returns variable, _rgxMatch, as type <Object.RegexMatch>, with information on where the _currentTag was found (if anywhere).
		_regexCurrentPos := _rgxMatch.Pos(0) + _rgxMatch.Len(0) ; returns the position and character length of the overall match 
		
		if (_rgxMatch.Value) { ;~ if _rgxMatch has any hits
			if (_currentTag == "d") {
				_matchPos := RegExMatch(_regexHaystack, "i)((day)|(december)|(dd)|(ddd)|(dddd))", _regexCurrentPos - 1)
				if (_matchPos)
					continue ; short-circuit to next iteration of this loop
				else if (!_matchPos)
					FormatTime, _outVar, % p_timeStamp, % _currentTag ; converts the current tag into formatted date-style text
			}
			else if (_currentTag == "m") {
				_matchPos := RegExMatch(_regexHaystack, "i)(.*?day\b)|(arch)|(ay)|(ber)|(m)", , _regexCurrentPos)
				if (_matchPos)
					continue
				else if (!_matchPos)
					FormatTime, _outVar, % p_timeStamp, % _currentTag
			}
			else if (_currentTag == "s") {
				_matchPos := RegExMatch(_regexHaystack, "i)(.*?sday)|(?<=(?:augu))|(eptember)", , _regexCurrentPos - 1)
				if (_matchPos)
					continue
				else if (!_matchPos)
					FormatTime, _outVar, % p_timeStamp, % _currentTag
			}
			else if (_currentTag == "h") {
				_matchPos := RegExMatch(_regexHaystack, "i)(.*?sday)|(?<=(?:augu))|(eptember)", , _regexCurrentPos)
				if (_matchPos)
					continue
				else if (!_matchPos)
					FormatTime, _outVar, % p_timeStamp, % _currentTag
			}
			else if (_currentTag == "SS")
				_outVar := A_MSec
			else if (_currentTag == "S")
				_outVar := A_MSec + 0 ; removes leading zeros from output String
			else
				FormatTime, _outVar, % p_timeStamp, % _currentTag ; converts the current tag into formatted date-style text
		}
		
		_formattedTxt := _outVar
		
		/* RegExReplace( in the current iteration of our haystack
		 *		, the current tag
		 *		, with the formatted text
		 *		, (don't worry about counting the times replaced)
		 *		, start looking from position <1>
		 *		, and replace <1> time(s))
		 */
		_regexHaystack := RegExReplace(_regexHaystack
					, _currentTag
					, _formattedTxt
					, 
					, 1
					, 1)
	}
	
	return _retVar := _regexHaystack
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

/** FORMATTING REFERENCE
    ;//the built-in command-function <FormatTime>
    FormatTime, OutputVar [, YYYYMMDDHH24MISS, Format]
    =============================================================================
    Remarks:
      ~ The value of a TimeStamp object is 
            STRING of INTEGERS in the following format, (YYYYMMDDHH24MISS)
    
    
    20171028 == 2017, October, 28, hour-00, min-00, sec-00
    MsgBox, % time_difference(20171028, 20220131, , "yyyy`ndd")
    
    
    location of file for custom date calculations
    (highlight and press Ctrl+Shift+O)
    =============================================================================
    E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Time-Calculator-UTILITY.ahk
    -----------------------------------------------------------------------------
    
    
    Date Formats (case sensitive)
    =============================================================================
    Format 	Description
    -----------------------------------------------------------------------------
    d 		Day of the month without leading zero (1 – 31)
    dd 		Day of the month with leading zero (01 – 31)
    ddd 		Abbreviated name for the day of the week (e.g. Mon) in the current user's language
    dddd 	Full name for the day of the week (e.g. Monday) in the current user's language
    M 		Month without leading zero (1 – 12)
    MM 		Month with leading zero (01 – 12)
    MMM 		Abbreviated month name (e.g. Jan) in the current user's language
    MMMM 	Full month name (e.g. January) in the current user's language
    y 		Year without century, without leading zero (0 – 99)
    yy 		Year without century, with leading zero (00 – 99)
    yyyy 	Year with century. For example: 2005
    gg 		Period/era string for the current user's locale (blank if none)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Time Formats (case sensitive)
    =============================================================================
    Format 	Description
    -----------------------------------------------------------------------------
    h 		Hours without leading zero; 12-hour format (1 – 12)
    hh 		Hours with leading zero; 12-hour format (01 – 12)
    H 		Hours without leading zero; 24-hour format (0 – 23)
    HH 		Hours with leading zero; 24-hour format (00 – 23)
    m 		Minutes without leading zero (0 – 59)
    mm 		Minutes with leading zero (00 – 59)
    s 		Seconds without leading zero (0 – 59)
    ss 		Seconds with leading zero (00 – 59)
    S 		Milliseconds without leading zero (0 – 59)
    SS 		Milliseconds with leading zero (00 – 59)
    t 		Single character time marker, such as A or P (depends on locale)
    tt 		Multi-character time marker, such as AM or PM (depends on locale)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Standalone Formats
    The following formats must be used alone; that is, with no other formats or text present in the Format parameter. These formats are not case sensitive.
    =============================================================================
    Format 		Description
    -----------------------------------------------------------------------------
    (Blank)		4:55 PM Saturday, November 27, 2004
    Time 		5:26 PM
    ShortDate 	02/29/04
    LongDate 	Friday, April 23, 2004
    YearMonth 	February, 2004
    YDay 		Day of the year without leading zeros (1 – 366)
    YDay0 		Day of the year with leading zeros (001 – 366)
    WDay 		Day of the week (1 – 7). Sunday is 1.
    YWeek 		The ISO 8601 full year and week number. For example: 200453. If the week containing January 1st has four or more days in the new year, it is considered week 1. Otherwise, it is the last week of the previous year, and the next week is week 1. Consequently, both January 4th and the first Thursday of January are always in week 1.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

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
