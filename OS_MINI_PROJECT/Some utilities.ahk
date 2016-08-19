#n::Run Notepad
#g::Run www.google.com
#f::Run www.facebook.com
#y::Run www.youtube.com
#r::Shutdown,2

#NumpadAdd::SoundSet +4
#NumpadSub::SoundSet -4

#e::
Drive, Eject
if !ErrorLevel
  MsgBox, The Drive is open
 ;If the command completed quickly, the tray was probably already ejected.
 ;In that case, retract it:
if A_TimeSinceThisHotkey > 1000  ; Adjust this time if needed.
    Drive, Eject,, 1
return


^+c::
{
Send, ^c
Sleep 50
Run, http://www.google.com/search?q=%clipboard%
Return
}

;Above part is to directly take the selected text and search it on google.


!t::SendInput {®}             
!o::SendInput {°}
!c::SendInput {©}
!p::SendInput {£}
!r::SendInput  {₹}
!e::SendInput {€}