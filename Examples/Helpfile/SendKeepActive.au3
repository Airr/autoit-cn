Run("notepad.exe")
WinWait("[CLASS:Notepad]")

SendKeepActive("[CLASS:Notepad]")

; ������ͣ�ڼ䱣�ִ��ڼ���״̬.
For $i = 1 to 10
	Sleep(1000)
	Send("Hello")
Next
