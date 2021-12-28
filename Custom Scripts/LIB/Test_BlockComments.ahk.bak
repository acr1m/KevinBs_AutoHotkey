



MsgBox, % "There is a `"`/`*`" right here -->" 
/* . "<-- ."

*/


MsgBox, There is a `"`/`*`" right here --> 
/* . "<-- ."

*/

;;There is a ";" right here -->
;;#######################################______________
str := "There is a "";"" right here -->" ; . "<-- ." */
Clipboard := str
MsgBox, , Title, %str%

;;There is a 
;;####################____________________________________
str := "There is a `" ; `/ `* `" right here -->" . "<-- ."
Clipboard := str
MsgBox, , Title, %str%

;;There is a "/*" right here --><-- .
;;#################################################
str := "There is a ""/*"" right here -->" . "<-- ."
Clipboard := str
MsgBox, , Title, %str%


;;If </*> is the first 2 characters on a new line, then
;;	it will comment EVERY line underneath it. 
;;_____________________________________________________
/*
str := "There is a ""/*"" right here -->" /*
Clipboard := str
MsgBox, , Title, %str%
*/

;;If there is ONLY whitespace before </*> on a new line,
;;	is anywhere first 2 characters on a new line, then
;;	it will comment EVERY line underneath it. 
;;_____________________________________________________
				 /*
				 */
s1 := "1`n"
s2 := "2`n"
s3 := "3`n"
s4 := "4`n"
MsgBox,% 0x40 , % "Title", % s1 . s2 . s3 . s4
*/

;;NULL
;;_____________________________________________________
str := "There is a ""/*"" right here -->" /* */
Clipboard := str
MsgBox, , Title, %str%

;;NULL
;;_____________________________________________________
str := "There is a ""/*"" right here -->" /* "<-- ." */
Clipboard := str
MsgBox, , Title, %str%

;;NULL
;;_______________________________________________________
str := "There is a ""/*"" right here -->" /* . "<-- ." */
Clipboard := str
MsgBox, , Title, %str%
;;
;;#################################################
str := "There is a ""/*"" right here -->" ; /* . "<-- ." */
Clipboard := str
MsgBox, , Title, %str%

