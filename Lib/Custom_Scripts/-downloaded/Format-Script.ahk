; This script serves to demonstrate different usages of the Format() function

; Simple substitution
; Group n = {n}, where n is the argument's index of the param list -1. 
s .= Format("{2}, {1}!`r`n", "World", "Hello")

; Padding with spaces
s .= Format("|{:-10}|`r`n|{:10}|`r`n", "Left", "Right")

; Hexadecimal
s .= Format("{1:#x} {2:X} 0x{3:x}`r`n", 3735928559, 195948557, 0)

; Floating-point
s .= Format("{1:0.3f} {1:.10f}", 4*ATan(1))

ListVars  ; Use AutoHotkey's main window to display monospaced text.
WinWaitActive ahk_class AutoHotkey
ControlSetText Edit1, %s%
WinWaitClose
