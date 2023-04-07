;~ #Include %A_LineFile%\..\..\
;~ #Include %A_WorkingDir%\-lib\Main-Method-Library-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\run()-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\mathKbd()-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\Emojis-And-Symbols-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\repeatKey()-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\time()-LIB.ahk
;~ #Include %A_WorkingDir%\-lib\RegEx()-LIB.ahk
;~ #Include %A_WorkingDir%\-utility\Generate-Lorem-Ipsum-UTILITY.ahk


#SingleInstance Force

;; #IfWinActive PowerLauncher ahk_exe PowerLauncher.exe
#IfWinActive ahk_exe PowerToys.PowerLauncher.exe

;; #Include pwrRun-date00-WIN.ahk

;; this block is primarily for testing script, main.ahk should already include all of these
;; #Include %A_ScriptDir%\..\-lib ;{ 
;; #Include Main-Method-Library-LIB.ahk
;; #Include Emojis-And-Symbols-LIB.ahk
;; #Include repeatKey()-LIB.ahk
;; #Include time()-LIB.ahk
;; #Include RegEx()-LIB.ahk
;; #Include %A_ScriptDir%\..\-utility
;; #Include Horizontal-Scrolling-UTILITY.ahk
;; #Include Generate-Lorem-Ipsum-UTILITY.ahk  ;}

::??todo;::
	;;TODO (20220725_171752_318): finish this todo hotstring
	return

::??!genshin;::
	;~ do nothing (uses firefox custom bang addon to handle custom Genshin Impact wiki search requests)	
	return

::??math_input;::
::??latex;::
	Run, firefox.exe "https://csdn.codecogs.com/eqneditor/editor.php"
	return

::??pcre reference;::
::??pcrereference;::
::??pcre_ref;::
::??pcreRef;::
::??pcre;::
	Run, firefox.exe "https://www.pcre.org/original/doc/html/pcresyntax.html"
	Run, firefox.exe "https://www.pcre.org/original/doc/html/pcrepattern.html"
	return

::??ahkapi;::
::??ahk.api;::
::??userahkapi;::
::??user.ahk.api;::
::??open user.ahk.api;::
::??open userahkapi;::
	targetFile := "E:\Library\OneDrive\Documents\AutoHotkey\SciTE\user.ahk.api"
	Run, %g_SCITE_4AHK_EXE% %targetFile% ;; vars defined in main.ahk
	return

::??my.brain.fm;::
::??brain.fm;::
::??brainfm;::
::??brain;::
	;~ pwrRun_newFirefoxWindow("https://my.brain.fm/")
	;~ pwrRun_newChromeWindow("https://my.brain.fm/")
	outputVarPID := ""
	
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=dcllmfmjlkpljanfegjgohmlnfipachj
	
	win := Object("x", -701, "y", 10, "w", 698, "h", 544) ; KeyA can be a variable reference (KeyA_Var) or encapped with quotes as a string "KeyA_CharName"
	;~ win := {(KeyA): ValueA, (KeyB): ValueB, ..., (KeyZ): ValueZ} ; KeyA can be a variable reference (KeyA_Var) or encapped with quotes as a string "KeyA_CharName"
	
		/* 
		 * x: -701	y: 10	w: 698	h: 544
		 * Client:		w: 682	h: 536
		 */
		 
	winTitle := Brain.fm App - brain.fm ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	WinWait, Brain.fm App - brain.fm ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , 3 ; wait for 3 seconds
	WinActivate
	
	
	main_showTooltip("outputVarPID := " . outputVarPID . "`nwinTitle := " . winTitle)
	
	WinMove, Brain.fm App - brain.fm ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe, , -701, 10, 698, 544 ; A := last active window ; WinMove, WinTitle, WinText, X, Y, Width, Height
	;~ WinMove, % winTitle, , % win[x], % win[y], % win[w], % win[h]
	return

