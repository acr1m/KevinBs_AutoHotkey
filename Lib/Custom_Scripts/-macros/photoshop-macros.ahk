; macros to create quarter inch dotted paper in photoshop
#InstallKeybdHook
#InstallMouseHook

Pause::
	Pause
	return
^CtrlBreak::
	ExitApp ; emergency script breaker
	return

;~ ^=::
	;~ Click, 135 58 2
	;~ return

^+`::
	;~ photoshopMacro()
	
	/* photoshopMacroDuplicateAndFreeTransformPosition(i, j, ms)
		params
			( i = starting col-index
			, j = starting row-index
			, ms = milliseconds between commands
			)
	*/
	;~ photoshopMacroDuplicateAndFreeTransformPosition(0, 0, 300) ; argument = sleep time in milliseconds b/w keystroke commands
	
	;~ Group 6 (starting point), |> yPosition = 750px |> i = 5
	;~ which means that the yPosition of the first pasted group is going to be
	;~		Group 7 |> yPosition = 900px |> i = 6 |> 6(150) = 300+300+300
	;~ photoshopMacro_Duplicate_FreeTransform_Vertical(6, 500) ; argument = sleep time in milliseconds b/w keystroke commands
	photoshopMacro_Duplicate_FreeTransform_Vertical_yPosition(3900, 300) ; argument = sleep time in milliseconds b/w keystroke commands
	return

photoshopMacro() {
	i := 0
	c := 0.25 ; constant multiplier
	w_max := 8.50 ; inches (size of paper width)
	v_max := 11.00 ; inches (size of paper height)
	
	
	; set horizontal guides
	Loop ; no specific count, uses bounds to break out of loop
	{
		;~ if (A_Index*c < w_max)
		
		if (i*c <= w_max) {
			Send, ^+r
			Sleep, 150
			Send, !v
			Send, !p
			Send, % i*c
			
			Tooltip, % i . ", " . (i*c)
			;~ waitForSpacebar()
			
			Send, {Enter}
			i := i+1
			
			;~ waitForSpacebar()
			
			continue ; next iteration of current loop
		}
		else {
			break ; end iteration of current loop
		}
	}
	
	; set vertical guides
	i := 0 ; reset i before loop iteration
	Loop ; no specific count, uses bounds to break out of loop
	{
		;~ if (A_Index*c < w_max)
		
		if (i*c <= v_max)
		{
			Send, ^+r
			Sleep, 150
			Send, !h
			Send, !p
			Send, % i*c
			
			Tooltip, % i . ", " . (i*c)
			;~ waitForSpacebar()
			
			Send, {Enter}
			i := i+1
			
			;~ waitForSpacebar()
			
			continue ; next iteration of current loop
		}
		else {
			break ; end iteration of current loop
		}
	}
}

waitForSpacebar() {
	KeyWait, Space, D ; wait for key to be pushed down
	KeyWait, Space ; wait for key to be released
}

photoshopMacroDuplicateAndFreeTransformPosition(p_i := 0, p_j := 0, s := 200) {
	;~ Absolute:	127, 50 (less often used)
	;~ Relative:	135, 58 (default)
	;~ Client:	127, 50 (recommended)
	
	;~ i := 0 ; horizontal iteration (current column index)
	i := p_i ; horizontal iteration (current column index)
	j := p_j ; vertical iteration (current row index)
	c := 0.25 ; constant multiplier
	pixelsPerInch := 600 ; value of current pixels/inch setting
	w_max := 8.50 ; inches (size of paper width)
	v_max := 11.00 ; inches (size of paper height)
		
	
	; set transformation position
	Loop ; no specific count, uses bounds to break out of loop
	{
		;~ if (A_Index*c < w_max)
		
		if (i * (pixelsPerInch / 4) <= w_max * pixelsPerInch) {
			Send, !l
			;~ Sleep, s
			Send, d ; toolbar Layer > Duplicate Layer...
			Sleep, s
			Send, {Enter} ; confirm Duplicate Layer... popup
			Sleep, s
			Send, ^t ; free-transform tool
			Sleep, s
			Click, 135 58 2 ; x y click-count (position of X:value text-box of free-transform tool)
			Sleep, s
			Send, % i * (pixelsPerInch / 4) ; quarter-inch X position
			;~ Sleep, s
			Send, {Tab}
			;~ Sleep, s
			Send, % j * (pixelsPerInch / 4) ; quarter-inch Y position
			Sleep, s
			Send, {Enter}
			Send, {Enter}
			Sleep, s
			
			Tooltip, % "i=" . i . ", " . (i*pixelsPerInch) . "`n j=" . j . ", " . (j*pixelsPerInch)
			;~ waitForSpacebar()
			
			i := i+1
			
			;~ waitForSpacebar()
			
			continue ; next iteration of current loop thread
		}
		else if (i * (pixelsPerInch / 4) > w_max * pixelsPerInch) {
			i := 0 ; reset i (current column index)
			j := j+1 ; increment j (current row index)
			continue ; next iteration of current loop thread
		}
		else if (j * (pixelsPerInch / 4) > v_max * pixelsPerInch) {
			break ; end iteration of current loop thread
		}
		else {
			break ; end iteration of current loop thread
		}
	}
	
	ToolTip ; hide tooltip
	
}


