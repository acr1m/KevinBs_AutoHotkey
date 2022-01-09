#IfWinActive PowerLauncher ahk_exe PowerLauncher.exe

::!word::
::??word::
::!wordhippo::
::??wordhippo::
	pwrRun_fireFoxSearch("word")
	return
::??regex::
	pwrRun_fireFoxSearch("regex", "{Enter}")
	return
::??regexr::
	Run, Firefox.exe "https://regexr.com/"
	return
::??test::
	pwrRun_fireFoxSearch("test","{Space}1{Space}2{Space}3")
	return
::colormix::
::color mix::
::colormixer::
::color mixer::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_mixer.asp"
	return
::colorpick::
::color pick::
::color picker::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_picker.asp"
	return
::colorname::
::color name::
::colornames::
::color names::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_names.asp"
	return
::??anime::
#Include %A_ScriptDir%\..\_lib\LIB_time().ahk
	v_domain := "https://www.livechart.me/timetable?date="
	v_date := time_getDate("yyyy-MM-dd")
	v_target := v_domain . v_date
	MsgBox, %v_target%
	Run, Chrome.exe %v_target%
	return
pwrRun_fireFoxSearch(str := "", extraSend := ""){
	if (WinExist("Firefox")){
		;;delete text
		Send, +{Home}{Delete}
		WinActivate
		;;new tab
		Run, "Firefox.exe" "about:newtab"
		;;select address bar
		Send, ^l
		;;type !word and then space
		Send, %str%{Space}
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
		Send, %str%{Space}%extraSend%
	}
	return
}




;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive