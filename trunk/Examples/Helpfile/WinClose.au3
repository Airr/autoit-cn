Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")
ControlSend("�ޱ��� - ���±�","","[CLASSNN:Edit1]","text")
Sleep(500)

WinClose("�ޱ��� - ���±�", "")
