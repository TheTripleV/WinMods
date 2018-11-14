; #NoEnv, #Persistent, #SingleInstance

x := GetKeyState("LWin")
Msgbox, %x%

/* $l::
Send {LWin Up}
Send {l}
return */
; qwertyuiopasdfghjk;''llllllllllllllllklklllllkkjjkkllllkkjjjhhhhgghjkllkjhghjklkl