#InstallKeybdHook
;===============================================================================
;~ CONSTANTS
global SUSPEND_LIMIT := 150 ; n milliseconds
global DOUBLE_TAP_LIMIT := 350 ; n milliseconds
global INCREMENT_LIMIT := 500 ; n milliseconds
;~ STARTING VARIABLES
global currentRaisedPower := 1 ;used for incrementing n. Ex:  a^n
;===============================================================================
;~ Menu, Tray, Icon, C:\WINDOWS\system32\msctf.dll, 410
;~ C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE

;~ Menu, Tray, Icon, C:\Program Files\Microsoft Office\root\Office16\OMICAUT.DLL, 203
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\OMICAUT_203.ico

;~ Menu, Tray, Icon, 
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\MSACCESS_289.ico
;~ Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\misc_902.ico

Menu, Tray, Icon, E:\Software\iconsext-1.47\icons\Microsoft Office Icons\MSACCESS_677.ico


;sqrt(a)
;~ C:\Program Files\Microsoft Office\root\Office16\misc.exe, 902

;circle(fx)
;~ C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE, 677

;===============================================================================
;~ HOTSTRING END CHARACTERS
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
	
	;~ `n=[enter], `t=[tab]
	;~ ? (question mark): The hotstring will be triggered even when it is 
		;~ inside another word; that is, when the character typed immediately
		;~ before it is alphanumeric. For example, if :?:al::airline is a 
		;~ hotstring, typing "practical " would produce "practicairline ". 
		;~ Use ?0 to turn this option back off.
;===============================================================================
;~ HOTSTRING OPTIONS 
	;~ #Hotstring SE ; •SE stands for SendEvent, which is the default in versions older than 1.0.43.
	;~ #Hotstring SI 
			; •SI stands for SendInput, which typically has superior speed and 
			;reliability than the other modes. Another benefit is that like 
			;SendPlay below, SendInput postpones anything you type during a 
			;hotstring's auto-replacement text. This prevents your keystrokes 
			;from being interspersed with those of the replacement. When 
			;SendInput is u
	;~ #Hotstring SP ; •SP stands for SendPlay, which may allow hotstrings to work in a broader variety of games.
	;~ #Hotstring O  ; omit ending character (for all hotstrings in document underneath this rule)
	;~ #Hotstring O0  ; turn off "omit ending character" (for all hotstrings in document underneath this rule)
	;~ #Hotstring Kn ; key delay (n = milliseconds) between each sent keystroke
	;~ #Hotstring *  ; turn on No Ending Character Required
	;~ #Hotstring *0 ; turn off No Ending Character Required
	;~ #Hotstring R  ; sends output as raw
	;~ #Hotstring C  ; case sensitive
	;~ #Hotstring C0 ; turn off case sensitive
;===============================================================================
;~ HOTKEY PREFIXES
	;~ [$] prefix keeps the hotkey from triggering itself in a loop
	;~ [~] When the hotkey fires, its key's native function will not 
			;be blocked (hidden from the system). 
;===============================================================================

