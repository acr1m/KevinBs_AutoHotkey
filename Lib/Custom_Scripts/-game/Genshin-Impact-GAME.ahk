#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin(,true) ; (,true) -> shows a msgbox indicating success/failure of process



/**
 * This script modifies the input/output of XBox1 Controller for
 *  the game, Genshin Impact by MiHoyo, hosted through the 
 *  Epic Games Launcher desktop client for Windows 10.
 * 
 */

#IfWinActive

;;TODO 2022-03-08 - capture control stick input

/* 
 ~~ the following cannot be used as hotkeys ~~
   - JoyX, JoyY, JoyZ, JoyR, JoyU, JoyV, JoyPOV, JoyName, JoyButtons, JoyAxes, JoyInfo
   - Must use <GetKeySate()> to access the values of the predefined variables above. 
*/


1Joy1::MsgBox, , % " Joy1", % " Joy1 A" 
1Joy2::MsgBox, , % " Joy2", % " Joy2 B"
1Joy3::MsgBox, , % " Joy3", % " Joy3 X"
1Joy4::MsgBox, , % " Joy4", % " Joy4 Y"
1Joy5::MsgBox, , % " Joy5", % " Joy5 LB"
1Joy6::MsgBox, , % " Joy6", % " Joy6 RB"
1Joy7::MsgBox, , % " Joy7", % " Joy7 Menu/Select"
1Joy8::MsgBox, , % " Joy8", % " Joy8 Start"
1Joy9::MsgBox, , % " Joy9", % " Joy9 L3"
1Joy10::MsgBox, , % "Joy10", % "Joy10 R3"
1Joy11::MsgBox, , % "Joy11", % "Joy11 XBox Button"
1Joy12::MsgBox, , % "Joy12", % "Joy12 has been pressed"
1Joy13::MsgBox, , % "Joy13", % "Joy13 has been pressed"
1Joy14::MsgBox, , % "Joy14", % "Joy14 has been pressed"
1Joy15::MsgBox, , % "Joy15", % "Joy15 has been pressed"
1Joy16::MsgBox, , % "Joy16", % "Joy16 has been pressed"
1Joy17::MsgBox, , % "Joy17", % "Joy17 has been pressed"
1Joy18::MsgBox, , % "Joy18", % "Joy18 has been pressed"
1Joy19::MsgBox, , % "Joy19", % "Joy19 has been pressed"
1Joy20::MsgBox, , % "Joy20", % "Joy20 has been pressed"
1Joy21::MsgBox, , % "Joy21", % "Joy21 has been pressed"
1Joy22::MsgBox, , % "Joy22", % "Joy22 has been pressed"
1Joy23::MsgBox, , % "Joy23", % "Joy23 has been pressed"
1Joy24::MsgBox, , % "Joy24", % "Joy24 has been pressed"
1Joy25::MsgBox, , % "Joy25", % "Joy25 has been pressed"
1Joy26::MsgBox, , % "Joy26", % "Joy26 has been pressed"
1Joy27::MsgBox, , % "Joy27", % "Joy27 has been pressed"
1Joy28::MsgBox, , % "Joy28", % "Joy28 has been pressed"
1Joy29::MsgBox, , % "Joy29", % "Joy29 has been pressed"
1Joy30::MsgBox, , % "Joy30", % "Joy30 has been pressed"
1Joy31::MsgBox, , % "Joy31", % "Joy31 has been pressed"
1Joy32::MsgBox, , % "Joy32", % "Joy32 has been pressed"


/* 
 * ;;Example from.... https://www.autohotkey.com/docs/Hotkeys.htm
 * 
 * ;;Joystick hotkeys do not currently support modifier prefixes such as ^ (Ctrl) and # (Win). However, you can use GetKeyState to mimic this effect as shown in the following example:
 * *****************************************
 * Joy2::
 * if not GetKeyState("Control")  ; Neither the left nor right Control key is down.
 *     return  ; i.e. Do nothing.
 * MsgBox You pressed the first joystick's second button while holding down the Control key.
 * return
 * *****************************************
 */





#IfWinActive ahk_exe GenshinImpact.exe




#IfWinActive 


