#SingleInstance Force

/* AHK_LIB_Emojis_And_Symbols.ahk
 * 
 * @description
 * 		This script is a place for hotstrings, hotkeys, and methods for 
 * 		handling the output of and conversion of text into unicode emojis and 
 * 		other symbols. 
 * 
 * 
 */
;;##############################################################################
;;SYMBOLS FOR CHAT, MESSAGES, COMMUNICATION, FRIENDS, 
;; #Include E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\Math-Keyboard-AHK.ahk

#Hotstring SE ;; send hotstring functions as SendEvent

global g_emojiIncrementTimer := 2000 ;; 2 seconds
global g_firstKissCall := 0


#Hotstring o0 ? ;; ending character off (o0), allow suffix triggering
/* 
 * Discrete Math Symbols
 * Predicate Logic
 * junctions::		∧∨⊕
 * statements::		∵∴≡⋯
 * 
 * set theory::		⋂⋃
 * prepositionals::	⊃⊅⊂⊄⊆⊇⊉⋲⋸
 * quantifiers::		∀∃∆
 * ⋀⋁⊼⊽∏∐Σ∑∏∐∓∈∋∣∼∽≔≢⨁⩡
 * ∩∪∩∪
 */

;; ˜ U+02dc ; high tilde, superscript tilde
::symmetricdifference;::
::symmetricdifference1;::
::symmdiff;::
::symmdiff1;::
::symdiff;::
::symdiff1;::
::sdiff;::
::sdiff1;::
::exclusiveor;::
::xor;::
::xor1;::
;; ⊕ 2295
;; ⊻ 22bb
	pasteClipboard("⊻") ; logical XOR, Exclusive OR
	return
::exclusiveor;;::
::exclusiveorr;::
::symmetricdifference;;::
::symmetricdifferencee;::
::symmetricdifference2;::
::symmdiff;;::
::symmdiff2;::
::symdiff;;::
::symdiff2;::
::sdiff;;::
::sdiff2;::
::xor;;::
::xorr;::
::xor2;::
::circleplus;::
::oplus;::
	pasteClipboard("⊕") ; logical XOR, Exclusive OR
	return
::notand;::
::nand;::
	pasteClipboard("⊼") ;; ⊼  22bc ; NOT AND, NAND
	return
::nor3;::
::nor;;;::
::norrr;::
	pasteClipboard("⊽") ;; ⊽  22bd ; NOT OR, NOR
	return
::then;::
	pasteClipboard("→") ; logical THEN
	return
::iff;::
::iff1;::
	pasteClipboard("⟷") ; logical IF AND ONLY IF, IFF
	return
::iff;;::
::ifff;::
::iff2;::
	pasteClipboard("⬌") ; logical IF AND ONLY IF, IFF
	return
::therefore;::
::tf;::
	pasteClipboard("∴") ; logical THEREFORE
	return
::because;::
::bcuz;::
::bc;::
	pasteClipboard("∵") ; logical BECAUSE
	return
;; ::;::
	;; pasteClipboard("")
	;; return
::subset;::
::sub;::
	pasteClipboard("⊂") ;;U+2282 (8834) 		⊂ 	SUBSET OF
	return
::superset;::
::supset;::
::sup;::
	pasteClipboard("⊃") ;;U+2283 (8835) 		⊃ 	SUPERSET OF
	return
::subseteq;::
::subset=;::
::subeq;::
::sub=;::
	pasteClipboard("⊆") ;;U+2286 (8838) 		⊆ 	SUBSET OF OR EQUAL TO
	return
::supseteq;::
::supset=;::
::supeq;::
::sup=;::
	pasteClipboard("⊇") ;;U+2287 (8839) 		⊇ 	SUPERSET OF OR EQUAL TO
	return
::sigma;::
::summation;::
::sum;::
	pasteClipboard("∑") ;;U+2211 (8721) 		∑	N-ARY SUMMATION
	return
::qed;::
	pasteClipboard("∎") ;;U+220E (8718) 		∎	END OF PROOF
	return
::not1;::
::not;::
	pasteClipboard("¬") ;; ¬ U+00ac ; carriage return symbol, logical NOT symbol
	return
::nott;::
::not2;::
::not;;::
	pasteClipboard("~") ;; ~ A+126 ; tilde
	return
