;AHK_Windows_Color_Picker.ahk
#IfWinActive Color ahk_class #32770
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;;HOTKEYS
v::
/* 	testClip := "rgb(93, 05, 123)"
 * 	clipArray := StrSplit(testClip, ",", "rgb() ")
 * 	Clipboard := 
 * 	for index, val in clipArray{
 * 		Clipboard := Clipboard . "`n" . "val[" . index . "] =>>" . val . "<<"
 * 	}
 *
 * ;;OUTPUT
 * val[1] =>>93<<
 * val[2] =>>05<<
 * val[3] =>>123<<
 */
	clipArray := StrSplit(Clipboard, ",", "rgb() ")
	for index, val in clipArray{
		
		;; select the input cell's contents to replace
		Send, ^a
		
		str := clipArray[index]
		Send, %str%{Tab}
	}
	
	return
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;remove context sensitive window detection for compatibility
#IfWinActive 

