#SingleInstance, #Persistent

F1Loc := 135
F2Loc := 235
F3Loc := 330
F4Loc := 425
F5Loc := 515
F6Loc := 610
F7Loc := 705
F8Loc := 805

F1Txt := "Hide"
F2Txt := "++Hotkey"
F3Txt := ""
F4Txt := ""
F5Txt := ""
F6Txt := ""
F7Txt := ""
F8Txt := ""

CustomColor = "000000"  ; Can be any RGB color (it will be made transparent below).

GuiHeight := 40
isVis=0

SysGet, workArea, MonitorWorkArea
workAreaWidth := workAreaRight - workAreaLeft
workAreaHeight := workAreaBottom - workAreaTop
GuiY := workAreaHeight - (2 * GuiHeight)


Gui +E0x20 +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s12  ; Set a large font size (32-point).

TxtYPos := 10
TxtWidth := 80

Gui, Add, Text, cWhite 0x1000 vTxtF1 x%F1Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF2 x%F2Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF3 x%F3Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF4 x%F4Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF5 x%F5Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF6 x%F6Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF7 x%F7Loc% y%TxtYPos% w%TxtWidth%
Gui, Add, Text, cWhite 0x1000 vTxtF8 x%F8Loc% y%TxtYPos% w%TxtWidth%


; Make all pixels of this color transparent and make the text itself translucent (150):
;SetTimer, UpdateOSD, 200
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.


Gui, Show, x0 y%GuiY% w%workAreaWidth% h%GuiHeight% NoActivate  ; NoActivate avoids deactivating the currently active window.
WinSet, Transparent, 140, hover_keyboard.ahk
return

UpdateOSD:
;MouseGetPos, MouseX, MouseY
;GuiControl,, MyTexts, X%MouseX%, Y%MouseY%
GuiControl,,TxtF1, %F1Txt%
GuiControl,,TxtF2, %F2Txt%
GuiControl,,TxtF3, %F3Txt%
GuiControl,,TxtF4, %F4Txt%
GuiControl,,TxtF5, %F5Txt%
GuiControl,,TxtF6, %F6Txt%
GuiControl,,TxtF7, %F7Txt%
GuiControl,,TxtF8, %F8Txt%
return

F1::
isVis := !isVis
if isVis
  gui, hide
else
  gui, show, NoActivate
Return

F2::

Gui, Font, cRed
GuiControl, Font,TxtF2

ClipboardCache := ClipboardAll

send {Shift Down}{Ctrl Down}
send {Left}
send {CtrlUp}{ShiftUp}

clipboard = 
Send ^c
ClipWait, .1

;MsgBox Copied txt: `n`n%clipboard%
clip = %clipboard%
;MsgBox, %clipboard%
Clipboard := ClipboardCache

send {Right}

Hotkey, F3, Off
Hotkey, F4, Off
Hotkey, F5, Off
Hotkey, F6, Off
Hotkey, F7, Off
Hotkey, F8, Off

Gui, Font, cGreen
GuiControl, Font,TxtF2

Input, SingleKey, L1, {F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}

if InStr(ErrorLevel, "F3"){

    F3Txt = %clip%
}
if InStr(ErrorLevel, "F4"){
    F4Txt = %clip%
}
if InStr(ErrorLevel, "F5"){
    F5Txt = %clip%
}
if InStr(ErrorLevel, "F6"){
    F6Txt = %clip%
}
if InStr(ErrorLevel, "F7"){
    F7Txt = %clip%
}
if InStr(ErrorLevel, "F8"){
    F8Txt = %clip%
}

Hotkey, F3, On
Hotkey, F4, On
Hotkey, F5, On
Hotkey, F6, On
Hotkey, F7, On
Hotkey, F8, On

Gui, Font, cWhite
GuiControl, Font,TxtF2

Gosub, UpdateOSD
Return

F3::

paste(F3Txt)
return

F4::
paste(F4Txt)
return

F5::
paste(F5Txt)
return

F6::
paste(F6Txt)
return

F7::
paste(F7Txt)
return

F8::
paste(F8Txt)
return

F9::
Send {Home}
return

F10::
Send {End}
return

paste(tex){
    tclipCache := ClipboardAll
    clipboard := tex
    Send, ^v
    clipboard := tclipCache
}