
Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")




$pid = WinGetProcess("�ޱ��� - ���±�")
MsgBox(0, "���� PID Ϊ", $pid)
