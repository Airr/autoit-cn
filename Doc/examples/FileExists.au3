If FileExists("C:\autoexec.bat") Then
	MsgBox(4096, "C:\autoexec.bat File", "�Ѵ���")
Else
	MsgBox(4096,"C:\autoexec.bat File", "������")
EndIf

If FileExists("C:\") Then
	MsgBox(4096, "C:\ Dir ", "�Ѵ���")
Else
	MsgBox(4096,"C:\ Dir" , "������")
EndIf

If FileExists("D:") Then
	MsgBox(4096, "������ D: ", "�Ѵ���")
Else
	MsgBox(4096,"������ D: ", "������")
EndIf
