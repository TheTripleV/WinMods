#NoEnv, #Persistent, #SingleInstance

SetTitleMatchMode, 2

waitingPeriod = -600 ; Timeout to register extra clicks
numOfClicks = 0

~#F20:: ; Pen Single Click
    numOfClicks += 1
    SetTimer, redirect, Off
    Gosub, redirect
    return
~#F19:: ; Pen Double Click
    numOfClicks +=2
    SetTimer, redirect, % waitingPeriod
    return
~#F18:: ; Pen Hold
    numOfClicks += 0.5
    SetTimer, redirect, Off
    Gosub, redirect
    return

redirect: ; Hold can only be included in a combo if it comes after a DoubleClick (F19)
    goGoGadget(  (numOfClicks =  0.5)?"Hold"
                :(numOfClicks =    1)?"SingleClick"
                :(numOfClicks =    2)?"DoubleClick"
                :(numOfClicks =  2.5)?"DoubleClickHold" ; Double Click then Hold on the third click
                :(numOfClicks =    3)?"TripleClick"
                :(numOfClicks =    4)?"QuadraClick"
                :(numOfClicks =  4.5)?"QuadraClickHold"
                :(numOfClicks =    5)?"PENTACLICK"
                :(numOfClicks =    6)?"HexaClick"
                :(numOfClicks = 98.5)?"RepetitiveStrainInjury"
                :"badinput")
    
    numOfClicks = 0
    return


goGoGadget(mode){
    if WinActive("Windows Ink Workspace"){
        return
    }
    else if WinActive("screenClass"){
        if (mode = "SingleClick"){
            Send {Right}
            return
        }
        if (mode = "DoubleClick"){
            Send {Left}
            return
        }
        if (mode = "Hold"){
            Send {b}
            return
        }
    }
    else if WinActive("OneNote"){
        if (mode = "SingleClick"){
           Send {AppsKey}
           return
        }
        if (mode = "DoubleClick"){
            return
        }
    }
    else if WinActive("Camera"){
        if (mode = "SingleClick"){
            Send, {Enter}
            return
        }
    }
     ;DEFAULT CASE
    if (mode = "SingleClick"){
        if not WinActive("OneNote"){ ; run onenote uwp if not running
        ;Run, explorer.exe shell:appsFolder\Microsoft.Office.OneNote_8wekyb3d8bbwe!microsoft.onenoteim
        Run, onenote-cmd:
        }
    }
    if (mode = "DoubleClick"){
        Run ms-penworkspace://Capture ; Windows Ink Screensketch
    }
    if (mode = "Hold"){
        Run ms-penworkspace://Create ; Windows Ink Sketchpad
    }
    if (mode = "TripleClick"){
        Run, display /toggle /rotate 180
        return
    }
    if (mode = "DoubleClickHold"){
        Send {Volume_Down}
        return
    }

    if (mode = "DecaClickHold"){
        Send #{w}
        return
    }
    return
}


defaultSingleClick(){
    if not WinActive("OneNote"){ ; run onenote uwp if not running
        ;Run, explorer.exe shell:appsFolder\Microsoft.Office.OneNote_8wekyb3d8bbwe!microsoft.onenoteim
        Run, onenote-cmd:
    }
    return
}

defaultDoubleClick(){
    Run ms-penworkspace://Capture ; Windows Ink Screensketch
    return
}

defaultHold(){
    Run ms-penworkspace://Create ; Windows Ink Sketchpad
    return
}


template(){
    if (mode = "SingleClick"){

    }
    if (mode = "DoubleClick"){

    }
    if (mode = "Hold"){

    }
}