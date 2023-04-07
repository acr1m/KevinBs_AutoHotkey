; TODO: 2022-02-13_03-48-41_PM (acr1m)
;  - replace ALT-modifier key with CAPS-LOCK
;-------------------------------------------------------------------------------
; Easy Window Dragging -- KDE style (requires XP/2k/NT) -- by Jonny
; https://www.autohotkey.com
;
; This script makes it much easier to move or resize a window: 1) Hold down
; the ALT key and LEFT-click anywhere inside a window to drag it to a new
; location; 2) Hold down ALT and RIGHT-click-drag anywhere inside a window
; to easily resize it; 3) Press ALT twice, but before releasing it the second
; time, left-click to minimize the window under the mouse cursor, right-click
; to maximize it, or middle-click to close it.

; This script was inspired by and built on many like it
; in the forum. Thanks go out to ck, thinkstorm, Chris,
; and aurelian for a job well done.
;-------------------------------------------------------------------------------
; Change history:
; November 07, 2006: Optimized resizing code in !RButton, courtesy of bluedawn.
; February 05, 2006: Fixed double-alt (the ~Alt hotkey) to work with latest versions of AHK.
;-------------------------------------------------------------------------------
; Instructions:
;  The Double-Alt modifier is activated by pressing
;  Alt twice, much like a double-click. Hold the second
;  press down until you click.
;
; The shortcuts:
;  Alt + Left Mouse Button  : Drag to move a window.
;  Alt + Right Mouse Button : Drag to resize a window.
;  Double-Alt + Left Mouse Button   : Minimize a window.
;  Double-Alt + Right Mouse Button  : Maximize/Restore a window.
;  Double-Alt + Middle Mouse Button : Close a window.
;
; You can optionally release Alt after the first
;  click rather than holding it down the whole time.

;-----------------------------------
; Beginning of Kevin Boykin's Sub

;;~ set the icon references
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\_used-icons\up-down-scroll.ico

; TrayIconManager-LIB.ahk provides a <TrayIconManager> class object
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\TrayIconManager-LIB.ahk
;~ #Include %A_ScriptDir%\..\-lib\TrayIconManager-LIB.ahk
trayIM := new TrayIconManager()
trayIM.iconActive :=    "..\-icons\key-s05-green.ico"
trayIM.iconSuspended := "..\-icons\key-s05-blue.ico"
trayIM.iconPaused :=    "..\-icons\key-s05-yellow.ico"
trayIM.iconInactive :=  "..\-icons\key-s05-red.ico"		
trayIM.start() 

formatRegion1 := 24
formatRegion2 := 32
tipString := Format("{1:-" 	    . formatRegion1 . "}   {2:-" 
								. formatRegion2 . "}", "The shortcuts", "")
tipString .= Format("`r`n{1:" 	. formatRegion1 . "} : {2:-" 
								. formatRegion2 . "}", "Alt + L_Mouse", "Drag to move a window.")
tipString .= Format("`r`n{1:" 	. formatRegion1 . "} : {2:-" 
								. formatRegion2 . "}", "Alt + R_Mouse", "Drag to resize a window.")
tipString .= Format("`r`n{1:" 	. formatRegion1 . "} : {2:-" 
								. formatRegion2 . "}", "Double-Alt + L_Mouse", "Minimize a window.")
tipString .= Format("`r`n{1:" 	. formatRegion1 . "} : {2:-" 
								. formatRegion2 . "}", "Double-Alt + R_Mouse", "Maximize/Restore a window.")
tipString .= Format("`r`n{1:" 	. formatRegion1 . "} : {2:-" 
								. formatRegion2 . "}", "Double-Alt + M_Mouse", "Close a window.")


;~ Menu, Tray, Tip, %tipString%
Menu, Tray, Add, % "Show Hotkey Controls", Lbl_Show_Hotkey_Controls

; script will cascade and run through this label during the auto-execute portion
Lbl_Show_Hotkey_Controls:

    MsgBox, %tipString%
    
    ;~ ListVars  ; Use AutoHotkey's main window to display monospaced text.
    ;~ WinWaitActive ahk_class AutoHotkey
    ;~ WinSet, Region, W200 H250, ahk_class AutoHotkey
    ;~ ControlSetText Edit1, %tipString%
    
return

; End of Kevin Boykin's Sub
;-------------------------------------

If (A_AhkVersion < "1.0.39.00")
{
    MsgBox,20,,This script may not work properly with your version of AutoHotkey. Continue?
    IfMsgBox,No
    ExitApp
}


; This is the setting that runs smoothest on my
; system. Depending on your video card and cpu
; power, you may want to raise or lower this value.
SetWinDelay,2

CoordMode,Mouse
return

!LButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; This message is mostly equivalent to WinMinimize,
    ; but it avoids a bug with PSPad.
    PostMessage,0x112,0xf020,,,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
}
return

!RButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    ; Toggle between maximized and restored state.
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
    If KDE_Win
        WinRestore,ahk_id %KDE_id%
    Else
        WinMaximize,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
    KDE_WinLeft := 1
Else
    KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
    KDE_WinUp := 1
Else
    KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return

; "Alt + MButton" may be simpler, but I
; like an extra measure of security for
; an operation like this.
!MButton::
If DoubleAlt
{
    MouseGetPos,,,KDE_id
    WinClose,ahk_id %KDE_id%
    DoubleAlt := false
    return
}
return

; This detects "double-clicks" of the alt key.
~Alt::
; DoubleAlt will be assigned TRUE only if this 
;  hotkey is triggered again within 400 milliseconds.
DoubleAlt := A_PriorHotkey = "~Alt" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait Alt  ; This prevents the keyboard's auto-repeat feature from interfering.
return
