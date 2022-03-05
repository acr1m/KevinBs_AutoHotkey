;;██████████████████████████████████████████████████████████████████████████████
;~ ;CONSTANTS
	global g_SUSPEND_LIMIT := 200 ; n milliseconds
	global g_DOUBLE_TAP_LIMIT := 350 ; n milliseconds
	global g_INCREMENT_LIMIT := 500 ; n milliseconds
;~ STARTING VARIABLES
	global g_windowSentinelIsOn := true ; default = true
	global g_currentRaisedPower := 1 ;used for incrementing n. Ex:  a^n

;~ MATH-INPUT-STYLE SWITCHES FOR EDITOR/BROWSER/ENVIRONMENT COMPATABILITY 
	;~ used for mathKbd_typeSquareRoot() function
	global mathKbd_style_paste := false ;~ default value = false
	global mathKbd_style_backSlash := true ;~ default value = true
	global mathKbd_style_squareRootLeftAmount := 0 ;~ default value = 0



;~ OTHER METHODS
;;██████████████████████████████████████████████████████████████████████████████

/**	mathKbd_incrementPowerNoCarrotWithExtraBackspacing()
	Descr:	Sets the current 'math-input-mode'.
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_incrementPowerNoCarrotWithExtraBackspacing()
{
	mathKbd_incrementPower(,,,,,false,true)
	return
}

/**	mathKbd_incrementPowerNoCarrot()
	Descr:	Sets the current 'math-input-mode'.
	Return:	VOID
	Params:	
	Notes:	
*/
mathKbd_incrementPowerNoCarrot()
{
	mathKbd_incrementPower(,,,,false)
	return
}

/**	mathKbd_incrementPower()
	Descr:	Increments through power-superscripts, increasing the number by 1 each time.
	Return:	VOID
	Params:	p_timeLimit := INTEGER (default := -1)
			p_incrementAmount := INTEGER (default := 1)
			p_initialBackspaceAmount := INTEGER (default := 2)
			p_subsequentBackspaceAmount := INTEGER (default := 3)
			p_rightAmount := INTEGER (default := 1)
			p_sendCarrot := BOOLEAN (default := true)
			p_extraBackspacing := BOOLEAN (default := false)
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_incrementPower( p_timeLimit := -1
		, p_incrementAmount := 1
		, p_initialBackspaceAmount := 2
		, p_subsequentBackspaceAmount :=3
		, p_rightAmount := 1
		, p_sendCarrot := true
		, p_extraBackspacing := false){
	if (doubleTap(p_timeLimit)){
		g_currentRaisedPower += p_incrementAmount
		if (g_currentRaisedPower = 2)
			Send, {Backspace %p_initialBackspaceAmount%} ;2
		else if (p_extraBackspacing == true && g_currentRaisedPower >= 11){
			extraBackspaceAmount := p_subsequentBackspaceAmount + 1
			Send, {Backspace %extraBackspaceAmount%}
		} 
		else
			Send, {Backspace %p_subsequentBackspaceAmount%} ;3
		
		if (p_sendCarrot == true)
			Send, {^}%g_currentRaisedPower%{Right %p_rightAmount%} ;1
		else if (p_sendCarrot == false && g_currentRaisedPower = 2)
			Send, {^}%g_currentRaisedPower%{Right %p_rightAmount%} ;1
		else
			Send, %g_currentRaisedPower%{Right %p_rightAmount%} ;1
	}
	else
		g_currentRaisedPower := 1
	return
}

/**	mathKbd_incrementVariables()
	Descr:	Variadic method that cycles through the given 'string' variable arguments.
	Return:	VOID
	Params:	p_timeLimit :=	INTEGER	(default := g_INCREMENT_LIMIT)
			p_vars* :=	STRING (default := none, must provide at least one argument)
				---> Can accept any amount of 'string' variables.
	Notes:	Method will loop back to the hotkey's natural output and then continue 
				working it's way through the given list of 'string' variables. 
*/
; variadic parameter__________________vvvvvvv________
mathKbd_incrementVariables(p_timeLimit := "", p_vars*) {
	;; if undeclared, set timelimit to default increment time value
	if (p_timeLimit == "") {
		p_timeLimit := g_INCREMENT_LIMIT
		;~ MsgBox, % "Set p_timeLimit from `"`" to g_INCREMENT_LIMIT = " . g_INCREMENT_LIMIT . "`p_vars.MaxIndex() = " . p_vars.MaxIndex()
	}
	;; if within doubleTap limit, set str to params[index] value, send output,
	;;;; and increment the index value
	if (doubleTap(p_timeLimit)) {
		
		;; set the string to the next parameter element
		str := p_vars[g_currentRaisedPower]
		
		;; delete the last printed element by checking the string length of prev elem
		previousIndex := g_currentRaisedPower - 1
		if (previousIndex == 0){
			backspaceAmount := 2
			previousIndex := 1
		} else { 
			backspaceAmount := StrLen(p_vars[previousIndex]) + 1
		}
		;; remove last print by backspaceAmount and print new string
		;; Send, {Backspace %backspaceAmount%}%str%
		SendInput, {Backspace %backspaceAmount%}%str%
				
/* 		After sending output and incrementing +1, if index variable would be higher than 
;; 			length of p_vars* object, then cycle back to beginning of elem index [1].
*/		
		g_currentRaisedPower += 1 ;intially starts at 1, first run sets to 2
		if (g_currentRaisedPower > p_vars.MaxIndex())
			g_currentRaisedPower := 1
	}
	else
		g_currentRaisedPower := 1
	
	;; send the release of any modifier keys to keep them from getting spam-locked
	Send, {CtrlUp}{ShiftUp}{AltUp}
	return
}

/**	mathKbd_typeSquareRoot()
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_typeSquareRoot() {
	if (mathKbd_style_paste == false) {
		if (mathKbd_style_backSlash == false || mathKbd_style_backSlash == 0)
			Send, sqrt{Left %mathKbd_style_squareRootLeftAmount%}
		else if (mathKbd_style_backSlash == true || mathKbd_style_backSlash == 1)
			Send, \sqrt{Left %mathKbd_style_squareRootLeftAmount%}
	} else if (mathKbd_style_paste == true) {
		mathKbd_pasteSquareRoot()
	}
}

/**	mathKbd_pasteSquareRoot()
	Descr:	____enter_a_description____
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_pasteSquareRoot() {
	archiveClipboard()
	Clipboard := "√"			; square root, radical  √:(A+251)
	Send, ^v{Left %mathKbd_style_squareRootLeftAmount%}
	restoreClipboard()
	return
}

/**	mathKbd_paste()
	Descr:	____enter_a_description____
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_paste(str := "") {	
	archiveClipboard()
	Clipboard := str
	Send, ^v 
	restoreClipboard()
	return
}