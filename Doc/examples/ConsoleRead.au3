; �� "ConsoleRead.exe" ����һ���ű�.
; �� ConsoleRead.exe ��פ��Ŀ¼��һ��������ʾ.
; ������������: echo ���� ! | ConsoleRead.exe
; �ڵ���һ������̨����ʱ, ������������ı� "���� !"
; but instead of dispalying it,  | ���߿���̨�� ConsoleRead.exe ���̵� STDIN ���Թܵ�������.
If Not @Compiled Then
	MsgBox(0, "", "����ű���������ʾ�����Ĺ�����.")
	Exit -1
EndIf

Local $data
While True
	$data &= ConsoleRead()
	If @error Then ExitLoop
	Sleep(25)
WEnd
MsgBox(0, "", "����: " & @CRLF & @CRLF & $data)
