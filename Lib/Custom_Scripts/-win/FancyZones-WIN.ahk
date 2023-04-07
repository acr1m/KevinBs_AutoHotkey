#SingleInstance

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\repeatKey()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
;~ #Include % A_MyDocuments . "\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk"
;~ #Include % A_MyDocuments . "\AutoHotkey\Lib\Custom_Scripts\-lib\repeatKey()-LIB.ahk"
;~ #Include % A_MyDocuments . "\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk"
run_AsAdmin(,true) ; (,true) -> shows a msgbox indicating success/failure of process

; utilizes methods 


global G_NUMBER_OF_ROWS := 2 ; should be an integer from 1 to 12
global G_NUMBER_OF_COLUMNS := 4 ; should be an integer from 1 to 12

Pause::
{
    MsgBox, % A_ThisHotkey . " key was pressed. Exiting Application."
    ExitApp
}

; If this window is active
;~ #IfWinActive FancyZones Layout ahk_exe PowerToys.FancyZonesEditor.exe
#IfWinActive ahk_exe PowerToys.FancyZonesEditor.exe
;~ #IfWinActive FancyZones

;~ MsgBox, % "Jumped to " . A_ThisFunc . "."

NumpadAdd::
{
    MsgBox, % A_ThisHotkey . " key was pressed with the following window as active.`n`t"
            . "=" . A . ""
    return
}

NumpadSub::
{
/*     MsgBox, % A_ThisHotkey . " key was pressed. Creating new Window Zones of`n`t"
 *             . G_NUMBER_OF_ROWS . " rows and " . G_NUMBER_OF_COLUMNS . " columns."
 */
    KeyWait, % "NumpadSub"
    ;~ fancyZones_createWindow(wnd_width, wnd_height, loop_count)
    
    fancyZones_createWindowGrid(G_NUMBER_OF_ROWS, G_NUMBER_OF_COLUMNS)
    
    return
}
; Re-declare any window as an acceptable 
; case-scenario before exit.
#IfWinActive

NumpadAdd::
{
    MsgBox, % A_ThisHotkey . " key was pressed. "
    return
}

; used for debugging
;~ Pause::ExitApp


; FUNCTIONS
; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
            outer_loop_count
            :   g_col
            :   : 1         2         3         4
g_row   1   01__[11]  02__[12]  03__[13]  04__[14]
        2   05__[21]  06__[22]  07__[23]  08__[24]
        3   09__[31]  10__[32]  11__[33]  12__[34]
        4   13__[41]  14__[42]  15__[43]  13__[44]
        5   17__[51]  18__[52]  19__[53]  20__[54]
*/
fancyZones_createWindow(p_wnd_width, p_wnd_height, p_loopCount := 1) {
    
    ; if Loop number < 1, then Loop is skipped.
    Loop, p_loopCount
    {
        fancyZones_setSize(p_wnd_width, p_wnd_height)
        fancyZones_setPos(p_wnd_width, p_wnd_height)
        
        ; Create a new floating\-window-zone and select it.
        Send, ^{Tab}{Space}^{Tab}+{Tab}
    }
}

