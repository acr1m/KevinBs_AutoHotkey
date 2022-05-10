#IfWinActive ahk_exe GenshinImpact.exe
;;If window is active

;; fail-safe breaker switch
Pause::
	ExitApp
	return

::wa::
::ww::
	Send, Windwheel Asters{Enter}
	return
::mc::
::mm::
	Send, Magic Crystals{Enter}
	return
::sg::
::ss::
	Send, Sea Ganoderma{Enter}
	return




;; Screen:	1751, 438 (less often used)
;; Window:	1751, 438 (default)
;; Client:	1751, 438 (recommended)
;; Color:	E48273 (Red=E4 Green=82 Blue=73)

;; targetPos := [1751, 438] ;; xPos, yPos 

^l::
	;; SetTimer, Lbl_clickLockButton, -2000 ;; activates subroutine parellel to this thread. 
	
	;; Sleep, 1000
	gosub, Lbl_clickLockButton ;; runs subroutine before continuing to next line.
	
	;; MsgBox, , % "l::", % "end of l::"
	
	;; ExitApp
	return

Lbl_clickLockButton:
	targetPos := [1751, 438] ;; xPos, yPos 
	;; targetPos := [500, 400] ;; xPos, yPos 
	
	mouseSpeed := 0 ;; Note: A speed of 0 will move the mouse instantly.
	clickLockButton(targetPos[1], targetPos[2], mouseSpeed)
	
	;; clickLockButton(1751, 438)
	;; clickLockButton(727, 185)
	return
	
clickLockButton(xPos := 1751, yPos := 438, mSpeed := 0) {
	
	MouseGetPos, mX, mY ;; initial mouse position
	
;; click the target location
;;	MouseClick [, WhichButton, X, Y, ClickCount, Speed, DownOrUp, Relative]
	MouseClick, left, % xPos, % yPos, 1, % mSpeed
	;; MouseClick, left, % xPos, % yPos, 1, % mSpeed, , R
	;; Click, left %xPos% %yPos% 
	;; MouseClick, left, % targetPos[1], % targetPos[2]
	;; Click, % left targetPos[1] targetPos[2]
	;; Click, left 1751 438
	;; Send {Click left %mX% %mY%}
	
;;Click, xPos, yPos, click: 0 times // return mouse to initial position
	MouseMove, % mX, % mY, % mSpeed
	;; MouseMove, % mX, % mY, % mSpeed, R
	;; Click, %mX% %mY% 0 
	;; Send, {Click %mX% %mY% 0}
	
	;; MsgBox, , % "Lbl_clickLockButton", % "end of Lbl_clickLockButton"
	
	return
}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive
