;~ #InstallKeybdHook

;~ HOTSTRING END CHARACTERS
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
	;~ `n=[enter], `t=[tab]
	;~ ? (question mark): The hotstring will be triggered even when it is 
;~ ;		inside another word; that is, when the character typed immediately
;~ ;		before it is alphanumeric. For example, if :?:al::airline is a 
;~ ;		hotstring, typing "practical " would produce "practicairline ". 
;~ ;		Use ?0 to turn this option back off.
;~ HOTSTRING OPTIONS 
	;~ #Hotstring O  ; omit ending character (for all hotstrings in document underneath this rule)
	;~ #Hotstring Kn ; key delay (n = milliseconds) between each sent keystroke
	;~ #Hotstring *  ; turn on No Ending Character Required
	;~ #Hotstring *0 ; turn off No Ending Character Required
	;~ #Hotstring R  ; sends output as raw
	;~ #Hotstring C  ; case sensitive
	;~ #Hotstring C0 ; turn off case sensitive

;~ HOTKEY PREFIXES
	;~ "$" prefix keeps the hotkey from triggering itself in a loop


;~ Numlock is set up to control the suspension of this script's hotkeys and hotstrings
^+PGUP::	Suspend, Off 	;~ hotkeys are live
^+PGDN::	Suspend, On		;~ hotkeys are suspended

#Hotstring SE K100				;sets all hotstrings below to use SendEvent (instead of SendInput)
;								which will allow a key delay of .1 second
SetKeyDelay, 100
;~ HOTKEY enable "modifier" key to still function by outputting {default value} upon release of the key without successfully triggering another declared hotkey.
		Right::Right
		Down::Down
		Numpad0::Numpad0
		Numpad1::Numpad1
		NumpadAdd::NumpadAdd
		NumpadDiv::					Send, {/}

;~ HOTKEY Navigation
	;~ Backspace & Space
		Right & NumpadSub::			Send, {Backspace}
		Right & Numpad0::			Send, {Space}
	;~ Enter/Return
		;~ ::		Send, {NumpadEnter}		; Enter
	;~ Tab
		PGUP::						Send, +{Tab}			; Previous
		PGDN::						Send, {Tab} 			; Next
		NumpadEnter::				Send, {Tab}				; Next
;~ HOTKEY Variables --------------------
	;~ X Variable
		Right & Numpad1::			Send, {x}
;~ HOTKEY SYMBOLS
	;~ Constants & Variables
		Down & Numpad1::			Send, -\inf 	; "-∞ "
		Down & Numpad2::			Send, \inf 		;  "∞ " 
;~ HOTKEY Parentheses, Brackets, Commas, Semicolons, Colons --------------
	;~ Comma
		Right & NumpadDot::			Send, {,}
	;~ Ordered Pair, Comma inside of Parentheses
		Down & Numpad7::			Send, ({,}){Left 2}
	;~ Parentheses ; 
		$+9::						Send, (){Left}
		Right & Numpad7::			Send, (){Left}
	;~ Curly Brace, Curly Brackets
		$+[::						Send, {{}{}}{Left}
	;~ Square Brackets
		$[::						Send, []{Left}
;~ HOTKEY Operators
	;~ Subscripts, Superscripts, Exponents, Radicals, Powers, Roots, Relationals
		;~ Right & Numpad0::
		;~ Right & Numpad1:: taken
		Right & Numpad2::			Send, {_}		; subscript, underscore
		;~ Right & Numpad3::
		Right & Numpad4::			Send, {<}		; less-than
		Down & Numpad4::			Send, {≤}		; less-than or equal to
		Right & Numpad5::			Send, {=}		; equals
		Down & Numpad5::			Send, {≈}		; approx symbol
		Right & Numpad6::			Send, {>}		; greater-than
		Down & Numpad6::			Send, {≥}		; greater-than or equal to
		;~ Right & Numpad7::
		Right & Numpad8::			Send, {^}		; superscript, power
		;~ Right & Numpad9::
		Right & NumpadDiv::			Send, \sqrt		; square root  √:(A+251)
		Right & NumpadMult::		Send, +5		; = %
		;~ Right & NumpadSub::
		Right & NumpadAdd::			Send, {-}		; minus
		Down & NumpadAdd::			Send, {±}		; plus or minus ±:(A+241)
		
		
#Hotstring O K50 ; omit ending character trail space

;~ HOTSTRING Brackets -----------------
	;~ Angled Brackets
		::leftanglebracket::⟨
		::langbk::⟨
		::rightanglebracket::⟩ 
		::rangbk::⟩ 
		::angle::∠
	;~ Therefore
		::therefore::∴
		::tf::∴
	;~ Because
		::because::∵
		::bc::∵
	;~ Ellipses
		::'''::⋯
		::...::… 
;~ HOTSTRING Superscripts, Exponents, Radicals, Powers, Roots
	; :?: on Endchar trigger, will still fire if suffix
	:?:sq::{^}2{Right}
	:?:srd::{^}2{Right}
	:?:sqrd::{^}2{Right}
	:?:squared::{^}2{Right}
	:?:root::\sqrt
	:?:sr::\sqrt
	:?:rt::\sqrt
	:?:srt::\sqrt
	:?:sqrt::\sqrt
	::radical::√
	#Hotstring *0 ;~ turn off No Ending Character Required
		::crt::∛ 
		::frt::∜
		::3rt::∛ 
		::4rt::∜
;~ Hotstring Numbers
	#Hotstring * ;~ turn on No Ending Character Required
		;~ :?:root::√
		::zero::0
		::one::1
		::two::2
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
	#Hotstring *0 ;~ turn off No Ending Character Required
;~ Hotstrings
;~ O: omits the ending character from outputting in the replaced hotstring
	;~ Unicode Symbols
		:R:plus::+ ;~ R: sends output as raw
		:?:minus::-
		::times::{*}
		::multiplied::{*}
		::dot::* ;~ For browser math input
		::realdot::· ;~ For generic text field input
		;~ ·\sqrt()
		::divided::{/}
		::plusminus::±
		::minusplus::∓
		;~ ::inf::∞
		::inf::\inf 
		::union::∪
		::sumseq::∑
		::elementof::∈
		;~ ::in::∈
		;~ ::f(::ƒ(
		::eq::=
		::equals::=
		::approx::≈
		::neq::≠
		::notequal::≠
		::notequals::≠
		::deg::°
		::degg::
			Clipboard:= "\deg"
			Send, ^v 
		return
;~ Superscripts----------------------
	;~ ⁰ⁱ¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ
	::supi::ⁱ
	::sup1::¹
	::sup2::²
	::sup3::³
	::pwr1::¹
	::pwr2::²
	::pwr3::³
;~ Subscripts-------------------------
	;~ ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎
	;~ ₐ ₑ ₒ ₓ ₔ ₕ ₖ ₗ ₘ ₙ ₚ ₛ ₜ
	::suba::ₐ
	::subn::ₙ
	::subx::ₓ
	::sub1::₁
	::sub2::₂
	::sub3::₃
;~ Fractions-------------------------
	::onehalf::½
	::onethird::⅓
	::onefourth::¼
	::onefifth::⅕
	::onesixth::⅙
	::oneseventh::⅐
	::oneeighth::⅛
	::oneninth::⅑
	::threefourths::¾
;~ Greek Letters----------------
	;~ #Hotstring c ;~ case sensitive
		::alpha::α
		::beta::β
		::gamma::γ
		::delta::δ
		::epsilon::ε
		::theta::θ
		::phi::φ
		;~ ::pi::π
		::omega::ω
	;~ #Hotstring c0 ;~ turn off case sensitive




;~ TIMER LAP FUNCTION





