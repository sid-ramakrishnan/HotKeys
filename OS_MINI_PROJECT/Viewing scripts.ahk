/*
Gui, Add, Text,, First name:
Gui, Add, Text,, Last name:
Gui, Add, Edit, vFirstName ym  ; The ym option starts a new column of controls.
Gui, Add, Edit, vLastName
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show,, Simple Input Example
return  ; End of auto-execute section. The script is idle until the user does something.

;GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
MsgBox You entered "%FirstName% %LastName%".
ExitApp
*/
Gui, Add, Text,, Pick a script to launch from the list below.`nTo cancel, press ESCAPE or close this window.
Gui, Add, ListBox, vMyListBox w640 r10
Gui, Add, Button, default, OK
Loop,C:\Rohit\Scripts Used Finally\*.ahk ; Change this folder and wildcard pattern to suit your preferences.
{
    GuiControl,, MyListBox, %A_LoopFileFullPath%
}
Gui, Show
return

MyListBox:
if A_GuiEvent <> DoubleClick
    return
; Otherwise, the user double-clicked a list item, so treat that the same as pressing OK.
; So fall through to the next label.

ButtonOK:
GuiControlGet, MyListBox  ; Retrieve the ListBox's current selection.
MsgBox, 4,, Would you you like to launch the script?`n`n%MyListBox%
IfMsgBox, No
    return
; Otherwise, try to launch it:
Run, %MyListBox%,, UseErrorLevel
if ErrorLevel = ERROR
    MsgBox Could not launch the specified file.  Perhaps it is not associated with anything.
return

GuiClose:
GuiEscape:
ExitApp
;*/