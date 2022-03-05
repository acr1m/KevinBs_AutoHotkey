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


NumpadMult::
	SendRaw, ⋅
	return

;; math-input, insert square root and edit inner expression.
?::Send, \sqrt{Space 2}{Left}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive


