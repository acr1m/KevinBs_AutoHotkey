#SingleInstance Force

/** 
 * This program reads the first character in the Clipboard and 
 *  outputs/returns the character code.
 * 
 * Chr(Number) - Returns the string (usually a single character) corresponding to 
 *  the character code indicated by the specified number.
 * 
 * Asc(String) - Returns the numeric value of the first byte or UTF-16 code unit 
 *  in the specified string.
 * 
 * Ord(String) - Returns the ordinal value (numeric character code) of the first 
 *  character in the specified string.
 * 
 * 
 */

myChar := SubStr(Clipboard, 1, 1) ;; Can be either a positive <Integer> or <String>
;; Clipboard := SubStr(Clipboard, 1, 1) . ": " . Format("{:X}", Ord(myChar))
Clipboard := myChar . "= Dec: " . Ord(myChar) . ", Hex: " . Format("{:X}", Ord(myChar))

myTitle := "Character Code UTILITY"
myOutMessage :=     "Results for Character:	" . myChar
				;; . "`nCharacter Code Value:	" . Chr(myChar)
				. "`nASCII Code Value:		" . Asc(myChar)
				. "`nDecimal Value:		" . Ord(myChar)
				. "`nHexidecimal Value:		" . Format("{:X}", Ord(myChar))
				. "`n" 
				. "`nClipboard`n" . Clipboard
				
MsgBox, , % myTitle, % myOutMessage, 10 ; 10 second timeout
