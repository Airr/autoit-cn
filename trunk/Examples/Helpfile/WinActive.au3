
Run("notepad.exe")
Sleep(1000)


If WinActive("�ޱ��� - ���±�") Then
	MsgBox(0, "", "���±������ǻ��")
EndIf
