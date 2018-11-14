#NoEnv, #Persistent, #SingleInstance

vkB3::
KeyWait, vkB3
KeyWait, vkB3, D T.5
if ErrorLevel
Run, display /display none /device 2 /rotate ccw /toggle
else
InputBox, brightnesslvl, Brightness, Enter Brightness for 2nd monitor:, , 160, 130
	if(!ErrorLevel){
		Run, display /display none /device 2 /brightness %brightnesslvl%
		Run, display /display none /device 2 /brightness %brightnesslvl%
	}
return	
		