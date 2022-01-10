/* ;: for testing purposes
;; #Include %A_ScriptDir%\..\_lib\LIB_Main_Method_Library.ahk
;; Pause::ExitApp
;; 1::generate_loremIpsum(6)
*/

/**	generate_loremIpsum()
	Descr:	Using the Clipboard (without affecting most recent clip), Pastes 1 to 10 paragraphs of generated Lorem Ipsum text. Default is 3 paragraphs.
	Return:	VOID
	Params:	p_paragraphAmount :=	INTEGER
	Notes:	Generated text acquired from "https://lipsum.com".
*/
generate_loremIpsum(p_paragraphAmount := 3){
	archiveClipboard()
	file := "E:\Library\OneDrive\Documents\AutoHotkey\Custom Scripts\_utility\lorem_ipsum.txt"
	
	;;;; EXPRESSION STYLE - SYNTAX
	;: i := 1
	;: while (i <= p_paragraphAmount){
		;: FileReadLine, appendVar, % file, % i
		;: Clipboard .= "`r`n" . appendVar
		;: i++
	;: }
	;: MsgBox, , % "Method 1", % Clipboard
	
	;: Clipboard :=
	
	;;;; COMMAND STYLE - SYNTAX
	;: Loop, %p_paragraphAmount%{
		;: FileReadLine, appendVar, %file%, %A_Index%
		;: Clipboard = %Clipboard%`r`n%appendVar%
	;: }
	;: MsgBox, , Method 2, %Clipboard%
	
	;;;; EXPRESSION STYLE - SYNTAX
	Loop, % p_paragraphAmount{
		FileReadLine, appendVar, % file, % A_Index
		Clipboard .= "`r`n" . appendVar
	}
	;: MsgBox, , % "Method 3", % Clipboard
	
	pasteClipboard()
	restoreClipboard()
}