;===============================================================================
;~ DIRECTIVES 
	SendMode, Event				;~ sets all hotkeys below to use SendEvent
	;~ SendMode, Input				;~ sets all hotkeys below to use SendInput
	SetKeyDelay, 30				;~ set all hotkeys below to have a delay of n milliseconds, 0.00n seconds
	;~ SetKeyDelay, 200				;~ set all hotkeys below to have a delay of n milliseconds, 0.00n seconds
	;~ #Hotstring SE K200			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SE K50			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SI 			;~ sets all hotstrings below to use SendInput (the default)
	#Hotstring SE 			;~ sets all hotstrings below to use SendEvent (instead of SendInput)
	;~ #Hotstring SP 			;~ sets all hotstrings below to use SendPlay (instead of SendInput)
	#Hotstring K30			;~ which will allow a key delay of n milliseconds, 0.00n seconds
	#Hotstring B			;~ activate automatic backspacing (the default)
	#Hotstring O 			;~ [O] omit ending-character trail space
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
		;the [;] has been removed from the hotstring ending characters
		;the ['] has been removed from the hotstring ending characters
	#Hotstring EndChars -()[]{}: "/\,.?!`n
;===============================================================================
;~ SCRIPT MANAGEMENT / SUSPENSION CONTROL
;~ ____ is set up to control the suspension of this script's hotkeys and hotstrings
	; [Ctrl+Shift+Numpad0]
	;~ if (GetKeyState, Numlock, T, = true) ; GetKey the Toggle KeyState of NumLock
	{
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
	}
	
;===============================================================================
;~ #IfWinActive
	;~ ;===========================================================================================
	;~ ;===========================================================================================
	;~ ; HOTKEYS REMAPS FOR NUMBER ROW DURING MATH MODE
	;~ $1::	KeyWait, 1
			;~ Send, {ShiftDown}{1}{ShiftUp}
	;~ $2::	KeyWait, 2
			;~ Send, {ShiftDown}}{2}{ShiftUp}
	;~ $3::	KeyWait, 3
			;~ Send, {ShiftDown}}{3}{ShiftUp}
	;~ $4::	KeyWait, 4
			;~ Send, {ShiftDown}}{4}{ShiftUp}
	;~ $5::	KeyWait, 5
			;~ Send, {ShiftDown}}{5}{ShiftUp}
	;~ $6::	KeyWait, 6
			;~ Send, {ShiftDown}}{6}{ShiftUp}
	;~ $7::	KeyWait, 7
			;~ Send, {ShiftDown}}{7}{ShiftUp}
	;~ $8::	KeyWait, 8
			;~ Send, {ShiftDown}}{8}{ShiftUp}
	;~ $9::	KeyWait, 9
			;~ Send, {ShiftDown}}{9}{ShiftUp}
	;~ $0::	KeyWait, 0
			;~ Send, {ShiftDown}}{0}{ShiftUp}
	;~ $-::	KeyWait, -
			;~ Send, {ShiftDown}}{-}{ShiftUp}
	;~ $=::	KeyWait, =
			;~ Send, {ShiftDown}}{=}{ShiftUp}
	
	
	
	;===========================================================================================
	;===========================================================================================
	;===========================================================================================
	
	
	
;~ 	HOTKEY enable "modifier" key to still function by outputting {default value} upon release 
;	of the key without successfully triggering another declared hotkey.

	Right::Right
	
