Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")

;�ȴ����±�����Ϊ���״̬,���һֱ�ǻ״̬,�ű���ͣ
WinWaitNotActive("[CLASS:Notepad]")

;�ȴ����±�����Ϊ���״̬(�ӳ�5��,5��󲻹����,�ű�����)
WinWaitNotActive("[CLASS:Notepad]", "", 5)