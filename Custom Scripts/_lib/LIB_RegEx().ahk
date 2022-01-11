;; Library of functions that utilitize Regular Expressions for string parsing and substitution.

/**	regex_SwapTabs(rgx_replaceWith := "\\t")
	Descr:	Replaces the Clipboard contents. Swaps out tab characters with the given RegEx string.
	Return:	STRING
	Notes: Search Expression := "(?:\t)"
*/
regex_SwapTabs(rgx_replaceWith := "\t"){
	rgx_findTabs := "(?:\t)"
	return RegExReplace(Clipboard, rgx_findTabs, rgx_replaceWith)
}
/**	regex_SwapLineBreaks(rgx_replaceWith := "\\n")
	Descr:	Replaces the Clipboard contents. Swaps out line-break characters with the given RegEx string.
	Return:	STRING
	Notes: Search Expression := "((?:\r\n)|(?:\r)|(?:\n))"
		- Matches a single token of (CR+LF or CR or LF)
*/
regex_SwapLineBreaks(rgx_replaceWith := "\n"){
	rgx_findLineBreaks := "((?:\r\n)|(?:\r)|(?:\n))"
	return RegExReplace(Clipboard, rgx_findLineBreaks, rgx_replaceWith)
}
/**	regex_parseDocumentForFunctions()
	Descr:	Selects All, Copies Selection, then replaces Clipboard with a list of functions if any.
	Return:	STRING - Returns a string list (not an array) of functions. 
	Params:	p_CRLF := "\r\n"
			p_TAB := "\t"
	Notes:	Replace text is considered raw. If actuall control characters are desired, use "`" to escape. 
*/
regex_parseDocumentForFunctions(p_CRLF := "\r\n", p_TAB := "\t"){
	Send, ^a
	copySelection()
	rgx_parser := "(?:([\s\S\.]*?)([\r\n]{1})([A-Za-z_\-]+)(\([\s\S]*?\))(?=[\s]*{[\s\S]*}))|(?:([\s\S]+?$)(?![\r\n]{1}[A-Za-z_\-]+\([\s\S]*?\)[\s\S]*{.+}.+$))"
	rgx_replacer := "$3$4" . p_CRLF
	first_pass := RegExReplace(Clipboard, rgx_parser, rgx_replacer)
	rgx_parser := "\n\t\t"
	rgx_replacer := p_CRLF . p_TAB . p_TAB
	second_pass := RegExReplace(Clipboard, rgx_parser, rgx_replacer)
	retVal := second_pass
	return  retVal
}

/**	regex_selection_swapLineBreaksAndTabs()
	Descr:	Adds current selection to Clipboard, then modifies the clipboard's contents,
				replacing line-breaks with "\n" by default,
				and tabs with "\t" by default.
	Return:	STRING
	Params: p_lineBreakSubstitution := 	"\n"
			p_tabSubstitution 		:=	"\t"
	Notes:	Must have something selected for this method to work. 
*/
regex_selection_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\n", p_tabSubstitution := "\t"){
	copySelection()
	Clipboard := regex_SwapLineBreaks()
    Clipboard := regex_SwapTabs()
	return
}
/**	regex_selection_swapLineBreaksAndTabs()
	Descr:	Modifies the clipboard's contents,
				replacing line-breaks with "\n" by default,
				and tabs with "\t" by default.
	Return:	STRING
	Params: p_lineBreakSubstitution := 	"\n"
			p_tabSubstitution 		:=	"\t"
	Notes:	This method only operates on pre-existing Clipboard content.
*/
regex_clipboard_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\n", p_tabSubstitution := "\t"){
	Clipboard := regex_SwapLineBreaks()
    Clipboard := regex_SwapTabs()
	return
}
/**	regex_selection_removeCommentDelimiters()
	Descr:	Adds current selection to Clipboard, then modifies the clipboard's contents,
	Return:	VOID
	Params:	p_delimiter_begin := "(/\*\*?\s*)"
			p_delimiter_mid := "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
			p_delimiter_end := "(?:\*/)"
	Notes:	Must have something selected for this method to work. 
*/

regex_selection_removeCommentDelimiters(p_delimiter_begin := "(/\*\*?\s*)"
		,	p_delimiter_mid := "((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_end := "(?:\*/)"){
	copySelection()
	;: MsgBox, % Clipboard
	Clipboard := RegExReplace(Clipboard, p_delimiter_begin)
	;: MsgBox, % Clipboard
	Clipboard := RegExReplace(Clipboard, p_delimiter_mid)
	;: MsgBox, % Clipboard
	Clipboard := RegExReplace(Clipboard, p_delimiter_end)
	;: MsgBox, % Clipboard
	return
}
/**	regex_clipboard_removeCommentDelimiters()
	Descr:	Modifies the clipboard's contents,
	Return:	VOID
	Params:	p_delimiter_begin := "(/\*\*?\s*)"
			p_delimiter_mid := "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
			p_delimiter_end := "(?:\*/)"
	Notes:	This method only operates on pre-existing Clipboard content.
*/
regex_clipboard_removeCommentDelimiters(p_delimiter_begin := "(/\*\*?\s*)"
		;: ,	p_delimiter_mid := "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_mid := "(?<=\r|\n|(?:\r\n))((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_end := "(?:\*/)"){
	Clipboard := RegExReplace(Clipboard, p_delimiter_begin)
	Clipboard := RegExReplace(Clipboard, p_delimiter_mid)
	Clipboard := RegExReplace(Clipboard, p_delimiter_end)
	return 
}

/**	regex_selection_sort()
	Descr:	Copies selection, and then sorts the Clipboard's contents.
	Return:	VOID
	Params:	
	Notes:	
*/
regex_selection_sort(){
	copySelection()
	Sort, Clipboard
	return
}

/**	regex_selection_sortAndPaste()
	Descr:	Sorts the currently selected text.
	Return:	VOID
	Params:	
	Notes:	
*/
regex_selection_sortAndPaste(){
	copySelection()
	Sort, Clipboard
	pasteClipboard()
	return
}

/**	regex_clipboard_sort()
	Descr:	Sorts the Clipboard's content.
	Return:	VOID
	Params:	
	Notes:	Does not copy or paste.
*/
regex_clipboard_sort(){
	Sort, Clipboard
	return
}

/**	regex_clipboard_sortAndPaste()
	Descr:	Sorts the Clipboard's content.
	Return:	VOID
	Params:	
	Notes:	Does not copy.
*/
regex_clipboard_sortAndPaste(){
	Sort, Clipboard
	pasteClipboard()
	return
}