Run("notepad.exe")
WinWaitActive("�ޱ��� - ���±�")
ControlSetText("�ޱ��� - ���±�","","[CLASSNN:Edit1]",Random(0,1000))
Sleep(500)



$text = WinGetText("�ޱ��� - ���±�", "")
MsgBox(0, "��ȡ���ı�Ϊ:","��ȡ�����ı�Ϊ: " & $text)