; this creates a grid of window zones of `a` rows and `b` columns             
fancyZones_createWindowGrid(p_rows, p_cols) {
    
    ; Create a new floating-window-zone and select it.
    ;  MUST HAVE THE CREATE NEW WINDOW BUTTON HIGHLIGHTED AS THE ACTIVE
    ;  SELECTION THROUGH KEYBOARD NAVIGATION ALREADY. 
        Send, {Space}^{Tab}+{Tab}
    
    ; This will serve as the total number of iterations 
    ; and windows to create, size, and set.
    loopCount := p_rows * p_cols
    
    ; Calculate the size for all windows based off of the 
    ; active monitor size.
    screen_Width  := A_ScreenWidth
    ; window width
    w := Floor(screen_Width / p_cols)
    ; my taskbar is 40 pixels tall from the bottom, which
    ; might be different on other computers, so we'll subtract 
    ; 40 from the A_ScreenHeight before passing it into the width var.
    screen_Height := A_ScreenHeight - 40
    ; window height
    h := Floor(screen_Height / p_rows)
    
    Loop, loopCount
    {
        ;Calculate the position needed based on the current iteration 
        ;of the grid's total number of windows needed.
/* ( 0   , 0    )
 * ( 480 , 384  )
 * ( 960 , 768  )
 * ( 1440, 1152 )
 * ( 0   , 1536 )
 * ( 480 , 0    )
 * ( 960 , 384  )
 * ( 1440, 768  )
 * ( 0   , 1152 )
 * ( 480 , 1536 )
 * ( 960 , 0    )
 * ( 1440, 384  )
 * ( 0   , 768  )
 * ( 480 , 1152 )
 * ( 960 , 1536 )
 * ( 1440, 0    )
 * ( 0   , 384  )
 * ( 480 , 768  )
 * ( 960 , 1152 )
 * ( 1440, 1536 )
 */
        
        ;x coordinate position
        ;from left to right, x = 0 to Max
        x := Mod( ( A_Index - 1 ), c ) * w / c
        ; y coordinate position 
        ; from top to bottom, y = 0 to Max
        y := Mod( ( A_Index - 1 ), r ) * w / r
        
        fancyZones_setSize(x, y)
         fancyZones_setPos(p_wnd_width, p_wnd_height)
        
        ; Create a new floating\-window-zone and select it.
        Send, ^{Tab}{Space}^{Tab}+{Tab}
    }
}

; reduces window to minimin size possible 64x 72y
fancyZones_resetSize() {
    SendMode, Input
    repeatShiftKey("Left", 150, 2)
    ;~ repeatShiftKey("Right", 10, 2)
    repeatShiftKey("Down", 150, 2)
    ;~ repeatShiftKey("Up", 10, 2)
    ; size is now at 164x 172y
    return
}

; increase window size to evenly divisible 
; number by 10's based off of target window size. 
fancyZones_prepSize(param_w, param_h) {
    SendMode, Input
    ; assign increment amounts of width and height
        ; get single digit, remainder value 
        ; e.g. Mod(436, 10) = 6
        ; divide that by 2
        ; e.g. 6 / 2 = 3
        ; incrAmnt = 3
    incrAmnt_w := Floor(Abs(Mod((param_w - 64), 10) / 2))
    incrAmnt_h := Floor(Abs(Mod((param_h - 72), 10) / 2))
    
    ; increments width by 2, one to four times, going from width=64 to width=72
    ; ; if w = 400, incrAmnt_w output should be 3
    repeatCtrlShiftKey("Right", incrAmnt_w, 2)

    ; increments height by 2, one to four times, going from height=72 to height=80
    ; ; if h = 400, incrAmnt_h output should be 4
    repeatCtrlShiftKey("Up", incrAmnt_h, 1)
    
    return [incrAmnt_w, incrAmnt_h]
}

fancyZones_setSize(w := 400, h := 400) {
    SendMode, Input
    fancyZones_resetSize()
    
    incrAmnt := fancyZones_prepSize(w, h)
    incAmount1 := incrAmnt[1]
    incAmount2 := incrAmnt[2]
    Sleep, 1
    ;~ MsgBox, %incrAmnt[%]%`, %incrAmnt[1]%
    ;~ MsgBox, % "incrAmnt[1] = " . incrAmnt[1] . "`nincrAmnt[2] = " . incrAmnt[2] "`nend"
    ; w = 10(x)+ 70
    ; w - 70 = 10x
    x := Floor(Abs((w - 64) / 10))
    y := Floor(Abs((h - 72) / 10))
    repeatShiftKey("Right", x, 2)
    repeatShiftKey("Up", y, 2)
    Sleep, 400
    SendMode, Event
    return
}

fancyZones_resetPos() {
    repeatKey("Left", 300)
    repeatKey("Up", 300)
    return
}
fancyZones_setPos(p_xPosition, p_yPosition) {
    fancyZones_resetPos()
    repeatCtrlKey("Right", p_xPosition)
    repeatCtrlKey("Down", p_yPosition)
    return
}