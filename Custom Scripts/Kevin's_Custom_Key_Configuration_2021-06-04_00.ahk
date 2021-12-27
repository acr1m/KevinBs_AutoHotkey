

;~ EMOJIS
:*:shruggie::¯\_(ツ)_/¯
:*:lol::lol 😂
:*:rofl::rofl 🤣



;~ HOTKEYS
#n::
Run Notepad
return


;~ MAGICAMI WIKI
;~ these are used for wiki editing
#ifWinActive ahk_class MozillaWindowClass
i:: send Icon{Enter}{Tab}{Tab}{Space}
#ifWinActive ahk_class MozillaWindowClass
b:: send Icon-Buff{Enter}{Tab}{Tab}{Space}
#ifWinActive ahk_class MozillaWindowClass
d:: send Icon-Debuff{Enter}{Tab}{Tab}{Space}
#ifWinActive ahk_class MozillaWindowClass
w:: send ^w





;this get the active window Title name and the Class and stores it into the clipboard.
m::
myTitle := 
WinGetTitle, myTitle, A
WinGetClass, class, A
tWindow	:= "Active Window Params are as follows.`n"
tTitle := "• Title:[" myTitle "].`n"
tClass := "• Class:[" class "].`n"
Clipboard := "• Title: [" myTitle "]`n• Class: [" class "]`n"
tContents := "The contents of the clipboard are as follows:`n"

;thin horizontal line
hl1 := "────────────────────────`n"
;thick horizontal line
hl2 := "========================`n"
MsgBox,  %tWindow% %hl1% %tTitle% %tClass% %hl2% %tContents% %hl1% %clipboard%
return



