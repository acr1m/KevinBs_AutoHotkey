#IfWinActive ahk_exe WINWORD.EXE
;;If window is active

^r::
{
	Send, ^h
	return
}


; crop - left_ctrl+t
<^t::
	KeyWait, LCtrl
	KeyWait, t
	;; InputHook("
	Send, {LAlt}
	;; Sleep, 500
	Send, jpvc
	return


;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive


