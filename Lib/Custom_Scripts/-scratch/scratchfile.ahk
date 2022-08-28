#SingleInstance Force
#Include %A_LineFile%\..\..\-lib\
#Include %A_WorkingDir%\Main-Method-Library-LIB.ahk
;~ #Include %A_WorkingDir%\run()-LIB.ahk
;~ #Include %A_WorkingDir%\mathKbd()-LIB.ahk
;~ #Include %A_WorkingDir%\Emojis-And-Symbols-LIB.ahk
;~ #Include %A_WorkingDir%\repeatKey()-LIB.ahk
#Include %A_WorkingDir%\time()-LIB.ahk
#Include %A_WorkingDir%\RegEx()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,false) ; (,true) -> shows a msgbox indicating success/failure of process


;;~ set the icon references
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\TrayIconManager-LIB.ahk
;~ #Include %A_ScriptDir%\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=    "E:\Assets\Icons\_used-icons\key-s05-green.ico"
trayIM.iconSuspended := "E:\Assets\Icons\_used-icons\key-s05-blue.ico"
trayIM.iconPaused :=    "E:\Assets\Icons\_used-icons\key-s05-yellow.ico"
trayIM.iconInactive :=  "E:\Assets\Icons\_used-icons\key-s05-red.ico"		
trayIM.start()


#IfWinActive

_msgboxStr := ""
;~ scratchMethod00()
;~ scratchMethod01()
;~ scratchMethod02()
;~ scratchMethod03() 		;~ testing output of time_translateDate() using "S" or "SS" as DATE-FORMAT tag for Milliseconds
;~ scratchMethod04() 	;~ testing output of time_parseYear() method
;~ scratchMethod05() 	;~ parse document for method names and parameters for documentation and user.ahk.api
return

;~ end of auto-execute section~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Esc::scratchMethod06()
F5::scratchMethod07()
F4::scratchMethod08()
Left::Send, {WheelUp}
Right::Send, {Space}


scratchMethod06() {
	;~ mouseClick(-594, 734, 0, 1)
	;~ Sleep, 1500
	;~ mouseClick(659, 948, 0, 1)
	MouseGetPos, mX, mY
	MouseClick, Left, 90, 1000, 1, 0
	;~ MouseClick, Left, 500, 500, 1, 0
	MouseClick, Left, %mX%, %mY%, 1, 0
	;~ MouseMove, % mX, % mY, 0
	return
}

scratchMethod07() {
	mSpeed := 0
	MouseClick, Left, 1330, 22, 1, % mSpeed
	MouseClick, Left, 960, 651, 1, % mSpeed
	MouseClick, Left, 1057, 1057, 1, % mSpeed
	;~ Sleep, 800
	MouseClick, Left, 958, 773, 2, % mSpeed
	return
}

scratchMethod08() {
	mSpeed := 0
	MouseGetPos, mX, mY
	MouseClick, Left, 1057, 1057, 1, % mSpeed
	MouseMove, % mX, % mY, % mSpeed
	return
}

