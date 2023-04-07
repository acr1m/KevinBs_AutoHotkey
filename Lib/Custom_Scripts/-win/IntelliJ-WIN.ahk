#IfWinActive ahk_exe idea64.exe
;;If window is active

;; CurrentTheme_obj := new CurrentTheme ;;creates a new CurrentTheme-class-object

/* 
 * In autohotkey, "base" and "class" are functionally the same
 * 
 */
class CurrentTheme
{
	themeListIndex := 1
	savedIndex := 2
	
	;; array
	themeList := [
		, "Tools, Material Theme Lite, Regular Themes, Darker Theme"
		, "Tools, Material Theme Lite, Regular Themes, Oceanic Theme"
		, "Tools, Material Theme Lite, Regular Themes, Palenight Theme"
		, "Tools, Material Theme Lite, Regular Themes, Lighter Theme"
		, "Tools, Material Theme Lite, Regular Themes, Deep Ocean Theme"
		, "Tools, Material Theme Lite, Regular Themes, Monokai Theme"
		, "Tools, Material Theme Lite, Regular Themes, GitHub Theme"
		, "Tools, Material Theme Lite, Regular Themes, GitHub Dark Theme"
		, "Tools, Material Theme Lite, Regular Themes, Dracula Theme"
		, "Tools, Material Theme Lite, Regular Themes, Arc Dark Theme"
		, "Tools, Material Theme Lite, Regular Themes, Atom One Dark Theme"
		, "Tools, Material Theme Lite, Regular Themes, Atome One Light Theme"
		, "Tools, Material Theme Lite, Regular Themes, Solarized Dark Theme"
		, "Tools, Material Theme Lite, Regular Themes, Solarized Light Theme"
		, "Tools, Material Theme Lite, Regular Themes, Night Owl Theme"
		, "Tools, Material Theme Lite, Regular Themes, Light Owl Theme"
		, "Tools, Material Theme Lite, Regular Themes, Moonlight Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Darker Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Oceanic Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Palenight Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Lighter Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Deep Ocean Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Monokai Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, GitHub Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, GitHub Dark Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Dracula Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Arc Dark Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Atom One Dark Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Atome One Light Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Solarized Dark Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Solarized Light Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Night Owl Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Light Owl Theme"
		, "Tools, Material Theme Lite, Contrasted Themes, Moonlight Theme"]
	themeList2 := [
		, "Tools | Material Theme Lite | Regular Themes: Darker Theme"
		, "Tools | Material Theme Lite | Regular Themes: Oceanic Theme"
		, "Tools | Material Theme Lite | Regular Themes: Palenight Theme"
		, "Tools | Material Theme Lite | Regular Themes: Lighter Theme"
		, "Tools | Material Theme Lite | Regular Themes: Deep Ocean Theme"
		, "Tools | Material Theme Lite | Regular Themes: Monokai Theme"
		, "Tools | Material Theme Lite | Regular Themes: GitHub Theme"
		, "Tools | Material Theme Lite | Regular Themes: GitHub Dark Theme"
		, "Tools | Material Theme Lite | Regular Themes: Dracula Theme"
		, "Tools | Material Theme Lite | Regular Themes: Arc Dark Theme"
		, "Tools | Material Theme Lite | Regular Themes: Atom One Dark Theme"
		, "Tools | Material Theme Lite | Regular Themes: Atome One Light Theme"
		, "Tools | Material Theme Lite | Regular Themes: Solarized Dark Theme"
		, "Tools | Material Theme Lite | Regular Themes: Solarized Light Theme"
		, "Tools | Material Theme Lite | Regular Themes: Night Owl Theme"
		, "Tools | Material Theme Lite | Regular Themes: Light Owl Theme"
		, "Tools | Material Theme Lite | Regular Themes: Moonlight Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Darker Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Oceanic Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Palenight Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Lighter Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Deep Ocean Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Monokai Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: GitHub Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: GitHub Dark Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Dracula Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Arc Dark Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Atom One Dark Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Atome One Light Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Solarized Dark Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Solarized Light Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Night Owl Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Light Owl Theme"
		, "Tools | Material Theme Lite | Contrasted Themes: Moonlight Theme"]
	
