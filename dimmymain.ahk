#SingleInstance, #Persistent

CustomColor = "000000"  ; Can be any RGB color (it will be made transparent below).

GuiHeight := 40
SysGet, workArea, MonitorWorkArea
workAreaWidth := workAreaRight - workAreaLeft
workAreaHeight := workAreaBottom - workAreaTop
GuiY := workAreaHeight - (2 * GuiHeight)


Gui +E0x20 +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%


Gui, Show, x0 y0 w1500 h1000 NoActivate  ; NoActivate avoids deactivating the currently active window.
WinSet, Transparent, 150, dimmymain.ahk

