#Persistent
#SingleInstance Force
#IfWinActive

;@Ahk2Exe-SetMainIcon E:\Assets\Icons\Cats-icons2-win\Cats_icons2_win\ICO\Terminal.ico

#Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk

run_AsAdmin(,false) ;; 2nd param <Boolean> controls output of msg box.

^+!a::Run, "E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\Main-AHK.exe"
;; ^+!a::run_AsAdmin("E:\Assets\Windows 10 Settings\Custom Toolbars\AHK-Scripts\Main-AHK.exe - Shortcut.lnk", true)
