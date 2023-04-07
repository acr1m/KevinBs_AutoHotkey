;~ Usage of the Region sub-command. These examples may not work well with the new Notepad on Windows 11 or later.

;~ #0
;~ Reset the window, removing all applied changes
WinSet, Region, , ahk_class Notepad


;~ #1
;~ Makes Notepad a little bit transparent.
WinSet, Transparent, 200, Untitled - Notepad

;~ #2 
;~ Makes all white pixels in Notepad invisible. This example may not work well with the new Notepad on Windows 11 or later.
WinSet, TransColor, White, Untitled - Notepad

;~ #3
;~ Toggles the always-on-top status of the calculator.
WinSet, AlwaysOnTop, Toggle, Calculator

;~ #7
;~ The following makes all parts of Notepad outside this rectangle invisible.
WinSet, Region, 50-50 W200 H250, ahk_class Notepad

;~ The following does the same as above but with corners rounded to 40x40.
WinSet, Region, 50-50 W200 H250 R40-40, ahk_class Notepad

;~ The following creates an ellipse instead of a rectangle.
WinSet, Region, 50-50 W200 H250 E, ahk_class Notepad

;~ The following creates a triangle with apex pointing down.
WinSet, Region, 50-50 250-50 150-225, ahk_class Notepad

;~ The following restores the window to its original/default display area.
WinSet, Region,, ahk_class Notepad

;~ The following creates a see-through rectangular hole inside Notepad (or any other window). There are two rectangles specified below: an outer and an inner. Each rectangle consists of 5 pairs of X/Y coordinates because the first pair is repeated at the end to "close off" each rectangle.
WinSet, Region, 0-0 300-0 300-300 0-300 0-0   100-100 200-100 200-200 100-200 100-100, ahk_class Notepad