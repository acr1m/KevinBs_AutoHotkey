Menu, Tray, Icon, % "E:\Assets\Icons\copy-cut-bg-red.ico"

#IfWinActive
;; select all
a::Send, {Click, Left, 1}^a
;; select word
s::Send, {Click, Left, 2}
;; select line
d::Send, {Click, Left, 3}
;; copy
c::Send, ^c
;; paste
v::Send, ^v
;; cut
x::Send, ^x
;; new line
b::Send, {Enter}

Pause::ExitApp
