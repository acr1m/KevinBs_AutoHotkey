#InstallKeybdHook

;~ HOTSTRING END CHARACTERS
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
	;~ `n=[enter], `t=[tab]
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



;~ HOTKEY enable Right arrow key (used as primary Numpad modifier key) to still function as right arrow by outputting {Right} upon release of the key without successfully triggering another declared hotkey.
		Right::Right


;~ HOTKEY Navigation
	;~ Tab
		NumpadEnter::			Send, {Tab} 	; Next
		Right & NumpadEnter::	Send, +{Tab}	; Previous
		^NumpadEnter::			Send, {NumpadEnter}
;~ HOTKEY Variables --------------------
	;~ X Variable
		Right & Numpad1::		Send, {x}
;~ HOTKEY Parentheses, Brackets, Commas, Semicolons, Colons --------------
	;~ Comma
		Right & NumpadDot::		Send, {,}
	;~ Ordered Pair, Comma inside of Parentheses
		Right & Numpad5::		Send, ({,}){Left 2}
	;~ Parentheses ; 
		$+9::					Send, (){Left}
		Right & Numpad7::		Send, (){Left}
	;~ Curly Brace, Curly Brackets
		$+[::					Send, {{}{}}{Left}
	;~ Square Brackets
		$[::					Send, []{Left}
;~ HOTKEY Operators
	;~ Superscripts, Exponents, Radicals, Powers, Roots
		Right & Numpad8::		Send {^}
		Right & Numpad2::		Send {_}
		Right & NumpadDiv::		Send \sqrt
		
		
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
	:?:srd::{^}2{Right}
	:?:sq::{^}2{Right}
	:?:sqrd::{^}2{Right}
	:?:squared::{^}2{Right}
	:?:sr::\sqrt
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
		::in::∈
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

