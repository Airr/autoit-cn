Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")
WinSetState("�ޱ��� - ���±�","",@SW_MINIMIZE)

; Check if a new notepad window is minimized
$state = WinGetState("�ޱ��� - ���±�", "")

; Is the "minimized" value set?
If BitAnd($state, 16) Then
	MsgBox(0, "����", "���±���������С����")
Else
	MsgBox(0, "����", "���±����ڲ�����С����")	
EndIf

