Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")


If WinExists("�ޱ��� - ���±�") Then
	MsgBox(0, "", "���±����ڴ���")
EndIf
