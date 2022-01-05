;AHK_Windows_Color_Picker.ahk
#IfWinActive Color ahk_class #32770
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;HOTKEYS
;~ ^c::
	;~ tempClip := Clipboard
	;~ StringSplit, strArray, tempClip, ",", "rgb( )"
	;~ StrSplit(
	;~ if 
	;~ Send, 
	;~ return
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;remove context sensitive window detection for compatibility
#IfWinActive 