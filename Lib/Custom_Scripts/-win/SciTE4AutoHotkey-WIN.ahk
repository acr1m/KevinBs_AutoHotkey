#IfWinActive
;@Ahk2Exe-SetMainIcon E:\Assets\Icons\autohotkey-scite\SciTE_500.ico
Menu, Tray, Icon, % "E:\Assets\Icons\autohotkey-scite\SciTE_500.ico"
;; ;@AHK2Exe-IgnoreBegin
;; global WIN_TITLE_SCITE := ahk_exe SciTE.exe
;; ;@AHK2Exe-IgnoreEnd
;; #Include %A_ScriptDir%\..\-lib\Main-Method-Library-LIB.ahk

#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
;; #Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Emojis-And-Symbols-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\repeatKey()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\time()-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\RegEx()-LIB.ahk

#IfWinActive ahk_exe SciTE.exe

;; "|" - puts the caret inside of quotation-marks when double-tapped
~+':: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

;; %|% - puts the caret inside of percent-signs when double-tapped
~+5:: ;{ 
	if (doubleTap(350))
		Send, {Left}
	return  ;}

;; Ctrl+Alt+Left|2390|\ 
^!Left::Send, ^/

;; Ctrl+Alt+Shift+Left|2391|\
^!+Left::Send, ^+/

;; Ctrl+Alt+Right|2392|\
^!Right::Send, ^\

;; Ctrl+Alt+Shift+Right|2393|\
^!+Right::Send, ^+\

^+z::Send, ^y

;;

;; open selected filename
^+e::PostMessage, 0x0111, 103, 0, , ahk_exe SciTE.exe
;; ^e::WinMenuSelectItem, ahk_exe scite.exe,, File, Open Selected Filename

;; open user properties file
!u::PostMessage, 0x0111, 461, 0, , ahk_exe SciTE.exe

;; open abbreviations file
!b::PostMessage, 0x0111, 463, 0, , ahk_exe SciTE.exe

;; toggle word wrap
F8::PostMessage, 0x0111, 414, 0, , ahk_exe SciTE.exe

;; copy path of current file/tab (Copy Pat&h",  118)
^+c::PostMessage, 0x0111, 118, 0, , ahk_exe SciTE.exe


;; "Make &Selection Uppercase\tCtrl+Shift+U",  240
+CapsLock::PostMessage, 0x0111, 240, 0, , ahk_exe SciTE.exe

;; "Make Selection &Lowercase\tCtrl+U",  241
!CapsLock::PostMessage, 0x0111, 241, 0, , ahk_exe SciTE.exe



;; "&Join",  248


;; "&Split",  249

;; ^MButton:: ;{

;; Toggle Current Fold
^MButton::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle current fold

;; SendMessage, %WM_COMMAND%
;; PostMessage, 0x0111, 414, 0, , ahk_exe SciTE.exe
;; SendMessage, 0x0111, 2620, 0, , ahk_exe SciTE.exe

;; Toggle All Folds
^+MButton::WinMenuSelectItem, ahk_exe SciTE.exe,, View, Toggle all folds
^b::WinMenuSelectItem, ahk_exe SciTE.exe,, Edit, Expand Abbreviation


#IfWinActive