::land1;:: ; logical and
::land;:: ; logical and
::and1;::
::and;::
	pasteClipboard("∧") ;; ∧ U+2227 ; logical AND, conjunction
	return
::land;;:: ; logcal and
::land2;:: ; logcal and
::and2;::
::and;;::
::andd;::
	pasteClipboard("⋀") ;; ⋀= U+22C0 (8896), ; logical AND, conjunction
	return
::lor1;:: ; logical or
::lor;:: ; logical or
::or1;::
::or;::
	pasteClipboard("∨") ;; ∨ U+2228 ; logical OR, disconjunction inclusive
	return
::lor2;:: ; logical or
::lor;;:: ; logical or
::or2;::
::orr;::
::or;;::
	pasteClipboard("⋁") ;; ⋁ U+22C1 (8897); logical OR, disconjunction inclusive
	return
::is not an element of;::
::isnotanelementof;::
::not element of;::
::notelementof;::
::not in;::
::notin;::
::nin;::
	pasteClipboard("∉") ;;U+2209 (8713) 		∉ 	NOT AN ELEMENT OF
	return
::is an element of;::
::isanelementof;::
::element of;::
::elementof;::
::in;::
	pasteClipboard("∈") ;;U+2208 (8712) 		∈ 	ELEMENT OF
	return
::emptyset;::
::0;::
	pasteClipboard("∅") ;;U+2205 (8709) 		∅ 	EMPTY SET
	return
::delta;::
::increment;::
	pasteClipboard("∆") ;; U+2206 (8710) 		∆ 	INCREMENT
	return
::nabla;::
	pasteClipboard("∇") ;; U+2207 (8711) 		∇ 	NABLA
	return
::equivalence;::
::isthesameas;::
::equivalent;::
::equiv;::
::=;::
::=;;::
::==;::
::---;::
	pasteClipboard("≡") ;; ≡ 2261
	return
::notequalto;::
::notequal;::
::nequal;::
::neq;::
	pasteClipboard("≠") ;; ≠ U+2260
	return
::theta;::
	pasteClipboard("Θ") ;; Θ (233)		Θ	theta
	return
::pi;::
	pasteClipboard("π") ;; Θ (227)		π	pi
	return
::union;::
:C:U;::
	pasteClipboard("∪") ;; U+222A (8746) 		∪ 	UNION
	return
::intersect;::
::intsect;::
	pasteClipboard("∩") ;; U+2229 (8745) 		∩ 	INTERSECTION
	return




::not all;::
::nall;::
:C:notA;::
:C:NA;::
:C:nA;::
	pasteClipboard("¬∀")
	return
::for all;::
::forall;::
::fall;::
::all;::
:C:A;::
	pasteClipboard("∀") ;;U+2200 (8704) 		∀ 	FOR ALL
	return
::notexists;::
::notexist;::
::nexist;::
:C:notE;::
:C:NE;::
:C:nE;::
	pasteClipboard("¬∃") ;;U+2203 (8707) 		∃ 	THERE EXISTS
	return
::exists;::
::exist;::
:C:E;::
	pasteClipboard("∃") ;;U+2203 (8707) 		∃ 	THERE EXISTS
	return

;; ::;::
	;; pasteClipboard(" ")
	;; return
;; ⊤ +22A4 ; Tautology; top, verum; propositional logic; Boolean Algebra (True);
;; T +22A4 ; Tautology; top, verum; propositional logic; Boolean Algebra (True);
;; 1 +22A4 ; Tautology; top, verum; propositional logic; Boolean Algebra (True);
;; ⊥ +22A5 ; Contradiction; bottom, falsum; Propositional logic, Boolean Algebra (False);
;; F      ; Contradiction; bottom, falsum; Propositional logic, Boolean Algebra (False);
;; 0      ; Contradiction; bottom, falsum; Propositional logic, Boolean Algebra (False);
;; ∀ +2200 ; universal quantification; for all, for any, for each; first-order logic;
;; ∃ +2203 ; existential quantification; there exists; first-order logic;
;; ∃! +2203 +0021 ; uniqueness quantification; there is exactly one; first-order logic;
;; ≔ +2254 ; Definition; is defined as; everywhere; 
;; : = +003a +003d  ; Definition; is defined as; everywhere; 
;; : ⊜ +003a +229c  ; Definition; is defined as; everywhere; 
;; ( ) +0028 +0029
;; ⊢ U+22a2
;; ⊨ U+22a8
;; ∴ U+2234	
;; ∵ U+2235	
;; ⊽ U+22bd	
;; ⋄ U+22c4	
;; ⋆ U+22c6	
;; ⊥ U+22a5	
;; ↓ U+2193 	
;; ⌐ U+2310	
;; ⌜ U+231c	
;; ⌝ U+231d	

