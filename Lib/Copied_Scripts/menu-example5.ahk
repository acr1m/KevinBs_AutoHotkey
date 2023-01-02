
;~ #5: Demonstrates the usage of BoundFunc objects to pass additional parameters when using a function instead of a subroutine.

; Bind parameters to the function and return BoundFunc objects:
BoundGivePar0 := Func("GivePar0").Bind()
BoundGivePar1 := Func("GivePar1").Bind("arg1")
BoundGivePar2 := Func("GivePar2").Bind("arg1", "arg2")
BoundGivePar3 := Func("GivePar3").Bind("arg1", "arg2", "arg3")

; Create the menu and show it:
Menu MyMenu, Add, Give parameters: 0, % BoundGivePar0
Menu MyMenu, Add, Give parameters: 1, % BoundGivePar1
Menu MyMenu, Add, Give parameters: 2, % BoundGivePar2
Menu MyMenu, Add, Give parameters: 3, % BoundGivePar3
Menu MyMenu, Show

/*	Definition of custom function GivePar:
	- Regardless of whether any arguments have been bound to
		the referenced FuncObject, the last 3 parameters are automatically
		assigned as follows...

		{ FunctionName(a, b, c): a = ItemName, b = ItemPos, c = MenuName }
		{ FunctionName(p1, ..., pN, a, b, c): N = number of bound parameters, a = ItemName, b = ItemPos, c = MenuName }
*/

GivePar0(p1, p2, p3)
{
    MsgBox % "ItemName:`t" p1 "`n"
           . "ItemPos: `t`t" p2 "`n"
           . "MenuName:`t" p3 "`n"
}

GivePar1(p1, p2, p3, p4)
{
    MsgBox % "parameter1:`t" p1 "`n"
		   . "ItemName:`t" p2 "`n"
           . "ItemPos:`t`t" p3 "`n"
           . "MenuName:`t" p4 "`n"
}

GivePar2(p1, p2, ItemName, ItemPos, MenuName)
{
    MsgBox % "parameter 1:`t" p1 "`n"
           . "parameter 2:`t" p2 "`n"
           . "ItemName:`t" ItemName "`n"
           . "ItemPos:`t`t" ItemPos "`n"
           . "MenuName:`t" MenuName
}

GivePar3(p1, p2, p3, d, e, f)
{
    MsgBox % "parameter 1:`t" p1 "`n"
           . "parameter 2:`t" p2 "`n"
           . "parameter 3:`t" p3 "`n"
           . "ItemName:`t" d "`n"
           . "ItemPos:`t`t" e "`n"
           . "MenuName:`t" f
}

return