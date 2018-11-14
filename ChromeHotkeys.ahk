#NoEnv, #Persistent, #SingleInstance

SetTitleMatchMode, 2
global DelayCycle := 246
global DelayCloseTab := 1000


#If WinActive("Google Chrome")
	;Browser Navigation

	
	;CloseTab

	RAlt & AppsKey::closeTab()
	AppsKey & RAlt::closeTab()
	
	;Save Tab
	AppsKey::AppsKey
	
	;CycleTabs
	AppsKey & Right::
		Send ^{Tab}
		Sleep, DelayCycle
		Return
	AppsKey & Left::
		Send ^+{Tab}
		Sleep, DelayCycle
		Return
	
#If

closeTab(){
	Send ^{w}
	Sleep, DelayCloseTab
	Return
}