#IfWinActive
::??getUnicode;::
::??getAltCode;::
::??getCharVal;::
::??getChar;::
::??convertCharCode;::
::??ccc;::
::??getCharCode;::
::??gcc;::
	targetScript := A_LineFile . "\..\-utility\Char-Code-UTILITY.ahk" 
	Run, %A_AhkPath% %targetScript%,,,pid_outVar
	return

#IfWinActive ahk_exe PowerToys.PowerLauncher.exe
::??apiconvert;::
::??convertapi;::
::??convertahkapi;::
::??capi;:: ;{
	pwrRun_clearText()
	;regex_convertText_SciTE_API(p_replaceSelection, p_useClipboard)
	regex_convertText_SciTE_API(false, true)
	return
;}

;; Runs the Optical Character Recognition (OCR) tool from ShareX ;{
::??ocr;::
	pwrRun_clearText()
	
	;; WinClose, ahk_exe PowerToys.PowerLauncher.exe
	;; WinHide, ahk_exe PowerToys.PowerLauncher.exe
	;; WinWaitClose ahk_exe PowerToys.PowerLauncher.exe
	;; WinWaitNotActive, ahk_exe PowerToys.PowerLauncher.exe
	
	if (!WinActive("ahk_exe PowerToys.PowerLauncher.exe"))
		Send, ^+{PrintScreen}
	return
;}

;; AHK DOCUMENTS----------------------------------------------------------------

;; opens "Emojis-And-Symbols-LIB.ahk"
::??emoji;::
::??emojiahk;::
::??emoji.ahk;:: 
::??symbols;::
::??symbolsahk;::
::??symbols.ahk;::
::??emojisymbols;::
::??emojisymbolsahk;::
::??emojisymbols.ahk;:: ;{
	Run, %g_SCITE_4AHK_EXE% %g_EMOJI_AHK_FILE% ;; vars defined in main.ahk
	return
;}

;; opens "Main-AHK.ahk"
::??mainahk;::
::??main.ahk;:: ;{
	Run, %g_SCITE_4AHK_EXE% %g_MAIN_AHK_FILE% ;; vars defined in main.ahk
	return
;}

;; opens "PowerRun-WIN.ahk"
::??pwrrun;::
::??pwrrunahk;::
::??pwrrun.ahk;:: ;{
	Run, %g_SCITE_4AHK_EXE% %g_PWRRUN_AHK_FILE% ;; vars defined in main.ahk
	return
;}

;; END OF AHK DOCUMENTS---------------------------------------------------------



;; opens a new tab in Firefox and activates the address bar for typing
::??firefoxsearch;::
::??ffsearch;::
::??ff;:: ;{ 
	pwrRun_fireFoxSearch()
	return
;}

;; opens firefox and sets the address bar to the shortcut for WordHippo's search bar
::??!w;::
::??word;::
::??wordHippo;:: ;{
	pwrRun_fireFoxSearch("!wordhippo") ;~ !wordhippo is the 'bang' command for DuckDuckGo search engine
	return 
;}


::??amazonorders;::
::??amazon;::
::??orders;:: ;{
	pwrRun_newChromeWindow("https://www.amazon.com/gp/css/order-history?ref_=nav_orders_first")
	return
;}
	
::??target;::
::??groceries;:: ;{
	lW := {x: -7, y: 0, w: 974, h: 1048} ;~ left window dimensions
	rW := {x: 953, y: 0, w: 974, h: 1048} ;~ right window dimensions
	pwrRun_newChromeWindow("target.com", lW)
	pwrRun_newChromeWindow("https://shoppinglist.google.com/u/0/lists/13332788625507169408", rW)
	return
;}

