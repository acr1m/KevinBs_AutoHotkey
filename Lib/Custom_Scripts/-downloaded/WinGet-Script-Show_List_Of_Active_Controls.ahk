/* DOWNLOADED SCRIPT FROM https://www.autohotkey.com/docs/commands/WinGet.htm#Examples
 * EXAMPLE #3.
 * Extracts the individual control names from the active window's control list.
 * 
 * WinGet, ActiveControlList, ControlList, A
 * Loop, Parse, ActiveControlList, `n
 * {
 *     MsgBox, 4,, Control #%A_Index% is "%A_LoopField%". Continue?
 *     IfMsgBox, No
 *         break
 * }
 */

;~ EDIT SUB

;~ stores info from active window into the variable 【ActiveControlList】
WinGet, ActiveControlList, ControlList, A


Loop, Parse, ActiveControlList, `n
{
    
    
    MsgBox, 4,, Control #%A_Index% is "%A_LoopField%". Continue?
    IfMsgBox, No
        break
}