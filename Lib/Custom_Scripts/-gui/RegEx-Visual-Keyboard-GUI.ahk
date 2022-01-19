#Include %A_ScriptDir%\..\-lib
#Include Main-Method-Library-LIB.ahk
#Include repeatKey()-LIB.ahk

_w   := 120
_h   := 40
t_w  := _w * 10
t_h  := _h * 10
mrgn := 3
r1 := 0 * (mrgn + _h) + mrgn
r2 := 1 * (mrgn + _h) + mrgn
r3 := 2 * (mrgn + _h) + mrgn
r4 := 3 * (mrgn + _h) + mrgn
r5 := 4 * (mrgn + _h) + mrgn
r6 := 5 * (mrgn + _h) + mrgn
r7 := 6 * (mrgn + _h) + mrgn
c1 := 0 * (mrgn + _w) + mrgn
c2 := 1 * (mrgn + _w) + mrgn
c3 := 2 * (mrgn + _w) + mrgn
c4 := 3 * (mrgn + _w) + mrgn
c5 := 4 * (mrgn + _w) + mrgn
c6 := 5 * (mrgn + _w) + mrgn
c7 := 6 * (mrgn + _w) + mrgn

#NoTrayIcon
Gui,	Font,	S8	CDefault,	jetbrains mono
Gui,	Add,	GroupBox,	x15		y7		w234	h103	,	Whitespace (WhtSpc)
Gui,	Add,	Button,		x%c2%	y%r1%		w120	h40		,	line-break`n\r\n
Gui,	Add,	Button,		x%c1%	y%r1%		w120	h40		,	TAB`n\t
Gui,	Add,	Button,		x%c1%	y%r2%		w120	h40		,	WhtSpc char`n\s
;: Gui,	Font,	S7	CDefault,	jetbrains mono
Gui,	Add,	Button,		x%c2%	y65		w120	h40		,	non-WhtSpc char`n\S
Gui,	Font,	S8	CDefault,	jetbrains mono

Gui,	Add,	GroupBox,	x11		y115	w259	h63		,	Word Characters
Gui,	Add,	Button,		x%c1%		y131	w120	h40		,	word char`n\w
Gui,	Add,	Button,		x%c2%	y131	w120	h40		,	non-word char`n\W
Gui,	Add,	Text,		x185	y136	w120	h40		+Center,	word character `n[A-Za-z0-9_]

Gui,	Add,	GroupBox,	x11		y180	w177	h62		,	Numbers
Gui,	Add,	Button,		x%c1%		y195	w120		h40		,	digit char`n\d
Gui,	Add,	Button,		x%c2%	y195	w120		h40		,	non-digit char`n\D

Gui,	Add,	Button,		x%c1%		y250	w120		h40		,	Hex char`n\xFF
Gui,	Add,	Text,		x120	y250	w120	h40		+Center,	Reserved Characters`n+*?^$\.[]{}()|/

Gui,	Add,	Button,		x275	y9		w120	h40		,	match any`n[\s\S]

Gui,	Add,	GroupBox,	x290	y79		w120	h205	,	Quantifiers
Gui,	Add,	Button,		x295	y99		w120	h40		,	0`, or more`n*
Gui,	Add,	Button,		x295	y129	w120	h40		,	at least 1`, or more`n+
Gui,	Add,	Button,		x295	y159	w120	h40		,	{4} - exactly 4`n{4`,} - 4 or more`n{1`,4} - 1 to 4`n{ }
Gui,	Add,	Button,		x295	y219	w120	h40		,	make optional or lazy`n?

Gui,	Add,	GroupBox,	x415	y8		w274	h293	,	Groups
Gui,	Add,	Button,		x420	y54		w120	h40		,	char-set`n[ ]
Gui,	Add,	Button,		x420	y94		w120	h40		,	capture-group`n( )
Gui,	Add,	Button,		x420	y154	w120	h40		,	positive lookbehind`n(?<= )
Gui,	Add,	Button,		x420	y194	w120	h40		,	negative lookbehind`n(?<! )
Gui,	Add,	Button,		x470	y254	w160	h40		,	named capturing group`n(?<name> )
Gui,	Add,	Button,		x560	y154	w120	h40		,	positive lookahead`n(?= )
Gui,	Add,	Button,		x560	y194	w120	h40		,	negative lookahead`n(?! )
Gui,	Add,	Button,		x560	y54		w120	h40		,	negated-set`n[^ ]
Gui,	Add,	Button,		x560	y94		w120	h40		,	non-capturing group`n(?: )
;	Generated	using	SmartGUI	Creator	for	SciTE
;: Gui,	Show,	w700	h312,	Untitled	GUI
Gui,	Show,	w%t_w%	h%t_h%,	Untitled	GUI
return



GuiClose:
ExitApp