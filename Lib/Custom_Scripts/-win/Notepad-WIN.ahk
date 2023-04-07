/* Included into this script-file
 * ;; E:\Library\OneDrive\Documents\AutoHotkey\Lib\Custom_Scripts\Main-AHK.ahk
 */
#IfWinActive ahk_class Notepad
Tab::Send, {Space 4}
+Tab::Send, {BackSpace 4}
+Backspace::Send, {BackSpace 4}
+Delete::Send, {Delete 4}
#IfWinActive