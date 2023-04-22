;; Main Method Library
;;;; this is the main library/collection of functions/methods.

;; This is a flag-setting for the Tillagoto utility

;TillaGoto.ScanFile = %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\Main-AHK.ahk
		;; E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\Main-AHK.ahk

;~ UTILITY METHODS
;; #Include %A_ScriptDir%\-lib
;; #Include Main-Method-Library-LIB.ahk
;; #Include Emojis-And-Symbols-LIB.ahk
;; #Include repeatKey()-LIB.ahk
;; #Include time()-LIB.ahk
;; #Include RegEx()-LIB.ahk

;~ class MainLibrary ;{

	;~ CONSTANTS
		global g_SUSPEND_LIMIT := 200 ; n milliseconds
		global g_DOUBLE_TAP_LIMIT := 350 ; n milliseconds
		global g_INCREMENT_LIMIT := 500 ; n milliseconds
		global g_TIME_INTERVAL_RAPIDFIRE := 100 ;n milliseconds
		global g_currentIncrementVariable := 100 ;n milliseconds
	;GLOBAL VARIABLES
		;used to store/restore clipboard in functions
		global g_archivedClipboard :=
		;available for use to help with debugging
		global g_debugVariable := "null"

	;==============================================================================
	;~ CLIPBOARD METHODS
	;==============================================================================

	/*!
		Function: copySelection(p_clipWaitTime := 1, p_showMsg := false)
			Sends "Ctrl+c"
		Returns: The copied selection as a string.
			(Returns as empty string, "" ≡ false, if nothing is selected or failed to copy).
		Params: p_clipWaitTime:=	INTEGER (seconds)
			p_showMsg := false (set to 'true' to show MsgBox error info)
		Notes: Make sure to have something "selected" before calling this
			method for it to work.
	*/
	copySelection(p_clipWaitTime := 1, p_showMsg := false) {
		;instantiate returning object
		outVar := ""

		;empty the clipboard so that ClipWait command can work properly
		archivedClipboard := ClipboardAll
		Clipboard := ""

		;copy command
		Send, ^c

		;make sure not to proceed without the clipboard being filled
		ClipWait, p_clipWaitTime ;wait for n seconds

		if (ErrorLevel) {

			title := "copySelection()"
			str := "The attempt to copy text onto the clipboard failed. Returning." ;~ message box string
			tooltipStr := title . "`n" . "The attempt to copy text onto the clipboard failed." ;~ Tooltip string
			timeOut := 5 ;~ seconds before message box is closed
			;~ MsgBox, , % title, % str, % timeOut
			main_showToolTip(tooltipStr, 5000)

			outVar := ""

		} else {
			outVar := Clipboard
		}

		;restore the clipboard before returning
		Clipboard := archivedClipboard

		if (p_showMsg == true) {
			main_showToolTip(outVar)
		}

		return outVar
	}

	/*!
		Function: setClipboard()
			Attempts to set the passed arguement's value to the Clipboard.
		Returns: BOOLEAN - true, if successful.
			BOOLEAN - false, if error occurred.
		Params: p_clipWaitTime := 1
			p_str := ""
			p_str := a string (object) stored to and pasted from the built-in
				Clipboard.
		Notes: - At end of method process, restores Clipboard back to what
			  it was prior to calling this method.
	*/
	setClipboard(p_clipWaitTime := 1, p_str := "") {
		;archive Clipboard contents
		archiveClipboard()
		;set Clipboard
		Clipboard := p_str
		;make sure not to proceed without the clipboard being filled
		ClipWait, p_clipWaitTime ;wait for n seconds
		if (ErrorLevel) {
			MsgBox, , setClipboard(), The attempt to copy text onto the clipboard failed. Returning., 3
			return false
		}
		return true
	}

	/*!
		Function: getClipboard(outputVar)
			Assigns Clipboard's content's value to the given argument.
		Returns: BOOLEAN - true, if success
				BOOLEAN - false, if failure
				INTEGER - -1, if unknown error
		Params: ByRef p_outputVar := OBJECT
		Notes: Must declare a variable object as argument.
	*/
	getClipboard(ByRef p_outputVar) {
		p_outputVar := Clipboard
		if (p_outputVar != Clipboard)
			retVal := false ;; failure - does not match Clipboard
		else if (p_outputVar == Clipboard)
			retVal := true ;; success - matches like it should
		else
			retVal := -1 ;; error unknown
		return retVal
	}

	/*!
		Function: pasteClipboard()
			Handles the pasting of Clipboard contents, without affecting
					the current clip.
		Returns: - BOOLEAN - true, if successful.
				BOOLEAN - false, if error occurred.
		Params: p_str := ""
		Notes: If argument is left blank, then paste current Clipboard contents.
				If argument is defined, then paste the argument without
					affecting the current Clipboard.
	*/
	pasteClipboard(p_str := "") {
		retVal := false
		;; paste like normal
		if (p_str == "") {
			Send, ^v
			retVal := true
		}
		;; if argument is defined, then paste it without affecting the current Clipboard.
		else if (p_str != "") {
			testBool := setClipboard(1, p_str)
			Sleep, 20
			if (testBool == true) {
				Send, ^v
				retVal := true
			}
			else {
				retVal := false
			}
			restoreClipboard()
		}
		;; return unsuccessful
		else {
			retVal := false
		}

		return retVal
	}

	;[DEPRECATED], use setClipboard() instead
/* 	archiveThenCopy(p_clipWaitTime := 0) {
 * 		;save and wipe the clipboard
 * 		archiveClipboard()
 * 		copySelection(p_clipWaitTime)
 * 		return
 * 	}
 */

	;used in setClipboard() method
	archClip() {
		return archiveClipboard()
	}
	;used in setClipboard() method
	archiveClipboard() {
		;if archivedClipboard is not equal to ClipboardAll
		if (g_archivedClipboard != ClipboardAll) {
			;clips are different, so overwrite archive with current clipAll
			g_archivedClipboard := ClipboardAll

			;wipe clipboard
			Clipboard :=

			;proccess completed
			return true
		}
		else if (g_archivedClipboard == ClipboardAll) {
			;"==" case-sensitive is-equal-to operator
			;both clips are the same, process failed
			return false
		}
		else {
			;clips relationship is undetermined, process failed
			return false
		}
	}

	;used in setClipboard() method
	rstrClip() {
		return restoreClipboard()
	}
	;used in setClipboard() method
	restoreClipboard() {
		if (g_archivedClipboard != ClipboardAll) {
			;clips are different, so overwrite clipboard with current archive
			Clipboard := g_archivedClipboard

			;proccess completed
			return true
		}
		;"==" case-sensitive is-equal-to operator
		else if (g_archivedClipboard == ClipboardAll) {
			;both clips are the same, process failed
			return false
		}
		else {
			;clips relationship is undetermined, process failed
			return false
		}
	}
	;;==============================================================================
	;; OTHER METHODS
	;;==============================================================================

	/*!
		Function: doubleTap()
			Checks if A_ThisHotkey has been double-tapped. More explicitly, checks if the time interval between prior hotkey (A_PriorHotkey) and this hotkey (A_ThisHotkey) is within the tapped  user hit the triggered hotkey recently (within a given time
				limit).
		Returns: BOOLEAN
		Params: p_timeLimit :=	INTEGER|FLOAT (default := g_DOUBLE_TAP_LIMIT | 350)
		Notes: Does not prevent a 'triple-tap' evaulating as two 'double-taps'.
					e.g., if p_timeLimit is 500, and 3 taps are sent 200ms apart,
						then doubleTap() would return TRUE twice.
		EXAMPLE: if (doubleTap(350)) { commands }
	*/
	doubleTap(p_timeLimit := -1) {
		if(p_timeLimit != -1) {
			;; If p_timeLimit is not -1, then the argument exists, so we let it stand.
		}
		;; We can't let the p_timeLimit be 0 or 1 (false or true) because
		;; it's impracticle and nearly impossible. So we'll re-assign to a global
		;; default value if it exists.
		else if (p_timeLimit == 0 || p_timeLimit == -1) {
			; if this global variable is not defined, does not exist, or is not positive
			; then assign the time interval requirement to 350 milliseconds. 
			if (g_DOUBLE_TAP_LIMIT <= 0)
				p_timeLimit := 350
			else
				p_timeLimit := g_DOUBLE_TAP_LIMIT
		}

		if  (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < p_timeLimit) {
			;~ MsgBox, %outText% ; for debugging
			return true
		}
		else {
			return false
		}
	}

	;; #Include SetTimer-Script-Detect-Multiple-Presses-Of-[Win+C].ahk

	/*	Downloaded from - https://www.autohotkey.com/docs/commands/SetTimer.htm
		Detects single, double, and triple-presses of a hotkey. This allows a hotkey to perform a different operation depending on how many times you press it.
	*/
	/*!
		Function: pressedCount()
			Any amount of hotkey presses, within the g_DOUBLE_TAP_LIMIT (around 350-400 ms). This allows a hotkey to perform a different operation depending on how many times you press it within the g_DOUBLE_TAP_LIMIT.
		Returns: INTEGER (the number of presses after g_DOUBLE_TAP_LIMIT has expired)
		Params: none
		Notes: Retrofitted code from - https://www.autohotkey.com/docs/commands/SetTimer.htm
	*/
	pressedCount() {

		global g_thisKey_presses
		;; g_thisKey_presses
		retVal := ""

		if (g_thisKey_presses > 0 && A_ThisHotkey == A_PriorHotkey) ; SetTimer already started, so we log the keypress instead.
		{
			g_thisKey_presses += 1
			return
		}

		; Otherwise, this is the first press of a new series. Set count to 1 and start
		; the timer:
		g_thisKey_presses := 1
		;; SetTimer, func_pressCount, g_DOUBLE_TAP_LIMIT ; Wait for more presses within a 400 millisecond window.



		return retVal
	}

	;; class PressCount() {
	;; }

	func_pressCount() {
		local retVal

		;; this label is activated after the SetTimer's given time-limit has expired.
		;; Lbl_KeyCounter:

		;; set retVal to the press count of this hotkey
		retVal := g_thisKey_presses

		; Regardless of which action above was triggered, reset the count to
		; prepare for the next series of presses:
		g_thisKey_presses := 0

		return retVal
	}


	rapidFire(p_thisHotkey := "", p_sendKey := "", p_time := 0) {
		if (p_thisHotkey == "")
			p_thisHotkey := A_ThisHotkey

		g_debugVariable := p_thisHotkey

		if (p_time == 0)
			p_time := g_TIME_INTERVAL_RAPIDFIRE
		
		while (GetKeyState(p_thisHotkey, "P")) {
			Send % GetKeyName(p_sendKey)
			Sleep, p_time
		}
		return
	}


	moveCurrentLineDown(p_moveAmount := 1)
	{
		SetKeyDelay, 30

		;wait for Shift and Ctrl to be released by user
		KeyWait Shift
		KeyWait Ctrl

		;archive before use, exit if failure
		if(!archiveClipboard()) {
			return
		}

		;select line (from beginning to end)
		Send, {Home}{ShiftDown}{End}{ShiftUp}

		;cut
		copySelection()
		Send, {Delete}

		;move caret down n times
		Send, {Down %p_moveAmount%}

		;paste
		Send, ^v

		;move caret to end of line
		Send, {Left}

		;since we're done with it...
		Sleep, 100 ;milliseconds
		restoreClipboard()
		return
	}

	moveCurrentLineUp(p_moveAmount := 1)
	{
		SetKeyDelay, 30

		;wait for Shift and Ctrl to be released by user
		KeyWait Shift
		KeyWait Ctrl

		;~ ;archive before use, exit if failure
		;~ if(!archiveClipboard()) {
			;~ return
		;~ }

		;select line (from beginning to end)
		Send, {Home}{ShiftDown}{End}{ShiftUp}

		;cut
		copySelection()
		Send, {Delete}

		;move caret up n times
		Send, {Up %p_moveAmount%}

		;paste
		Send, ^v

		;move caret to end of line
		Send, {Left}

		;~ ;since we're done with it...
		;~ Sleep, 100 ;milliseconds
		;~ restoreClipboard()

		return
	}

	GetClientSize(v_hWnd, ByRef w := "", ByRef h := "")
	{
		VarSetCapacity(rect, 16)
		DllCall("GetClientRect", "ptr", v_hWnd, "ptr", &rect)
		w := NumGet(rect, 8, "int")
		h := NumGet(rect, 12, "int")
	}

	;========================================================================
	;MOUSE EVENT METHOD
	;------------------------------------------------------------------------
	/*!
		Function:
			mouseClick(xPos, yPos, clicks, mSpeed)
			Method substitution for the MouseClick command~>
			~>MouseClick [, WhichButton, X, Y, ClickCount, Speed, DownOrUp, Relative]
		Returns: VOID
		Params: xPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				yPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				clicks := 1 {any integer >= 0; if 0, will move mouse without clicking}
				mSpeed := 0 {any integer >= 0; zero is instant}
		Notes: - To specify mouse button, use mouseClickExplicit() instead.
				- mouseClick(400, 600, 0) will move mouse and not click.
				- Shorthand call for mouseClickExplicit() method.
	*/
	mouseClick(xPos := "", yPos := "", clicks := 1, mSpeed := 0) {
		mouseClickExplicit(xPos, yPos, clicks, mSpeed)
		return
	}
	/*!
		Function: mouseClickRelative(xPos, yPos, clicks, mSpeed)
			Same as mouseClick(), but calls mouseClickExplicit()
				and passes xPos and yPos as Relative coords instead of Absolute coords.
		Returns: VOID
		Params: xPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				yPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				clicks := 1 {any integer >= 0; if 0, will move mouse without clicking}
				mSpeed := 0 {any integer >= 0; zero is instant}
		Notes: - To specify mouse button, use mouseClickExplicit() instead.
				- mouseClick(400, 600, 0) will move mouse to RELATIVE position and not click.
				- Shorthand call for mouseClickExplicit() method.
	*/
	mouseClickRelative(xPos := "", yPos := "", clicks := 1, mSpeed := 0) {
		mouseClickExplicit(xPos, yPos, clicks, mSpeed, , "R")
		return
	}

	/*!
		Function: mouseClickExplicit(mBtn, xPos, yPos, clicks, mSpeed, downOrUp, p_coordMode)
			Method substitution for the MouseClick command~>
			~>MouseClick [, WhichButton, X, Y, ClickCount, Speed, DownOrUp, Relative]
		Returns: VOID
		Params: mBtn := "Left" {"L", "R", "M", "X1", "X2", "WU", "WD", "WL", "WR"}
				xPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				yPos := "" {any integer; "" = current Mouse position; default coordMode == Absolute}
				clicks := 1 {any integer >= 0; if 0, will move mouse without clicking}
				mSpeed := 0 {any integer >= 0; zero is instant}
				downOrUp := "" {"" = Down then Up, "Down" = Down only, "Up" = Up only}
				p_coordMode := "" {"" = Absolute (default), "R" = Relative}
		Notes: mBtn options are... {
					"Left", "Right", "Middle",
					"X1" = M4 or Back_Mouse_Btn,
					"X2" = M5 or Forward_Mouse_Btn,
					"WheelUp", "WheelDown", "WheelLeft", "WheelRight"}
	*/
	mouseClickExplicit(mBtn := "Left", xPos := "", yPos := "", clicks := 1, mSpeed := 0, downOrUp := "", p_coordMode := "") {

		MouseGetPos, iX, iY ;; initial mouse position
		xPos := (xPos == "") ? iX
		yPos := (yPos == "") ? iY

		MouseClick, % mBtn, % xPos, % yPos, % clicks, % mSpeed, % downOrUp, % p_coordMode

		return
	}

	mouseEvent(p_clickDelay := 200, p_coordAsPercent*) {
		;p_coords := {x,y},{x,y},{x,y},{x,y}
		;CoordMode, ToolTip|Pixel|Mouse|Caret|Menu [, Screen|Window|Client]
		;MouseGetPos [, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 1|2|3]
		;WinGetPos [, X, Y, Width, Height, WinTitle, WinText, ExcludeTitle, ExcludeText]
		;~ WinGetPos, winX, winY, winWidth, winHeight, A
		;getClientSize(window, ByRef width, ByRef height)




		;set coord mode to be relative to client's dimensions
		CoordMode, Mouse, Client

		;get mouse pos, client size
		MouseGetPos, v_mouseX, v_mmouseY, v_mmouseW
		getClientSize(v_curWin, v_clientWidth, v_clientHeight)

		;for each coordinate argument of parameter, perform a click
			;event at the pos relative to dimensions of active client
		for, i, i_elem in p_coordAsPercent {
			MsgBox, %i_elem%`, %p_coordAsPercent% `, %i_elem%

			xPercentToPos := i_elem.x * v_clientWidth
			yPercentToPos := i_elem.y * v_clientHeight
			MsgBox, %xPercentToPos%`, %yPercentToPos%
			Click, %xPercentToPos%, %yPercentToPos%
			Sleep, %p_clickDelay%
		}

		;return mouse to original position
		MouseMove, v_mouseX, v_mouseY
	}
	;------------------------------------------------------------------------

	/*!
		Function: main_toggleVar()
			____enter_a_description____
		Returns: VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
		Params: p_alpha :=	STRING	(default := "str")
				p_beta :=	BOOLEAN
				p_gamma :=	INTEGER_STRING
				p_delta :=	FLOAT_STRING
		Notes: ____How_to_or_when_is_this_used____
	*/
	main_toggleVar(ByRef p_Var, p_showVar := false) {
		;; if true
		if (p_Var || !p_Var ) {
			;; toggle it
			p_Var := !p_Var

			;; show it
			if (p_showVar) {
				MsgBox, p_Var is %p_Var%
			}
		}
		else {
			;; if not true or false, then default false
			p_Var := false
			;; show it
			if (p_showVar) {
				MsgBox, p_Var is %p_Var%
			}
		}
		return
	}



	/*!
		Function: main_scrollMethod_02()
			Starting from the time of first ScrollWheel input, output speed
					is gradually increased, as long as A_ThisHotkey is
					'double-tapped' (i.e., 're-triggered') within a given
					time_limit up to a given max_output_speed.
		Returns: VOID
		Params: p_timeLimit := INTEGER (default := 500) 'milliseconds'
				p_
		Notes: utilizes the global variable g_scrollWheel
	*/
	main_scrollMethod_02(p_timeLimit := 500) {
	;{ NOTES...
	;   scrollWheel range  = [1, 100]
	;       I want the mouse to speed up, the longer the wheel has been 'active'.
	;       there'd be a lifetime for the max_delta to be active.
	;       if the lifetime isn't 'restored' before it runs out,
	;       then it should turn off.
	;   parameters:
	;       wheelTimeActive - delta of current lifetime
	;       wheelLifeTime - limit of 'admissible' time to elapse
	;       				to still trigger buildup.
	;       wheelOutputAmount -
	;       wheelBuildupAmount - amount to build the OutputAmount by.
	;}

		return
	}

	/*!
		Function: main_scrollMethod_01()
			Utilizes a logarithmic function for scroll input that goes faster
					when the value of 『A_TimeSincePriorHotkey』 is lower.
		Returns: INTEGER - 1 if too slow, g_scrollWheel_scrollAmount if fast enough.
		Params: p_elapsedTimeLimit := INTEGER (default := 200)
		Notes:
	*/
	main_scrollMethod_01(p_elapsedTimeLimit := 200) {
		;; int_logFactor := 1.5	; about 80-120 lines per stroke
		;; int_logFactor := 1.4 ; about 60-80 lines per stroke
		;; int_logFactor := 1.2	; about 40-50 lines per stroke
		int_logFactor := 1.1	; about 180-250 lines per stroke

		int_translate := -15
		;; int_factorFinal := 1
		int_factorFinal := 0.9

		if (doubleTap(p_elapsedTimeLimit)) {
			if (A_TimeSincePriorHotkey > 10) {
				g_scrollWheel_deltaTime := A_TimeSincePriorHotkey + !(A_TimeSincePriorHotkey) ; if A_TimeSincePriorHotkey is 0, then "!(A_TimeScinePriorHotkey)" will return as "1".
				;; https://www.desmos.com/calculator/ogtxptay3x
				;; https://www.desmos.com/calculator/hlft5krmra
				g_scrollWheel_scrollAmount := Ceil(Abs((Log(g_scrollWheel_deltaTime)/Log(int_logFactor))+int_translate))

				; factor scroll amount faster if less time has passed, factored by int_factorFinal.
				;; g_scrollWheel_scrollAmount *= (int_factorFinal / g_scrollWheel_deltaTime)
				;; g_scrollWheel_scrollAmount *= (p_elapsedTimeLimit) / (g_scrollWheel_deltaTime)
				g_scrollWheel_scrollAmount := (p_elapsedTimeLimit) / (g_scrollWheel_deltaTime)

				;; set a limit cap for scroll speed amount
				if (g_scrollWheel_scrollAmount > 30) {
					g_scrollWheel_scrollAmount := 30
				}

				;~ ToolTip % "g_scrollWheel_deltaTime: `t" . g_scrollWheel_deltaTime . "`nint:`t" . int ""

				;; Send, {A_ThisHotkey %g_scrollWheel_scrollAmount%}

				;; return the scroll wheel amount
				return g_scrollWheel_scrollAmount
			}
		}
		;; if scroll wasn't within the double-tap time limit, then return 1 for the scroll speed amount.
		return 1
	}


	;; kind of like a default template object, that starts as being 'off'
	/*!
		Base Class for toggling output when a hotkey is triggered.
		Type: <Class>
		Properties: - isActive := false
		Example: class AppWindow_Ctrl_A extends SwitchHandlerForKeys
	*/
	class SwitchHandlerForKeys {

		; class variable (inherited by all classes which extend this one)
		;; static isActive := false

		; instance variable
		isActive := false

		toggleState() {
			this.isActive := !this.isActive
		}
	}

	/*!	main_incrementVariables()
		Variadic method that cycles through the given 'string' variable arguments.
		Returns: 	VOID
		Params: 	p_timeLimit :=	INTEGER	(default := g_INCREMENT_LIMIT)
					p_vars* :=	STRING (default := none, must provide at least one argument)
					  //Can accept any amount of 'string' variables.
		Notes: Method will loop back to the hotkey's natural output and then continue
					  working it's way through the given list of 'string' variables.
					Copied from "mathKbd_incrementVariables()"
	*/
	main_incrementVariables(p_shouldThisLoop := true, p_timeLimit := "", p_vars*) {


		if (p_shouldThisLoop) { ;; if this method should handle its own looping
			if (p_timeLimit == "") { ;; if undeclared, set timelimit to default increment time value
				p_timeLimit := g_INCREMENT_LIMIT
			}
		}

		if (doubleTap(p_timeLimit)) {

			str := p_vars[g_currentIncrementVariable] ;; set the string to the next parameter element
			previousIndex := g_currentIncrementVariable - 1 ;; delete the last printed element by checking the string length of prev elem

			if (previousIndex == 0) {
				backspaceAmount := 2
				previousIndex := 1
			}
			else {
				backspaceAmount := StrLen(p_vars[previousIndex]) + 1
			}

			SendInput, {Backspace %backspaceAmount%}%str% ;; remove last print by backspaceAmount and print new string

			g_currentIncrementVariable += 1 ;; intially starts at 1, first run sets to 2
			if (g_currentIncrementVariable > p_vars.MaxIndex()) ;; cycle back currentIncrementVariable to 1
				g_currentIncrementVariable := 1
		}
		else
			g_currentIncrementVariable := 1

		Send, {CtrlUp}{ShiftUp}{AltUp} ;; release modifier keys to prevent spam-lock
		return
	}

	/*!
		Function: loopSend(p_btn := "Space", p_count := 2,  p_interval := 50)
			Sends the indicated string as a keystroke if applicable.
		Returns: VOID
		Params: p_btn := "Space" ; the button or key to press
				p_count := 2 ; number of times to send the button press
				p_interval := 50 ; <milliseconds> interval between each button press
		Notes:
	*/
	loopSend(p_btn := "Space", p_count := 2,  p_interval := 50) {
		Loop, % p_count
		{
			Send, {%p_btn%}
			Sleep, % p_interval
			;; if (A_Index >= p_count)
				;; break ; end loop
		}
		return
	}

	/*!
		Function: main_getRandomNum(_min := 0, _max := 1)
			Returns a number between _min and _max (inclusive bounds).
		Returns: INTEGER or FLOAT
		Params: _min := 0 INTEGER or FLOAT
				_max := 1 INTEGER or FLOAT
		Notes: Can be either an Integer or Floating-Point Number.
				If either param is a FLOAT, then output will be a FLOAT.
	*/
	main_getRandomNum(_min := 0, _max := 1) {
		Random, outputVar, % _min, % _max
		return outputVar
	}

	main_tooltipShowVar(p_Array) {
		_outText := ""
		for k, v in p_Array {
			_outText .= k . "= " . p_Array[k] . "`n"
		}

		/*
		targetFuncObj := Func("main_tooltipUpdate").Bind(outText)
		SetTimer, targetFuncObj, 200
		*/

		main_tooltipUpdate(_outText)

		return
	}

	main_tooltipUpdate(p_outText) {
		MouseGetPos, mX, mY
		ToolTip, % "main_tooltipShowVar Output`n" . p_outText, % mX + 10, % mY - 60

		return
	}

	/*!
		Function: main_getActiveWin()
			Process for retreiving the data of the currently active window.
		Returns: An Object with the following fields (accessible as such);
			aWin.title
			aWin.hwnd (unique window handle ID)
			aWin.minMax (the Min/Maximized state of window)
			aWin.width
			aWin.height
			aWin.x
			aWin.y
		Params: (none)
		Notes: ____How_to_or_when_is_this_used____
	*/
	lib_myFunctionName() {

	}
	main_getActiveWin() {
		WinGetActiveStats, title, width, height, xPos, yPos
		WinGet, w_hwnd, ID, A
		WinGet, w_minMax, MinMax, A
		aWin := {"title":title
				, "hwnd":w_hwnd ;unique window id handle
				, "minMax":w_minMax
				, "width":width
				, "height":height
				, "x":xPos
				, "y":yPos}
		return aWin
	}


	main_showToolTip(p_tooltipText, p_timeOut := 5000) {

		MouseGetPos, mX, mY
		ToolTip, % p_tooltipText, % mX + 10, % mY - 60

		; wait for p_timeOut run once (if resulting value is negative)
		;~ timeOut := -1 * p_timeOut
		SetTimer, Lbl_HideToolTip, % -1 * (p_timeOut)
		return

		; wait for time and runs once (if SetTimer value is negative)
		Lbl_HideToolTip:
			ToolTip, % ""
			return
	}

;}