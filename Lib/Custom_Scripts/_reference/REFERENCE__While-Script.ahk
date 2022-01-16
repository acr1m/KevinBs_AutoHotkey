CoordMode, Mouse, Screen

~LButton::
    MouseGetPos, begin_x, begin_y
    while GetKeyState("LButton")
    {
        MouseGetPos, x, y
        ToolTip, % begin_x ", " begin_y "`n" Abs(begin_x-x) " x " Abs(begin_y-y)
        Sleep, 10
    }
    ToolTip
return