scratchMethod00() {
	Loop, 11 {
		Sleep, main_getRandomNum(0, 99)
		_msgboxStr .= time_getDate("yyyyMMdd_hhmmss_S_tt") . "`n"
		_msgboxStr .= time_translateDate((-8), "Hours", "yyyyMMdd_hhmmss_S_tt") . "`n`n"
		;~ _msgboxStr .= time_getDate("`t`tS_") . "`n"
		;~ _msgboxStr .= time_getDate("`t`tSS_") . "`n"
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

;~ testing output of time_translateDate() using "S" or "SS" as DATE-FORMAT tag for Milliseconds
scratchMethod03() {
	_outFile := FileOpen("scratchMethod03.txt", "w", "UTF-8")
	
	_outFile.WriteLine("                                    A_Now:= {" . A_Now . "}")
	_outFile.WriteLine("                                                            ")
	
	_outFile.WriteLine("       time_getDate(""yyyyMMdd_HHmmss_SS""):= {" . time_getDate("yyyyMMdd_HHmmss_SS") . "}")
	;~ _outFile.WriteLine("       time_sendDate(""M/d/yy,  dddd,  S""):= " . time_sendDate("yyyyMMdd_HHmmss_SS") . "}")
	
	_outFile.WriteLine("       time_getDate(""yyyyMMdd_HHmmss_SS""):= {" . time_getDate("yyyyMMdd_HHmmss_SS") . "}")
	;~ _outFile.WriteLine("      time_sendDate(""yyyyMMdd_HHmmss_SS""):= " . time_sendDate("yyyyMMdd_HHmmss_SS") . "}")
	
	_outFile.WriteLine("         time_getDate(""M/d/yy,  dddd, S""):= {" . time_getDate("M/d/yy, dddd, S") . "}")
	_outFile.WriteLine(" time_parseDateFormat(""M/d/yy,  dddd, S""):= {" . time_parseDateFormat("M/d/yy, dddd, S") . "}")
	
	_outFile.WriteLine("")
	_outFile.WriteLine("                                            {______________}")
	_outFile.WriteLine("                                            {YYYYMMDDHHmmSS}")
	_outFile.WriteLine("                                            {______DD______}")
	_outFile.WriteLine("                                    A_Now:= {" . A_Now . "}")
	_outFile.WriteLine("                                   +0 day:= {" . time_translateDate(0, "Days", "d") . "}")
	_outFile.WriteLine("                                   +1 day:= {" . time_translateDate(1, "Days", "d") . "}")
	_outFile.WriteLine("                                   +2 day:= {" . time_translateDate(2, "Days", "d") . "}")
	_outFile.WriteLine("                                   -2 day:= {" . time_translateDate(-2, "Days", "d") .  "}")
	_outFile.WriteLine("                                            {______DD______}")
	
	
	;~ _outFile.WriteLine()
	;~ _outFile.WriteLine()
	;~ _outFile.WriteLine("time_getDate(""`tM/d/yy,`tdddd,`tSS""):")
	;~ _outFile.WriteLine("`t`t" . time_getDate("M/d/yy,`tdddd,`tSS"))
	;~ _outFile.WriteLine()
	;~ _outFile.WriteLine("+0 day shift:`t" . time_translateDate(0, "Days", "M/d/yy,`tdddd", true))
	;~ _outFile.WriteLine("+2 day shift:`t" . time_translateDate(2, "Days", "M/d/yy,`tdddd", true))
	;~ _outFile.WriteLine("-2 day shift:`t" . time_translateDate(-2, "Days", "M/d/yy,`tdddd", true))
	;~ _outFile.WriteLine()
	;~ _outFile.WriteLine()
	;~ _outFile.WriteLine("+0 second shift:`t`t" . time_getDate("HH:mm:ss"))
	;~ _outFile.WriteLine("+0 second shift:`t`t" . time_translateDate(0, "Seconds", "HH:mm:ss"))
	;~ _outFile.WriteLine("+3h seconds shift:`t`t" . time_translateDate(648000, "Seconds", "hh:mm:ss"))
	;~ _outFile.WriteLine("-3h seconds shift:`t`t" . time_translateDate(-648000, "Seconds", "hh:mm:ss"))
	;~ _outFile.WriteLine()
	
	_outFile.Close()
	Run, % "scratchMethod03.txt"
	
	return
}

;~ testing output of time_parseYear() method
scratchMethod04() {
	outFile := FileOpen("scratchfile_output.txt", "w") ;opens file in write-mode (overwriting any pre-existing contents) and assigns the object reference as the value for outFile.
	
	;~ _outStr := ""
		;~ . "time_getDate(""`tyyyyMMddHHmmss_SS,`tdddd""):`n`t`t"
		;~ . time_getDate("yyyyMMddHHmmss_SS,`tdddd")	. "`n`n"
		;~ . "----------------------------------------------------------------------`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddddd""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddddd") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdddd""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdddd") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddd""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tddd") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdd""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `tdd") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tMM`tss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tMM`tss`t_SS, `td") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`td`tHH`tMM`tss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`td`tHH`tMM`tss`t_SS, `td") . "`n"
		;~ . "`n----------------------------------------------------------------------`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~d~mss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~d~mss`t_SS, `td") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~dd~mss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~dd~mss`t_SS, `td") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~ddd~mss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~ddd~mss`t_SS, `td") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~dddd~mss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~dddd~mss`t_SS, `td") . "`n"
		;~ . "time_parseDateFormat(""`n`t`tyyyy`tMM`tdd`tHH`tm~ddddd~mss`t_SS, `td""):" 
		;~ . "`n`t`t" . time_parseDateFormat("yyyy`tMM`tdd`tHH`tm~ddddd~mss`t_SS, `td") . "`n"
	
	;~ _outStr2 := "[""yyyy"", ""yyy"", ""yy"", ""y"""
		;~ . ", ""MMMM"", ""MMM"", ""MM"", ""M"" "
		;~ . ", ""dd"", ""d"""
		;~ . ", ""HH"", ""H"", ""hh"", ""h"""
		;~ . ", ""mm"", ""m"""
		;~ . ", ""ss"", ""s"""
		;~ . ", ""SS"", ""S"""
		;~ . ", ""dddd"", ""ddd""]"
	
	;~ _outStr3 := ""
		;~ . "time_parseDateFormat(_outStr2):" . "`n"
		;~ . time_parseDateFormat(_outStr2) . "`n"
	
	;~ FormatTime, _formatTimeOutput, , % _outStr2
	
	;~ _outStr4 := ""
		;~ . "FormatTime, _formatTimeOutput, , _outStr2, :" . "`n"
		;~ . _formatTimeOutput . "`n"
	
	
	;~ _outHLine := "`n----------------------------------------------------------------------`n"

		
	;~ Clipboard := _outStr
	;~ FileAppend, % "_outStr1: " . "`n" . _outStr, % "scratchfile_output.txt"
	
	
	;~ outFile.Write(_outStr)
	;~ outFile.Write(_outHLine . _outStr2 . "`n" . _outStr3 . _outStr4)
	outFile.Write(time_parseDateFormat("MMMM, dddd, yyyy, HH:mm:ss:SS") . "`n")
	outFile.Write(time_parseDateFormat("yyyyMMdd_HHmm_ssSS") . "`n")
	outFile.Write(time_parseDateFormat("yyyyMMdd_HHmm_s-S") . "`n")
	
	_outFile.Close()
	
	return
}

