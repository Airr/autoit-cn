Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")



$title = WinGetTitle("�ޱ��� - ", "")
MsgBox(0, "�����ı���Ϊ:", $title)
