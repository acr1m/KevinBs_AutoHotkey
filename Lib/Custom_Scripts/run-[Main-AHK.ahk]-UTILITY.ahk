#Persistent
#SingleInstance
#IfWinActive

#Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk

run_AsAdmin(,true)

^+!a::Run, "E:\Assets\Windows 10 Settings\Custom Toolbars\AHK-Scripts\Main-AHK.exe - Shortcut.lnk"
;; ^+!a::run_AsAdmin("E:\Assets\Windows 10 Settings\Custom Toolbars\AHK-Scripts\Main-AHK.exe - Shortcut.lnk", true)
