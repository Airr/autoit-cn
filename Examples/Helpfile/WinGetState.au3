Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
WinSetState("[CLASS:Notepad]","",@SW_MINIMIZE)

; �����±�����״̬
Local $state = WinGetState("[CLASS:Notepad]", "")

; �����±������ǲ���"��С��"״̬.
If BitAND($state, 16) Then
	MsgBox(0, "����", "���±���������С����")
Else
	MsgBox(0, "����", "���±����ڲ�����С����")	
EndIf

