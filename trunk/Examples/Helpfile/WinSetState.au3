Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")


WinSetState("�ޱ��� - ���±�", "", @SW_HIDE)
Sleep(3000)
WinSetState("�ޱ��� - ���±�", "", @SW_SHOW)
