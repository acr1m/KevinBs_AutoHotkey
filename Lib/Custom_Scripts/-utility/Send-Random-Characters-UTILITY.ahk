myCount := 32
myRange := 7
myShift := 97

MsgBox, 64, , ➤ Press Ctrl+Shift+F5 to send random keyboard strokes from A to G while the MuseScore application is the active window.`n`n➤ To change the count`, range`, and shift of the output`, open and edit the file`,`n    ➥ "Send-Random-Characters-UTILITY.ahk" . , 15

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,false) ; (,true) -> shows a msgbox indicating success/failure of process



#IfWinActive ahk_exe MuseScore3.exe

^+F5::sendRandomCharacters(myCount, myRange, myShift)

#SingleInstance Force


#IfWinActive

/**	sendRandomCharacters(p_count := 8, p_range := 7, p_shift := 97)
	Descr:	Sends random characters.
	Return:	VOID
	Params:	
			p_count := 8
			p_range := 7
			p_shift := 97
	Notes:	Used in MuseScore to generate random notes for reading practice. 
*/
sendRandomCharacters(p_count := 8, p_range := 7, p_shift := 97) {
	stringOut := ""

	Loop, 32
	{
/* 			
 * 		s = [ 0,  32] => r = [{NULl}, {SPACE}]
 * 		s = [48,  57] => r = [0, 9] (ASCII character code value for numbers 0-9)
 * 		s = [65,  90] => r = [A, Z]
 * 		s = [97, 122] => r = [a, z]
 */
		
		a := 0
		b := r - 1
		r := p_range
		s := p_shift ; shift amount
				
		Random, n, 0, 6 ; range of 7 for letters [a-g]
		n += s
		Send, % Chr(n)
		Sleep, 20
		;; stringOut .= Chr(n) . ", "
	}

	;; MsgBox, , % "Send-Random-Characters-UTILITY.ahk", % "stringOut = " stringOut
}