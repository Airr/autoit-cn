Example()

Func Example()
	; Run Notepad
	Run("notepad.exe")

	; �ȴ�10��,���ż��±����ڳ���
	WinWait("[CLASS:Notepad]", "", 10)

	;�ٵ��۵ȴ�2��
	Sleep(2000)

	;ʹ�ü��±���"��"���ƹرռ��±�����
	WinClose("[CLASS:Notepad]")
EndFunc   ;==>Example
