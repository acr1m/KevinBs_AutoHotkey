#SingleInstance Force
;run this command
;; temp_outputMessage()
;; this->E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-scratch\scratchfile.ahk
;; SetWorkingDir, %A_ScriptDir%\..\-lib\
;; MsgBox, , % A_ScriptName, % "address:= " . A_WorkingDir . "\time()-LIB.ahk"
;; Clipboard := "address:= " . A_WorkingDir . "\time()-LIB.ahk"
;; #Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk
;;          E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\
#Include %A_WorkingDir%\Main-Method-Library-LIB.ahk
;; #Include %A_WorkingDir%\run()-LIB.ahk
;; #Include %A_WorkingDir%\mathKbd()-LIB.ahk
;; #Include %A_WorkingDir%\Emojis-And-Symbols-LIB.ahk
;; #Include %A_WorkingDir%\repeatKey()-LIB.ahk
#Include %A_WorkingDir%\time()-LIB.ahk
#Include %A_WorkingDir%\RegEx()-LIB.ahk

#IfWinActive

/* 
_msgboxStr := time_getDate("yyyyMMdd_HHmmssS") . "`n"
Sleep, main_getRandomNum(0, 99)
_msgboxStr .= time_getDate("yyyyMMdd_HHmmssSS") . "`n"
Sleep, main_getRandomNum(0, 99)
_msgboxStr .= time_getDate("yyyyMMdd_HHmmss_S") . "`n"
Sleep, main_getRandomNum(0, 99)
_msgboxStr .= time_getDate("yyyyMMdd_HHmmss_SS") . "`n"
Sleep, main_getRandomNum(0, 99)
_msgboxStr .= time_getDate("yyyyMMdd_HHmmss_S_tt") . "`n"
Sleep, main_getRandomNum(0, 99)
_msgboxStr .= time_getDate("yyyyMMdd_HHmmss_SS_tt") . "`n"

*/

_msgboxStr := ""
;; scratchMethod00()
;; scratchMethod01()
;; scratchMethod02()
;; scratchMethod03()
scratchMethod04()
ExitApp

;~ end of auto-execute section~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

scratchMethod00() {
	Loop, 11 {
		Sleep, main_getRandomNum(0, 99)
		_msgboxStr .= time_getDate("yyyyMMdd_hhmmss_S_tt") . "`n"
		_msgboxStr .= time_translateDate((-8), "Hours", "yyyyMMdd_hhmmss_S_tt") . "`n`n"
		;; _msgboxStr .= time_getDate("`t`tS_") . "`n"
		;; _msgboxStr .= time_getDate("`t`tSS_") . "`n"
	} 
	MsgBox, , % A_ScriptName, % "Loop, 11 _msgboxStr: " . "`n" . _msgboxStr
	return
}

scratchMethod01() {
	_msgboxStr1 := "_msgboxStr1: "
	_msgboxStr1 .= time_getDate("yyyyMMdd_hhmmss_S_tt") . "`n"
	_msgboxStr2 := "_msgboxStr2: "
	_msgboxStr2 .= time_translateDate(-8, "h") . "`n"
	_msgboxStr3 := "_msgboxStr3: "
	_msgboxStr3 .= time_translateDate(4, "D", "yyyyMMdd_t_hhmmss_SS") . "`n"
	_msgboxStr4 := "_msgboxStr4: "
	_msgboxStr4 .= time_translateDate(5, "Days", "yyyyMMdd_t_hhmmss_S") . "`n"
	_msgboxStrOut := _msgboxStr1 . _msgboxStr2 . _msgboxStr3 . _msgboxStr4
	Clipboard := _msgboxStrOut
	MsgBox, , % A_ScriptName, % "_msgboxStrOut: " . "`n" . _msgboxStrOut
	return
}

scratchMethod02() {
	_outStr := "time_getDate(""yyyyMMdd_hhmmss_S_tt""):`t"	. time_getDate("yyyyMMdd_hhmmss_S_tt")	. "`n"
	_outStr .= "`n"
	_outStr .= "+0 day shift:`t" 		. time_translateDate(0, "Days")	. "`n"
	_outStr .= "+2 day shift:`t" 		. time_translateDate(2, "Days")	. "`n"
	_outStr .= "-2 day shift:`t" 		. time_translateDate(-2, "Days")	. "`n"
	_outStr .= "`n"
	_outStr .= "+0 day shift:`t" 		. time_translateDate(0, "Days")	. "`n"
	_outStr .= "+2 hour shift:`t" 		. time_translateDate(2, "Hours")	. "`n"
	_outStr .= "-2 hour shift:`t" 		. time_translateDate(-2, "Hours")	. "`n"
	_outStr .= "`n"
	_outStr .= "+0 day shift:`t" 		. time_translateDate(0, "Days")	. "`n"
	_outStr .= "+2 minute shift:`t" 	. time_translateDate(2, "Minutes")	. "`n"
	_outStr .= "-2 minute shift:`t" 	. time_translateDate(-2, "Minutes")	. "`n"
	_outStr .= "`n"
	_outStr .= "+0 day shift:`t" 		. time_translateDate(0, "Days")	. "`n"
	_outStr .= "+2 second shift:`t" 	. time_translateDate(2, "Seconds")	. "`n"
	_outStr .= "-2 second shift:`t" 	. time_translateDate(-2, "Seconds")	. "`n"
	_outStr .= "`n"
	
	Clipboard := _outStr
	MsgBox, , % A_ScriptName, % "_outStr: " . "`n" . _outStr
	return
}

