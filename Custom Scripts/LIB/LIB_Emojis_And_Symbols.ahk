/* AHK_LIB_Emojis_And_Symbols.ahk
 * 
 * @description
 * 		This script is a place for hotstrings, hotkeys, and methods for 
 * 		handling the output of and conversion of text into unicode emojis and 
 * 		other symbols. 
 * 
 * 
 */
#Hotstring SE
;~ EMOJIS
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

::beer;::{U+1F37A} ;
::cheers;::cheers {U+1F37A} ;
::lol;::lol {U+1F602} ;
::rofl;::rofl {U+1F923} ;藍

::shruggie;::
	pasteClipboard("¯\_(ツ)_/¯")
	return
::shock;::
::shock1;::
	;~ Send, Σ(°ロ°)
	pasteClipboard("Σ(°ロ°)")
	return
::shock2::
::shock2;::
	;~ Send, (￣□￣;)
	pasteClipboard("(￣□￣;)")
	return
::gasp;::
::gasp;::
	;~ Send, (°ロ°) !
	pasteClipboard("(°ロ°) !")
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
	;~ Send, ( ͡° ͜ʖ ͡°)
	
	;~ archiveClipboard()
	;~ Clipboard := "( ͡° ͜ʖ ͡°)"
	;~ ClipWait, 2
	;~ Send, %ErrorLevel%
	;~ Sleep, 200
	;~ Send, ^v
	;~ restoreClipboard()
	return
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
::`:P;::{U+1F61B} ;
::`;);::{U+1F609} ;
::`:);::{U+1F642} ;
::`;P;::{U+1f61c} ;
;~ ::`;P:: Send {AltDown}{NumpadAdd}1F61C{AltUp}
;~ ::`:P:: Send {AltDown}{NumpadAdd}1F61B{AltUp}

;~ SYMBOLS
::rightarrow::{U+2794} ; ➔
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