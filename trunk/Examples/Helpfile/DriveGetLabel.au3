Local $var = DriveGetLabel("c:\")
If $var='' Then
	MsgBox(4096,"����","C �̾��δ����")
Else
	MsgBox(4096,"C �̾��: ",$var)
EndIf