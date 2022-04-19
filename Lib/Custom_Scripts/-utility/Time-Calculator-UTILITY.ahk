#Persistent
#SingleInstance

;{ AutoHotkey Compiler Directives
;; the next line is a compiler-directive that assigns the default ".exe" icon
	;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\accessibilitycpl_339-clock-stopwatch-time.ico
;}

global g_tC_ShortFormat := "M/d/yyyy" ;; 4/8/2022
global g_tC_LongFormat := "dddd, MMM, d, yyyy" ;; Friday, Apr, 8, 2022

run_AsAdmin() ; (,true) -> shows a msgbox indicating success/failure of process

#Include %A_LineFile%\..\..\-win\pwrRun-date01-WIN.ahk


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
	timeCalc_showDateMessage(v_daysFromNow, v_format, retVar, 10)
	return retVar ;; returns a string of the date with the given v_format
}


timeCalc_difference() {
	v_days := time_difference(20171028,, "Days")
	v_years := Round(time_difference(20171028,, "Days")/365)
	;; v_days := Mod(v_days,(v_years * 365))
	v_days := Mod(v_days, (v_years * 365))
	MsgBox, % "years: " v_years "`ndays: " v_days
}

timeCalc_showDateMessage(v_daysFromNow, v_format, v_clipOutput, v_timeOut := 5) {
	MsgBox, , % A_ScriptName , % ""
	. "" ;; "Date: " . time_translateDate(0,, "yyy / M-MMM / dd-ddd") 
	. "Today:`t`t" . time_translateDate(0,, g_tC_LongFormat)
	. "`nv_daysFromNow = " . v_daysFromNow 
	. "`nDate:`t`t" . time_translateDate(v_daysFromNow,, g_tC_LongFormat)
	. "`nClipboard:`t" . v_clipOutput
	. "`n`n(this window will close after " . v_timeOut . " seconds)"
	, % v_timeOut ;; timeout = 5 seconds
	return
}

;; #Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\run()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk
#Include %A_LineFile%\..\..\-lib\run()-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\mathKbd()-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\Emojis-And-Symbols-LIB.ahk
;; #Include %A_LineFile%\..\..\-lib\repeatKey()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\time()-LIB.ahk
#Include %A_LineFile%\..\..\-lib\RegEx()-LIB.ahk



;; MsgBox, , % "title", %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk
