Run("notepad.exe")

;�ȴ����±����ڳ��ֲ��ǻ״̬
WinWaitActive("[CLASS:Notepad]")

;�ȴ����±����ڳ��ֲ��ǻ״̬,���ȴ�5��,5��󲻹���Σ��ű�����
WinWaitActive("[CLASS:Notepad]", "", 5)
