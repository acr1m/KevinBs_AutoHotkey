

;~ Progress, m2 b zh0, Text here
;~ Sleep, 4000


/* Progress, b w200, My SubText, My MainText, My Title
 * Progress, 50 ; Set the position of the bar to 50%.
 * Sleep, 4000
 * Progress, Off 
 */


;~ Gui, +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
;~ Gui, -SysMenu +Owner +OwnDialogs  ; +Owner avoids a taskbar button.
Gui, -SysMenu +Owner  ; +Owner avoids a taskbar button.
Gui, Add, Text,, Some text to display.
Gui, Add, Text, cgreen gMySubRoutine, Click here to run sub-routine.
Gui, Add, Text, cgreen gMovingProgressBar, Click here to run MovingProgressBar.
;~ Gui, Show, NoActivate, Title of Window  ; NoActivate avoids deactivating the currently active window.
Gui, Show,, Untitled
Sleep, 5000
return ; End of auto-execute section. The script is idle until the user does something.



MySubRoutine:
MsgBox, msgbox from sub-routine.
return



MovingProgressBar:
Gui, 
Gui, Color, White
Gui, Add, Picture, x0 y0 h350 w450, %A_WinDir%\system32\ntimage.gif
Gui, Add, Button, Default xp+20 yp+250, Start the Bar Moving
Gui, Add, Progress, vMyProgress w416
Gui, Add, Text, vMyText wp  ; wp means "use width of previous".
Gui, Show
return

ButtonStartTheBarMoving:
Loop, %A_WinDir%\*.*
{
    if (A_Index > 100)
        break
    GuiControl,, MyProgress, %A_Index%
    GuiControl,, MyText, %A_LoopFileName%
    Sleep 50
}
GuiControl,, MyText, Bar finished.
return

GuiEscape:
GuiClose:
;~ Gui, Hide 
ExitApp