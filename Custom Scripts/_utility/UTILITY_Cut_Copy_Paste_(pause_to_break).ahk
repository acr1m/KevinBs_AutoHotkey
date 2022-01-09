
;; one clipboard
;~ Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_00.ico

;; two clipboards
;~ Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_01.ico

;; two clipboards - sliced
Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_02.ico

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
