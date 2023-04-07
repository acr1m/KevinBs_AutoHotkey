#IfWinActive Mathway 
{
	NumpadMult:: ; superscript, power, multiply, squared, increment, iteration
		Send, {*}
		mathKbd_incrementPowerNoCarrotWithExtraBackspacing()
		return

	+Tab::Left

	;~ +/::
	;~ Right & NumpadDiv::
		;~ pasteSquareRoot(1)
		;~ return
	
	;~ NumpadDiv::
		;~ Send, {/}
		;~ if (doubleTap()){
			;~ Send, {Backspace 2}
			;~ ;pasteSquareRoot(1)
		;~ }
		;~ return

;HOTSTRINGS===========================================
	#Hotstring SE
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
	;~ ::srt::
	;~ ::root::
	;~ ::sqrt::
	;~ ::sqrtt::
	;~ ::radical::
		;~ pasteSquareRoot(1)
		;~ return
	
	;;integrals 
	;; ::int::
	:?0:int::
		;; mathKbd_paste("∫")
		pasteClipboard("∫")
		return
	:?0:integral::
		;; mathKbd_paste("∫")
		pasteClipboard("∫")
		return
	::theta::
		;; mathKbd_paste("θ")
		pasteClipboard("θ")
		return
	::inf::
	::infinity::
		;; mathKbd_paste("∞")
		pasteClipboard("∞")
		return
#Hotstring C0 O0 ?0 *0		;~ Turn off Hotstring directives
}