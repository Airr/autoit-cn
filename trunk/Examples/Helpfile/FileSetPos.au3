#include <Constants.au3>

Local Const $sFile = "test.txt"
Local $hFile = FileOpen($sFile, 2)

; ����ļ��Ƿ��Ѵ�
If $hFile = -1 Then
	MsgBox(4096, "����", "�޷����ļ�.")
	Exit
EndIf

; ���ǰ�Ѵ򿪵��ı��ļ�β׷��һ������.
FileWriteLine($hFile, "Line1")
FileWriteLine($hFile, "Line2")
FileWriteLine($hFile, "Line3")

; ������ı��ļ��ڴ滺�������ݵ�����.����ڱ������.
FileFlush($hFile)

; ��ȡ��ǰ�ļ���������
MsgBox(4096, "", "λ��: " & FileGetPos($hFile) & @CRLF & "����: " & @CRLF & FileRead($hFile))

; ���õ�ǰ�ļ�����.
Local $n = FileSetPos($hFile, 0, $FILE_BEGIN)

;��ȡ��ǰ�ļ���������
MsgBox(4096, "", "λ��: " & FileGetPos($hFile) & @CRLF & "����: " & @CRLF & FileRead($hFile))

; �رմ�ǰ�Ѵ򿪵��ļ�.
FileClose($hFile)

;ɾ����ʱ�ļ�.
FileDelete($sFile)