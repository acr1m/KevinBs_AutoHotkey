;; The following functions can be used to run a command and retrieve its output or to run multiple commands in one go and retrieve their output.

RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
    shell := ComObjCreate("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(ComSpec " /C " command)
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}

RunWaitMany(commands) {
    shell := ComObjCreate("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`nexit")  ; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}

;; Executes the given code as a new AutoHotkey process.
ExecScript(Script, Wait:=true)
{
    shell := ComObjCreate("WScript.Shell")
    exec := shell.Exec("AutoHotkey.exe /ErrorStdOut *")
    exec.StdIn.Write(script)
    exec.StdIn.Close()
    if Wait
        return exec.StdOut.ReadAll()
}

/**	run_AsAdmin(p_targetFilePath := "", p_show_MsgBox := false, p_DllCall_arg1 := "GetCommandLine", p_DllCall_arg2 := "str")
	Descr:	Attempts to restart the current script as admin.
	Return:	BOOLEAN
	Parameters:
		- STRING	p_targetFilePath := "" (default: A_ScriptFullPath)
		- BOOLEAN	p_show_MsgBox := false
		- STRING	p_DllCall_arg1 := "GetCommandLine"
		- STRING	p_DllCall_arg2 := "str"
	Notes:	For an executable file, the *RunAs verb is equivalent to selecting
			Run as administrator from the right-click menu of the file. For 
			example, the following code attempts to restart the current 
			script as admin.
*/
run_AsAdmin(p_targetFilePath := "", p_show_MsgBox := false, p_DllCall_arg1 := "GetCommandLine", p_DllCall_arg2 := "str") {
	
	;; initialize retVal
	local retVal
	
	;; full_command_line := DllCall("GetCommandLine", "str")
	full_command_line := DllCall(p_DllCall_arg1, p_DllCall_arg2)
	
	if (p_targetFilePath == "") {
		p_targetFilePath := A_ScriptFullPath
		retVal := run_AsAdmin_thisScript(p_targetFilePath, full_command_line)
	}
;{ 	else {
;       		run_AsAdmin_targetFile(p_targetFilePath)
;       	}
;}
	
	;; Message Box Output ;{
	local successString, msgIcon
	local msgTitle := "run_AsAdmin()"
	
	if (p_show_MsgBox) {
		if (retVal == true) {
			successString := "Successfully launched as Administrator."
			msgIcon := 64 ;; info icon
		} 
		else if (retVal == false) {
			successString := "Failed to launch as Administrator."
			msgIcon := 16 ;; error icon
		}
		
		messageString := successString . "`n`nA_IsAdmin: " . A_IsAdmin . "`n`nCommand line: `n`n" . full_command_line
		
		;; MsgBox, %msgIcon%, %msgTitle%, %successString%`nA_IsAdmin: %A_IsAdmin%`nCommand line: %full_command_line%
		;; MsgBox, %msgIcon%, %msgTitle%, %messageString%
		MsgBox, % msgIcon, % msgTitle, % messageString
	} 
	;}
	
	return retVal
}


/**	run_AsAdmin_thisScript(p_targetFilePath, p_DllCall_arg1, p_DllCall_arg2)
	Descr:	Handles 'Run As Administrator' for the calling script.
	Return:	BOOLEAN
	Parameters:	
	Notes:	Sub-script for run_AsAdmin(). 
*/
run_AsAdmin_thisScript(p_targetFilePath, p_full_command_line) {
	
	
	if not (A_IsAdmin or RegExMatch(p_full_command_line, " /restart(?!\S)"))
	{
		try
		{
			if A_IsCompiled {
				Run, *RunAs "%p_targetFilePath%" /restart, , UseErrorLevel
			}
			else {
				Run, *RunAs "%A_AhkPath%" /restart "%p_targetFilePath%", , UseErrorLevel
			}
		}
	}
	
	if (A_LastError == 0) {
		;; successfull launch
		retVal := true
	} 
	else  if (A_LastError != 0) {
		;; failed launch
		retVal := false
	}
	return retVal
}



/**	run_AsAdmin_targetFile(p_targetFile)
	Descr:	Handles 'Run As Administrator' for the target file.
	Return:	BOOLEAN
	Parameters:	
		- STRING	p_targetFile
	Notes:	Sub-script for run_AsAdmin().
		- (must target a '.exe' in order to retrieve the PID)
*/
run_AsAdmin_targetFile(p_targetFile) {
;{ 	
;       	local targetFilePID
;       	
;       	;; initialize the target file and return it's process id
;       	;; (must target a '.exe' in order to retrieve the PID)
;       	Run, p_targetFilePath, , , targetFilePID
;       	
;       	
;       	
;       	;; full_command_line := DllCall("GetCommandLine", "str")
;       	full_command_line := DllCall(p_DllCall_arg1, p_DllCall_arg2)
;       
;       	if not (targetFilePID A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
;       	{
;       		try
;       		{
;       			if A_IsCompiled {
;       				Run, *RunAs "%p_targetFilePath%" /restart, , UseErrorLevel
;       			}
;       			else {
;       				Run, *RunAs "%A_AhkPath%" /restart "%p_targetFilePath%", , UseErrorLevel
;       			}
;       		}
;       	}
;       	
;       	if (A_LastError == 0) {
;       		;; successfull launch
;       		retVal := true
;       	} 
;       	else  if (A_LastError != 0) {
;       		;; failed launch
;       		retVal := false
;       	}
;	return retVal
;}
}

