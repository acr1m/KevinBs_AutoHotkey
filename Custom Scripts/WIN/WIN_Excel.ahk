;WIN_Excel.ahk

/* Function List
 * 		excel_ActivateDrawBorderTool()
 * 		excel_AddTopBorder()
 * 		excel_EncapIfErrorIf()
 * 		excel_Hotkey_#Insert()
 *		excel_NavigateToBottomLeftCell()
 * 		excel_StampTimeCurrent()
 * 		excel_StampTimeCurrent_OnNextLine()
 * 		excel_setBorderColorToAccent1()
 */

#IfWinActive
#x::gosub, label_OpenExcel

#Insert::
	gosub, label_OpenExcel
	Sleep, 8000
	excel_StampTimeCurrent_OnNextLine()
	return

label_OpenExcel:
#Include WIN_Excel_filepaths.ahk
	;~ Run, % "open" filePathFor_Excel
	;~ MsgBox,,, % "Msg from `n#IfWinActive NONE `n#x::", % 3
	Run, %filePathFor_Excel% %filePathFor_Excel_doc%
	return
	
#IfWinExist ahk_class XLMAIN ahk_exe EXCEL.EXE
#x::
	;~ MsgBox,,, % "Msg from `n#IfWinExist EXCEL`n#x::", % 3
	WinActivate ; Activates the window found by the above #IfWin directive.
	return
#Insert::
	;~ MsgBox,,, % "Msg from `n#IfWinExist EXCEL `n#Insert::", % 3
	WinActivate
	excel_Hotkey_#Insert()
	return
#IfWinActive ahk_class XLMAIN ahk_exe EXCEL.EXE
{
	;;Scroll Left
	+WheelUp::
	{
		SetScrollLockState, On
		Send, {Left}
		SetScrollLockState, Off
		return	
	}
	
	;;Scroll Right
	+WheelDown::
	{
		SetScrollLockState, On
		Send, {Right}
		SetScrollLockState, Off
		return
	}
	
	;Edit Current Cell Content
	^Enter::Send, {F2}
	
	;Activate Draw Border Tool
	^w::excel_ActivateDrawBorderTool()
	
	;Adds a top border to the first 9 columns in a single row
	^e::excel_AddTopBorder()
	
	;TIME-STAMP FUNCTION
	Insert::excel_StampTimeCurrent()
	
/* 	Description
 * 		This code encapsulates or surrounds a cell's formula 
 * 		with an IFERROR(__,IF(__)) block that will effectively
 * 		hide resulting cell values that result in zero or less
 * 		without having to mess with excel's "conditional formatting".
 * Known Issues
 * 		- Will delete the first character, always. So make sure there's 
 *		an "=" for the first character of the cell's contents.
 * 	
 */
	^+i::excel_EncapIfErrorIf()
	
	#Insert::
	^+Insert::
		;~ MsgBox,,, % "Msg from `n#IfWinActive EXCEL `n#Insert::", % 3
		excel_Hotkey_#Insert()
		return
	
}
#IfWinActive

;LABELS
excel_ActivateDrawBorderTool()
{ 
	;~ Send, {Alt}
	;~ Send, hbw
	Send, {Alt}hbw
	KeyWait, Alt
	Sleep, 10
	;~ Send, {Escape}
	return
}
excel_AddTopBorder()
{
	excel_setBorderColorToAccent1()
	SetKeyDelay, 50
	Send, {Home}
	Send, {Shift down}
	Send, {Right 8}
	Send, {Shift up}
	Send, {Alt}hbp
	Sleep, 30
	Send, {Home}
	KeyWait, Home
	;~ Send, {Escape}
	SetKeyDelay, Default
	return
}
excel_EncapIfErrorIf()
{
	;archive/save the clipboard's contents and clear
	clipArchive := ClipboardAll
	Clipboard :=
	;edit cell contents
		Send, {F2} 
	;select all except the beginning "=" sign
		Send, {Home}{Right}{ShiftDown}{End}{ShiftUp} 
	;cut
		Send, ^x 
	;wait for clipboard to have content before proceeding
		ClipWait, 1 ;wait for 1 second
		if ErrorLevel 
		{
			MsgBox, The attempt to copy text onto the clipboard failed.
			return
		}
	;text
		Send, IFERROR(IF((
	;past cell's contents as inner formula
		Send, ^v
		Send, )>0,(
	;past cell's contents as inner formula, again
		Send, ^v
	;closing statement parentheses and empty string values
	;for output in case false or error 
		Send, ),`"`"),`"`")
	;confirm new cell contents by hitting enter
		Send, {Enter}
	;restore clipboard's previous contents
		Clipboard := clipArchive
	return
}
excel_Hotkey_#Insert()
{
	excel_StampTimeCurrent_OnNextLine()
	return
}
excel_NavigateToBottomLeftCell()
{
	Send, ^{Home 2}
	Send, ^{Down}
	Send, {Down}
	excel_StampTimeCurrent()
	return
}
excel_StampTimeCurrent()
{
	SetKeyDelay, 100
	
	clipHolder := ClipboardAll
	Clipboard := "=now()"
	
	Send, ^v
	KeyWait, Ctrl
	
	Send, ^c
	KeyWait, Ctrl		
	
	Send, {Alt}
	KeyWait, Alt
	Send, h
	KeyWait, h
	Send, v
	KeyWait, v
	Send, v
	KeyWait, v
	Send, {Escape}
	KeyWait, Escape
	Send, {Escape}
	
	;~ Clipboard := clipHolder
	
	SetKeyDelay, Default
	return
}
excel_StampTimeCurrent_OnNextLine()
{
	excel_NavigateToBottomLeftCell()
	excel_StampTimeCurrent()
	Send, {Right 2}
	return
}
excel_setBorderColorToAccent1()
	{
		SetKeyDelay, 50
		Send, {Alt}hbi{Right 5}{Enter}
		return
	}