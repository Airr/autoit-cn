BlockInput(1)

Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
Send("{F5}") ;ճ����ǰʱ�������

BlockInput(0)
