ExecScript(Script, Wait:=true)
{
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec("AutoHotkey.exe /ErrorStdOut *")
    exec.StdIn.Write(script)
    exec.StdIn.Close()
    if Wait
        return exec.StdOut.ReadAll()
}

; Example:
InputBox expr,, Enter an expression to evaluate as a new script.,,,,,,,, Asc("*")
result := ExecScript("FileAppend % (" expr "), *")
MsgBox % "Result: " result
