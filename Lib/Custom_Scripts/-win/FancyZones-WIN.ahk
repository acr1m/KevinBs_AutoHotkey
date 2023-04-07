/*
This program is for the purpose of iterating through the creation of 
multiple overlapping snap-regions (window-frames) for the FancyZones utility
which is a tool that is part of Microsoft PowerToys.
-------------------------------------------------------------------------------
*/

;@Ahk2Exe-SetMainIcon E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-icons\key-s05-green.ico
#SingleInstance

; set the working directory by targetting a folder (directory) location
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib
; include .ahk script files that are within the currently targetted directory
#Include Main-Method-Library-LIB.ahk
#Include repeatKey()-LIB.ahk
#Include run()-LIB.ahk
#Include TrayIconManager-LIB.ahk
 
; SET THE ICON REFERENCES
trayIM := new TrayIconManager()
trayIM.iconActive :=    A_WorkingDir . "\..\-icons\key-s05-green.ico"
trayIM.iconSuspended := A_WorkingDir . "\..\-icons\key-s05-blue.ico"
trayIM.iconPaused :=    A_WorkingDir . "\..\-icons\key-s05-yellow.ico"
trayIM.iconInactive :=  A_WorkingDir . "\..\-icons\key-s05-red.ico"	
trayIM.start(true) ; if arg is True, then include default tray icon menu items
run_AsAdmin(,true) ; (,true) -> shows a msgbox indicating success/failure of process
; ------------------------------------------------------------------------------


; SET THE NUMBER OF ROW AND COLUMN DIVISIONS FOR DESIRED WINDOW FRAMES
global G_NUMBER_OF_ROWS := 3 ; should be an integer from 1 to 12
global G_NUMBER_OF_COLUMNS := 2 ; should be an integer from 1 to 12
; ------------------------------------------------------------------------------

Pause::
{
    MsgBox, % A_ThisHotkey . " key was pressed. Exiting Application."
    ExitApp
}

; If this window is active...
#IfWinActive ahk_exe PowerToys.FancyZonesEditor.exe
;~ #IfWinActive FancyZones

;~ MsgBox, % "Jumped to " . A_ThisFunc . "."

NumpadAdd::
{
    /* MsgBox, % A_ThisHotkey . " key was pressed with the following window as active.`n`t"
            . "=" . A . ""
    */
    WinGetTitle, win_title, % "A"
    MsgBox, % A_ThisHotkey . " key was pressed and activated from #IfWinActive ahk_exe PowerToys.FancyZonesEditor.exe,`nwith the following window as active...`n" . win_title
    return
}


;  MUST HAVE THE CREATE NEW WINDOW BUTTON HIGHLIGHTED AS THE ACTIVE
;  SELECTION BY KEYBOARD NAVIGATION ALREADY. 
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

Numpad0::
{
    KeyWait, % "Numpad0"
    fancyZones_resetPos()
    return
}

; Re-declare any window as an acceptable 
; case-scenario before exit.
#IfWinActive