	;;;; this sub tests the themeList array
	;; outStr := ""
	;; for themeListIndex, val in themeList {
	;; outStr .= "themeListIndex: " . themeListIndex . " =  val: " . val . "`n"
	;; }
	;; MsgBox, , % "title", % outStr
	;; MsgBox, , % "test", % themeList[themeListIndex]

	
	/*
	themeListIndex[]
	{
		get() {
			return themeListIndex
		}
		set() {
			return themeListIndex := p_int
		}
	}
	
	savedIndex[] {
		get() {
			return savedIndex
		}
		set(p_int) {
			return savedIndex := p_int
		}
	}
	*/
	
	/**
	 * increments the current themeList themeListIndex value by +1
	 * and then activates the WinMenuSelectItem that corresponds
	 * to that themeListIndex-value.
	 */
	nextTheme() {
		;; this.themeListIndex += 1
		;; themeListIndex += 1
		;; themeListIndex := themeListIndex + 1
		this.themeListIndex := this.themeListIndex + 1

		;; WinMenuSelectItem, ahk_exe idea64.exe,, % this.themeList[themeListIndex]
		outStr := this.themeList2[this.themeListIndex]
		Send, {Shift}
		Sleep, 250
		Send, {Shift}
		KeyWait, Shift
		Send, %outStr%{Enter}
		
		Sleep, 1000
		MsgBox, , % "nextTheme()", % "themeListIndex = " . this.themeListIndex

	}
	
	/**
	 * Decrements the current themeList themeListIndex value by -1, 
	 * and then activates the WinMenuSelectItem that corresponds
	 * to that themeListIndex-value.
	 */
	prevTheme() {
		;; this.themeListIndex -= 1
		;; themeListIndex -= 1
		;; themeListIndex := themeListIndex - 1
		this.themeListIndex := this.themeListIndex - 1
		
		;; WinMenuSelectItem, ahk_exe idea64.exe,, % this.themeList[themeListIndex]
		outStr := this.themeList2[this.themeListIndex]
		Send, {Shift}
		Sleep, 250
		Send, {Shift}
		KeyWait, Shift
		Send, %outStr%{Enter}
		
		Sleep, 1000
		MsgBox, , % "prevTheme()", % "themeListIndex = " . this.themeListIndex
	}
	
	/**
	 * Sets the current themeList themeListIndex value by -1, 
	 * and then activates the WinMenuSelectItem that corresponds
	 * to that themeListIndex-value.
	 */
	restoreTheme() {
		this.themeListIndex := this.savedIndex
		;; themeListIndex := savedIndex
		
		;; WinMenuSelectItem, ahk_exe idea64.exe,, % this.themeList[themeListIndex]
		outStr := this.themeList2[this.themeListIndex]
		Send, {Shift}
		Sleep, 250
		Send, {Shift}
		KeyWait, Shift
		Send, %outStr%{Enter}
		
		Sleep, 1000
		MsgBox, , % "restoreTheme()", % "themeListIndex = " . this.themeListIndex . " : savedIndex = " this.savedIndex
	}
	
}

^!+PgDn::
	CurrentTheme_obj.nextTheme()
	return

^!+PgUp::
	CurrentTheme_obj.prevTheme()
	return

^!+Home::
	CurrentTheme_obj.restoreTheme()
	return

;; $LButton::
	;; Send, {LButton}
	;; KeyWait, LButton
	;; return
	
!LButton Up::
{
	Send, {LButton Up}
	Send, !{Enter}
	return
}
;;Re-declare any window as an acceptable 
;;case-scenario before exit.
#IfWinActive 