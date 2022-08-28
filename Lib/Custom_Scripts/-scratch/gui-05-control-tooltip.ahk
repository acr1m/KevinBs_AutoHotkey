Gui, Add, Edit, vMyEdit
MyEdit_TT := "This is a tooltip for the control whose variable is MyEdit."
Gui, Add, DropDownList, vMyDDL, Red|Green|Blue
MyDDL_TT := "Choose a color from the drop-down list."
Gui, Add, Checkbox, vMyCheck, This control has no tooltip.
Gui, Show
OnMessage(0x0200, "WM_MOUSEMOVE")
return

WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT  ; _TT is kept blank for use by the ToolTip command below.
    CurrControl := A_GuiControl
    if (CurrControl != PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip  ; Turn off any previous tooltip.
        SetTimer, DisplayToolTip, 1000
        PrevControl := CurrControl
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip % %CurrControl%_TT  ; The leading percent sign tell it to use an expression.
    SetTimer, RemoveToolTip, 3000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}


GuiClose:
ExitApp