#IfWinActive Wolfram
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
			
	
	;; +?::
		;; pasteClipboard("Sqrt[]")
		;; return
	+?::
	Right & NumpadDiv::
		pasteClipboard("Sqrt[]")
		return
	Down & NumpadDiv::
		;; pasteClipboard("D[,x]")
		pasteClipboard("D[,]")
		return
	Down & NumpadAdd::
		pasteClipboard("Integrate[,]")
		return
	:?0:\dx::
	:?0:\deriv::
	:?0:\derivative::
		pasteClipboard("D[,]")
		return
	:?0:\dx2::
	:?0:\deriv2::
	:?0:\derivative2::
		pasteClipboard("D[,{,2}]")
		return	
	:?0:||::
	:?0:\abs::
		pasteClipboard("Abs[]")
		return
	:?0:\gt::
	:?0:\greaterthan::
	:?0:>=::
	:?0:=>::
		pasteClipboard("≥")
		return
	:?0:\lt::
	:?0:\lessthan::
	:?0:<=::
	:?0:=<::
		pasteClipboard("≤")
		return
	:?0:\neq::
	:?0:\nequal::
	:?0:\notequal::
	:?0:!=::
	:?0:not=::
		pasteClipboard("≠")
		return
	:?0*:ln::
		pasteClipboard("Log[]")
		return
	:?0*:log::
		pasteClipboard("Log[,]")
		return
	;; :?0:surd::
	;; :?0:nroot::
	;; :?0:sqrtn::
	;; :?0:nsqrt::
	:?0:\nroot::
	:?0:\sqrtn::
	:?0:\nsqrt::
	:?0:\surd::
		pasteClipboard("Surd[,]")
		return
	;; :?0:sqrt::
	;; :?0:root::
	;; :?0:radical::
	:?0:\sqrt::
	:?0:\root::
	:?0:\radical::
		pasteClipboard("Sqrt[]")
		return
	;; :?0:cbrt::
	;; :?0:croot::
	;; :?0:cuberoot::
	:?0:\cbrt::
	:?0:\croot::
	:?0:\cuberoot::
		pasteClipboard("Cbrt[]")
		return
	;; :?0:int::
	;; :?0:integral::
	:?0:\int::
	:?0:\integral::
		;; mathKbd_paste("∫")
		pasteClipboard("Integrate[,]")
		return
	;; :?0:defint::
	;; :?0:definiteintegral::
	:?0:\defint::
	:?0:\definiteintegral::
		;; mathKbd_paste("∫")
		pasteClipboard("Integrate[,{,,}]")
		return
	;; ::theta::
	::\theta::
		;; mathKbd_paste("θ")
		pasteClipboard("θ")
		return
	;; ::inf::
	;; ::infinity::
	::\inf::
	::\infinity::
		;; mathKbd_paste("∞")
		pasteClipboard("∞")
		return
#Hotstring C0 O0 ?0 *0		;~ Turn off Hotstring directives
}