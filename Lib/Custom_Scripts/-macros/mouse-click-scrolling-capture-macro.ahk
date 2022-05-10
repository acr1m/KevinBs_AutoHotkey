;; MouseClick, Left, 1887, 1045, 1, 0
#Include %A_LineFile%\..\..\-lib\Main-Method-Library-LIB.ahk

Pause::ExitApp

$Space::loopSend("Space", 2, 50)
;; $Right::gosub, loadNextPage
;; $Left::gosub, loadPrevPage
;; $F13::gosub, lbl_ScrollingMethod





lbl_ScrollingMethod:
	gosub, startScrollingCapture
	gosub, loadNextPage
	gosub, navigateBackToScrollingCaptureWindow
	return
startScrollingCapture:
	WinActivate, ShareX - Scrolling capture ahk_exe ShareX.exe
	Send, {Space}
	Sleep, 300
	MouseClick, % "L", 1000, 200, 1, 0 ;; click browser window
	Sleep, 4000
	return
navigateBackToScrollingCaptureWindow:
	WinActivate, ShareX - Scrolling capture ahk_exe ShareX.exe
	Sleep, 150
	Send, ^{Tab}
	return
loadNextPage:
	MouseClick, % "L", 1000, 200, 1, 0 ;; click browser window
	Sleep, 150
	Send, {Right}
	return	
loadPrevPage:
	MouseClick, % "L", 1000, 200, 1, 0 ;; click browser window
	Sleep, 150
	Send, {Left}
	return


;; Absolute:	1792, 992 (less often used)
;; Relative:	1800, 1000 (default)
;; Client:	1792, 1000 (recommended)



	
Lbl_macroLoop:
	KeyWait, RControl
	Send, {Space}
	;; MouseClick, Left
	
	Sleep, % (g_loopTime*0.05)
	MouseClick, % "L", 1000, 200, 1, 0 ;; click browser window
	;; mouseClick(1000, 200, 0) ;; click browser window
	Sleep, % (g_loopTime*0.8)

	;; MouseClick, "L", 1792, 992, 1, 0 ;; click page number textbox
	;; mouseClickExplicit("R", 1792, 992, 1, 2) ;; click page number textbox
	;; mouseClick(1792, 992, 0) ;; click page number textbox
	
	MouseClick, % "L", 1887, 1045, 1, 0 ;; click next page button
	;; mouseClick(1887, 1045, 0) ;; click next page button
	
	WinActivate, ShareX - Scrolling capture ahk_exe ShareX.exe
	Sleep, % (g_loopTime*0.05)
	;; Sleep, 500
	Send, ^{Tab}
	return



	;;Click, xPos, yPos, click: 0 times // return mouse to initial position
