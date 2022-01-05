#IfWinActive ahk_class OpusApp ahk_exe WINWORD.EXE
;;If window is active

^r::
{
	Send, ^h
	return
}




;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive