;; This is a utility script which, when active, injects {Ctrl} on key-down of
;; x, c, and v, to cut, copy, and paste.

#IfWinActive PowerLauncher ahk_class HwndWrapper[PowerLauncher;;300ce19b-7b4c-49eb-a764-0a730ee71419] ahk_exe PowerLauncher_exe
c::c
v::v
x::x

#IfWinActive



;; copy
c::
{
	if (oneKey_){
		Send, ^c
	}
	return
}
;; paste
v::
{
	Send, ^v
	return
}
;; cut
x::
{
	Send, ^x
	return
}

;; ctrl v
oneKey_setState_Paste(param_bool){
	param_bool
	return
}
oneKey_getState_Paste(param_bool){
	param_bool
	return
}
;; ctrl c
oneKey_setState_Copy(param_bool){
	
	return
}
oneKey_getState_Copy(param_bool){
	
	return
}
;; ctrl x
oneKey_setState_Cut(param_bool){
	
	return
}
oneKey_getState_Cut(param_bool){
	
	return
}

/* atm, not sure if I want to go this route... ~~KevinB @6:56pm 2022/1/4
 * 		~~ with all these oneKey_assumed_Modifiers... 
 * 
 * 
 * oneKey_assumed_Alt(){
 * 	
 * 	return
 * }
 * oneKey_assumed_Ctrl(){
 * 	
 * 	return
 * }
 * oneKey_assumed_Shift(){
 * 	
 * 	return
 * }
 * oneKey_assumed_Ctrl_Shift(){
 * 	
 * 	return
 * }
 * oneKey_assumed_Alt_Ctrl(){
 * 	
 * 	return
 * }
 * oneKey_assumed_Alt_Ctrl_Shift(){
 * 	
 * 	return
 * } */
