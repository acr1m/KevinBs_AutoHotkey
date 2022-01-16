;; shows the amount of scroll-wheel inputs sent as a tooltip following the mouse

;; loop the given label-block by n-amount
SetTimer, Lbl_Scroll_Speed_Monitor, 50
return

;; breaker-switch
Pause::ExitApp

;; this label-block is looped by the command 'SetTimer'
Lbl_Scroll_Speed_Monitor: ;{ 
	ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . scrollAmount ""
	return  ;}