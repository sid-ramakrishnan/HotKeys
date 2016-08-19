Alt & LButton::
CoordMode, Mouse  ; Not necessary
MouseGetPos, StartX, StartY, MouseWin
WinGetPos, PosX, PosY,,, ahk_id %MouseWin%
WinGet, WinState, MinMax, ahk_id %MouseWin% 
if WinState = 0  ; Only if the window isn't maximized 
    SetTimer, WatchMouse, 10 ; Track the mouse as the user drags it.
return

WatchMouse:
GetKeyState, LButtonState, LButton, P
if LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, WatchMouse, off
    return
}
GetKeyState, EscapeState, Escape, P
if EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, WatchMouse, off
    WinMove, ahk_id %MouseWin%,, %OriginalPosX%, %OriginalPosY%
    return
}

; Repositioning Code.

CoordMode, Mouse
MouseGetPos, MouseX, MouseY
WinGetPos, WinX, WinY,,, ahk_id %MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %MouseWin%,, WinX + MouseX - MouseStartX, WinY + MouseY - MouseStartY
MouseStartX := MouseX  ; Update for the next timer-call to this subroutine.
MouseStartY := MouseY
return
