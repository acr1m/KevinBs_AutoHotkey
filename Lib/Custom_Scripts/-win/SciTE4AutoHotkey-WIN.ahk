#SingleInstance Force

#IfWinActive
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\autohotkey-scite\SciTE_500.ico
Menu, Tray, Icon, % "E:\Assets\Icons\autohotkey-scite\SciTE_500.ico"
; ;@AHK2Exe-IgnoreBegin
; global WIN_TITLE_SCITE := ahk_exe SciTE.exe
; ;@AHK2Exe-IgnoreEnd
; #Include %A_ScriptDir%\..\-lib\Main-Method-Library-LIB.ahk

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
; #Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Emojis-And-Symbols-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\repeatKey()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\RegEx()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\WM-List-LIB.ahk

;_START_OF_SCITE_HOTKEYS____________________________________________________________________________
#IfWinActive ahk_exe SciTE.exe

SciTE_exe := "E:\Software\AutoHotkey_MyInstallation_v01\SciTE\SciTE.exe"

;_FILE_SHORTCUTS_TO_API_SETTINGS____________________________________________________________________

; open selected filename
^+e::PostMessage, 0x0111, 103, 0, , ahk_exe SciTE.exe

; open user properties file
^!u::PostMessage, 0x0111, 461, 0, , ahk_exe SciTE.exe

; open user.ahk.api properties file
^!a::
^!p::
^!i::
	Run, %SciTE_exe% "E:\Library\OneDrive\Documents\AutoHotkey\SciTE\user.ahk.api"
	return

; open the AutoHotkey file for SciTE (literally the file you are reading: "SciTe4AutoHotkey-WIN.ahk")
^!s::Run, %SciTE_exe% "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-win\SciTE4AutoHotkey-WIN.ahk"

; open abbreviations file
^!b::PostMessage, 0x0111, 463, 0, , ahk_exe SciTE.exe
;___________________________________________________________________________________________________

; These two lines turn off the hotkey defined for double-tapping the quotation-marks [Ctrl+Shift+']
Hotkey, IfWinActive, ahk_exe SciTE.exe
Hotkey, ~+', , Off

; "|" - puts the caret inside of quotation-marks when double-tapped
~+':: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

; %|% - puts the caret inside of percent-signs when double-tapped
~+5:: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

; Ctrl+Alt+Left|2390|\ 
^!Left::Send, ^/

; Ctrl+Alt+Shift+Left|2391|\
^!+Left::Send, ^+/

; Ctrl+Alt+Right|2392|\
^!Right::Send, ^\

; Ctrl+Alt+Shift+Right|2393|\
^!+Right::Send, ^+\

; Redo (alternative hotkey)
^+z::Send, ^y

; toggle word wrap
F8::PostMessage, 0x0111, 414, 0, , ahk_exe SciTE.exe

; copy path of current file/tab (Copy Pat&h",  118)
^+c::PostMessage, 0x0111, 118, 0, , ahk_exe SciTE.exe

; "Make &Selection Uppercase\tCtrl+Shift+U",  240
+CapsLock::PostMessage, 0x0111, 240, 0, , ahk_exe SciTE.exe

; "Make Selection &Lowercase\tCtrl+U",  241
!CapsLock::PostMessage, 0x0111, 241, 0, , ahk_exe SciTE.exe

; "&Join",  248
^j::PostMessage, 0x0111, 248, 0, , ahk_exe SciTE.exe

; "&Split",  249
^k::PostMessage, 0x0111, 249, 0, , ahk_exe SciTE.exe

; Toggle Current Fold (ID: 235)
;~ ^MButton::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle current fold
^NumpadAdd::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle current fold

; Toggle All Folds (ID: 236)
;~ ^+MButton::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle all folds
^+NumpadAdd::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle all folds

; Expand Abbreviation
^;::WinMenuSelectItem, ahk_exe SciTE.exe,, Edit, Expand Abbreviation

; Toggle Bookmark
^b::WinMenuSelectItem, ahk_exe SciTE.exe,, Search, Toggle Bookmark

; Open Containing Folder (of current file)
;~ ^+e::

; move to matching brace
^SC027::PostMessage, 0x0111, 230, 0, , ahk_exe SciTE.exe

; select to matching brace
^+'::PostMessage, 0x0111, 231, 0, , ahk_exe SciTE.exe

; when the "Replace..." hotkey is pressed, copy and paste the selection into the "Replace:" field.
^h::
	str := copySelection()
	Send, ^h
	pasteClipboard(str)
	Send, ^a
	return

;~ ^!+Up::
;~ PostMessage, WM_USER + 1557 (0x00000a15)
;~ PostMessage, WM_USER + 1393 (0x00000971)
;~ PostMessage, WM_USER + 1394 (0x00000972)
;~ PostMessage, WM_USER + 1327 (0x0000092f)
;~ PostMessage, WM_USER + 1142 (0x00000876)
;~ PostMessage, WM_USER + 1142 (0x00000876)
;~ PostMessage, WM_USER + 1110 (0x00000856)
;~ PostMessage, WM_USER + 3977 (0x00001389)
	;~ return

; Zoom In - Increase Font Size
^=::Send, ^{NumpadAdd}

; Zoom Out - Decrese Font Size
^-::Send, ^{NumpadSub}

; Zoom Reset - Reset Font Size to Default
^0::Send, ^{NumpadDiv}

; END OF SCITE HOTKEYS__________________________________________________________
#IfWinActive
