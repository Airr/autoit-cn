Run("notepad.exe")

;�ȴ����±����ڳ���
;WinWait("δ����")
WinWait("[CLASS:Notepad]")

;�ȴ����±����ڳ���,�ȴ�5��,�����δ����.�ű�����
;WinWait("δ����", "", 5)
WinWait("[CLASS:Notepad]", "", 5)