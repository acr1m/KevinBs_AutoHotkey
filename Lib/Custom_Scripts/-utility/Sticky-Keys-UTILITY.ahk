
;; one clipboard
;~ Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_00.ico

;; two clipboards
;~ Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_01.ico

;; two clipboards - sliced
Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_02.ico

#IfWinActive

global isCtrlDown := false

Ctrl::
	toggle_ctrl()
	return


Pause::ExitApp

toggle_ctrl(){
	if (isCtrlDown){
		;; yes
		isCtrlDown := !isCtrlDown
		Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_01.ico
		Send, {A_ThisHotkey Up}
		}
	else{
		;; not-yes, probably no
		isCtrlDown := !isCtrlDown
		Menu, Tray, Icon, E:\Assets\Icons\cut_copy_paste_00.ico
		Send, {A_ThisHotkey Down}
	}
	return
}

