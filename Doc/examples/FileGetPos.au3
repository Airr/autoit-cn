#include <Constants.au3>

Local Const $sFile = "test.txt"
Local $hFile = FileOpen($sFile, 2)

; ����ļ��Ƿ�д��ģʽ
If $hFile = -1 Then
	MsgBox(0, "����", "�޷����ļ�.")
	Exit
EndIf

;д���ı�.
FileWriteLine($hFile, "Line1")
FileWriteLine($hFile, "Line2")
FileWriteLine($hFile, "Line3")

; Flush the file to disk.
FileFlush($hFile)

; Check file position and try to read contents for current position.
MsgBox(0, "", "Position: " & FileGetPos($hFile) & @CRLF & "Data: " & @CRLF & FileRead($hFile))

; Now, adjust the position to the beginning.
Local $n = FileSetPos($hFile, 0, $FILE_BEGIN)

; Check file position and try to read contents for current position.
MsgBox(0, "", "Position: " & FileGetPos($hFile) & @CRLF & "Data: " & @CRLF & FileRead($hFile))

;�رմ�ǰ�Ѵ򿪵��ļ�.
FileClose($hFile)

;ɾ����ʱ�ļ�.
FileDelete($sFile)
