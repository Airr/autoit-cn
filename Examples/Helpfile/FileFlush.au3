Example1()
Example2()

Func Example1()
	;================================================
	;ʾ��1 �ٷ�Ĭ������
	;================================================
	Local Const $sFile = "test.txt"
	Local $hFile = FileOpen($sFile, 1)

	; ����ļ��Ƿ��Ѵ�
	If $hFile = -1 Then
		MsgBox(4096, "����", "�޷����ļ�.")
		Exit
	EndIf

	; ���ǰ�Ѵ򿪵��ı��ļ�β׷��һ������.
	FileWriteLine($hFile, "Line1")

	; ���м��±�,���ı��ļ���δ����κ�����.
	RunWait("notepad.exe " & $sFile)

	; ������ı��ļ��ڴ滺�������ݵ�����.����ڱ������.
	FileFlush($hFile)

	; ���м��±�,��ʾ����Ľ��.
	RunWait("notepad.exe " & $sFile)

	; �رմ�ǰ�Ѵ򿪵��ļ�.
	FileClose($hFile)

	;ɾ����ʱ�ļ�.
	FileDelete($sFile)
EndFunc   ;==>Example1

Func Example2()
	;================================================
	;ʾ��2 ACN����
	;================================================
	#include <Constants.au3>
	Local Const $aFile = "test.txt"
	Local $hFile = FileOpen($aFile, 1)

	; ����ļ��Ƿ��Ѵ�
	If $hFile = -1 Then
		MsgBox(0, "����", "�޷����ļ�.")
		Exit
	EndIf

	; ���ǰ�Ѵ򿪵��ı��ļ�β׷��һ������.
	FileWriteLine($hFile, "Line1")

	; ��ȡ��ǰ�ļ���������
	MsgBox(0, "", "λ��: " & FileGetPos($hFile) & @CRLF & "����: " & @CRLF & FileRead($hFile))

	; ������ı��ļ��ڴ滺�������ݵ�����.����ڱ������.
	FileFlush($hFile)

	; ���õ�ǰ�ļ�����.
	Local $n = FileSetPos($hFile, 0, $FILE_BEGIN)

	;��ȡ��ǰ�ļ���������
	MsgBox(0, "", "λ��: " & FileGetPos($hFile) & @CRLF & "����: " & @CRLF & FileRead($hFile))

	; �رմ�ǰ�Ѵ򿪵��ļ�.
	FileClose($hFile)

	;ɾ����ʱ�ļ�.
	FileDelete($aFile)
EndFunc   ;==>Example2