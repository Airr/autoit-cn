
Run("notepad.exe")
Sleep(1000)


If WinActive("[CLASS:Notepad]") Then
	MsgBox(0, "", "���±������ǻ��")
EndIf
