Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")


If WinExists("�ޱ��� - ���±�") Then
	MsgBox(0, "", "���±����ڴ���")
EndIf
