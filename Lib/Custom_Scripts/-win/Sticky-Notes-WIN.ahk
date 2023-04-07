#IfWinActive Sticky Notes ahk_class ApplicationFrameWindow ahk_exe ApplicationFrameHost.exe

Tab::
{	;;SendRaw, % "	"
	Send, {ASC 09}
	return
}
+Tab::
{	Send, {Home}{Delete}
	return
}
^+Up:: moveCurrentLineUp()
^+Down:: moveCurrentLineDown()

#IfWinActive