#IfWinActive PowerLauncher ahk_exe PowerLauncher.exe
#Include pwrRun-date00-WIN.ahk

;; this block is primarily for testing script, main.ahk should already include all of these
#Include %A_ScriptDir%\..\_lib ;{ 
#Include LIB_Main_Method_Library.ahk
#Include LIB_Emojis_And_Symbols.ahk
#Include LIB_repeatKey().ahk
#Include LIB_time().ahk
#Include LIB_RegEx().ahk
#Include %A_ScriptDir%\..\_utility
#Include UTILITY_Horizontal_Scrolling.ahk
#Include UTILITY_Generate_Lorem_Ipsum.ahk  ;}

;; opens a new tab in Firefox and activates the address bar for typing
Lbl_Firefox_Search: ;{ 
::???::
	pwrRun_fireFoxSearch()
	return  ;}

;; opens firefox and sets the address bar to the shortcut for WordHippo's search bar
Lbl_Word_Hippo: ;{ 
::??word::
::??wordHippo::
	pwrRun_fireFoxSearch("word")
	return  ;}

;; opens (https://regexr.com) in Firefox
Lbl_Open_Regexr: ;{ 
::??regexr::
	Run, Firefox.exe "https://regexr.com/"
	return  ;}

;; opens a color-mixer
Lbl_Color_Mixer: ;{
	::??blend::
	::??color Mix::
	::??color Mixer::
	::??colorblend::
	::??colorMix::
	::??colorMixer::
		Run, Firefox.exe "https://www.w3schools.com/colors/colors_mixer.asp"
		return
;}

;; opens a color-picer
Lbl_Color_Picker: ;{
::??color Pick::
::??color Picker::
::??colorPick::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_picker.asp"
	return  ;}

;; opens color-name website
Lbl_Color_Name: ;{
::??color name::
::??color names::
::??colorName::
::??colorNames::
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_names.asp"
	return  ;}

;; opens anime schedule shortcut (livechart.me/timetable)
Lbl_Anime_LiveChart: ;{
::??anime::
::??liveChart.me::
::??liveChart::
	v_domain := "https://www.livechart.me/timetable?date=" ;{ 
	v_date := time_translateDate(-3, ,"yyyy-MM-dd")
	v_target := v_domain . v_date
	;: MsgBox, %v_target%
	Run, Chrome.exe %v_target%
	return  ;}  ;}

;; sorts selection and replaces it
Lbl_Regex_Sort: ;{
::??sort::
::??sortLines::
::??sortSelection::
	regex_selection_sortAndPaste()
	return  ;}

;; runs regex_parseDocumentForFunctions and assigns it to Clipboard
Lbl_Regex_Parse_Document_For_Functions: ;{ 
::??parse document for functions::
::??parse for functions::
::??parseDocumentForFunctions::
::??parseForFunctions::
	Clipboard := regex_parseDocumentForFunctions()
	return  ;}

;; runs the lorem-ipsum text method
Lbl_Generate_Lorem_Ipsum: ;{ 
::??ipsum::
::??lipsum::
::??loremipsum::
	pwrRun_loremIpsumTextMethod()
	return
::??ipsum1::
::??lipsum1::
::??loremipsum1::
	pwrRun_loremIpsumTextMethod(1)
	return
::??ipsum2::
::??lipsum2::
::??loremipsum2::
	pwrRun_loremIpsumTextMethod(2)
	return
::??ipsum3::
::??lipsum3::
::??loremipsum3::
	pwrRun_loremIpsumTextMethod(3)
	return
::??ipsum4::
::??lipsum4::
::??loremipsum4::
	pwrRun_loremIpsumTextMethod(4)
	return
::??ipsum5::
::??lipsum5::
::??loremipsum5::
	pwrRun_loremIpsumTextMethod(5)
	return
::??ipsum6::
::??lipsum6::
::??loremipsum6::
	pwrRun_loremIpsumTextMethod(6)
	return
::??ipsum7::
::??lipsum7::
::??loremipsum7::
	pwrRun_loremIpsumTextMethod(7)
	return
::??ipsum8::
::??lipsum8::
::??loremipsum8::
	pwrRun_loremIpsumTextMethod(8)
	return
::??ipsum9::
::??lipsum9::
::??loremipsum9::
	pwrRun_loremIpsumTextMethod(9)
	return
::??ipsum10::
::??lipsum10::
::??loremipsum10::
	pwrRun_loremIpsumTextMethod(10)
	return  ;}

;; opens the WindowSpy.ahk GUI
Lbl_Window_Spy: ;{ 
::??windowspy::
	Run, autohotkey.exe %A_AhkPath%\..\WindowSpy.ahk
	return  ;}
	
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
	/* if (WinExist("Firefox")){
		;;delete text
		pwrRun_clearText()
		WinActivate
		;;new tab
		Run, "Firefox.exe" "about:newtab"
		Sleep, 500
		;;select address bar
		Send, ^l
		;;type !word and then space
		Send, %str%{Space}%extraSend%
	}
	else {
		;;delete text
		pwrRun_clearText()
		;;new tab
		Run, "Firefox.exe" "about:newtab"
		WinWait, ahk_exe Firefox.exe
		WinActivate
		;;select address bar
		Send, ^l
		;;type !word and then space
		Send, %str%{Space}%extraSend%
	} 
	*/
	
	;;delete text
	pwrRun_clearText()
	;;new tab
	Run, "Firefox.exe" "about:newtab"
	WinWait, ahk_exe Firefox.exe
	WinActivate
	;;select address bar
	Send, ^l
	;;type !word and then space
	Send, %str%{Space}%extraSend%
	
	return
}

/**	pwrRun_loremIpsumTextMethod()
	Descr:	Generates text, and sends a message telling user how to paste it. 
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	Used for when activating generate_loremIpsum() in PowerRun.
*/
pwrRun_loremIpsumTextMethod(p_int := 3){
	pwrRun_clearText()
	str := generate_loremIpsum(p_int)
	MsgBox, , % "Message", % "For the next 10 seconds,`nPress [ t ] to paste the generated text.", 3
	KeyWait, t, D T10
	;; if user doesn't press the button in time, then quit
	if (ErrorLevel) {
		MsgBox, , % "Message", % "User did not hit [ t ] key.`n[ t ] key is now released.", 3
		return
	}
	else {
		Send, {BackSpace}
		pasteClipboard(str)
	}
	return
}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive