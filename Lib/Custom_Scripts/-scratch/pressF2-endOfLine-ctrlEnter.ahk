; temp

; f2, end of line, new line (ctrl+enter)

Numpad0::
{
	KeyWait, % A_ThisHotkey
	Send, {F2}
	Sleep, 200
	Send, {End}
	Send, ^{Enter}
	return
}

^Esc::ExitApp
