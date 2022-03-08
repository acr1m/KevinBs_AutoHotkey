

#Include %A_ScriptDir%\..\-lib\run()-LIB.ahk


/**
 * Rerun this script as admin.
 * 
 * Utilizes the included script library "run()-LIB.ahk" method "run_AsAdmin()"
 * 
 */
run_AsAdmin(,true)

$9::
	Send, (
	return

$+9::
	Send, 9
	return

$0::
	Send, )
	return

$+0::
	Send, 0
	return
