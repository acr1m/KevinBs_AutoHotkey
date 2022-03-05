;; SCREENSHOT HOTKEYS - screenshot utility = ShareX

;; ScrollLock DoubleTap = Capture Active Window
ScrollLock:: ;{ 
	if (doubleTap()) {
		SetScrollLockState, Off
		;[Alt+PrtSc] used for ShareX, captures active window region as image.
		Send, !{PrintScreen}
	} else {
		Send, {ScrollLock}
	}
	return  ;}


; z - only fire if z_Handler_object says it can
;; z::
/* Instantiate a new class-object to handle the z button
*    when physically pressed down. 
* 
*  It will fire (ie. Send) itself, {z}, if a <CustomModifierHotkey>
*    which relies on {z down} as a condition to trigger,
*    hasn't itself been successfully triggered.
*    - ie. z & a::Send, triggered

*/
	;; z_Handler := new CustomModifierHandler
	;; return

;; ~$z Up:: ; '~$' means, pass-through and only fire when physically triggered.
	;; if (z_handler.canFire()) {
		;; Send, {z Down}{z Up}
	;; }
	;; return

;; ; ShareX - capture left monitor using defined hotkey in ShareX settings
;; z & Numpad1::
	;; Send, !^+F13
	;; return

;; ; ShareX - capture middle monitor using defined hotkey in ShareX settings
;; z & Numpad2::
	;; Send, !^+F14
	;; return

;; ; ShareX - capture right monitor using defined hotkey in ShareX settings
;; z & Numpad3::
	;; Send, !^+F15
	;; return

;; class z_Handler extends CustomModifierHandler {
;;	
;; }