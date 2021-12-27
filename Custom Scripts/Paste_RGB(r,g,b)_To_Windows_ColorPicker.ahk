

#IfWinActive Color ahk_class #32770 ; the default Windows Color Picker panel

; alt+v
	!v::
		testClip := "rgb(93, 05, 123)"
		;~ example → Array := [Item1, Item2, ..., ItemN]
		clipArray := StrSplit(testClip, " ", "rgb()")
		
		MsgBox, "clipArray = " %clipArray% "`n-------"
		;~ StrSplit(Clipboard, [A_Space,]

	return


#IfWinActive
;~ ; alt+v
	;~ ; hotkey is null
	;~ !v::return


;StrSplit TESTING
; alt+v
	!v::
		testClip := "rgb(93, 05, 123)"
		clipArray := StrSplit(testClip, ",")
		
		; Dot "." is the concatenation operator to explicitly 
		;	combine two items
		;	-there must be at least one space on each side of the string
		
		
		; for is equivalent to a "for each" expression in other languages
		; 	- iterates through each key-value pair in an object 
		;		- regardless of the object's data type of its key
		
		
		; assign . append the value of %eachKey% to %s%
		s := ""
		for eachKey, val in clipArray
			s .= val . "`n"
		
		MsgBox, testClip=%testClip%`nclipArray=%s%`n-------
		;~ StrSplit(Clipboard, [A_Space,]

	return


