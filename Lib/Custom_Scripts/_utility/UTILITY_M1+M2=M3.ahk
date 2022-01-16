lbutton::send % getkeystate("rbutton","p") ? "{mbutton down}" : "{lbutton down}"
lbutton up::send % getkeystate("lbutton") ? "{lbutton up}" : "{mbutton up}"
 
rbutton::send % getkeystate("lbutton","p") ? "{mbutton down}" : "{rbutton down}"
rbutton up::send % getkeystate("rbutton") ? "{rbutton up}" : "{mbutton up}"