#SingleInstance, #Persistent

CustomColor = "000000"  ; Can be any RGB color (it will be made transparent below).

GuiHeight := 40
SysGet, workArea, MonitorWorkArea
workAreaWidth := workAreaRight - workAreaLeft
workAreaHeight := workAreaBottom - workAreaTop
GuiY := workAreaHeight - (2 * GuiHeight)


Gui +E0x20 +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%


Gui, Show, x-3360 y-446 w1680 h1050 NoActivate  ; NoActivate avoids deactivating the currently active window.
WinSet, Transparent, 220, dimmy.ahk

