Local $pos = WinGetPos("[CLASS:Notepad]")
If IsArray($pos) Then
	MsgBox(0, "���ڿ��", $pos[3])
EndIf