;~ remaps down key to right-alt key when pressed down, 
;~ afterwards, sends a typical downkey stroke when released
;~ [$] is an option to force the usage of the keyboard-hook
		;~  This is usually only necessary if the script uses the Send command to 
		;~   send the keys that comprise the hotkey itself, which might otherwise 
		;~   cause it to trigger itself.
		
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
		incrementVariables(,"x","y","z","1")
		return
	$Numpad2::
		SendRaw, 2
		incrementVariables(,"pi","\theta","r","2")
		return
	$Numpad3::
		SendRaw, 3
		incrementVariables(,"e","3")
		return
	$Numpad4::
		SendRaw, 4
		incrementVariables(,"t","u","v","w","4")
		return
	$Numpad5::
		SendRaw, 5
		incrementVariables(,"i","j","k","5")
		return
	$Numpad6::
		SendRaw, 6
		;~ incrementTrigFunctions(,"sin","cos","tan","csc","sec","cot")
		return
	$Numpad8::
		SendRaw, 8
		incrementPower()
		return
	$Numpad9::
		SendRaw, 9
		; negative incrementation, i.e. decrement by 1 at a time
		incrementPower(,-1)
		return
	
	
	;this function is a double-tap that turns a plus "+" into a minus "-"
	$NumpadAdd:: 
		SendRaw, +
		incrementVariables(,"-","+")
		return
	NumpadSub::
		Send, {Backspace}
		return
	NumpadMult:: ; superscript, power, multiply, squared, increment, iteration
		Send, {*}
		incrementPower()
		return
	NumpadDiv:: ; square root, 
		Send, {/}
		if (doubleTap()){
			Send, {Backspace 3}
			Send, \sqrt
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
			incrementPower(INCREMENT_LIMIT,1)
			return
		Right & NumpadDiv::			Send, \sqrt		; square root, radical  √:(A+251)
		+/::						Send, \sqrt		; square root, radical  √:(A+251)
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
		;~ ·\sqrt()
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
;~ Greek Letters===============================================================
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
;==============================================================================


#IfWinActive Mathway
{

		;~ Right & NumpadDiv::			Send, \sqrt		; square root  √:(A+251)
		;~ Right & NumpadDiv::			Send, {Asc 251}		; square root  √:(A+251)
		;~ decimal base value for 	; square root  √: 8730, 	base 10;
		;~ ^1::	Send, {Asc 251}		; square root  √:(A+251)	base ASCII
		;~ ^2::	Send, asdf{U+221A}		; square root  √:(U+221A), 	base Hex
		;~ ^3:: 
			;~ Clipboard:= "√"
			;~ Send, ^v 
			;~ return
		

; SQUARE ROOTS IN MATHWAY
	
	;HOTKEYS==============================================
		; [Shift+2]
		;~ +2::
			;~ Clipboard:= "√"			; square root, radical  √:(A+251)
			;~ Send, ^v 
			;~ return
		; [Shift+/]
		+/::
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v{Left}
			return
		Right & NumpadDiv::
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v{Left}
			return
		NumpadDiv::
			Send, {/}
			if (doubleTap()){
				Send, {Backspace 2}
				Clipboard:= "√"			; square root, radical  √:(A+251)
				Send, ^v{Left}
			}
			return
	
	;HOTSTRINGS===========================================
	{
		#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		::rt::
		{
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v 
			return
		}
		::root::
		{
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v 
			return
		}
		::sqrt::
		{
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v 
			return
		}
		::sqrtt::
		{
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v 
			return
		}
		::radical::
		{
			Clipboard:= "√"			; square root, radical  √:(A+251)
			Send, ^v 
			return
		}
		::theta::					; theta θ
		{
			Clipboard:= "θ"
			Send, ^v 
			return
		}
		::inf::						; infinity ∞
		{
			Clipboard:= "∞"
			Send, ^v 
			return
		}
		::infinity::				; infinity ∞
		{
			Clipboard:= "∞ "
			Send, ^v 
			return
		}
	}
#Hotstring C0 O0 ?0 *0		;~ Turn off Hotstring directives
}

;References for setting up this unicode process method
{
	;=======================================================
	;=======================================================
	;~ Name 	Square Root
	;~ Unicode number 	
	;~ U+221A
	;~ HTML-code 	
	;~ &#8730;
	;~ CSS-code 	
	;~ \221A
	;~ Entity 	
	;~ &radic;
	;~ Block 	Mathematical Operators
	;~ Unicode version: 	1.1 (1993)
	;~ Alt code: 	
	;~ Alt 251 (English keyboard layout)

	 ;~ {ASC nnnnn} 
	  
	;~ Sends an Alt+nnnnn keypad combination, which can be used to generate 
	;~ special characters that don't exist on the keyboard. To generate ASCII 
	;~ characters, specify a number between 1 and 255. To generate ANSI 
	;~ characters (standard in most languages), specify a number between 128 
	;~ and 255, but precede it with a leading zero, e.g. {Asc 0133}.

	;~ Unicode characters may be generated by specifying a number between 256 
	;~ and 65535 (without a leading zero). However, this is not supported by 
	;~ all applications. For alternatives, see the section below.
	 
	;~ {U+nnnn} 
	  
	;~ [v1.0.90+]: Sends a Unicode character where nnnn is the hexadecimal value 
	;~ of the character excluding the 0x prefix. This typically isn't needed in 
	;~ Unicode versions of AutoHotkey, where Send and ControlSend automatically 
	;~ support Unicode text.

	;~ SendInput()¬ or WM_CHAR¬ is used to send the character and the current 
	;~ Send mode has no effect. Characters sent this way usually do not trigger 
	;~ shortcut keys or hotkeys.
	 
	;CODE_EXAMPLES=====================
	;~ Transform, OutputVar, Unicode  ; Retrieves the clipboard's Unicode text as a UTF-8 string.
	;~ Transform, Clipboard, Unicode, %MyUTF_String%  ; Places Unicode text onto the clipboard.
	;~ ^!u::  ; Control+Alt+U hotkey.
	;~ MsgBox Copy some Unicode text onto the clipboard, then return to this window and press OK to continue.
	;~ Transform, ClipUTF, Unicode
	;~ Clipboard := "Transform, Clipboard, Unicode, %ClipUTF%`r`n"
		;~ MsgBox The clipboard now contains the following line that you can paste 
		;~ into your script. When executed, this line will cause the original 
		;~ Unicode string you copied to be placed onto the clipboard:`n`n%Clipboard%
	;~ return
	;=======================================================
	;=======================================================
	;=======================================================
}

#IfWinActive ;end specific window targeting

; parameter_timeLimit is optional (will default to DOUBLE_TAP_LIMIT if undeclared)
doubleTap(p_timeLimit := -1){
	if(p_timeLimit != -1)
		outText := "double tap time limit = p_timeLimit: " + p_timeLimit
	if (p_timeLimit == -1){
		p_timeLimit := DOUBLE_TAP_LIMIT
		outText := "double tap time limit = DOUBLE_TAP_LIMIT: " + DOUBLE_TAP_LIMIT
	}
	if  (A_PriorHotkey = A_ThisHotkey && A_TimeSincePriorHotkey < p_timeLimit){
		;~ MsgBox, %outText% ; for debugging
		return true
	} 
	else
		return false
}

incrementPower(p_timeLimit := -1, p_incrementAmount := 1){
	if (doubleTap(p_timeLimit)){
		currentRaisedPower += p_incrementAmount
		if (currentRaisedPower = 2){
			Send, {Backspace 2}
		} else{
			Send, {Backspace 3}
		}
		Send, {^}%currentRaisedPower%{Right}
	}
	else
		currentRaisedPower := 1
}

; variadic parameter__________________vvvvvvv________
incrementVariables(p_timeLimit := "", p_vars*){
	
	; if undeclared, set timelimit to default increment time value
	if (p_timeLimit == ""){
		p_timeLimit := INCREMENT_LIMIT
		;~ MsgBox, % "Set p_timeLimit from `"`" to INCREMENT_LIMIT = " . INCREMENT_LIMIT . "`p_vars.MaxIndex() = " . p_vars.MaxIndex()
	}
	; if within doubleTap limit, set str to params[index] value, send output,
	; and increment the index value
	if (doubleTap(p_timeLimit)){
		
		; set the string to the next parameter element
		str := p_vars[currentRaisedPower]
		
		; delete the last printed element by checking the string length of prev elem
		previousIndex := currentRaisedPower - 1
		if (previousIndex == 0){
			backspaceAmount := 2
			previousIndex := 1
		} else { 
			backspaceAmount := StrLen(p_vars[previousIndex]) + 1
		}
		; remove last print by backspaceAmount and print new string
		Send, {Backspace %backspaceAmount%}%str%
		
		; after sending output and incrementing +1, if index variable would be higher than 
		; length of p_vars* object, then cycle back to beginning of elem index [1].
		currentRaisedPower += 1 ;intially starts at 1, first run sets to 2
		if (currentRaisedPower > p_vars.MaxIndex())
			currentRaisedPower := 1
	}
	else
		currentRaisedPower := 1
}