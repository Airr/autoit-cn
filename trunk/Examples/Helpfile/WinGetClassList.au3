
Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")





$text = WinGetClassList("�ޱ��� - ���±�", "")
MsgBox(0, "���б�Ϊ:", $text)
