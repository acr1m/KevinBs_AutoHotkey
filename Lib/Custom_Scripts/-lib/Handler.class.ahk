class CustomModifierHandler {
	pressedKey := A_ThisHotkey
	
	canFire() {
		; 
		if(
	}
}


/**	
* Listens for any CustomModifierHandler`s 
* 
* GlobalHotkeyListener provides a place for the class, <CustomModifierHandler>, 
*  to let its existence be known. 
* This is accomplished by incrementing the Listener's property, 
*  %activeCustomModifiers%, by one, every time that a new 
*  <CustomModifierHandler> is instantiated.
* 
*  whether or not a 
*  Hotkey has been fired, so that Handler classes can determine whether 
*  or not to allow their key-triggers to fire when physically 
*  released, i.e. {keyName Up} commands.
* 
* Properties:
*  hotKeyFired := FALSE; (default) 
*     - Sets to TRUE by statements inside other class.method()'s
*       or hotkey.statement-blocks.
*     - Sets to FALSE, automatically, when the number of 'custom-modifiers' is equal to zero.
*   - whenever a non-modifier key is acting as a custom-modifier, and needs to determine 
* Notes:	____How_to_or_when_is_this_used____
*/
class CustomModifierListener {
	
}