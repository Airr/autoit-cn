Run("notepad.exe")

;�ȴ����±����ڳ���
WinWait("[CLASS:Notepad]")

;�ȴ����±����ڳ���,�ȴ�5��,�����δ����.�ű�����
WinWait("[CLASS:Notepad]", "", 5)