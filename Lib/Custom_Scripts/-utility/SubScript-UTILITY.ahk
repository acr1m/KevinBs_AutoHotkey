#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\Main-Method-Library-LIB.ahk
#Include %A_MyDocuments%\AutoHotkey\Lib\Custom_Scripts\-lib\run()-LIB.ahk
run_AsAdmin()

;;ₐᵦₑₔⱼₕₖₗₘₙₚₛₜᵢᵣᵤᵥᵧᵨᵩₒₓᵪ₊₋₌₍₎₀₁₂₃₄₅₆₇₈₉
a::SendRaw, ₐ
b::SendRaw, ᵦ
e::SendRaw, ₑ
j::SendRaw, ⱼ
h::SendRaw, ₕ
k::SendRaw, ₖ
l::SendRaw, ₗ
m::SendRaw, ₘ
n::SendRaw, ₙ
p::SendRaw, ₚ
s::SendRaw, ₛ
t::SendRaw, ₜ
i::SendRaw, ᵢ
r::SendRaw, ᵣ
u::SendRaw, ᵤ
v::SendRaw, ᵥ
y::SendRaw, ᵧ
:?o:rho;::ᵨ ;; allow trigger as suffix, omit EndChar
o::SendRaw, ₒ
x::SendRaw, ₓ
+9::SendRaw, ₍
+0::SendRaw, ₎
+::
NumpadAdd::
	SendRaw, ₊
	return
-::
NumpadSub::
	SendRaw, ₋
	return
=::
	SendRaw, ₌
	return
0::
Numpad0::
	SendRaw, ₀
	return
1::
Numpad1::
	SendRaw, ₁
	return
2::
Numpad2::
	SendRaw, ₂
	return
3::
Numpad3::
	SendRaw, ₃
	return
4::
Numpad4::
	SendRaw, ₄
	return
5::
Numpad5::
	SendRaw, ₅
	return
6::
Numpad6::
	SendRaw, ₆
	return
7::
Numpad7::
	SendRaw, ₇
	return
8::
Numpad8::
	SendRaw, ₈
	return
9::
Numpad9::
	SendRaw, ₉
	return
;; ::SendRaw, ₔ
;; ::SendRaw, ᵩ
;; ::SendRaw, ᵪ
