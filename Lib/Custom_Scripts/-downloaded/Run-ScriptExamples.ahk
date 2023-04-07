;; Run (command) Examples
#Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk


;;;; RunWaitOne & RunWaitMany Examples

;; The following functions can be used to run a command and retrieve its output or to run multiple commands in one go and retrieve their output.
MsgBox % RunWaitOne("dir " A_ScriptDir)
MsgBox % RunWaitMany("
(
echo Put your commands here,
echo each one will be run,
echo and you'll get the output.
)")


;;;; ExecScript() Example

;;	InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout       , Default]
;;	InputBox, OutputVar [, Title, Prompt                                          ,,,,,,,, Default]
	InputBox, expr       ,      , Enter an expression to evaluate as a new script.,,,,,,,, Asc("*")

result := ExecScript("FileAppend % (" expr "), *")

MsgBox % "Result: " result
