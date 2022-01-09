/* Descr:	This script handles horizontal mouse wheel scrolling when the user hold down the Shift key.
 */

#IfWinActive
;; Scroll left.
+WheelUp::
	Send, {Left}
/* 	horiz_scrollWheel_controlVal := 0x114
 * 	ControlGetFocus, outputVar_control, A
 * 	Loop 4  ; <-- Increase this value to scroll faster.
 * 	{
 * 		;; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
 * 		;~ SendMessage, 0x114, 0, 0, %outputVar_control%, A  
 * 		
 * 		;~ SendMessage, %horiz_scrollWheel_controlVal%, SB_LINELEFT, 0, %outputVar_control%, A
 * 		SendMessage, %horiz_scrollWheel_controlVal%, 0, 0, %outputVar_control%, A
 * 	}
 */
	return
	
;; Scroll right.
+WheelDown::  
	Send, {Right}
/* 	horiz_scrollWheel_controlVal := 0x114
 * 	ControlGetFocus, outputVar_control, A
 * 	Loop 4 ;; <-- Increase this value to scroll faster.
 * 	{	
 * 		;; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
 * 		;~ SendMessage, 0x114, 1, 0, %outputVar_control%, A  
 * 		
 * 		;~ SendMessage, %horiz_scrollWheel_controlVal%, SB_LINERIGHT, 0, %outputVar_control%, A
 * 		SendMessage, %horiz_scrollWheel_controlVal%, 1, 0, %outputVar_control%, A
 * 	}
 */
	return