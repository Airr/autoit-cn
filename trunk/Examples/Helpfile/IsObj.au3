Local $oShell = ObjCreate("shell.application")
If IsObj($oShell) Then
	MsgBox(4096,"","������һ������")
Else
	MsgBox(4096,"","��������һ������.")
EndIf
