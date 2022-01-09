;; Library of functions that utilitize Regular Expressions for string parsing and substitution.

/**	RegEx_SwapTabs(rgx_replaceWith := "\\t")
	Descr:	Replaces the Clipboard contents. Swaps out tab characters with the given RegEx string.
	Return:	STRING
	Notes: Search Expression := "(?:\t)"
*/
RegEx_SwapTabs(rgx_replaceWith := "\t"){
	rgx_findTabs := "(?:\t)"
	return RegExReplace(Clipboard, rgx_findTabs, rgx_replaceWith)
}
/**	RegEx_SwapLineBreaks(rgx_replaceWith := "\\n")
	Descr:	Replaces the Clipboard contents. Swaps out line-break characters with the given RegEx string.
	Return:	STRING
	Notes: Search Expression := "((?:\r\n)|(?:\r)|(?:\n))"
		- Matches a single token of (CR+LF or CR or LF)
*/
RegEx_SwapLineBreaks(rgx_replaceWith := "\n"){
	rgx_findLineBreaks := "((?:\r\n)|(?:\r)|(?:\n))"
	return RegExReplace(Clipboard, rgx_findLineBreaks, rgx_replaceWith)
}
/**	RegEx_parseDocumentForFunctions()
	Descr:	Selects All, Copies Selection, then replaces Clipboard with a list of functions if any.
	Return:	STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____Insert_notes_here____
*/
RegEx_parseDocumentForFunctions(){
	Send, ^a
	copySelection()
	rgx_parser := "(?:([\s\S\.]*?)([\r\n]{1})([A-Za-z_\-]+)(\([\s\S]*?\))(?=[\s]*{[\s\S]*}))|(?:([\s\S]+?$)(?![\r\n]{1}[A-Za-z_\-]+\([\s\S]*?\)[\s\S]*{.+}.+$))"
	rgx_replacer := "$3$4\r\n"
	return RegExReplace(Clipboard, rgx_parser, rgx_replacer)
}