/* ;SCROLL SPEED MONITORING (AS TOOLTIP)
 * ;===============================================================================
 * #Persistent
 * SetTimer, ScrollSpeedMonitor, 50
 * return
 * ;-------------------------------------------------------------------------------
 * ScrollSpeedMonitor:
 * ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . scrollAmount ""
 * return
 */

/* lines
 * 	of 
 * 	test
 * text 
 * 	to 
 * 	un-block-comment
 * 	
 */




#PersistenT 

;SCROLL SPEED MONITORING (AS TOOLTIP)
;===============================================================================
;auto-execute section===========================================================
;	cmd,      label,              time interval in milliseconds
 SetTimer, ScrollSpeedMonitor, 50
 return
;end of auto-execute section;---------------------------------------------------
;-------------------------------------------------------------------------------

;	label
	ScrollSpeedMonitor:
;	statement, 
	ToolTip % "deltaTime: `t" . deltaTime . "`nint:`t" . scrollAmount ""
	return