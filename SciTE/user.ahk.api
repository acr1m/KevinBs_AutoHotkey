
time_translateDate(p_timeShift, p_timeUnit := "Days", p_format := "yyyy-MM-dd_hh-mm-ss_tt")\nDescr:\tUses [EnvAdd,] command to shift the current date by a given number and unit.\n\tReturn:\tSTRING\t- returns the resulting date-time as a string with the given format.\n\tParams:\tINTEGER\tp_timeShift\t:=\t(any positive or negative integer)\n\t\t\tSTRING\tp_timeUnit\t:=\t(default := "Days")\n\t\t\t\t\t\t\tthis\t["Seconds" | "Minutes" | "Hours" | "Days" ]\n\t\t\t\t\t\t\tor...\t["s" | "m" | "h" | "d"]\n\t\t\tSTRING\tp_format \t:=\t(default := "yyyy-MM-dd_hh-mm-ss_tt")\n
time_translateDate(timeShiftAmount [, Unit, Format])\ntime_translateDate(p_timeShift\n\t\t\t, p_timeUnit := "Days"\n\t\t\t, p_format := "yyyy-MM-dd_hh-mm-ss_tt")\n

archClip()
archiveClipboard()
archiveThenCopy(p_clipWaitTime := 0)
copySelection(p_clipWaitTime := 1)\n\tDescr:\tSends "Ctrl+c"\n\tReturn:\tBOOLEAN\n\tParams:\tp_clipWaitTime:= INTEGER (seconds)\n\tNotes:\tMake sure to have something "selected" before calling this method for it to work.
ctrlC(p_clipWaitTime := 1)
doubleTap()
doubleTap()\nDescr:\tChecks if user hit the triggered hotkey recently (within a given time\n\t\t\tlimit).\nReturn:\tBOOLEAN\nParams:\tp_timeLimit :=\tINTEGER|FLOAT (default := DOUBLE_TAP_LIMIT | 350)\nNotes:\tDoes not prevent a 'triple-tap' evaulating as two 'double-taps'.\n\t\t\te.g., if p_timeLimit is 500, and 3 taps are sent 200ms apart,\n\t\t\t\tthen doubleTap() would return TRUE twice. \nEXAMPLE: if (doubleTap(350)) { commands }\n
doubleTap(p_timeLimit := -1)
excel_ActivateDrawBorderTool()
excel_AddTopBorder()
excel_EncapIfErrorIf()
excel_NavigateToBottomLeftCell()
excel_setBorderColorToAccent1()
excel_StampTimeCurrent()
excel_StampTimeCurrent_OnNextLine()
generate_loremIpsum()\n\tDescr:\tUsing the Clipboard (without affecting most recent clip), Pastes 1 to 10 paragraphs of generated Lorem Ipsum text. Default is 3 paragraphs.\n\tReturn:\tVOID\n\tParams:\tp_paragraphAmount :=\tINTEGER\n\tNotes:\tGenerated text acquired from "https://lipsum.com".\n
generate_loremIpsum()\ngenerate_loremIpsum(p_paragraphAmount := 3)
GetClientSize(v_hWnd, \nByRef w := "", \nByRef h := "")
getClipboard(ByRef p_var)
getClipboard(outputVar)
getClipboard(outputVar)\nDescr:\tAssigns Clipboard's content's value to the given argument.\nReturn:\tBOOLEAN - true, if success\n\t\tBOOLEAN - false, if failure\n\t\tINTEGER - -1, if unknown error\nParams:\tByRef p_outputVar := OBJECT\nNotes:\tMust declare a variable object as argument.\n
mathKbd_activeWindowSentinel()
mathKbd_debugFunction()incrementPowerNoCarrotWithExtraBackspacing()
mathKbd_incrementPower( p_timeLimit := -1, \np_incrementAmount := 1, \np_initialBackspaceAmount := 2, \np_subsequentBackspaceAmount :=3, \np_rightAmount := 1, \np_sendCarrot := true, \np_extraBackspacing := false)
mathKbd_incrementPowerNoCarrot()
mathKbd_incrementVariables(p_timeLimit := "", \np_vars*)
mathKbd_paste(str := "")
mathKbd_pasteSquareRoot()
mathKbd_setMathInputStyle(p_1 := false, \np_2 := true, \np_3 := 3, \np_4 := 0)
mathKbd_typeSquareRoot()
mouseEvent(p_clickDelay := 200, \np_coordAsPercent*)
moveCurrentLineDown(p_moveAmount := 1)
moveCurrentLineUp(p_moveAmount := 1)
pasteClipboard()\nDescr:\tHandles the pasting of Clipboard contents, without affecting\n\t\t\tthe current clip.\nReturn:\tBOOLEAN - true, if successful.\n\t\tBOOLEAN - false, if error occurred.\nParams:\tp_str := ""\nNotes:\tIf argument is left blank, then paste current Clipboard contents.\n\t\tIf argument is defined, then paste the argument without \n\t\t\taffecting the current Clipboard.\n
pasteClipboard()\npasteClipboard(p_str := "")
pasteClipboard(p_str := "")
pwrRun_clearText()\n\tDescr:\tSelects all, Delete, Escape, then wait 200 (default) milliseconds.\n\tReturn:\tVOID\n\tParams:\tp_waitTime :=\tINTEGER\n\tNotes:\tThis is particularly used to clear the text typed into the \n\t\t\t\tPowerRun search bar before Escaping the search bar.\n
pwrRun_clearText()\npwrRun_clearText(p_waitTime := 200)
pwrRun_fireFoxSearch(str := "", extraSend := "")
rapidFire(p_thisHotkey := "", p_sendKey := "", p_time := 0)
regex_clipboard_removeCommentDelimiters(p_delimiter_begin := "(/\\*\\*?\\s*)"\n\t\t,\tp_delimiter_mid := "(?<=(?:\\r|\\n|(?:\\r\n)))((;;\\s)|(;:\\s)|(;~\\s))"\n\t\t,\tp_delimiter_end := "(?:\\)")
regex_clipboard_removeCommentDelimiters(p_delimiter_begin := "(/\\*\\*?\\s*)",	p_delimiter_mid := "(?<=(?:\\r|\\n|(?:\\r\\n)))((;;\\s)|(;:\\s)|(;~\\s))",	p_delimiter_end := "(?:\\*/)")
regex_clipboard_sort()
regex_clipboard_sortAndPaste()
regex_clipboard_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\\n", p_tabSubstitution := "\\t")
regex_convertText_SciTE_API()\n\tDescr:\tConverts whitespace for .api files used by SciTE and removes\n\t\t\t\ta limited amount of comment delimiters. \n\tReturn:\tSTRING - returns selected text as a literal-string object. \n\tParams:\tp_pasteInsteadOfReturnVal := BOOLEAN  (default := false)\n\tNotes:\t\n
regex_convertText_SciTE_API()\nregex_convertText_SciTE_API(p_pasteInsteadOfReturnVal := false)
regex_parseDocumentForFunctions()\n\tDescr:\tSelects All, Copies Selection, then replaces Clipboard with a list of functions if any.\n\tReturn:\tSTRING - Returns a string list (not an array) of functions. \n\tParams:\tp_CRLF := "\\r\\n"\n\tNotes:\tReplace text is considered raw. If actuall control characters are desired, use "`" to escape. 
regex_parseDocumentForFunctions()\nregex_parseDocumentForFunctions(p_CRLF := "\\r\\n")
regex_parseDocumentForFunctions(p_CRLF := "\\r\\n")
regex_parseDocumentForFunctions(p_CRLF := "\\r\\n", p_TAB := "\\t")
regex_selection_removeCommentDelimiters()\nregex_selection_removeCommentDelimiters(p_delimiter_begin := "(/\\*\\*?\\s*)"\n\t\t,\tp_delimiter_mid := "((;;\\s)|(;:\\s)|(;~\\s))"\n\t\t,\tp_delimiter_end := "(?:\\)")
regex_selection_removeCommentDelimiters(p_delimiter_begin := "(/\\*\\*?\\s*)",	p_delimiter_mid := "((;;\\s)|(;:\\s)|(;~\\s))",	p_delimiter_end := "(?:\\*/)")
regex_selection_sort()
regex_selection_sortAndPaste()
regex_selection_swapLineBreaksAndTabs()\n\tDescr:\tAdds current selection to Clipboard, then modifies the clipboard's contents,\n\t\t\t\treplacing line-breaks with "\n" by default,\n\t\t\t\tand tabs with "\t" by default.\n\tReturn:\tSTRING\n\tParams: p_lineBreakSubstitution := \t"\n"\n\t\t\tp_tabSubstitution \t\t:=\t"\t"\n\tNotes:\tMust have something selected for this method to work. \n
regex_selection_swapLineBreaksAndTabs()\nregex_selection_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\\n", p_tabSubstitution := "\\t")
regex_selection_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\\n", p_tabSubstitution := "\\t")
regex_SwapLineBreaks()\nregex_SwapLineBreaks(rgx_replaceWith := "\\n")
regex_SwapLineBreaks(rgx_replaceWith := "\\n")
regex_SwapLineBreaks(rgx_replaceWith := "\\n")\n\tDescr:\tReplaces the Clipboard contents. Swaps out line-break characters with the given RegEx string.\n\tReturn:\tSTRING\n\tNotes: Search Expression := "((?:\r\n)|(?:\r)|(?:\n))"\n\t\t- Matches a single token of (CR+LF or CR or LF)
regex_SwapTabs()\nregex_SwapTabs(rgx_replaceWith := "\\t")
regex_SwapTabs(rgx_replaceWith := "\\t")
repeatAltKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatAltShiftKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatCtrlAltShiftKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatCtrlKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatCtrlShiftKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
repeatShiftKey(p_key := "K", \np_keyPressAmount := 1, \np_delayAmount := -1, \np_pressDuration := -1)
restoreClipboard()
rstrClip()
setClipboard()\nDescr:\tAttempts to set the passed arguement's value to the Clipboard.\nReturn:\tBOOLEAN - true, if successful.\n\t\tBOOLEAN - false, if error occurred.\nParams:\tp_clipWaitTime := 1\n\t\tp_str := ""\n\t\tp_str := a string (object) stored to and pasted from the built-in\n\t\t\tClipboard.\nNotes:\tAt end of method process, restores Clipboard back to what \n\t\t\tit was prior to calling this method.\n 
setClipboard(p_clipWaitTime := 1, \np_str := "")
setClipboard(p_clipWaitTime := 1, p_str := "")
StrReplace(Haystack, Needle [, ReplaceText, OutputVarCount, Limit])
time_getDate(STRING:= dateFormat)\r\n Descr:\tgets the date in the specified format.\r\n Return:\tSTRING\r\n Params:\r\n\tp_dateFormat: STRING \r\n\tmust use only these characters\r\n \t(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")\r\n \t[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
time_sendDate(STRING: dateFormat)\r\n Descr:\tUses the 'Send, ' command, after getting the formatted date specified.\r\n Return:\tSTRING\r\n Params:\r\n\tp_dateFormat: STRING \r\n\tmust use only these characters\r\n \t(ex: "gg yyyy-MMMM-dddd (HH)|(hh):mm:ss tt")\r\n \t[ (no-arg) | "Time" | "ShortDate" | "LongDate" | "YearMonth" | "YDay" | "YDay0" | "WDay" | "YWeek"]
