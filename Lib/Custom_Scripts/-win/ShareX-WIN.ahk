;; #IfWinExist ShareX 13.7 (Release, Admin) ahk_class WindowsForms10.Window.8.app.0.3bd0390_r8_ad1 ahk_exe ShareX.exe
;; ShareX 13.7 (Release, Admin)



#IfWinActive ShareX 13.7 ahk_exe ShareX.exe
;;If window is active

e::
	sharexEdit()
	return


sharexEdit() {
	Send, ^e
	return
}

;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive