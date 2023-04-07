/*
 *	AutoHotkey - Class Reference Document
 *	This document is a reference for the syntax of implementing objects
 *	 and classes in AutoHotkey scripts.
 *	
 *	Will be using <Java> coding syntax for equivalent comparisons. 
 */


/*	
 *	<AHK>
 *	class MyClass extends BaseClass {
 *		; statements...
 *	}
 *	
 *	<Java>
 *	public class MyClass extends BaseClass {...}
 *	
 */

myClass := new MyClassExample
SetTimer, 


class MyClassExample {
	
/* 	This is the Constructor method for this class
 * 	
 *	<AHK> <Constructor>
 *	class MyClass extends BaseClass { ; ''extends Object'' is optional
 *		__New(p1, p2) {
 *			this.p1 = p1;
 *			this.p2 = p2;
 *		}
 *	}
 *	
 * 	<Java> <Constructor>
 *	public class MyClass extends BaseClass{
 * 		public static void MyClass(p1, p2) {
 *			this.p1 = p1; 
 *			this.p2 = p2;
 *		}
 *	}
 *	
 *	
 */
	__New(param1, param2) {
		this.property1 := param1
		this.property2 := param2 
		this.myMethod := ObjBindMethod(this, "myMethodName")
	}
	
	MsgBox, , % "MyClassExample", % "hello from MyClassExample Class `n" . this.Name . "`nend of output-string." ; 
	
	;;TODO finish this method and documentation
	; outputs the properties of this object in a Tooltip
	myMethodName() {
		ToolTip, % "property1 = " . property1 . "`nproperty2 = " . property2 . "`nthis.Name = " . this.Name
	}
	
	
	
}


; Example from https://www.autohotkey.com/docs/commands/SetTimer.htm
;; #4: Uses a method as the timer subroutine.

counter := new SecondCounter
counter.Start()
Sleep 5000
counter.Stop()
Sleep 2000

; An example class for counting the seconds...
class SecondCounter {
    __New() {
        this.interval := 1000
        this.count := 0
        ; Tick() has an implicit parameter "this" which is a reference to
        ; the object, so we need to create a function which encapsulates
        ; "this" and the method to call:
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start() {
        ; Known limitation: SetTimer requires a plain variable reference.
        timer := this.timer
        SetTimer % timer, % this.interval
        ToolTip % "Counter started"
    }
    Stop() {
        ; To turn off the timer, we must pass the same object as before:
        timer := this.timer
        SetTimer % timer, Off
        ToolTip % "Counter stopped at " this.count
    }
    ; In this example, the timer calls this method:
    Tick() {
        ToolTip % ++this.count
    }
}

/* 
 * Tips relating to the above example:
 * •We can also use this.timer := this.Tick.Bind(this). When this.timer is called, it will effectively invoke this.Tick.Call(this) (except that this.Tick is not re-evaluated). By contrast, ObjBindMethod() produces an object which invokes this.Tick().
 * •If we rename Tick to Call, we can just use this directly instead of this.timer. This also removes the need for the temporary variable. However, ObjBindMethod() is useful when the object has multiple methods which should be called by different event sources, such as hotkeys, menu items, GUI controls, etc.
 * •If the timer is being modified or deleted from within a function/method called by the timer, it may be easier to omit the Label parameter. In some cases this avoids the need to retain the original object which was passed to SetTimer, which eliminates one temporary variable (like timer in the example above).
 */