photoshopMacro_Duplicate_FreeTransform_Vertical_yPosition(p_currentYPosition := 0, s := 200) {
	currentIndex := (p_currentYPosition / 150) + 1
	photoshopMacro_Duplicate_FreeTransform_Vertical(currentIndex, s)
	return
}

/* photoshopMacro_Duplicate_FreeTransform_Vertical(p_i := 0, p_j := 0, s := 200)
 * Description: This function runs a loop that 
		duplicates the selected layers/elements
 * 		and then free-transforms the objects to a new vertical position.
 */
photoshopMacro_Duplicate_FreeTransform_Vertical(p_i := 0, s := 200) {
	SetKeyDelay, 100
	;~ Absolute:	127, 50 (less often used)
	;~ Relative:	135, 58 (default)
	;~ Client:	127, 50 (recommended)
	
	i := p_i ; vertical iteration (current row index)
	c := 0.25 ; constant multiplier
	pixelsPerInch := 600 ; value of current pixels/inch setting
	v_max := 11.00 ; inches (size of paper height)
	
	; set transformation position
	Loop ; no specific count, uses bounds to break out of loop
	{
		;~ if (A_Index*c < w_max)
		yPosition := i * (pixelsPerInch / 4) 
		yMax := v_max * pixelsPerInch
		
		if (yPosition <= yMax) {
			
			Send, !l
			;~ Sleep, s
			Send, d ; toolbar Layer > Duplicate Layer...
			Sleep, s
			Send, {Enter} ; confirm Duplicate Layer... popup
			Sleep, s
			Send, ^t ; free-transform tool
			Sleep, s
			Click, 135 58 2 ; x y click-count (position of X:value text-box of free-transform tool)
			Sleep, s
			;~ Send, % xPosition ; quarter-inch X position
			;~ Sleep, s
			Send, {Tab}
			;~ Sleep, s
			Send, % yPosition ; quarter-inch Y position
			Sleep, s
			Send, {Enter}
			Send, {Enter}
			Sleep, s
			
			Tooltip, % "i=" . i . ", " . (i*pixelsPerInch) . "`n j=" . j . ", " . (j*pixelsPerInch)
			;~ waitForSpacebar()
			
			i := i+1
			
			;~ waitForSpacebar()
			
			continue ; next iteration of current loop thread
		}
		else {
			break ; end iteration of current loop thread
		}
	}
	
	ToolTip ; hide tooltip
	SetKeyDelay, 10

}