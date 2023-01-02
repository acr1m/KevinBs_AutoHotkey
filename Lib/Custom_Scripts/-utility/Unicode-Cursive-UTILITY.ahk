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

setCheckmarks()

return
; END OF AUTOEXECUTE SECTION

Esc::ExitApp
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

;~ 𝒶𝒷𝒸𝒹𝑒𝒻𝑔𝒽𝒾𝒿𝓀𝓁𝓂𝓃𝑜𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏 - italic regular (cursive)
;~ 𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃 - italic bold (cursive)

; this method catches
unicodeHook(k:="")
{
	if(!k)
	{
		k := A_ThisHotkey
	}
	flagValue := getFlagState()
/* 	
 * 	MsgBox,	% "flagValue: " . flagValue
 * 		. "`n" . "I: " . I . "`t=> " . I*(2**2)
 * 		. "`n" . "B: " . B . "`t=> " . B*(2**1)
 * 		. "`n" . "U: " . U . "`t=> " . U*(2**0)
 */
 	;~ vk41-vk5A == a-z

	hook := InputHook()
	
	
	outStr := "A_ThisHotkey: " k 
		. "`nflagValue: " . flagValue 
		. "`nitalic: " . I 
		. "`nbold: " . B 
		. "`nunderline: " . U
		. "`nA_PriorKey: " . A_PriorKey

	ToolTip, % outStr
	
	;~ Clipboard := testChrFunc()
	
	return
}

; this function iterates through the Chr() function from value 3 to 255 and returns a string
testChrFunc()
{
	i := 0
	strOut := ""
	Loop
	{
		if (i <= 100000)
		{
			strOut .= "`nChr(" . i . "): " . Chr(i)
			i++
		}
		else
		{
			break
		}
	}
	return strOut
}

getFlagState()
{
	val := I*(2**2) + B*(2**1) + U*(2**0)
	; 	IBU	IBU	IBU	IBU	IBU	IBU	IBU	IBU
	; 	000	001	010	011	100	101	110	111
	;	0	1	2	3	4	5	6	7
	;	N	U	B	BU	I	IU	IB	IBU		
	return val
}

/* 	if(flag == 0) ; regular
 * 		; do nothing
 * 	else if(flag == 1) ; underline
 * 	else if(flag == 2) ; bold
 * 	else if(flag == 3) ; bold underline
 * 	else if(flag == 4) ; italic
 * 		Send, {Backspace}𝒶)
 * 	else if(flag == 5) ; italic underline
 * 	else if(flag == 6) ; italic bold
 * 		Send, {Backspace}𝓪)
 * 	else if(flag == 7) ; italic bold underline
 */
~*a::
~*b::
~*c::
~*d::
~*e::
~*f::
~*g::
~*h::
~*i::
~*j::
~*k::
~*l::
~*m::
~*n::
~*o::
~*p::
~*q::
~*r::
~*s::
~*t::
~*u::
~*v::
~*w::
~*x::
~*y::
~*z::
{
	unicodeHook()
}