;~ #InstallKeybdHook

;~ HOTSTRING END CHARACTERS
	;~ #Hotstring EndChars -()[]{}:;'"/\,.?!`n 
	;~ `n=[enter], `t=[tab]
	;~ ? (question mark): The hotstring will be triggered even when it is 
		;~ inside another word; that is, when the character typed immediately
		;~ before it is alphanumeric. For example, if :?:al::airline is a 
		;~ hotstring, typing "practical " would produce "practicairline ". 
		;~ Use ?0 to turn this option back off.
;~ HOTSTRING OPTIONS 
	;~ #Hotstring O  ; omit ending character (for all hotstrings in document underneath this rule)
	;~ #Hotstring Kn ; key delay (n = milliseconds) between each sent keystroke
	;~ #Hotstring *  ; turn on No Ending Character Required
	;~ #Hotstring *0 ; turn off No Ending Character Required
	;~ #Hotstring R  ; sends output as raw
	;~ #Hotstring C  ; case sensitive
	;~ #Hotstring C0 ; turn off case sensitive

;~ HOTKEY PREFIXES
	;~ [$] prefix keeps the hotkey from triggering itself in a loop
	
	
;~ DIRECTIVES 
	SendMode Event				;~ sets all hotkeys below to use Send
	SetKeyDelay, 50				;~ set all hotkeys below to have a delay of n-milliseconds.
	#Hotstring SE K50			;~ sets all hotstrings below to use Send (instead of SendInput)
								;~ which will allow a key delay of .2 second

;~ SCRIPT MANAGEMENT / SUSPENSION CONTROL
;~ Numlock is set up to control the suspension of this script's hotkeys and hotstrings
	^PGUP::	Suspend, Off 	;~ hotkeys are live
	^PGDN::	Suspend, On		;~ hotkeys are suspended

