Run("notepad.exe")
Sleep(1000)
If WinActive("[CLASS:Notepad]") Then ; Check if Notepad is currently active.
	MsgBox(4096, "WinActive", "���±������ǻ��")
Else
	MsgBox(4096, "WinActive", "���±����ڲ��ǻ��.")
EndIf
