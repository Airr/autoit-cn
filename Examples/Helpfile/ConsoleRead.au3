; 1,����˽ű� "ConsoleRead.exe".
; 2,��������ʾ���ķ�ʽ�򿪳���ConsoleRead.exe����Ŀ¼��.
; 3,��������������:
;	echo Hello! | ConsoleRead.exe
;

If Not @Compiled Then
	MsgBox(0, "��ʾ", "�˽ű��������������ȷ��ʾ.")
	Exit -1
EndIf

Local $data
While True
	$data &= ConsoleRead()
	If @error Then ExitLoop
	Sleep(25)
WEnd
MsgBox(0, "", "����: " & @CRLF & @CRLF & $data)
