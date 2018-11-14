OnMessage(0x0219, "WM_DEVICECHANGE")
return

WM_DEVICECHANGE(wParam, lParam, msg, hwnd)    ; http://msdn.com/library/aa363480(vs.85,en-us)
{
    static DBT_DEVICEARRIVAL        := 0x8000    ; A device or piece of media has been inserted and is now available.
    static DBT_DEVICEREMOVECOMPLETE := 0x8004    ; A device or piece of media has been removed.

    if (wParam = DBT_DEVICEARRIVAL)
        OutputDebug, Pluggedin
    if (wParam = DBT_DEVICEREMOVECOMPLETE)
        OutputDebug, Unplugged
}
