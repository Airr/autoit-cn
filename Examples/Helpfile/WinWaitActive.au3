Example()

Func Example()
	; Run Notepad
	Run("notepad.exe")

	;�ȴ����±����ڳ��ֲ��ǻ״̬,��ʱ10��
	WinWaitActive("[CLASS:Notepad]", "", 10)

	; �ȴ����±�������ʾ����
	Sleep(2000)

	; ʹ�ü��±��������رռ��±�����.
	WinClose("[CLASS:Notepad]")
EndFunc   ;==>Example
