Local $oShell = ObjCreate("shell.application")
If Not IsObj($oShell) Then
	MsgBox(0,"����","$oShell ����һ������.")
Else
	MsgBox(0,"�ɹ�","�ɹ��������� $oShell.")
EndIf
