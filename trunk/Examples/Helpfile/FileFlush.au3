Local Const $sFile = "test.txt"
Local $hFile = FileOpen($sFile, 1)

; ����ļ��Ƿ��Ѵ�
If $hFile = -1 Then
	MsgBox(0, "����", "�޷����ļ�.")
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