;~ 	HOTKEY enable "modifier" key to still function by outputting {default value} upon release 
;	of the key without successfully triggering another declared hotkey.
		
		
		;Left::RAlt
		
		;~ bind arrow key to Right Alt key, to use for alt codes (not ready to refactor to this functionality yet 2021/09/30
		
		Right::Right
		
		;~ remaps down key to right-alt key when pressed down, 
		;~ afterwards, sends a typical downkey stroke when released
		;~ [$] is an option to force the usage of the keyboard-hook
				;~  This is usually only necessary if the script uses the Send command to send the keys that comprise the hotkey itself, which might otherwise cause it to trigger itself.
 
		Down::	Send, {RAlt down}
		Down Up::
			Send, {RAlt Up}
			Send, {RAlt}
			Send, {Down}
		return
		
		
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
		;~ PGUP::						Send, +{Tab}			; Previous
		;~ PGDN::						Send, {Tab} 			; Next
		Right & PGDN::				Send, {Tab 8}			; Tab to the end.
		NumpadEnter::				Send, {Tab}				; Next
;~ HOTKEY Variables --------------------
	;~ X Variable
		Right & Numpad1::			Send, {x}	;i.e. Alt+120
		Right & Numpad3::			Send, {y}	;i.e. Alt+121
		Down & Numpad3::			Send, {e}	;i.e. Alt+101

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
		;~ +2::						Send, {^}2{Right}	;squared, power of 2
		+2::						Send, {^}		;superscript, power
		;~ Right & Numpad9::
		Right & NumpadDiv::			Send, \sqrt		; square root  √:(A+251)
		Right & NumpadMult::		Send, +5		; = %
		;~ Right & NumpadSub::
		Right & NumpadAdd::			Send, {-}		; minus
		Down & NumpadAdd::			Send, {±}		; plus or minus ±:(A+241)
	;~HOTKEY Functions
		;~Trigonometric Functions
		Insert::					Send, sin(){Left}
		Delete::					Send, csc(){Left}
		Home::						Send, cos(){Left}
		End::						Send, sec(){Left}
		PGUP::						Send, tan(){Left}
		PGDN::						Send, cot(){Left}
		
		
		
#Hotstring O 				;~ [O] omit ending-character trail space

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
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		::sq::{^}2{Right}
		::rd::{^}2{Right}
		::squared::{^}2{Right}
		::root::\sqrt
		::rt::\sqrt
		::sqrtt::√
		::radical::√
		::ex::e{^}x{Right}
	#Hotstring ?0			;~ [?0] turn off "if-suffix" trigger
		::crt::∛ 
		::frt::∜
		::3rt::∛ 
		::4rt::∜
;~ Hotstring Numbers
	#Hotstring * 			;~ [*] turn on No Ending-Character Required
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
	#Hotstring *0 			;~ [*0] turn off No Ending-Character Required



;~ HOTSTRINGS
	;~ Unicode Symbols
	;~ [O] omits the ending character from outputting in the replaced hotstring
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		:R:plus::+ 		;~ [R] sends output as raw
		::minus::-
		::times::{*}
		::multiplied::{*}
		::dot::{*} 			;~ For browser math input * *
		::realdot::· 		;~ For generic text field input
		;~ ·\sqrt()
		::divided::{/}
		::plusminus::±
		::minusplus::∓
		;~ ::inf::∞
		::inf::\inf 
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
			Clipboard:= "\deg"
			Send, ^v 
		return
	#Hotstring ?0	;~ turns off "if-suffix" trigger
;~ Superscripts----------------------
	#Hotstring ?	;~ turns on "if-suffix" trigger
	;~ ⁰ⁱ¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ
	::supi::ⁱ
	;~ [O] omit ending character trail space
	;~ [?] if-suffix, still triggers
	:?:supx::{^}x{Right}
	::supn::ⁿ
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
	#Hotstring ?0	;~ turns off "if-suffix" trigger
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
	;~ #Hotstring C ;~ [C] case sensitive
	;~ letters are automatically replaced/matched with Capitalization of replaced string.
	#Hotstring ?	;~ turns on "if-suffix" trigger
		::alpha%::α
		::alpha::\alpha
		::beta%::β
		::beta::\beta
		::gamma%::γ
		::gamma::\gamma
		::delta%::δ
		::delta::\delta
		::epsilon%::ε
		::epsilon::\eplison
		::theta%::θ
		::theta::\theta
		::phi%::φ
		::phi::\phi
		::pi%::π
		;~ ::pi::\pi
		::omega%::ω
		::omega::\omega
	;~ #Hotstring C0 ;~ [C0] turn off case sensitive
	#Hotstring ?0	;~ turns off "if-suffix" trigger


#Hotstring C0 O0 ?0 *0		;~ Reset Hotstring directives

;~ TIMER LAP FUNCTION


#IfWinActive Mathway
		Clipboard
		Right & NumpadDiv::			Send, \sqrt		; square root  √:(A+251)
		
	#Hotstring ?			;~ [?] if-suffix, hotstring will still fire
		::rt::\sqrt
		::root::\sqrt
		::sqrtt::√
		::radical::√

;References for setting up this unicode process method
;=======================================================
 ;~ {ASC nnnnn} 
  
;~ Sends an Alt+nnnnn keypad combination, which can be used to generate special characters that don't exist on the keyboard. To generate ASCII characters, specify a number between 1 and 255. To generate ANSI characters (standard in most languages), specify a number between 128 and 255, but precede it with a leading zero, e.g. {Asc 0133}.

;~ Unicode characters may be generated by specifying a number between 256 and 65535 (without a leading zero). However, this is not supported by all applications. For alternatives, see the section below.
 
;~ {U+nnnn} 
  
;~ [v1.0.90+]: Sends a Unicode character where nnnn is the hexadecimal value of the character excluding the 0x prefix. This typically isn't needed in Unicode versions of AutoHotkey, where Send and ControlSend automatically support Unicode text.

;~ SendInput()¬ or WM_CHAR¬ is used to send the character and the current Send mode has no effect. Characters sent this way usually do not trigger shortcut keys or hotkeys.
 

;~ Transform, OutputVar, Unicode  ; Retrieves the clipboard's Unicode text as a UTF-8 string.
;~ Transform, Clipboard, Unicode, %MyUTF_String%  ; Places Unicode text onto the clipboard.
;~ ^!u::  ; Control+Alt+U hotkey.
;~ MsgBox Copy some Unicode text onto the clipboard, then return to this window and press OK to continue.
;~ Transform, ClipUTF, Unicode
;~ Clipboard := "Transform, Clipboard, Unicode, %ClipUTF%`r`n"
;~ MsgBox The clipboard now contains the following line that you can paste into your script. When executed, this line will cause the original Unicode string you copied to be placed onto the clipboard:`n`n%Clipboard%
;~ return

#IfWinActive ;end specific window targeting


