;------------------------------------------------------------------------------
; icorners - Add curved corners your display

cornerSize := 1.2 ; [0, 100] - determines the size of the corners
cornerCurvature := 3 ; [2, inf] - determines the strength of the curve of the corners
cornerColor := 0x000000 ; 0xBBGGRR - determines the color of the corners

;------------------------------------------------------------------------------


;This code sets up a transparent gui the size of the screen for drawing to
;Uncomment +E0x20 to allow the user to "click through" your drawings
Gui, +hwndhgui -caption +toolwindow +alwaysontop +lastfound +E0x20
Gui, Color, 0xFFFFFF ;set background to white
WinSet, TransColor, 0xFFFFFF 255 ;set white to transparent
Gui, show, w%A_ScreenWidth% h%A_ScreenHeight% x0 y0


hdc := DllCall("GetDC", "uint", hgui) ;get a handle to the windows device context

; math setup

smallScreenDim := Min(A_ScreenWidth, A_ScreenHeight)
cornerRadius := smallScreenDim * cornerSize / 100


; Top Left Corner

circleCenterX := cornerRadius - 1
circleCenterY := cornerRadius - 1

Loop, %cornerRadius%
{
    currX := A_Index - 1

    Loop, %cornerRadius%
    {
        currY := A_Index - 1

        if (DistFromCenter(currX, currY, circleCenterX, circleCenterY, cornerCurvature) >= cornerRadius**cornerCurvature)
        {
            SetPixel(hdc, currX, currY, cornerColor)
        }
    }
}

; Top Right Corner

circleCenterX := A_ScreenWidth - cornerRadius
circleCenterY := cornerRadius - 1

Loop, %cornerRadius%
{
    currX := A_Index - 1 + circleCenterX

    Loop, %cornerRadius%
    {
        currY := A_Index - 1

        if (DistFromCenter(currX, currY, circleCenterX, circleCenterY, cornerCurvature) >= cornerRadius**cornerCurvature)
        {
            SetPixel(hdc, currX, currY, cornerColor)
        }
    }
}

; Bottom Left Corner

circleCenterX := cornerRadius - 1
circleCenterY := A_ScreenHeight - cornerRadius

Loop, %cornerRadius%
{
    currX := A_Index - 1

    Loop, %cornerRadius%
    {
        currY := A_Index - 1 + circleCenterY

        if (DistFromCenter(currX, currY, circleCenterX, circleCenterY, cornerCurvature) >= cornerRadius**cornerCurvature)
        {
            SetPixel(hdc, currX, currY, cornerColor)
        }
    }
}

; Bottom Right Corner

circleCenterX := A_ScreenWidth - cornerRadius
circleCenterY := A_ScreenHeight - cornerRadius

Loop, %cornerRadius%
{
    currX := A_Index - 1 + circleCenterX

    Loop, %cornerRadius%
    {
        currY := A_Index - 1 + circleCenterY

        if (DistFromCenter(currX, currY, circleCenterX, circleCenterY, cornerCurvature) >= cornerRadius**cornerCurvature)
        {
            SetPixel(hdc, currX, currY, cornerColor)
        }
    }
}



DllCall("ReleaseDC", "uint", hgui, "uint", hdc) ;release the device context, use this after youre done drawing
return


DistFromCenter(x, y, centerX, centerY, curvature)
{
    return ((Abs(x - centerX))**curvature) + ((Abs(y - centerY))**curvature)
}


;Gdi does not support transparency for SetPixel
SetPixel(hdc, x, y, BGR)
{
    DllCall("gdi32.dll\SetPixel","uint", hdc, "int", x,"int", y,"uint", BGR | 0x2000000)
}

;There is a built in method for this
GetPixel(x, y)
{
    PixelGetColor, color, x, y
    return color
}

