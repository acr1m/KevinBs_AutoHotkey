;; This utility is run by and terminated by Main-AHK.ahk
;;......E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\Main-AHK.ahk
;; 
;;..this file...
;;......E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\-utility\Hyphen-Spacing-UTILITY.ahk


#IfWinActive

SetTimer, Lbl_Hyphen_Spacing_Tooltip, 15 ;; default time-interval is 250 milliseconds
return

;; this label-block is looped by the command 'SetTimer'
Lbl_Hyphen_Spacing_Tooltip:
{
	;; show tooltip, indicating that hyphen-spacing is active
	ToolTip % "Hyphen-Spacing is Active.`nPress Ctrl+Shift+Space to toggle On|Off."
	return
}


;; breaker-switch
Pause::ExitApp

;; Re-map spacebar to hyphen, while this script is active.
Space::-