;INCLUDES/IMPORTS/INSTALLS==========================================


;INITIAL DIRECTIVES=================================================
	
	; n milliseconds delay
	;~ SendMode, Event	
	SendMode, Input	
	;~ SetKeyDelay, 05


;SCRIPT CONTROLLERS=================================================
	
	; [Ctrl+Alt+Shift+Space]
	^!+Space::
		Suspend, Toggle
		if (A_IsSuspended)
			MsgBox, Tab Mode = Tab
		else
			MsgBox, Tab Mode = 4 Spaces
		return


;MAIN PROCESSES======================================================
	
	; [Tab]
	Tab::Send, {Space 4}
	; [Shift+Tab]
	+Tab::Send, {Home}{Del 4}{End}


