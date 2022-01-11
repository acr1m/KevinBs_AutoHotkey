;~ UTILITY METHODS

;~ CONSTANTS
	global SUSPEND_LIMIT := 200 ; n milliseconds
	global DOUBLE_TAP_LIMIT := 350 ; n milliseconds
	global INCREMENT_LIMIT := 500 ; n milliseconds
	global TIME_INTERVAL_RAPIDFIRE := 100 ;n milliseconds
;GLOBAL VARIABLES
	;used to store/restore clipboard in functions
	global g_archivedClipboard :=
	;available for use to help with debugging
	global debugVariable := "null"
	
;==============================================================================
;~ CLIPBOARD METHODS
;==============================================================================

/**	copySelection(p_clipWaitTime := 1)
;;	Descr:	Sends "Ctrl+c"
;;	Return:	BOOLEAN
;;	Params:	p_clipWaitTime:=	INTEGER (seconds)
;;	Notes:	Make sure to have something "selected" before calling this method for it to work.
*/
copySelection(p_clipWaitTime := 1){
	;copy command
	Send, ^c	
	;make sure not to proceed without the clipboard being filled
	ClipWait, p_clipWaitTime ;wait for n seconds
	if ErrorLevel {
		MsgBox, , copySelection(), The attempt to copy text onto the clipboard failed. Returning.
		return false
	}
	return true
}

/* setClipboard(Number: Integer, Object: String)
 * @params	
		p_str := a string (object) stored to and pasted from the built-in
 * 				Clipboard.
 * @return	true if successful.
 * 			false if error occurred.
 * @remark	at end of method process, restores Clipboard back to what 
			it was prior to calling this method.
 */
setClipboard(p_clipWaitTime := 1, p_str := "")
{
	;archive Clipboard contents
	archiveClipboard()
	;set Clipboard
	Clipboard := p_str
	;make sure not to proceed without the clipboard being filled
	ClipWait, p_clipWaitTime ;wait for n seconds
	if ErrorLevel {
		MsgBox, , setClipboard(), The attempt to copy text onto the clipboard failed. Returning.
		return false
	}
	return true
}

getClipboard(ByRef p_var){
	p_var := Clipboard
	return 
}

/* pasteClipboard(Object: String)
 * @params	p_str := a string (object) stored to and pasted from the built-in
 * 				Clipboard.
 * @return	true if successful.
 * 			false if error occurred.
 * @note	At end of method process, restores Clipboard back to what 
 *			it was prior to calling this method.
 */
/**	pasteClipboard()
	Descr:	Handles the pasting of Clipboard contents.
	Return:	BOOLEAN -	true if successful.
			* 			false if error occurred.
	Params:	p_str := ""
	Notes:	If argument is left blank, then paste current Clipboard contents.
			If argument is defined, then paste the argument without affecting the current Clipboard.
*/
pasteClipboard(p_str := ""){
	retVal := false
	;; paste like normal
	if (p_str == ""){ 
		Send, ^v
		retVal := true
	}
	;; if argument is defined, then paste it without affecting the current Clipboard.
	else if (p_str != ""){
		testBool := setClipboard(1, p_str)
		Sleep, 200
		if (testBool == true){
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

;[DEPRECATED], use setClipboard() isntead
archiveThenCopy(p_clipWaitTime := 0)
{
	;save and wipe the clipboard
	archiveClipboard()
	copySelection(p_clipWaitTime)
	return
}

;used in setClipboard() method
archClip()
{
	return archiveClipboard()
}
;used in setClipboard() method
archiveClipboard()
{
	;if archivedClipboard is not equal to ClipboardAll
	if g_archivedClipboard <> ClipboardAll 
	{
		;clips are different, so overwrite archive with current clipAll
		g_archivedClipboard := ClipboardAll
		
		;wipe clipboard
		Clipboard :=
		
		;proccess completed
		return true
	} 
	else if g_archivedClipboard == ClipboardAll 
	{ 
		;"==" case-sensitive is-equal-to operator
		;both clips are the same, process failed
		return false
	} 
	else 
	{
		;clips relationship is undetermined, process failed
		return false
	}
}

;used in setClipboard() method
rstrClip()
{
	return restoreClipboard()
}
;used in setClipboard() method
restoreClipboard()
{
	if g_archivedClipboard <> ClipboardAll
	{
		;clips are different, so overwrite clipboard with current archive
		Clipboard := g_archivedClipboard
		
		;proccess completed
		return true
	}
	;"==" case-sensitive is-equal-to operator
	else if g_archivedClipboard == ClipboardAll
	{
		;both clips are the same, process failed
		return false
	} 
	else 
	{
		;clips relationship is undetermined, process failed
		return false
	}
}
;==============================================================================
;==============================================================================

;==============================================================================
;~ OTHER METHODS
;==============================================================================

; parameter_timeLimit is optional (will default to DOUBLE_TAP_LIMIT if undeclared)
; EXAMPLE
/* 
 * if (doubleTap(150)){
 * 		Send, {BackSpace 2}
 * 	}
 * 	return
 */
	
doubleTap(p_timeLimit := -1)
{
	if(p_timeLimit != -1){
		;~ outText := "double tap time limit = p_timeLimit: " . p_timeLimit
	}
	if (p_timeLimit == -1){
		p_timeLimit := DOUBLE_TAP_LIMIT
		;~ outText := "double tap time limit = DOUBLE_TAP_LIMIT: " . DOUBLE_TAP_LIMIT
	}
	if  (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < p_timeLimit){
		;~ MsgBox, %outText% ; for debugging
		return true
	} 
	else {
		return false
	}
}


rapidFire(p_thisHotkey := "", p_sendKey := "", p_time := 0){
	if (p_thisHotkey == "")
		p_thisHotkey := A_ThisHotkey
	
	debugVariable := p_thisHotkey
	
	if (p_time == 0)
		p_time := TIME_INTERVAL_RAPIDFIRE
	while (GetKeyState(p_thisHotkey, "P")){
		;~ MsgBox % GetKeyName(p_sendKey)
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
mouseEvent(p_clickDelay := 200, p_coordAsPercent*){
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