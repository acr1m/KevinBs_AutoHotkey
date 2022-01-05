#Include LIB_Main_Method_Library.ahk


#IfWinActive Color ahk_class #32770 ahk_exe notepad++.exe
;;If window is active

^v::
{
	txt := Clipboard
	StringSplit, colorArray[]
	Send, 
	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive