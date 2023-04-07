;: Menu, Tray, Icon, % "E:\Software\iconsext-1.47\icons\shell32\shell32_40.ico"

;;;; Use the 2nd icon group from the file
;: Menu, Tray, Icon, Shell32.dll, 40 

;;;; Use icon with resource identifier (16813)
Menu, Tray, Icon, Shell32.dll, -16813 

#b:: HideShowTaskbar(hide := !hide)

HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}