;~ parse document for method names and parameters for documentation and user.ahk.api
scratchMethod05() {
	_inFile := FileOpen("E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk", "r")
	_outFile := FileOpen("E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk.txt", "w", "UTF-8")
	
	_rgxNeedle := "(?:([\s\S\.]*?)([\r\n]{1})(?P<methodName>[A-Za-z_\-]+)(?P<methodParams>\([\s\S]*?\))(?=[\s]*{[\s\S]*}))|(?:([\s\S]+?$)(?![\r\n]{1}[A-Za-z_\-]+\([\s\S]*?\)[\s\S]*{.+}.+$))"
	_rgxHaystack := _inFile.Read() ;~ reads/streams all text of file as a single STRING
	_rgxPos := 1
	
	while (_rgxPos < StrLen(_rgxHaystack)) {
		RegExMatch(_rgxHaystack, "O)" . _rgxNeedle, _rgxMatch, _rgxPos)
		_outFile.WriteLine(_rgxMatch.methodName . _rgxMatch.methodParams)
		_rgxPos := _rgxMatch.Pos(0) + _rgxMatch.Len(0)
	}
	
	_inFile.Close()
	_outFile.Close()
	
	Run, "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk.txt"	
}


Pause::ExitApp
NumpadEnter::ExitApp



#IfWinActive ahk_exe Game.exe
;~If window is active


BackSpace::Esc ;x
RShift::Esc ;x
RControl::Enter ;z
Delete::a
End::s
PgDn::d



;~[;] semicolon key, SC027=scan_code-for-semicolon
;~ SC027::SendPlay, {Down}

;~['] apostrphe key
;~ SC028::SendRaw, {Down}

;~Re-declare any window as an acceptable 
;~case-scenario before exit.
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

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/*~ Alt Code Handler
	Description: Hooks alt code sequences for characters like Tab, NewLine, etc.
	Example: If Alt down → Numpad0 → Numpad9 → Alt up ⇒ paste({TAB})
*/
~Alt::
{
	showKeyStateInfo(A_ThisHotkey)		
	if (GetKeyState("A_ThisHotkey", "P")) {
		
	}
	Send, {A_ThisHotkey}
	return
}

~Alt up::
{
	showKeyStateInfo(A_ThisHotkey)	
	Send, {A_ThisHotkey}
	return
}

showKeyStateInfo(p_ThisHotkey) {
	
	rgxMatch := "" ; used to hold the matched group of RegExMatch
	RegExMatch(p_ThisHotkey, "([\!\^\+a-zA-Z0-9]+)", rgxMatch)
	
	k := {name: p_ThisHotkey
		, key: rgxMatch}
		
	str := k.name . " (physical):= " . k.key . " := " . GetKeyState(k.key, "P")
	str .= "`n" . k.name . " (virtual):= " . k.key . " := " . GetKeyState(k.key)
	;~ str := "k.name := " . k.name . "`nk.key := " . k.key . "`n" . str
	
	main_showTooltip(str, 2000)
	
	return
}