;; testing output of time_translateDate() using "S" or "SS" as DATE-FORMAT tag for Milliseconds
scratchMethod03() {
	_outStr := "time_getDate(""`tM/d/yy,`tdddd,`tS""):`n`t`t"
	_outStr .= time_getDate("M/d/yy,`tdddd,`tS")	. "`n"
	_outStr .= "`n"
	_outStr .= "+1 day shift:`t" 		. time_translateDate(1, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "+2 day shift:`t" 		. time_translateDate(2, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "-2 day shift:`t" 		. time_translateDate(-2, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "`n"
	_outStr .= "`n"
	_outStr .= "time_getDate(""`tM/d/yy,`tdddd,`tSS""):`n`t`t"
	_outStr .= time_getDate("M/d/yy,`tdddd,`tSS")	. "`n"
	_outStr .= "`n"
	_outStr .= "+0 day shift:`t" 		. time_translateDate(0, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "+2 day shift:`t" 		. time_translateDate(2, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "-2 day shift:`t" 		. time_translateDate(-2, "Days", "M/d/yy,`tdddd", true)	. "`n"
	_outStr .= "`n"
	_outStr .= "`n"
	_outStr .= "+0 second shift:`t`t" 		. time_getDate("HH:mm:ss")	. "`n"
	_outStr .= "+0 second shift:`t`t" 		. time_translateDate(0, "Seconds", "HH:mm:ss")	. "`n"
	_outStr .= "+3h seconds shift:`t`t" 		. time_translateDate(648000, "Seconds", "hh:mm:ss")	. "`n"
	_outStr .= "-3h seconds shift:`t`t" 		. time_translateDate(-648000, "Seconds", "hh:mm:ss")	. "`n"
	_outStr .= "`n"
	
	Clipboard := _outStr
	MsgBox, , % A_ScriptName, % "_outStr: " . "`n" . _outStr
	return
}

;; testing output of time_parseYear() method
scratchMethod04() {
	outFile := FileOpen("scratchfile_output.txt", "w") ;opens file in write-mode (overwriting any pre-existing contents) and assigns the object reference as the value for outFile.
	
	;; _outStr := ""
		;; . "time_getDate(""`tyyyyMMddHHmmss_SS,`tdddd""):`n`t`t"
		;; . time_getDate("yyyyMMddHHmmss_SS,`tdddd")	. "`n`n"
		;; . "----------------------------------------------------------------------`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddddd""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddddd") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdddd""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdddd") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddd""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddd") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdd""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdd") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `td") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`td`tHH`tMM`tss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`td`tHH`tMM`tss`t_SS, `td") . "`n"
		;; . "`n----------------------------------------------------------------------`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~d~mss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~d~mss`t_SS, `td") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~dd~mss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~dd~mss`t_SS, `td") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~ddd~mss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~ddd~mss`t_SS, `td") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~dddd~mss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~dddd~mss`t_SS, `td") . "`n"
		;; . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~ddddd~mss`t_SS, `td""):" 
		;; . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~ddddd~mss`t_SS, `td") . "`n"
	
	;; _outStr2 := "[""yyyy"", ""yyy"", ""yy"", ""y"""
		;; . ", ""MMMM"", ""MMM"", ""MM"", ""M"" "
		;; . ", ""dd"", ""d"""
		;; . ", ""HH"", ""H"", ""hh"", ""h"""
		;; . ", ""mm"", ""m"""
		;; . ", ""ss"", ""s"""
		;; . ", ""SS"", ""S"""
		;; . ", ""dddd"", ""ddd""]"
	
	;; _outStr3 := ""
		;; . "time_parseDateFormat(_outStr2):" . "`n"
		;; . time_parseDateFormat(_outStr2) . "`n"
	
	;; FormatTime, _formatTimeOutput, , % _outStr2
	
	;; _outStr4 := ""
		;; . "FormatTime, _formatTimeOutput, , _outStr2, :" . "`n"
		;; . _formatTimeOutput . "`n"
	
	
	;; _outHLine := "`n----------------------------------------------------------------------`n"

		
	;; Clipboard := _outStr
	;; FileAppend, % "_outStr1: " . "`n" . _outStr, % "scratchfile_output.txt"
	
	
	;; outFile.Write(_outStr)
	;; outFile.Write(_outHLine . _outStr2 . "`n" . _outStr3 . _outStr4)
	outFile.Write(time_parseDateFormat("MMMM, dddd, yyyy, HH:mm:ss:SS") . "`n")
	outFile.Write(time_parseDateFormat("yyyyMMdd_HHmm_ssSS") . "`n")
	outFile.Write(time_parseDateFormat("yyyyMMdd_HHmm_s-S") . "`n")
	
	return
}

Pause::ExitApp
NumpadEnter::ExitApp



#IfWinActive ahk_exe Game.exe
;;If window is active


BackSpace::Esc ;x
RShift::Esc ;x
RControl::Enter ;z
Delete::a
End::s
PgDn::d



;~[;] semicolon key, SC027=scan_code-for-semicolon
;; SC027::SendPlay, {Down}

;~['] apostrphe key
;; SC028::SendRaw, {Down}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
temp_outputMessage() {
	v1 := A_SendMode
	SendMode, event
	v2 := A_SendMode
	outStr := "v1 := A_SendMode ⇒ " . v1 . "`n"
	outStr .= "v2 := A_SendMode ⇒ " . v2 . "`n"
	MsgBox, , % A_ScriptName, % outStr
}