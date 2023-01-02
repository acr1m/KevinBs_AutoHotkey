/* ;CURSIVE TEXT OUTPUT SCRIPT ahk-version(1.1.36.02)
 *
 * italic regular (cursive regular)
 * 𝒶𝒷𝒸𝒹𝑒𝒻𝑔𝒽𝒾𝒿𝓀𝓁𝓂𝓃𝑜𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏
 *
 * italic bold (cursive bold)
 * 𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃
 *
 */
global I := true
global B := false
global U := false
global mni := "Italic"
global mnb := "Bold"
global mnu := "Underline"

Menu, Tray, Add ; separator

f := Func("toggleItalic")
Menu, Tray, Add, % mni, % f

f := Func("toggleBold")
Menu, Tray, Add, % mnb, % f

f := Func("toggleUnderline")
Menu, Tray, Add, % mnu, % f

;~ ^i:: toggleItalic();
;~ ^b:: toggleBold();
;~ ^u:: toggleUnderline();

toggleItalic() {
	I := !I
	setCheckmarks()
}

toggleBold() {
	B := !B
	setCheckmarks()
}

toggleUnderline() {
	U := !U
	setCheckmarks()
}

setCheckmarks() {
	if (I)
		Menu, Tray, Check, % mni
	else if (!I)
		Menu, Tray, Uncheck, % mni

	if (B)
		Menu, Tray, Check, % mnb
	else if (!B)
		Menu, Tray, Uncheck, % mnb

	if (U)
		Menu, Tray, Check, % mnu
	else if (!U)
		Menu, Tray, Uncheck, % mnu
}

;~ italic regular
;~ 𝒶𝒷𝒸𝒹𝑒𝒻𝑔𝒽𝒾𝒿𝓀𝓁𝓂𝓃𝑜𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏
;~ 𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃
~a::
{
	flag := I*2^3 + B*2^2 + U*2^1
	; 	IBU	IBU	IBU	IBU	IBU	IBU	IBU	IBU
	; 	000	001	010	011	100	101	110	111
	;	0	1	2	3	4	5	6	7
	;	N	U	B	BU	I	IU	IB	IBU
	if(flag == 0) ; regular
		; do nothing
	else if(flag == 1) ; underline
	else if(flag == 2) ; bold
	else if(flag == 3) ; bold underline
	else if(flag == 4) ; italic
		Send, {Backspace}𝒶)
	else if(flag == 5) ; italic underline
	else if(flag == 6) ; italic bold
		Send, {Backspace}𝓪)
	else if(flag == 7) ; italic bold underline

}
~b::
{
	if(I ? Send, {Backspace}𝒷 : )
		if(flag == 0) ; regular
		; do nothing
	else if(flag == 1) ; underline
	else if(flag == 2) ; bold
	else if(flag == 3) ; bold underline
	else if(flag == 4) ; italic
		Send, {Backspace}𝒶)
	else if(flag == 5) ; italic underline
	else if(flag == 6) ; italic bold
		Send, {Backspace}𝓪)
	else if(flag == 7) ; italic bold underline

}
}
~c::
{
	if(I ? Send, {Backspace}𝒸)
}
~d::
{
	if(I ? Send, {Backspace}𝒹)
}
~e::
{if(I ? Send, {Backspace}𝑒) }
~f::
{if(I ? Send, {Backspace}𝒻) }
~g::
{if(I ? Send, {Backspace}𝑔) }
~h::
{if(I ? Send, {Backspace}𝒽) }
~i::
{if(I ? Send, {Backspace}𝒾) }
~j::
{if(I ? Send, {Backspace}𝒿) }
~k::
{if(I ? Send, {Backspace}𝓀) }
~l::
{if(I ? Send, {Backspace}𝓁) }
~m::
{if(I ? Send, {Backspace}𝓂) }
~n::
{if(I ? Send, {Backspace}𝓃) }
~o::
{if(I ? Send, {Backspace}𝑜) }
~p::
{if(I ? Send, {Backspace}𝓅) }
~q::
{if(I ? Send, {Backspace}𝓆) }
~r::
{if(I ? Send, {Backspace}𝓇) }
~s::
{if(I ? Send, {Backspace}𝓈) }
~t::
{if(I ? Send, {Backspace}𝓉) }
~u::
{if(I ? Send, {Backspace}𝓊) }
~v::
{if(I ? Send, {Backspace}𝓋) }
~w::
{if(I ? Send, {Backspace}𝓌) }
~x::
{if(I ? Send, {Backspace}𝓍) }
~y::
{if(I ? Send, {Backspace}𝓎) }
~z::
{if(I ? Send, {Backspace}𝓏) }

;~ italic bold
;~ 𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃
;~ a::if(I && B ? Send, {Backspace}𝓪)
;~ b::if(I && B ? Send, {Backspace}𝓫)
;~ c::if(I && B ? Send, {Backspace}𝓬)
;~ d::if(I && B ? Send, {Backspace}𝓭)
;~ e::if(I && B ? Send, {Backspace}𝓮)
;~ f::if(I && B ? Send, {Backspace}𝓯)
;~ g::if(I && B ? Send, {Backspace}𝓰)
;~ h::if(I && B ? Send, {Backspace}𝓱)
;~ i::if(I && B ? Send, {Backspace}𝓲)
;~ j::if(I && B ? Send, {Backspace}𝓳)
;~ k::if(I && B ? Send, {Backspace}𝓴)
;~ l::if(I && B ? Send, {Backspace}𝓵)
;~ m::if(I && B ? Send, {Backspace}𝓶)
;~ n::if(I && B ? Send, {Backspace}𝓷)
;~ o::if(I && B ? Send, {Backspace}𝓸)
;~ p::if(I && B ? Send, {Backspace}𝓹)
;~ q::if(I && B ? Send, {Backspace}𝓺)
;~ r::if(I && B ? Send, {Backspace}𝓻)
;~ s::if(I && B ? Send, {Backspace}𝓼)
;~ t::if(I && B ? Send, {Backspace}𝓽)
;~ u::if(I && B ? Send, {Backspace}𝓾)
;~ v::if(I && B ? Send, {Backspace}𝓿)
;~ w::if(I && B ? Send, {Backspace}𝔀)
;~ x::if(I && B ? Send, {Backspace}𝔁)
;~ y::if(I && B ? Send, {Backspace}𝔂)
;~ z::if(I && B ? Send, {Backspace}𝔃)