#Hotstring O ?0



::bell;::
	pasteClipboard("•")
	return
::tab;:: ; pastes a regular horizontal tab character
	pasteClipboard("	")
	return
::tab;;:: ; tab character code identity for html
	pasteClipboard("&#9;")
	return
::space;:: ; no break space named identity for html
	pasteClipboard("&nbsp;")
	return
::space;;:: ; regular space character code identity for html
	pasteClipboard("&#32;")
	return
::nl;::
::newline;::
	;; Send, {asc 013} ; carriage-return ascii key-code
	Send, {u+013} ; carriage-return ascii key-code
	
	
	;; tempClip := ClipboardAll
	;; Clipboard := ""
	;; Clipboard := Asc("
	;; ClipWait
	;; Send, ^v
	;; Clipboard := tempClip
	
	return
	
/*
::kiss;::

	;; set global var from (default: 1) to 2,
	;;; and print out the first string in the list of arguments
	;; hit enter to cycle through the list
		
	pasteClipboard("(⌒▽⌒)♡")
	
	;; if first time this function is called...
	if (g_currentRaisedPower == 1 && g_firstKissCall == 0) {
		g_currentRaisedPower := 2
		g_firstKissCall := 1
	} else if (g_currentRaisedPower == 1) {
		g_currentRaisedPower := 2
		g_emojiIncrementTimer
	}
	
	mathKbd_incrementVariables(2000
	,"(⌒▽⌒)♡"
	,"(*¯ ³¯*)♡"
	,"♡ (￣З￣)"
	,"(≧◡≦) ♡"
	,"( ´ ∀ `)ノ～ ♡"
	,"( ´ ▽ ` ).｡ｏ♡")
	return

;; this label resets the global var 'g_firstKissCall' to 0
;;;; whenever the 'SetTimer' which activated this Label has
;;;; expired.
Lbl_Hotstring_kiss:
	g_firstKissCall := 0 
	return
*/
/** KAOMOJIS 
 */
::facepalm;::
	pasteClipboard("(ノへ￣、)")
	return
::kiss1;::
	pasteClipboard("(*¯ ³¯*)♡")
	return
::kiss2;::
	pasteClipboard("(⌒▽⌒)♡")
	return
::kiss3;::
	pasteClipboard("♡ (￣З￣)")
	return
::kiss4;::
	pasteClipboard("(≧◡≦) ♡")
	return
::kiss5;::
	pasteClipboard("( ´ ∀ `)ノ～ ♡")
	return
::kiss6;::
	pasteClipboard("( ´ ▽ ` ).｡ｏ♡")
	return
::tableflip;::
	pasteClipboard("( ╯°□°)╯ ┻━━┻")
	return
::happyblush;::
::blushhappy;::
	pasteClipboard("(#＾ヮ＾#)")
	return
::itsnothing;::
::awwshucks;::
::shucks;::
::noproblem;::
::blush;::
::np;::
	pasteClipboard("(⌒▿⌒*)ゞ")
	return
::suss;::
::suss1;::
::doubt;::
	pasteClipboard("(￢_￢)")
	return
::susss;::
::suss2;::
::doubt2;::
	pasteClipboard("(¬_¬ )")
	return
::shruggie;::
	pasteClipboard("¯\_(ツ)_/¯")
	return
::shruggie2;::
	pasteClipboard("￣\_(ツ)_/￣")
	return
::shruggie3;::
	pasteClipboard("┑(￣Д ￣)┍")
	return
::shruggie4;::
	pasteClipboard("╮(╯▽╰)╭")
	return
::shruggie5;::
	pasteClipboard("╮(╯-╰)╭")
	return
::shruggie6;::
	pasteClipboard("━━(￣ー￣*|||━━")
	return
::shruggie7;::
	pasteClipboard("ㄟ( ▔, ▔ )ㄏ")
	return

::shruggie_;::
	shruggieLoop()
	return

shruggieLoop() {	
	local loopAgain := true
	while (loopAgain) {
		
		KeyWait, RCtrl, D T2 ;; wait 2 seconds to be pressed
		if (ErrorLevel == 0) {
			
			KeyWait, RCtrl, ;; RCtrl must be released before continuing, else it rapid fires.
			if (ErrorLevel == 0) { 
				
				
				main_incrementVariables(2000 ;; 2 seconds
					,"¯\_(ツ)_/¯"
					,"￣\_(ツ)_/￣"
					,"┑(￣Д ￣)┍"
					,"╮(╯▽╰)╭"
					,"╮(╯-╰)╭"
					,"━━(￣ー￣*|||━━"
					,"ㄟ( ▔, ▔ )ㄏ")
				loopAgain := true
			} else {
				loopAgain := false
			}
		} else {
			loopAgain := false
		}
	}
	return
}

::gasp1;::
::gasp;::
::shock1;::
::shock;::
	pasteClipboard("Σ(°ロ°)")
	return
::shock2;::
::gasp2;::
	pasteClipboard("(°ロ°) !")
	return
::speechless1;::
::speechless;::
::umm1;::
::umm;::
::eh...;::
	pasteClipboard("(￣□￣;)")
	return
::speechless2;::
::speechless;;::
::umm2;::
::umm;;::
	pasteClipboard("(°ー°〃)")
	return
::speechless3;::
::speechless;;;::
::umm3;::
::umm;;;::
	pasteClipboard("(⊙_⊙;)")
	return
::speechless4;::
::speechless;;;;::
::umm4;::
::umm;;;;::
	pasteClipboard("(ˉ▽ˉ；)...")
	;; (￣_,￣ )
	;; ←_←
	;; →_→
	;; (x_x)
	;; (。>︿<)_θ
	;; (☆-ｖ-)
	;; ( ╯□╰ )
	;; (￣▽￣)"
	;; (。・・)ノ
	;; (ˉ▽￣～)
	;; ┌( ´_ゝ` )┐
	;; ,,ԾㅂԾ,,
	;; ○|￣|_
	;; ε=ε=ε=┏(゜ロ゜;)┛
	;; ...( ＿ ＿)ノ｜
	return
::drool;::
	pasteClipboard("(ˉ﹃ˉ)")
	return
::wow;::
	pasteClipboard("w(°ｏ°)w")
	return
::bliss;::
	pasteClipboard("(¯▿¯)")
	return
::smug;::
::larry;::
::lenny;::
	pasteClipboard("( ͡° ͜ʖ ͡°)")
	return
::joy;::
	pasteClipboard("(⁀ᗢ⁀)")
	return
::smirk;::
::smirk1;::
::happysuss;::
	pasteClipboard("(￢‿￢ )")
	return
::smirk2;::
::smirk;;::
::happysuss2;::
	pasteClipboard("(¬‿¬ )")
	return
::lookofdisapproval;::
::disapproval;::
::disapprove;::
::lookofd;::
::lookod;::
::lkofd;::
::lod;::
::notamused;::
::notfunny;::
	;~ Send, ಠ__ಠ
	pasteClipboard("ಠ__ಠ")
	return
;;SYMBOLS FOR BASIC EMOJIS
::`:);::{U+1F642} ;;
::`:P;::{U+1F61B} ;;
::`;);::{U+1F609} ;;
::`;P;::{U+1f61c} ;;
::beer;::{U+1F37A} ;;
::cheers;::cheers {U+1F37A} ;;
::lol;::lol {U+1F602} ;;
::heart;::{U+2764} ;;❤
::rofl;::rofl {U+1F923} ;藍
;~ ::`;P:: Send {AltDown}{NumpadAdd}1F61C{AltUp}
;~ ::`:P:: Send {AltDown}{NumpadAdd}1F61B{AltUp}
;~##############################################################################
;~ SYMBOLS FOR ORGANIZED LISTS
#Hotstring O
	::check;::
	::chk::
	::chk;::
		Send, {U+2714} ;✔ 
		return
	::chkx::
	::xmark::
	::xmark;::
	::xmrk::
	::xmrk;::
	::x;::
	::x;::
	::rx::
	::rx;::
		Send, {U+274C} ;❌
		return
	::checkbox;::
	::chkbx::
	::chkbx;::
	::chkbox::
	::chkbox;::
		Send, {U+2705} ;✅
		return
#Hotstring O0

::rightarrow;::{U+2794} ; ➔
;~ ::rr::{U+2794} ;➔	right arrow 					➔
::rr::{U+27a4} ;my default favorite arrow 		➤	black rightwards arrowhead 		➤
::rrt::{U+27a5} ;my default favorite tab arrow	➥	3d arrow, bottom lighted 		➥
::rre::{U+2B60} ;⭠ 	left triangle-headed arrow 		⭠
:O:rrx::{U+274C} ;❌

::r1::{U+2794} ;➔	right arrow 					➔
::r2::{U+27a2} ;➢	3d arrow, top lighted 			➢
::r3::{U+27a3} ;➣	3d arrow, bottom lighted 		➣
::r4::{U+27a4} ;➤	black rightwards arrowhead 		➤
::r5::{U+27a5} ;➥	3d arrow, bottom lighted 		➥
::r6::{U+27a6} ;➦	3d arrow, bottom lighted 		➦➜
::r7::{U+2B95} ;⮕ 	rightwards black arrow			⮕
::r0::{U+2B62} ;⭢ 	right triangle-headed arrow 	⭢

 
::sup,A;::
::supA;::
	Send, {U+1D2C} ;ᴬ
	return
::sup,AE;::
::supAE;::
	Send, {U+1D2D} ;ᴭ
	return
::supB;::
::sup,B;::
	Send, {U+1D2E} ;ᴮ
	return
::supᴯ;::
::sup,ᴯ;::
	Send, {U+1D2F} ;ᴯ
	return
::sup,D;::
::supD;::
	Send, {U+1D30} ;ᴰ
	return
::sup,E;::
::supE;::
	Send, {U+1D31} ;ᴱ
	return
::sup,E<;::
::sup,Eback;::
::sup,Ebackwards;::
::sup,Eleft;::
::sup,Erev;::
::supE<;::
::supEback;::
::supEbackwards;::
::supEleft;::
::supErev;::
	Send, {U+1D32} ;ᴲ
	return
::sup,G;::
::supG;::
	Send, {U+1D33} ;ᴳ
	return
::sup,H;::
::supH;::
	Send, {U+1D34} ;ᴴ
	return
::sup,I;::
::supI;::
	Send, {U+1D35} ;ᴵ
	return
::sup,J;::
::supJ;::
	Send, {U+1D36} ;ᴶ
	return
::sup,K;::
::supK;::
	Send, {U+1D37} ;ᴷ
	return
::sup,L;::
::supL;::
	Send, {U+1D38} ;ᴸ
	return
::sup,M;::
::supM;::
	Send, {U+1D39} ;ᴹ
	return
::sup,N;::
::supN;::
	Send, {U+1D3A} ;ᴺ
	return
::sup,N<;::
::supN<;::
	Send, {U+1D3B} ;ᴻ
	return
::sup,O;::
::supO;::
	Send, {U+1D3C} ;ᴼ
	return
::sup,OU;::
::supOU;::
	Send, {U+1D3D} ;ᴽ
	return
::sup,P;::
::supP;::
	Send, {U+1D3E} ;ᴾ
	return
::sup,R;::
::supR;::
	Send, {U+1D3F} ;ᴿ
	return
::sup,T;::
::supT;::
	Send, {U+1D40} ;ᵀ
	return
::sup,U;::
::supU;::
	Send, {U+1D41} ;ᵁ
	return
::sup,W;::
::supW;::
	Send, {U+1D42} ;ᵂ
	return
::sup,a;::
::supa;::
	Send, {U+1D43} ;ᵃ
	return
::sup,adown;::
::supadown;::
	Send, {U+1D44} ;ᵄ
	return
::sup,alpha;::
::supalpha;::
	Send, {U+1D45} ;ᵅ
	return
::sup,ae;::
::supae;::
	Send, {U+1D46} ;ᵆ
	return
::sup,b;::
::supb;::
	Send, {U+1D47} ;ᵇ
	return
::sup,d;::
::supd;::
	Send, {U+1D48} ;ᵈ
	return
::sup,e;::
::supe;::
	Send, {U+1D49} ;ᵉ
	return
::sup,edown;::
::sup,eturned;::
::sup,eupsidedown;::
::supedown;::
::supeturned;::
::supeupsidedown;::
	Send, {U+1D4A} ;ᵊ
	return
::sup,eopen;::
::sup,eopen;::
::sup,epsilon;::
::sup,epsilon;::
::sup,opene;::
::sup,opene;::
::supeopen;::
::supepsilon;::
::supopene;::
	Send, {U+1D4B} ;ᵋ
	return
::sup,eopen,turned;::
::sup,eopenturned;::
::sup,epsilon,turned;::
::sup,epsilonturned;::
::sup,opene,turned;::
::sup,openeturned;::
::sup,turned,eopen;::
::sup,turned,epsilon;::
::sup,turned,opene;::
::sup,turnedeopen;::
::sup,turnedepsilon;::
::sup,turnedopene;::
::supeopenturned;::
::supepsilonturned;::
::supopeneturned;::
::supturnedeopen;::
::supturnedepsilon;::
::supturnedopene;::
	Send, {U+1D4C} ;ᵌ
	return
::sup,g;::
::supg;::
	Send, {U+1D4D} ;ᵍ
	return
::sup!;::
::sup,!;::
	Send, {U+1D4E} ;ᵎ
	return
::sup,k;::
::supk;::
	Send, {U+1D4F} ;ᵏ
	return
::sup,m;::
::supm;::
	Send, {U+1D50} ;ᵐ
	return
::supᵑ;::
::sup,ᵑ;::
::sup,eng;::
::sup,nj;::
::supeng;::
::supnj;::
	Send, {U+1D51} ;ᵑ
	return
::sup,o;::
::supo;::
	Send, {U+1D52} ;ᵒ
	return
::sup,cflipped;::
::sup,cturned;::
::sup,flippedc;::
::sup,o,open;::
::sup,oopen;::
::sup,open,o;::
::sup,openo;::
::sup,turnedc;::
::supcflipped;::
::supcturned;::
::supflippedc;::
::supoopen;::
::supopeno;::
::supturnedc;::
	Send, {U+1D53} ;ᵓ
	return
::sup,o,tophalf;::
::sup,otop;::
::sup,otop;::
::sup,otophalf;::
::sup,top,o;::
::sup,tophalf,o;::
::sup,tophalfo;::
::sup,topo;::
::supotop;::
::supotophalf;::
::suptophalfo;::
::suptopo;::
	Send, {U+1D54} ;ᵔ
	return
::sup,bottom,o;::
::sup,bottomhalf,o;::
::sup,bottomhalfo;::
::sup,bottomo;::
::sup,o,bottomhalf;::
::sup,obottom;::
::sup,obottom;::
::sup,obottomhalf;::
::supbottomhalfo;::
::supbottomo;::
::supobottom;::
::supobottomhalf;::
	Send, {U+1D55} ;ᵕ
	return
::sup,p;::
::supp;::
	Send, {U+1D56} ;ᵖ
	return
::sup,t;::
::supt;::
	Send, {U+1D57} ;ᵗ
	return
::sup,u;::
::sup,u;::
::supu;::
	Send, {U+1D58} ;ᵘ
	return
::sup,<,n;::
::sup,<n;::
::sup,left,n;::
::sup,leftn;::
::sup,n,<;::
::sup,n,left;::
::sup,n,side;::
::sup,n,sideways;::
::sup,n<;::
::sup,nleft;::
::sup,nside;::
::sup,nsideways;::
::sup,side,n;::
::sup,siden;::
::sup,sideways,n;::
::sup,sidewaysn;::
::sup<n;::
::supleftn;::
::supn<;::
::supnleft;::
::supnside;::
::supnsideways;::
::supsiden;::
::supsidewaysn;::
	Send, {U+1D59} ;ᵙ
	return
::sup,downm;::
::sup,flippedm;::
::sup,mdown;::
::sup,mflipped;::
::sup,mturned;::
::sup,mupsidedown;::
::sup,turnedm;::
::sup,upsidedownm;::
::supdownm;::
::supflippedm;::
::supmdown;::
::supmflipped;::
::supmturned;::
::supmupsidedown;::
::supturnedm;::
::supupsidedownm;::
	Send, {U+1D5A} ;ᵚ
	return
::sup,v;::
::supv;::
	Send, {U+1D5B} ;ᵛ
	return
::sup,ain;::
::supain;::
	Send, {U+1D5C} ;ᵜ
	return