;; opens (https://regexr.com) in Firefox
::??regexr;:: ;{ 
	Run, Firefox.exe "https://regexr.com/"
	return 
;}

;; opens a color-mixer
::??blend;::
::??color Mix;::
::??color Mixer;::
::??colorblend;::
::??colorMix;::
::??colorMixer;::
::??colormixer;::
::??color mixer;:: ;{
	Run, Firefox.exe "https://colordesigner.io/gradient-generator"
	;; Run, Firefox.exe "https://www.w3schools.com/colors/colors_mixer.asp"
	return
;}

;; opens a color-picker
Lbl_Color_Picker:
::??color Pick;::
::??color Picker;::
::??colorPick;:: ;{
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_picker.asp"
	return  ;}

;; opens color-name website
::??color name;::
::??color names;::
::??colorName;::
::??colorNames;:: ;{
	Run, Firefox.exe "https://www.w3schools.com/colors/colors_names.asp"
	return  ;}

;; opens anime schedule shortcut (livechart.me/timetable)
::??anime;::
::??liveChart.me;::
::??liveChart;:: ;{
	v_domain := "https://www.livechart.me/timetable?date="
	v_date := time_translateDate(-3, ,"yyyy-MM-dd")
	v_target := v_domain . v_date
	;: MsgBox, %v_target%
	Run, Chrome.exe %v_target%
	return  
;}

;; sorts selection and replaces it
Lbl_Regex_Sort_Selection: ;{
::??sortLines;::
::??sortSelection;::
	regex_selection_sortAndPaste()
	return  ;}

;; sorts most recent clipboard content
Lbl_Regex_Sort_Clipboard: ;{
::??sort;::
::??sortclip;::
::??sortclipboard;::
	regex_clipboard_sort()
	MsgBox, 0, Clipboard Sorted, Clipboard sorted`, ready to paste. , 3
	return  ;}
	
	

;; runs regex_parseDocumentForFunctions and assigns it to Clipboard
Lbl_Regex_Parse_Document_For_Functions: ;{ 
::??parse api;::
::??parseapi;::
::??papi;::
::??getmethods;::
::??getfuncs;::
::??getfunctions;::
::??get functions;::
::??parse document for functions;::
::??parse for functions;::
::??parseDocumentForFunctions;::
::??parseForFunctions;::
	pwrRun_clearText(500)
	Clipboard := regex_parseDocumentForFunctions()
	return  ;}

;; runs the lorem-ipsum text method
Lbl_Generate_Lorem_Ipsum: ;{ 
::??ipsum;::
::??lipsum;::
::??loremipsum;::
	pwrRun_loremIpsumTextMethod()
	return
::??ipsum1;::
::??lipsum1;::
::??loremipsum1;::
	pwrRun_loremIpsumTextMethod(1)
	return
::??ipsum2;::
::??lipsum2;::
::??loremipsum2;::
	pwrRun_loremIpsumTextMethod(2)
	return
::??ipsum3;::
::??lipsum3;::
::??loremipsum3;::
	pwrRun_loremIpsumTextMethod(3)
	return
::??ipsum4;::
::??lipsum4;::
::??loremipsum4;::
	pwrRun_loremIpsumTextMethod(4)
	return
::??ipsum5;::
::??lipsum5;::
::??loremipsum5;::
	pwrRun_loremIpsumTextMethod(5)
	return
::??ipsum6;::
::??lipsum6;::
::??loremipsum6;::
	pwrRun_loremIpsumTextMethod(6)
	return
::??ipsum7;::
::??lipsum7;::
::??loremipsum7;::
	pwrRun_loremIpsumTextMethod(7)
	return
::??ipsum8;::
::??lipsum8;::
::??loremipsum8;::
	pwrRun_loremIpsumTextMethod(8)
	return
::??ipsum9;::
::??lipsum9;::
::??loremipsum9;::
	pwrRun_loremIpsumTextMethod(9)
	return
::??ipsum10;::
::??lipsum10;::
::??loremipsum10;::
	pwrRun_loremIpsumTextMethod(10)
	return  ;}

;; opens the WindowSpy.ahk GUI
Lbl_Window_Spy: ;{ 
::??windowspy;::
	Run, autohotkey.exe %A_AhkPath%\..\WindowSpy.ahk
	return  ;}
	
/*!	Function: pwrRun_clearText()
;	Descr:	Selects all, Delete, Escape, then wait 200 (default) milliseconds.
;	Return:	VOID
;	Params:	p_waitTime :=	INTEGER
;	Notes:	This is particularly used to clear the text typed into the 
;				PowerRun search bar before Escaping the search bar.
*/
pwrRun_clearText(p_waitTime := 200) {
	Send, ^a ;; select all
	Send, {Delete}{Escape}
	Sleep, % p_waitTime
	return
}

/*!	Function: pwrRun_fireFoxSearch()
;	Descr:	Opens Firefox and puts text caret in the address bar.
;	Returns:	`**VOID**`
;	Parameters:	- str := "", 
;				- extraSend := ""
;	Remarks:	
*/
pwrRun_fireFoxSearch(str := "", extraSend := "") {
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
pwrRun_loremIpsumTextMethod(p_int := 3) {
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

/*!	pwrRun_newChromeWindow(p_htmlAddress :=  "", p_posObj := "")
	Descr:	Opens new chrome window, sets position, and naviagtes to target html address.
	Return:	VOID
	Params:	p_posObj :=	【OBJECT: Associative-Array】 OR 【OBJECT: ARRAY of INTEGERS】
				example1》 【associativeArrayObj := {x: -7, y: 0, w: 958, h: 1040}】
				example2》 【simpleArrayObj := [-7, 0, 958, 1040]】
			p_htmlAddress := STRING
	Notes:	Define the p_posObj before, and then pass it in as the argument.
*/
pwrRun_newChromeWindow(p_htmlAddress :=  "", p_posObj := "") {
	
	Run, chrome.exe, , , outputVarPID
	SetTitleMatchMode, 3 ;; 3 = must match exactly
	WinWait, New Tab - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	;~ WinWait, ahk_pid %outputVarPID%
	;~ WinWait, New Tab - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe ahk_pid %outputVarPID%
	WinActivate
	
	;~ aWin := main_getActiveWin()
	
	; if param_object is not null, then use it to set the window's position
	if (p_posObj != "") {
		
		WinRestore, A
		
		if (p_posObj.x){
			WinMove, A, , % p_posObj.x, % p_posObj.y, % p_posObj.w, % p_posObj.h
		}
		else {
			WinMove, A, , % p_posObj[1], % p_posObj[2], % p_posObj[3], % p_posObj[4]
		}
	}

	Send, ^l ;~ select address bar
	pasteClipboard(p_htmlAddress)
	Send, {Enter}
	SetTitleMatchMode, 1 ;; 1 = default, (must match beginning)
	Sleep, 1000
	return
}

/**	pwrRun_newFirefoxWindow(p_htmlAddress :=  "", p_posObj := "")
	Descr:	Opens new firefox window, sets position, and naviagtes to target html address.
	Return:	VOID
	Params:	p_posObj :=	【OBJECT: Associative-Array】 OR 【OBJECT: ARRAY of INTEGERS】
				example1》 【associativeArrayObj := {x: -7, y: 0, w: 958, h: 1040}】
				example2》 【simpleArrayObj := [-7, 0, 958, 1040]】
			p_htmlAddress := STRING
	Notes:	Define the p_posObj before, and then pass it in as the argument.
*/
pwrRun_newFirefoxWindow(p_htmlAddress :=  "", p_posObj := "") {
	
	Run, firefox.exe, , , outputVarPID
	SetTitleMatchMode, 3 ;; 3 = must match exactly
	WinWait, Mozilla Firefox ahk_class MozillaWindowClass ahk_exe firefox.exe
	;~ WinWait, ahk_pid %outputVarPID%
	;~ WinWait, Mozilla Firefox ahk_class MozillaWindowClass ahk_exe firefox.exe ahk_pid %outputVarPID%
	WinActivate
	
	if (p_posObj.x){
		WinMove, A, , % p_posObj.x, % p_posObj.y, % p_posObj.w, % p_posObj.h
	}
	else if (p_posObj[1]){
		WinMove, A, , % p_posObj[1], % p_posObj[2], % p_posObj[3], % p_posObj[4]
	}
	
	Send, ^l ;~ select address bar
	pasteClipboard(p_htmlAddress)
	Send, {Enter}
	SetTitleMatchMode, 1 ;; 1 = default, (must match beginning)
	Sleep, 1000
	return
}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive