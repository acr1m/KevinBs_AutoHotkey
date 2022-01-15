#Include %A_ScriptDir%\_lib\LIB_Main_Method_Library.ahk
#SingleInstance Force
#InstallKeybdHook

;~ TOOLBAR ICON
	Menu, Tray, Icon, E:\Assets\Icons\math_ruler_.bmp
;;██████████████████████████████████████████████████████████████████████████████
;~ ;CONSTANTS
	;~ global SUSPEND_LIMIT := 200 ; n milliseconds
	;~ global DOUBLE_TAP_LIMIT := 350 ; n milliseconds
	;~ global INCREMENT_LIMIT := 500 ; n milliseconds
;~ STARTING VARIABLES
	global g_windowSentinelIsOn := true ; default = true
	global currentRaisedPower := 1 ;used for incrementing n. Ex:  a^n

;~ MATH-INPUT-STYLE SWITCHES FOR EDITOR/BROWSER/ENVIRONMENT COMPATABILITY 
	;~ used for mathKbd_typeSquareRoot() function
	global mathKbd_style_paste := false ;~ default value = false
	global mathKbd_style_backSlash := true ;~ default value = true
	global mathKbd_style_squareRootLeftAmount := 0 ;~ default value = 0
	
;run the Active Window Sentinel method
mathKbd_activeWindowSentinel()


;~ SET STYLE FUNCTION
mathKbd_setMathInputStyle(p_1 := false, p_2 := true, p_3 := 3, p_4 := 0){
	mathKbd_style_paste := p_1
	mathKbd_style_backSlash := p_2
	mathKbd_style_squareRootBackspaceAmount := p_3
	mathKbd_style_squareRootLeftAmount := p_4
}

mathKbd_activeWindowSentinel(){
	while(g_windowSentinelIsOn){
		Sleep, 3000
		if (WinActive("Desmos")){
			mathKbd_setMathInputStyle(false, false, 2, 0)
		} else if (WinActive("Mathway")){
			mathKbd_setMathInputStyle(true, false, 3, 1)
		} else {
			mathKbd_setMathInputStyle(false, true, 3, 0)
		}
	}
}

;;██████████████████████████████████████████████████████████████████████████████


;;██████████████████████████████████████████████████████████████████████████████
;~ DIRECTIVES 
	SendMode, Event				;~ sets all hotkeys below to use SendEvent
	SetKeyDelay, 30				;~ set all hotkeys below to have a delay of n milliseconds, 0.00n seconds
	#Hotstring SE 			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	#Hotstring K30			;~ which will allow a key delay of n milliseconds, 0.00n seconds
	#Hotstring B			;~ activate automatic backspacing (the default)
	#Hotstring O 			;~ [O] omit ending-character trail space
	#Hotstring EndChars -()[]{}: "/\,.?!`n
;;██████████████████████████████████████████████████████████████████████████████
;~ AUTORUN COMMANDS
;;██████████████████████████████████████████████████████████████████████████████
#IfWinActive
mathKbd_debugFunction()

mathKbd_debugFunction()
{
	MsgBox, function called at TOP of script.
	return
}

mathKbd_setMathInputStyle()

;;██████████████████████████████████████████████████████████████████████████████
;~ SCRIPT MANAGEMENT / SUSPENSION CONTROL
	F4::Suspend, Toggle
	NumpadDot & Numpad0::Suspend, On 	;hotkeys are suspended
	NumpadDot & Numpad1::Suspend, Off 	;hotkeys are live

	;Captures Numpad0 when Numlock is On or Off
	^NumpadIns:: 
	^+NumpadIns:: Suspend, Toggle

	^+PGUP::
	^+NumpadAdd::
	^!=::	Suspend, Off 	;~ hotkeys are live

	^+NumpadSub::
	^+PGDN::
	^!-::	Suspend, On		;~ hotkeys are suspended

	$-::
	Suspend Permit
	SendRaw, -
	if (doubleTap(SUSPEND_LIMIT)){
		Send, {BackSpace 2}
		Suspend On
	}
	return

	$=::
	Suspend Permit
	SendRaw, =
	if (doubleTap(SUSPEND_LIMIT)){
		Send, {BackSpace 2}
		Suspend Off
	}
	return
;;██████████████████████████████████████████████████████████████████████████████





	;~ 	HOTKEY enable "modifier" key to still function by outputting {default value} upon release 
	;	of the key without successfully triggering another declared hotkey.
	Right::Right
	Down::Down

	;this function is a double-tap that turns a decimal "." into a comma ","
	$NumpadDot::
		Suspend, Permit
	{
		SendRaw, .
		if (doubleTap()){
			Send, {BackSpace 2}{,}
		}
		return
	}
	Numpad0::Numpad0
	
	;this function is a double-tap that turns a plus "+" into a minus "-"
	$Numpad1::
		SendRaw, 1
		mathKbd_incrementVariables(,"x","y","z","1")
		return
	$Numpad2::
		SendRaw, 2
		mathKbd_incrementVariables(,"pi","\theta","r","2")
		return
	$Numpad3::
		SendRaw, 3
		mathKbd_incrementVariables(,"e","3")
		return
	$Numpad4::
		SendRaw, 4
		mathKbd_incrementVariables(,"t","u","v","w","4")
		return
	$Numpad5::
		SendRaw, 5
		mathKbd_incrementVariables(,"i","j","k","5")
		return
	$Numpad6::
		SendRaw, 6
		;~ incrementTrigFunctions(,"sin","cos","tan","csc","sec","cot")
		return
	$Numpad7::
		SendRaw, 7
		mathKbd_incrementVariables(350,"(",")")
		return
	$Numpad8::
		SendRaw, 8
		mathKbd_incrementPower()
		return
	$Numpad9::
		SendRaw, 9
		; negative incrementation, i.e. decrement by 1 at a time
		mathKbd_incrementPower(,-1)
		return
	~x::
		Send, x
		if (doubleTap()){
			Send, {BackSpace, 2}^2{Tab}
		}
		return
	
	;this function is a double-tap that turns a plus "+" into a minus "-"
	$NumpadAdd:: 
		SendRaw, +
		mathKbd_incrementVariables(,"-","+")
		return
	NumpadSub::
		Send, {Backspace}
		return
	NumpadMult:: ; superscript, power, multiply, squared, increment, iteration
		Send, {*}
		mathKbd_incrementPower()
		return
	NumpadDiv:: ; square root, 
		Send, {/}
		if (doubleTap()){
			Send, {Backspace %mathKbd_style_squareRootBackspaceAmount%}
			mathKbd_typeSquareRoot()
		}
		return

;~ HOTKEY Navigation
	;~ Backspace & Space
		Right & NumpadSub::Send, {Backspace}
		Right & Numpad0::Send, {Space}
		Right & PGDN::Send, {Tab 8}			; Tab to the end.
	
;~ HOTKEY Variables --------------------
	;~ X Variable
		Right & Numpad1::Send, {x}	;i.e. Alt+120
		Right & Numpad9::Send, {t}	;i.e. Alt+
		Right & Numpad3::Send, {y}	;i.e. Alt+121
		Down & Numpad3::Send, {e}	;i.e. Alt+101
;~ HOTKEY SYMBOLS
	;~ Constants & Variables
		Down & Numpad1::	Send, -\inf 	; "-∞ "
		Down & Numpad2::	Send, \inf 		;  "∞ " 
;~ HOTKEY Parentheses, Brackets, Commas, Semicolons, Colons --------------
	;~ Comma
		Right & NumpadDot::	Send, {,}
		
	;~ Ordered Pair, Comma inside of Parentheses
		Down & Numpad7::	Send, (-\inf{,}\inf){Left 2}
	
	;~ Parentheses ; 
	{
		$^!9::Send, \left(
		$^!0::Send, \right)
		
		$+9::				Send, (){Left}
		Right & Numpad7::	Send, (){Left}
		; ")" Right Paranthesis
		$+0::
			; store the clipboard's contents before utilizing
			clipTemp := ClipboardAll
			
			;highlight the next character
			Send, {LShift down}{Right 1}{LShift up}
			
			; copy the highlighted character to the clipboard to "scan" it
			Send, ^c
			Sleep, 30 ; milliseconds
			
			; If the copied character is the same and the one we're trying to type...
			; then leave it alone and exit the highlighted text.
			; Else, plop down a ")".
			if (Clipboard == ")"){
				Send, {Left}{Right}
			}
			else
			{
				Send, {Left}{)}
			}
			
			; restore the clipboard's contents
			Clipboard := clipTemp
			return
	}
	
	;~ Curly Brace, Curly Brackets
	{
		$^!+[::Send, \left{{}
		$^!+]::Send, \right{}}
		$+[::Send, {{}{}}{Left}
		$+]::
		{
			; store the clipboard's contents before utilizing
			clipTemp := ClipboardAll
			;highlight the next character
			Send, {LShift down}{Right 1}{LShift up}
			; copy the highlighted character to the clipboard to "scan" it
			Send, ^c
			Sleep, 30 ; milliseconds
			; If the copied character is the same and the one we're trying to type...
			; then leave it alone and exit the highlighted text.
			; Else, plop down a ")".
			if (Clipboard == "}"){
				Send, {Left}{Right}
			}
			else
			{
				Send, {Left}{}}
			}
			; restore the clipboard's contents
			Clipboard := clipTemp
			return
		}
	}
	;~ Square Brackets
	{
		$^![::Send, \left[
		$^!]::Send, \right]
		$[::Send, []{Left}
		$]::
		{
			; store the clipboard's contents before utilizing
			clipTemp := ClipboardAll
			
			;highlight the next character
			Send, {LShift down}{Right 1}{LShift up}
			
			; copy the highlighted character to the clipboard to "scan" it
			Send, ^c
			Sleep, 30 ; milliseconds
			
			; If the copied character is the same and the one we're trying to type...
			; then leave it alone and exit the highlighted text.
			; Else, plop down a ")".
			if (Clipboard == "]"){
				Send, {Left}{Right}
			}
			else
			{
				Send, {Left}{]}
			}
			
			; restore the clipboard's contents
			Clipboard := clipTemp
			return
		}
	}
;~ HOTKEY Operators
{
	;~ Subscripts, Superscripts, Exponents, Radicals, Powers, Roots, Relationals
	{
		Right & Numpad2::			Send, {_}		; subscript, underscore
		Right & Numpad4::			Send, {<}		; less-than
		Down & Numpad4::			Send, {≤}		; less-than or equal to
		Right & Numpad5::			Send, {=}		; equals
		Down & Numpad5::			Send, {≈}		; approx symbol
		Right & Numpad6::			Send, {>}		; greater-than
		Down & Numpad6::			Send, {≥}		; greater-than or equal to
		Right & Numpad8::			Send, {^}		; superscript, power
		
		+2::
			Send, {^}		; superscript, power
			mathKbd_incrementPower(INCREMENT_LIMIT,1)
			return
		+/::
		Right & NumpadDiv::
			mathKbd_typeSquareRoot()
			return
		Right & NumpadMult::		Send, +5		; = %
		+3::						Send, {+}		; addition, plus, sum, add
		^p:: 
		{
			KeyWait, p ;wait for key to be released to avoid triggering
					;in combination with {Shift}
			Send, {+} ;[Shift+=] -> {=}
			return ;exit method
		}	
		+4::						Send, {-}		; subtraction, minus, difference, subtract, negative, 
		Right & NumpadAdd::			Send, {-}		; subtraction, minus, difference, subtract, negative, 
		Down & NumpadAdd::			Send, {±}		; plus or minus ±:(A+241)
	;~HOTKEYS Functions
		;~Trigonometric Functions
		^Insert::					Send, sin(){Left}
		^Delete::					Send, csc(){Left}
		^Home::						Send, cos(){Left}
		^End::						Send, sec(){Left}
		^PGUP::						Send, tan(){Left}
		^PGDN::						Send, cot(){Left}
	}
}

;~ HOTSTRING Brackets and Separators============================================
	;~ Angled Brackets
		::leftanglebracket::⟨
		::langbk::⟨
		::rightanglebracket::⟩ 
		::rangbk::⟩ 
		::angle::∠
	;~ Comma
			;DEPRECATED, keyboard periods no longer trigger commas, only a 
			;timed-double-tap NumpadDot triggers a comma replacement
		;~ :*?:..::{,}
	;~ Therefore
		::therefore::∴
		::tf::∴
	;~ Because
		::because::∵
		::bc::∵
	;~ Ellipses
		::'''::⋯
		;~ ::...::… 
;~ HOTSTRING Superscripts, Exponents, Radicals, Powers, Roots==================
{
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		::ss::
			Send, {^}{2}{Right}
			return
		::sq::{^}2{Right}			; squared, power of 2, exponent 2
		::srd::{^}2{Right}			; squared, power of 2, exponent 2
		::sqrd::{^}2{Right}			; squared, power of 2, exponent 2
		::squared::{^}2{Right}		; squared, power of 2, exponent 2
		::root::\sqrt				; square root, radical  √:(A+251)
		::srt::\sqrt				; square root, radical  √:(A+251)
		::sqrtt::√					; square root, radical  √:(A+251)
		::radical::√    			; square root, radical  √:(A+251)
		::ex::e{^}x{Right}			; exponential constant to the power of x
	#Hotstring ?0			;~ [?0] turn off "if-suffix" trigger
		::crt::∛ 
		::frt::∜
		::3rt::∛ 
		::4rt::∜
}
; HOTSTRING NUMBERS============================================================
{
	;~ #Hotstring *			;~ [*] turn on No Ending-Character Required
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		;~ :?:root::√
		::zero::0
		::one::1
		:T:two::2			;~ [T] send as raw text, no keystrokes
		::three::3
		::four::4
		::five::5
		::six::6
		::seven::7
		::eight::8
		::nine::9
		::ten::10
		::eleven::11
		::twelve::12
		::thirteen::13
		::fourteen::14
		::fifteen::15
		::sixteen::16
		::seventeen::17
		::eighteen::18
		::nineteen::19
		::twenty::20
		::thirty::30
		::fourty::40
		::fifty::50
		::sixty::60
		::seventy::70
		::eighty::80
		::ninety::90
		::hundred::100
		::onehundred::100
	#Hotstring ?0			;~ [?0] turn off "if-suffix" trigger
	#Hotstring *0 			;~ [*0] turn off No Ending-Character Required
}

;~ HOTSTRINGS UNICODE & ASCII SYMBOLS 
{
	;~ [O] omits the ending character from outputting in the replaced hotstring
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		:R:plus::+ 		;~ [R] sends output as raw, without translating as keywords
		:R:add::+
		:R*:pp::+	;plus
		:R*:nn::-	;minus
		:R*:mm::-	;minus
		:R*:tt::*	;times
		:R*:dd::/	;divided
		::min::-
		::minus::-
}
;~ #IfWinActive Topic: Discussion: Mixed Derivatives ; target specific window
{
		;~ ::min::
			;~ Send, {Backspace}{-}
		;~ ::minus::
			;~ Send, {Backspace 3}{-}
}
;~ #IfWinActive ; re-declare targeting of any window
{
		::neg::-
		::negative::-
		::times::{*}
		::multiplied::{*}
		::dot::{*} 			;~ For browser math input * *
		::realdot::· 		;~ For generic text field input
		::divided::{/}
		::plusminus::±
		::minusplus::∓
		;~ ::inf::∞
		;~ ::inf::\inf 
		:C:union::∪		;~ [C] caps sensitive hotstring
		:C:U::
		::sumseq::∑
		::elementof::∈
		;~ ::in::∈
		;~ ::f(::ƒ(
		::equals::=
		::approx::≈
		::approximately::≈
		::notequal::≠
		::notequals::≠
		::deg::°
		::degg::
		{
			Clipboard:= "\deg"
			Send, ^v 
			return
		}
		;~ :T:deggg::\deg			; Doesn't work in Mathway browser, the back-slash and forward-slash 
									; are captured as ratio dividers before getting a chance to finish
									; the character command.
		
		;integrals 
		:?0:int::\int
		:?0:integral::\int
		::dint::\dint
		::defint::\dint
		::definite integral::\dint
		
		
	#Hotstring ?0	;~ turns off "if-suffix" trigger
}
;~ Superscripts================================================================
{
	#Hotstring ?	;~ turns on "if-suffix" trigger
	;~ ⁰ⁱ¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ
	;~ [O] omit ending character trail space
	;~ [?] if-suffix, still triggers
	::supi'::ⁱ
	::supn'::ⁿ
	::sup1'::¹
	::sup2'::²
	::sup3'::³
	::sup1'::¹
	::sup2'::²
	::sup3'::³
	;---------------------------------
	::sup::
	::pow::
	::pwr::
	::power::{^}
	::sup1::
	::pow1::
	::pwr1::
	::power1::{^}1{Right}
	::sup2::
	::pow2::
	::pwr2::
	::power2::{^}2{Right}
	::sup3::
	::pow3::
	::pwr3::
	::power3::{^}3{Right}
	::sup4::
	::pow4::
	::pwr4::
	::power4::{^}4{Right}
	::sup5::
	::pow5::
	::pwr5::
	::power5::{^}5{Right}
	::sup6::
	::pow6::
	::pwr6::
	::power6::{^}6{Right}
	::sup7::
	::pow7::
	::pwr7::
	::power7::{^}7{Right}
	::sup8::
	::pow8::
	::pwr8::
	::power8::{^}8{Right}
	::sup9::
	::pow9::
	::pwr9::
	::power9::{^}9{Right}
	::sup0::
	::pow0::
	::pwr0::
	::power0::{^}0{Right}
	::supx::
	::powx::
	::pwrx::
	::powerx::{^}x{Right}
	::supn::
	::pown::
	::pwrn::
	::powern::{^}n{Right}
	::supone::
	::powone::
	::pwrone::
	::powerone::{^}1{Right}
	::suptwo::
	::powtwo::
	::pwrtwo::
	::powertwo::{^}2{Right}
	::supthree::
	::powthree::
	::pwrthree::
	::powerthree::{^}3{Right}
	::supfour::
	::powfour::
	::pwrfour::
	::powerfour::{^}4{Right}
	::supfive::
	::powfive::
	::pwrfive::
	::powerfive::{^}5{Right}
	::supsix::
	::powsix::
	::pwrsix::
	::powersix::{^}6{Right}
	::supseven::
	::powseven::
	::pwrseven::
	::powerseven::{^}7{Right}
	::supeight::
	::poweight::
	::pwreight::
	::powereight::{^}8{Right}
	::supnine::
	::pownine::
	::pwrnine::
	::powernine::{^}9{Right}
	::supzero::
	::powzero::
	::pwrzero::
	::powerzero::{^}0{Right}
	;---------------------------------
}
;~ Subscripts==================================================================
{
	;~ ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎
	;~ ₐ ₑ ₒ ₓ ₔ ₕ ₖ ₗ ₘ ₙ ₚ ₛ ₜ
	::suba'::ₐ
	::subn'::ₙ
	::subx'::ₓ
	::sub1'::₁
	::sub2'::₂
	::sub3'::₃
	;---------------------------------
	::base::{_}
	::base1::{_}1{Right}
	::base2::{_}2{Right}
	::base3::{_}3{Right}
	::base4::{_}4{Right}
	::base5::{_}5{Right}
	::base6::{_}6{Right}
	::base7::{_}7{Right}
	::base8::{_}8{Right}
	::base9::{_}9{Right}
	::base0::{_}0{Right}
	::basex::{_}x{Right}
	::basen::{_}n{Right}
	;---------------------------------
	::sub::{_}
	::sub1::{_}1{Right}
	::sub2::{_}2{Right}
	::sub3::{_}3{Right}
	::sub4::{_}4{Right}
	::sub5::{_}5{Right}
	::sub6::{_}6{Right}
	::sub7::{_}7{Right}
	::sub8::{_}8{Right}
	::sub9::{_}9{Right}
	::sub0::{_}0{Right}
	::subx::{_}x{Right}
	::subn::{_}n{Right}
	;---------------------------------
	#Hotstring ?0	;~ turns off "if-suffix" trigger
}
;~ Fractions===================================================================
{
	::onehalf::½
	::onethird::⅓
	::onefourth::¼
	::onefifth::⅕
	::onesixth::⅙
	::oneseventh::⅐
	::oneeighth::⅛
	::oneninth::⅑
	::threefourths::¾
}
;;██████████████████████████████████████████████████████████████████████████████
;~ Greek Letters
;;██████████████████████████████████████████████████████████████████████████████
{
	;~ #Hotstring C ;~ [C] case sensitive
	;~ letters are automatically replaced/matched with Capitalization of replaced string.
	#Hotstring ?	;~ turns on "if-suffix" trigger
	::alpha%::α
	::alpha;::α
	::alpha::\alpha
	::beta%::β
	::beta;::β
	::beta::\beta
	::gamma%::γ
	::gamma;::γ
	::gamma::\gamma
	::delta%::δ
	::delta;::δ
	::delta::\delta
	::epsilon%::ε
	::epsilon;::ε
	::epsilon::\eplison
	::theta%::θ
	::theta;::θ
	::theta::\theta
	::phi%::φ
	::phi;::φ
	::phi::\phi
	::pi%::π
	::pi;::π
	;~ ::pi::\pi
	::omega%::ω
	::omega;::ω
	::omega::\omega
	;~ #Hotstring C0 ;~ [C0] turn off case sensitive
	#Hotstring ?0	;~ turns off "if-suffix" trigger
	
	#Hotstring C0 O0 ?0 *0		;~ Reset Hotstring directives
}
;;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;;##############################################################################
;;//////////////////////////////////////////////////////////////////////////////
;;««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
;;»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»
;;░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
;;▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
;;▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
;;██████████████████████████████████████████████████████████████████████████████

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
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
	;~ ::srt::
	;~ ::root::
	;~ ::sqrt::
	;~ ::sqrtt::
	;~ ::radical::
		;~ pasteSquareRoot(1)
		;~ return
	::theta::
		mathKbd_paste("θ")
		return
	::inf::
	::infinity::
		mathKbd_paste("∞")
		return
#Hotstring C0 O0 ?0 *0		;~ Turn off Hotstring directives
}

#IfWinActive Desmos


#IfWinActive ;end specific window targeting



;;██████████████████████████████████████████████████████████████████████████████
;;██████████████████████████████████████████████████████████████████████████████
;;██████████████████████████████████████████████████████████████████████████████
;~ OTHER METHODS
;;██████████████████████████████████████████████████████████████████████████████

/**	mathKbd_incrementPowerNoCarrotWithExtraBackspacing()
	Descr:	Sets the current 'math-input-mode'.
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_incrementPowerNoCarrotWithExtraBackspacing()
{
	mathKbd_incrementPower(,,,,,false,true)
	return
}

/**	mathKbd_incrementPowerNoCarrot()
	Descr:	Sets the current 'math-input-mode'.
	Return:	VOID
	Params:	
	Notes:	
*/
mathKbd_incrementPowerNoCarrot()
{
	mathKbd_incrementPower(,,,,false)
	return
}

/**	mathKbd_incrementPower()
	Descr:	Increments through power-superscripts, increasing the number by 1 each time.
	Return:	VOID
	Params:	p_timeLimit := INTEGER (default := -1)
			p_incrementAmount := INTEGER (default := 1)
			p_initialBackspaceAmount := INTEGER (default := 2)
			p_subsequentBackspaceAmount := INTEGER (default := 3)
			p_rightAmount := INTEGER (default := 1)
			p_sendCarrot := BOOLEAN (default := true)
			p_extraBackspacing := BOOLEAN (default := false)
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_incrementPower( p_timeLimit := -1
		, p_incrementAmount := 1
		, p_initialBackspaceAmount := 2
		, p_subsequentBackspaceAmount :=3
		, p_rightAmount := 1
		, p_sendCarrot := true
		, p_extraBackspacing := false){
	if (doubleTap(p_timeLimit)){
		currentRaisedPower += p_incrementAmount
		if (currentRaisedPower = 2)
			Send, {Backspace %p_initialBackspaceAmount%} ;2
		else if (p_extraBackspacing == true && currentRaisedPower >= 11){
			extraBackspaceAmount := p_subsequentBackspaceAmount + 1
			Send, {Backspace %extraBackspaceAmount%}
		} 
		else
			Send, {Backspace %p_subsequentBackspaceAmount%} ;3
		
		if (p_sendCarrot == true)
			Send, {^}%currentRaisedPower%{Right %p_rightAmount%} ;1
		else if (p_sendCarrot == false && currentRaisedPower = 2)
			Send, {^}%currentRaisedPower%{Right %p_rightAmount%} ;1
		else
			Send, %currentRaisedPower%{Right %p_rightAmount%} ;1
	}
	else
		currentRaisedPower := 1
	return
}

/**	mathKbd_incrementVariables()
	Descr:	Variadic method that cycles through the given 'string' variable arguments.
	Return:	VOID
	Params:	p_timeLimit :=	INTEGER	(default := INCREMENT_LIMIT)
			p_vars* :=	STRING (default := none, must provide at least one argument)
				---> Can accept any amount of 'string' variables.
	Notes:	Method will loop back to the hotkey's natural output and then continue 
				working it's way through the given list of 'string' variables. 
*/
; variadic parameter__________________vvvvvvv________
mathKbd_incrementVariables(p_timeLimit := "", p_vars*){
	;; if undeclared, set timelimit to default increment time value
	if (p_timeLimit == ""){
		p_timeLimit := INCREMENT_LIMIT
		;~ MsgBox, % "Set p_timeLimit from `"`" to INCREMENT_LIMIT = " . INCREMENT_LIMIT . "`p_vars.MaxIndex() = " . p_vars.MaxIndex()
	}
	;; if within doubleTap limit, set str to params[index] value, send output,
	;;;; and increment the index value
	if (doubleTap(p_timeLimit)){
		
		;; set the string to the next parameter element
		str := p_vars[currentRaisedPower]
		
		;; delete the last printed element by checking the string length of prev elem
		previousIndex := currentRaisedPower - 1
		if (previousIndex == 0){
			backspaceAmount := 2
			previousIndex := 1
		} else { 
			backspaceAmount := StrLen(p_vars[previousIndex]) + 1
		}
		;; remove last print by backspaceAmount and print new string
		Send, {Backspace %backspaceAmount%}%str%
				
/* 		After sending output and incrementing +1, if index variable would be higher than 
;; 			length of p_vars* object, then cycle back to beginning of elem index [1].
*/		
		currentRaisedPower += 1 ;intially starts at 1, first run sets to 2
		if (currentRaisedPower > p_vars.MaxIndex())
			currentRaisedPower := 1
	}
	else
		currentRaisedPower := 1
	
	;; send the release of any modifier keys to keep them from getting spam-locked
	Send, {CtrlUp}{ShiftUp}{AltUp}
	return
}

/**	mathKbd_typeSquareRoot()
	Descr:	____enter_a_description____
	Return:	VOID-STRING-BOOLEAN-INTEGER_STRING-FLOAT_STRING
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_typeSquareRoot(){
	if (mathKbd_style_paste == false){
		if (mathKbd_style_backSlash == false || mathKbd_style_backSlash == 0)
			Send, sqrt{Left %mathKbd_style_squareRootLeftAmount%}
		else if (mathKbd_style_backSlash == true || mathKbd_style_backSlash == 1)
			Send, \sqrt{Left %mathKbd_style_squareRootLeftAmount%}
	} else if (mathKbd_style_paste == true){
		mathKbd_pasteSquareRoot()
	}
}

/**	mathKbd_pasteSquareRoot()
	Descr:	____enter_a_description____
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_pasteSquareRoot(){
	archiveClipboard()
	Clipboard := "√"			; square root, radical  √:(A+251)
	Send, ^v{Left %mathKbd_style_squareRootLeftAmount%}
	restoreClipboard()
	return
}

/**	mathKbd_paste()
	Descr:	____enter_a_description____
	Return:	VOID
	Params:	p_alpha :=	STRING	(default := "str")
			p_beta :=	BOOLEAN
			p_gamma :=	INTEGER_STRING
			p_delta :=	FLOAT_STRING
	Notes:	____How_to_or_when_is_this_used?____
*/
mathKbd_paste(str := ""){	
	archiveClipboard()
	Clipboard := str
	Send, ^v 
	restoreClipboard()
	return
}
;;██████████████████████████████████████████████████████████████████████████████
;;██████████████████████████████████████████████████████████████████████████████
