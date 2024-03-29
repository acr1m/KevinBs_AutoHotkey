#Include E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK_Main_Method_Library.ahk
#Persistent

;GET MOUSE POS AS PERCENTAGE - TOOLTIP
CoordMode, Mouse, Client
;~ CoordMode, Mouse, Screen

global v_winWidth
global v_winHeight

;~ MouseGetPos, v_xpos, v_ypos 
;~ MsgBox, The cursor is at X%v_xpos% Y%v_ypos%. 

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
SetTimer, WatchCursor, 100
return

WatchCursor:
v_curWin := WinExist("A")
MouseGetPos, v_mX, v_mY, v_windowID, v_control
WinGetPos, v_winX, v_winY, v_winWidth, v_winHeight, A
WinGetTitle, v_title, ahk_id %v_windowID%
WinGetClass, v_class, ahk_id %v_windowID%
WinGetActiveStats, v_title2, v_winWidth2, v_winHeight2, v_winX2, v_winY2

;getClientSize(window, ByRef width, ByRef height)
getClientSize(v_curWin, v_clientWidth, v_clientHeight)

v_mXPercentage := (v_mX / v_winWidth)
v_mYPercentage := (v_mY / v_winHeight)


;~ str_mousePos := 


;~ ToolTip, `nmousePos`(%v_mXPercentage%`%`, %v_mYPercentage%`%`)`nahk_id %v_windowID%`nahk_class %v_class%`n%v_title%`nControl: %v_control%
;~ ToolTip, `nmousePos = `(X: %v_mX%`, %v_mXPercentage% `%`, Y: %v_mY%`, %v_mYPercentage% `%`)`nw`, h = %v_winWidth%`, %v_winHeight%`nahk_class %v_class%`n%v_title%`, %v_title2%`nControl: %v_control%
;~ ToolTip, `nmousePos:`tX: %v_mX%`t`tY: %v_mY%`nmouse`%:`tX: %v_mXPercentage%`%`tY: %v_mYPercentage%`%`nclient size:`tw: %v_clientWidth%`t`th: %v_clientHeight%`nwindow size:`tw: %v_winWidth%`t`th: %v_winHeight%`nahk_class %v_class%`n%v_title%`nControl: %v_control%
;~ ToolTip % "`nmousePos:`tX: " . v_mX . "`t`tY: " . v_mY . "`nmouse`%:`tX: " . v_mXPercentage . "`%`tY: " . v_mYPercentage . "`%`nclient size:`tw: " . v_clientWidth . "`t`th: " . v_clientHeight . "`nwindow size:`tw: " . v_winWidth . "`t`th: " . v_winHeight . "`nahk_class " . v_class . "`n" . v_title . "`nControl: " . v_control . ""
ToolTip % "`nmousePos:`tX: " . v_mX . "`t`tY: " . v_mY 
	. "`nmouse`%:`tX: " . v_mXPercentage . "`%`tY: " . v_mYPercentage . "`%" 
	. "`nclient size:`tw: " . v_clientWidth . "`t`th: " . v_clientHeight 
	. "`nwindow size:`tw: " . v_winWidth . "`t`th: " . v_winHeight 
	. "`nahk_class " . v_class . "`n" . v_title 
	. "`nControl: " . v_control . ""
return


;COPY ALL TOOLTIP TEXT TO CLIPBOARD
^c::
	Clipboard = `nmousePos:`t`tX: %v_mX%`t`tY: %v_mY%`nmousePercent:`tX: %v_mXPercentage%`%`tY: %v_mYPercentage%`%`nClient size:`tw: %v_clientWidth%`t`th: %v_clientHeight%`nWindow size:`tw: %v_winWidth%`t`th: %v_winHeight%`nahk_class %v_class%`nTitle: %v_title%`nControl: %v_control%
	return




Pause::ExitApp
;~ Escape::ExitApp
