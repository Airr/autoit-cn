Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
;�ȴ����±����ڱ��ر�
WinWaitClose("[CLASS:Notepad]")

;�ȴ����±����ڱ��ر�,����5��,�����Ȼδ�ر�,�ű�����
WinWaitClose("[CLASS:Notepad]", "", 5)
