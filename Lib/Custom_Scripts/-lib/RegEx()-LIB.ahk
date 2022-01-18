/*!
	Library: RegEx Library
		This is a collection of functions and objects that utilitize Regular Expressions  
		to parse text/`String`-objects. and do things with them like sorting, substitution, and compiling.
	Author: Kevin Boykin (acr1m)
	License: 
	Version 0.blah

*/

/*!	
	Function: regex_convertText_SciTE_API(p_replaceSelection)
		Converts whitespace for .api files used by SciTE and removes
				a limited amount of comment delimiters. 
	Returns:
		**`STRING`** - returns selected text in a format style that is friendly for the user.api.ahk file.
	Parameters:	
		p_replaceSelection 
			- `***BOOLEAN*** (Default := *false*)`
	Remarks:	This is used to manually copy and paste from file to file.
*/
regex_convertText_SciTE_API(p_replaceSelection := false) {
	;; this preps a selection of text for pasting into "user.ahk.api"
		
		retVal := ""
		
		archiveClipboard()
		copySelection()
		
		regex_clipboard_removeCommentDelimiters()
		regex_clipboard_swapLineBreaksAndTabs("\\n", "\\t")
		retVat := Clipboard
		
		if (p_replaceSelection == true)
			pasteClipboard()
		
		restoreClipboard()
		return retVal
}

/*!	
	Function: regex_SwapTabs(rgx_replaceWith := "\t")
	Descr:	Replaces the Clipboard's content. Swaps out tab characters with the given RegEx string.
	Returns:	STRING
	Remarks: Search Expression := "(?:\t)"
*/
regex_SwapTabs(rgx_replaceWith := "\t") {
	rgx_findTabs := "(?:\t)"
	return RegExReplace(Clipboard, rgx_findTabs, rgx_replaceWith)
}
/*!
	Function: regex_SwapLineBreaks(rgx_replaceWith := "\\n")
	Descr:	Replaces the Clipboard contents. Swaps out line-break characters with the given RegEx string.
	Returns:	STRING
	Remarks: Search Expression := "((?:\r\n)|(?:\r)|(?:\n))"
		- Matches a single token of (CR+LF or CR or LF)
*/
regex_SwapLineBreaks(rgx_replaceWith := "\n") {
	rgx_findLineBreaks := "((?:\r\n)|(?:\r)|(?:\n))"
	return RegExReplace(Clipboard, rgx_findLineBreaks, rgx_replaceWith)
}
/*!
	Function: regex_parseDocumentForFunctions()
	Descr:	Selects All, Copies Selection, then replaces Clipboard with a list of functions if any.
	Returns:	STRING - Returns a string list (not an array) of functions. 
	Parameters:	p_CRLF - "\r\n"
			p_TAB - "\t"
	Remarks:	Replace text is considered raw. If actuall control characters are desired, use "`" to escape. 
*/
regex_parseDocumentForFunctions(p_CRLF := "\r\n", p_TAB := "\t") {
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

/*!
	Function: regex_selection_swapLineBreaksAndTabs()
	Descr:	Adds current selection to Clipboard, then modifies the clipboard's contents,
				replacing line-breaks with "\n" by default,
				and tabs with "\t" by default.
	Returns:	STRING
	Parameters: p_lineBreakSubstitution - 	"\n"
			p_tabSubstitution 		-	"\t"
	Remarks:	Must have something selected for this method to work. 
*/
regex_selection_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\n", p_tabSubstitution := "\t") {
	copySelection()
	Clipboard := regex_SwapLineBreaks()
    Clipboard := regex_SwapTabs()
	return
}
/*!
	Function: regex_selection_swapLineBreaksAndTabs()
	Descr:	Modifies the clipboard's contents,
				replacing line-breaks with "\n" by default,
				and tabs with "\t" by default.
	Returns:	STRING
	Parameters: p_lineBreakSubstitution - 	"\n"
			p_tabSubstitution 		-	"\t"
	Remarks:	This method only operates on pre-existing Clipboard content.
*/
regex_clipboard_swapLineBreaksAndTabs(p_lineBreakSubstitution := "\n", p_tabSubstitution := "\t") {
	Clipboard := regex_SwapLineBreaks()
    Clipboard := regex_SwapTabs()
	return
}
/*!
	Function: regex_selection_removeCommentDelimiters()
	Descr:	Adds current selection to Clipboard, then modifies the clipboard's contents,
	Returns:	VOID
	Parameters:	p_delimiter_begin - "(/\*\*?\s*)"
			p_delimiter_mid - "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
			p_delimiter_end := "(?:\*/)"
	Remarks:	Must have something selected for this method to work. 
*/

regex_selection_removeCommentDelimiters(p_delimiter_begin := "(/\*\*?\s*)"
		,	p_delimiter_mid := "((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_end := "(?:\*/)") {
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
/*!
	Function: regex_clipboard_removeCommentDelimiters()
	Descr:	Modifies the clipboard's contents,
	Returns:	VOID
	Parameters:	p_delimiter_begin - "(/\*\*?\s*)"
			p_delimiter_mid - "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
			p_delimiter_end := "(?:\*/)"
	Remarks:	This method only operates on pre-existing Clipboard content.
*/
regex_clipboard_removeCommentDelimiters(p_delimiter_begin := "(/\*\*?\s*)"
		;: ,	p_delimiter_mid := "(?<=(?:\r|\n|(?:\r\n)))((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_mid := "(?<=\r|\n|(?:\r\n))((;;\s)|(;:\s)|(;~\s))"
		,	p_delimiter_end := "(?:\*/)") {
	Clipboard := RegExReplace(Clipboard, p_delimiter_begin)
	Clipboard := RegExReplace(Clipboard, p_delimiter_mid)
	Clipboard := RegExReplace(Clipboard, p_delimiter_end)
	return 
}

/*!
	Function: regex_selection_sort()
	Descr:	Copies selection, and then sorts the Clipboard's contents.
	Returns:	VOID
	Parameters:	
	Remarks:	
*/
regex_selection_sort() {
	copySelection()
	Sort, Clipboard
	return
}

/*!
	Function: regex_selection_sortAndPaste()
	Descr:	Sorts the currently selected text.
	Returns:	VOID
	Parameters:	
	Remarks:	
*/
regex_selection_sortAndPaste() {
	copySelection()
	Sort, Clipboard
	pasteClipboard()
	return
}

/*!
	Function: regex_clipboard_sort()
	Descr:	Sorts the Clipboard's content.
	Returns:	VOID
	Parameters:	
	Remarks:	Does not copy or paste.
*/
regex_clipboard_sort() {
	Sort, Clipboard
	return
}

/*!
	Function: regex_clipboard_sortAndPaste()
	Descr:	Sorts the Clipboard's content.
	Returns:	VOID
	Parameters:	
	Remarks:	Does not copy.
*/
regex_clipboard_sortAndPaste() {
	Sort, Clipboard
	pasteClipboard()
	return
}