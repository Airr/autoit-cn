Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
WinSetState("[CLASS:Notepad]","",@SW_MINIMIZE)

; Check if a new notepad window is minimized
$state = WinGetState("[CLASS:Notepad]", "")

; Is the "minimized" value set?
If BitAnd($state, 16) Then
	MsgBox(0, "����", "���±���������С����")
Else
	MsgBox(0, "����", "���±����ڲ�����С����")	
EndIf

