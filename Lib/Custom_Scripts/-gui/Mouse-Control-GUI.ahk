;~ #Include E:\Assets\Scripts\AutoHotkey\Custom Scripts\AHK-Main-Method-Library.ahk
#Include %A_ScriptDir%\-lib
#Include Main-Method-Library-LIB.ahk
#Include Mouse-Swap-Primary-Button-LIB.ahk
#InstallKeybdHook
#InstallMouseHook
#SingleInstance
#Persistent

GUI_Mouse_Control:
;====================================================================
Gui, MouseControlPanel:Default
;~ Gui, Font, s10 cDefault, Consolas
;~ Gui, Font, s10 cSilver, Consolas
;~ Gui, Font, s10 cc0c0c0
;~ Gui, Font, s10 c2f1d31 ;dark maroon-purple
;~ Gui, Font, s10 c533357 ;light maroon-purple
;~ Gui, Font, s10 c68586a ;lighter desaturated maroon-purple
;~ Gui, Font, s10 ca290a5 ;lightest desaturated maroon-purple
Gui, Font, s10 ca290a5, Consolas ;lightest desaturated maroon-purple
Gui, Add, GroupBox,	x005 y015 w260  h90	+Center, Mouse Buttons
;~ Gui, Font, s14 c6f6372, Franklin Gothic Medium
;~ Gui, Font, s14 c6f6372, Lucida Sans Unicode
Gui, Font, s14 c6f6372, Lucida Sans
Gui, Add, Text,		x015 y038 w240  h20 +Center, Primary Mouse
;~ Gui, Font, s16 c2f1d31 ;dark maroon-purple
;~ Gui, Font, s18 c8a9a7d norm underline, Consolas
Gui, Font, s18 c9a9a9a norm,
if (PRIMARY_MOUSE == "Left"){
	leftRadioSwitch := 1
	rightRadioSwitch := 0
}
else if (PRIMARY_MOUSE == "Right"){
	leftRadioSwitch := 0
	rightRadioSwitch := 1
}
Gui, Add, Radio, 	x030 y065 w100  h30 gRadioLeft Checked%leftRadioSwitch% +Right, Left
Gui, Add, Radio, 	x150 y065 w100  h30 gRadioRight Checked%rightRadioSwitch%, Right

Gui, Font, s10 ca290a5 norm, Consolas ;lightest desaturated maroon-purple
Gui, Add, GroupBox, x005 y105 w260 h135 c +Center, Keyboard Buttons

Gui, Font, s10 ca290a5 norm, Lucida Sans ;lightest desaturated maroon-purple
Gui, Add, Button, 	x015 y130 w70  h30 , Esc
Gui, Add, Button, 	x095 y130 w70  h30 , F5
Gui, Add, Button, 	x175 y130 w70  h30 , Enter

Gui, Add, Button, 	x015 y165 w70  h30 , F11
Gui, Add, Button, 	x095 y165 w70  h30 , Spacebar
Gui, Add, Button, 	x175 y165 w70  h30 , Mixer

Gui, Add, Button, 	x015 y200 w70  h30 , Keyboard
Gui, Add, Button, 	x095 y200 w70  h30 , Sound
Gui, Add, Button, 	x175 y200 w70  h30 , Voice-`nmeeter
Gui, Font, s10 ca290a5, Consolas ;lightest desaturated maroon-purple
Gui, Add, GroupBox, x005 y250 w260 h80 +Center, Scroll Speed Acceleration
Gui, Font, s12 c533357, Gadugi ;light maroon-purple
Gui, Add, Slider, 	x020 y270 w230 h30 , v
Gui, Add, Text, 	x020 y305 w70  h20 , None
Gui, Add, Text, 	x180 y305 w70  h20 +Right, Max
; Generated using SmartGUI Creator for SciTE
;~ gosub, GuiShow
;~ SetTimer, GuiSubmitControllerVariables, 100
return

GuiShow_Mouse_Control:
Gui, MouseControlPanel:Show, w270 h335, Mouse Control Panel
return

GuiSubmitControllerVariables:
Gui, MouseControlPanel:Submit, NoHide
return

GuiEscape:
Gui, MouseControlPanel:Submit
Gui, MouseControlPanel:Hide
return

MouseControlPanelGuiClose:
Gui, MouseControlPanel:Submit
Gui, MouseControlPanel:Hide
return

RadioLeft:
SetKeyDelay, 50
Send, {LWin}mouse and touch{Enter}
Sleep, 100
Send, {Up}
Sleep, 600
#IfWinExist Settings
WinClose
SetKeyDelay, -1
;~ assignPrimaryMouseButton("Left")
;~ Gui, Submit, NoHide
return

RadioRight:
SetKeyDelay, 50
Send, {LWin}mouse and touch{Enter}
Sleep, 100
Send, {Down}
Sleep, 600
#IfWinExist Settings
WinClose
SetKeyDelay, -1
;~ assignPrimaryMouseButton("Right")
;~ Gui, Submit, NoHide
return

ButtonEsc:
Send, !{Tab}
Sleep, 100
Send, {Escape}
Send, !{Tab}
return

ButtonF5:
Send, !{Tab}
Sleep, 100
Send, {F5}
Send, !{Tab}
return

ButtonEnter:
Send, !{Tab}
Sleep, 100
Send, {Enter}
Send, !{Tab}
return

ButtonSpace:
ButtonSpacebar:
Send, !{Tab}
Sleep, 100
Send, {Space}
Send, !{Tab}
return

ButtonKeyboard:
Send, #^o
return

ButtonSound:
Run, "E:\Assets\Scripts\Windows Commands\Sound Control Panel - Playback Tab.bat"
return

ButtonMixer:
Send, #r
Sleep, 200
Send, sndvol{Enter}
return

ButtonVoice-meeter:
ButtonVoicemeeter:
if (WinExist("VoiceMeeter ahk_class VBCABLE0Voicemeeter0MainWindow0 ahk_exe voicemeeter.exe"))
	WinActivate
else
	Run, "C:\Users\Kevin B - (Acr1m)\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\VB Audio\Voicemeeter\Voicemeeter.LNK"
return

ButtonF11:
Send, !{Tab}
Sleep, 100
Send, {F11}
Send, !{Tab}
return