NumpadAdd::
{
    WinGetTitle, win_title , % "A"
    MsgBox, % A_ThisHotkey . " key was pressed and activated from #IfWinActive."
        . "The following window is active... `n" . win_title
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
    Loop, % p_loopCount
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
    ;  SELECTION BY KEYBOARD NAVIGATION ALREADY. 
    Send, {Space}^{Tab}+{Tab}
    
    ; This will serve as the total number of iterations 
    ; and windows to create, size, and set.
    loopCount := p_rows * p_cols
    
    ; ------------------------------------------------
    ; Calculate the window frame width and height based
    ;  on the active monitor pixel size. 
       
    ; Active monitor Width
    screen_Width  := A_ScreenWidth
    
    ; My taskbar is 40 pixels tall from the bottom on my monitor, which
    ;  might be different on other computers, so we'll subtract 
    ;  40 from the A_ScreenHeight before passing it into the Width variable.
    screen_Height := A_ScreenHeight - 40
    
    ; Window Width
    w := Floor(screen_Width / p_cols)
    
    ; Window Height
    h := Floor(screen_Height / p_rows)
    
    outStr := "loopCount = " . loopCount . "`n"
    outStr .= "screen_Width = " . screen_Width . "`n"
    outStr .= "screen_Height = " . screen_Height . "`n"
    outStr .= "w = " . w . "`n"
    outStr .= "h = " . h . "`n"
    MsgBox, , % "title", % outStr, 2
    main_showTooltip(outStr)

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
    
    Loop, % loopCount
    {
        ;~ MsgBox,,, % "A_Index = " . A_Index . " out of " . loopCount . "`n", 2
        outStr := "A_Index = " . A_Index . " out of " . loopCount . "`n"
        main_showTooltip(outStr, 2000)
        ;Calculate the position needed based on the current iteration 
        ;of the grid's total number of windows needed.
        
        
        ;x coordinate position
        ;from left to right, x = 0 to Max
        c := p_cols
        x := Mod( ( A_Index - 1 ), c ) * w
        
        /* if... 
            A_Index = 1 -> x = (1 - 1) * width
            A_Index = 2 -> x = (2 - 1) * width
            A_Index = 3 -> x = (3 - 1) * width
            A_Index = 4 -> x = (4 - 1) * width
            A_Index = 5 -> x = (Mod(5, cols) - 1) * width
            A_Index = 6 -> x = (Mod(6, cols) - 1) * width
            A_Index = 7 -> x = (Mod(7, cols) - 1) * width
            A_Index = 8 -> x = (Mod(8, cols) - 1) * width
            
            summary...
            x = Mod( ( A_Index - 1 ), c ) * w
        */
        
        /*  outStr := Mod( ( 1 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 2 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 3 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 4 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 5 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 6 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 7 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 8 - 1 ), 4 ) * 480 . "`n"
            outStr .= "---------------------------------`n"
            outStr .= Mod( ( 1 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 2 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 3 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 4 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 5 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 6 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 7 - 1 ), 4 ) * 480 . "`n"
            outStr .= Mod( ( 8 - 1 ), 4 ) * 480 . "`n"
            outStr .= "---------------------------------`n"
            MsgBox, % outStr
        */
        
        ; y coordinate position 
        ; from top to bottom, y = 0 to Max
        r := p_rows
        y := Mod( ( A_Index - 1 ), r ) * h
        
        fancyZones_setSize(w, h)
        fancyZones_setPos(x, y)
        
        ; Ctrl+Tab to navigate from window frame to floating toolbar,
        ;  Space to activate button to create a new window frame,
        ;  Ctrl+Tab to navigate from floating toolbar to 1st window frame,
        ;  Shift+Tab to navigate from 1st window frame to last window frame
        Send, ^{Tab}{Space}^{Tab}+{Tab}
    }
    return
}

; reduces window to minimum size possible 64x 72y
fancyZones_resetSize() {
    SendMode, Event
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
    SendMode, Event
    ; assign increment amounts of width and height
        ; get single digit, remainder value 
        ; e.g. Mod(436, 10) = 6
        ; divide that by 2
        ; e.g. 6 / 2 = 3
        ; incrAmnt = 3
    incrAmnt_w := Floor(Abs(Mod((param_w - 64), 10) / 2))
    incrAmnt_h := Floor(Abs(Mod((param_h - 72), 10) / 2))
    
    ; increments width by 2, one to four times, going from width=64 to width=72
    ;  if w = 400, increase amount for the width (incrAmnt_w) should be 3 (key presses)
    ;  which equals 6 pixels of added width, going from the minimum allowed window
    ;  frame width of 64 up to 70. 
    repeatCtrlShiftKey("Right", incrAmnt_w, 2)

    ; increments height by 2, one to four times, going from height=72 to height=80
    ;  if desired window frame height (h) = 400, 
    ;  then the increase amount for the height (incrAmnt_h) should be 4 (key presses)
    ;  which equals 8 pixels of added height, going from the minimum allowed window
    ;  frame height of 72 up to 80. 
    repeatCtrlShiftKey("Up", incrAmnt_h, 1)
    
    return [incrAmnt_w, incrAmnt_h]
}

fancyZones_setSize(w := 400, h := 400) {
    SendMode, Event
    fancyZones_resetSize()
    
    fancyZones_prepSize(w, h)
    ;~ incrAmnt := fancyZones_prepSize(w, h)
    ;~ incAmount1 := incrAmnt[1]
    ;~ incAmount2 := incrAmnt[2]
    Sleep, 1
    ;~ MsgBox, %incrAmnt[%]%`, %incrAmnt[1]%
    ;~ MsgBox, % "incrAmnt[1] = " . incrAmnt[1] . "`nincrAmnt[2] = " . incrAmnt[2] "`nend"
    ; w = 10(x)+ 70
    ; w - 70 = 10x
    keyPressAmountForWidth := Floor(Abs((w - 64) / 10))
    keyPressAmountForHeight := Floor(Abs((h - 72) / 10))
    repeatShiftKey("Right", keyPressAmountForWidth, 2)
    repeatShiftKey("Up", keyPressAmountForHeight, 2)
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
    
    /*
    keyPressAmountForXPos := p_xPosition
    keyPressAmountForYPos := p_yPosition
    repeatCtrlKey("Right", keyPressAmountForXPos)
    repeatCtrlKey("Down", keyPressAmountForYPos)
    */
    keyPressAmountForXPos := p_xPosition / 10
    keyPressAmountForYPos := p_yPosition / 10
    repeatKey("Right", keyPressAmountForXPos)
    repeatKey("Down", keyPressAmountForYPos)
    return
}