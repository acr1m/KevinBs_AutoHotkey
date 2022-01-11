#IfWinActive PowerLauncher ahk_exe PowerLauncher.exe
::???::
	pwrRun_fireFoxSearch()
	return
::??word::
::??wordHippo::
	pwrRun_fireFoxSearch("word")
	return
::??regexr::
	Run, Firefox.exe "https://regexr.com/"
	return
::??test::
	pwrRun_fireFoxSearch("test","{Space}1{Space}2{Space}3")
	return
::??blend::
::??colorblend::
::??colorMix::
::??color Mix::
::??colorMixer::
::??color Mixer::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_mixer.asp"
	return
::??colorPick::
::??color Pick::
::??color Picker::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_picker.asp"
	return
::??colorName::
::??color name::
::??colorNames::
::??color names::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_names.asp"
	return
::??anime::
::??liveChart::
::??liveChart.me::
	v_domain := "https://www.livechart.me/timetable?date="
	v_date := time_translateDate(-3, ,"yyyy-MM-dd")
	v_target := v_domain . v_date
	;: MsgBox, %v_target%
	Run, Chrome.exe %v_target%
	return
::??sortLines::
::??sort::
::??sortSelection::
	regex_selection_sortAndPaste()
	return
::??parse for functions::
::??parse document for functions::
::??parseDocumentForFunctions::
::??parseForFunctions::
	Clipboard := regex_parseDocumentForFunctions()
	return
::??loremipsum::
::??loremipsum1::
	pwrRun_clearText()
	generate_loremIpsum(1)
	return
::??loremipsum2::
	pwrRun_clearText()
	generate_loremIpsum(2)
	return
::??loremipsum3::
	pwrRun_clearText()
	generate_loremIpsum(3)
	return
::??loremipsum4::
	pwrRun_clearText()
	generate_loremIpsum(4)
	return
::??loremipsum5::
	pwrRun_clearText()
	generate_loremIpsum(5)
	return
::??loremipsum6::
	pwrRun_clearText()
	generate_loremIpsum(6)
	return
::??loremipsum7::
	pwrRun_clearText()
	generate_loremIpsum(7)
	return
::??loremipsum8::
	pwrRun_clearText()
	generate_loremIpsum(8)
	return
::??loremipsum9::
	pwrRun_clearText()
	generate_loremIpsum(9)
	return
::??loremipsum10::
	pwrRun_clearText()
	generate_loremIpsum(10)
	return

/**	pwrRun_clearText()
	Descr:	Selects all, Delete, Escape, then wait 200 (default) milliseconds.
	Return:	VOID
	Params:	p_waitTime :=	INTEGER
	Notes:	This is particularly used to clear the text typed into the 
				PowerRun search bar before Escaping the search bar.
*/
pwrRun_clearText(p_waitTime := 200){
	Send, ^a ;; select all
	Send, {Delete}{Escape}
	Sleep, % p_waitTime
	return
}


/**	pwrRun_fireFoxSearch()
	Descr:	Opens Firefox and puts text caret in the address bar.
	Return:	VOID
	Params:	str := "", 
			extraSend := ""
	Notes:	
*/
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