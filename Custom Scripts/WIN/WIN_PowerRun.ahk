#IfWinActive PowerLauncher ahk_class HwndWrapper[PowerLauncher;;300ce19b-7b4c-49eb-a764-0a730ee71419] ahk_exe PowerLauncher.exe

::!word::
::!wordhippo::
{
	if (WinExist("Firefox")){
		;;delete text
		Send, +{Home}{Delete}
		WinActivate
		;;new tab
		Run, "Firefox.exe" "about:newtab"
		;;select address bar
		Send, ^l
		;;type !word and then space
		Send, word{Space}
	}
	else {
		;;delete text
		Send, +{Home}{Delete}
		;;new tab
		Run, "Firefox.exe" "about:newtab"
		Sleep, 200
		;;select address bar
		Send, ^l
		;;type !word and then space
		Send, word{Space}
	}
	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive