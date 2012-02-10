#cs
	1,����˽ű�Ϊ "ConsoleRead.exe".
	2,��������ʾ���ķ�ʽ�򿪳���ConsoleRead.exe����Ŀ¼��.
	3,��������������:
	echo Hello! | ConsoleRead.exe

	When invoked in a console window, the above command echos the text "Hello!"
	but instead of displaying it, the | tells the console to pipe it to the STDIN stream
	of the ConsoleRead.exe process.
#ce

Example()

Func Example()
	If Not @Compiled Then
		MsgBox(4096, "��ʾ", "�˽ű��������������ȷ��ʾ.")
		Exit
	EndIf

	Local $sOutput
	While True
		$sOutput &= ConsoleRead()
		If @error Then ExitLoop
		Sleep(25)
	WEnd
	MsgBox(4096, "", "����: " & @CRLF & @CRLF & $sOutput)
EndFunc   ;==>Example
