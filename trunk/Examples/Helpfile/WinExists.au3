Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")


If WinExists("[CLASS:Notepad]") Then
	MsgBox(0, "", "���±����ڴ���")
EndIf
