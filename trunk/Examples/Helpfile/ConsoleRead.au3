; 1������˽ű� "ConsoleRead.exe".
; 2����������ʾ���ķ�ʽ�򿪳���ConsoleRead.exe����Ŀ¼��.
; 3����������������:
;	echo Hello! | ConsoleRead.exe
;
; When invoked in a console window, the above command echos the text "Hello!"
; but instead of dispalying it, the | tells the console to pipe it to the STDIN stream
; of the ConsoleRead.exe process.
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
MsgBox(0, "", "Received: " & @CRLF & @CRLF & $data)
