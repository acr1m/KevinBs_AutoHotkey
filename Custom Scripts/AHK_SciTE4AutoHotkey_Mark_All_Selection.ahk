;AHK_SciTE4AutoHotkey_Mark_All_Selection.ahk
#Include %A_ScriptDir%\LIB\LIB_Main_Method_Library.ahk
#IfWinActive ahk_class SciTEWindow ahk_exe SciTE.exe
/* ~LButton::
 * 	if (doubleTap(150)){
 * 		KeyWait, LButton
 * 		Send, ^f!u!m
 * 	}
 * 	return
 */
/* ~RButton::
 * 	if (doubleTap(150)){
 * 		KeyWait, RButton
 * 		Send, ^f!u!m
 * 	}
 * 	return
 */
 ^f::Send, ^f!u!m
#IfWinActive
