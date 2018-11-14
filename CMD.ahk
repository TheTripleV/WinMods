#NoEnv, #Persistent, #SingleInstance

#`::openCMD()

  
openCMD(){
	if WinActive("ahk_class CabinetWClass"){
		Send !{d}
		Send ^{a}
		Send cmd
		Send {Enter}
	}
	else {
		Run, cmd.exe, C:\users\vasis
	}
}