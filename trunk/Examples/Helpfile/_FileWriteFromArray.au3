#include<File.au3>

Local $avCommon = _FileListToArray(@CommonFilesDir)
Local $avUser = _FileListToArray(@UserProfileDir)
Local $sFile = @ScriptDir & "\Test.txt"

; д���׸����鵽���ַ�����ʾ���Ƶ��ļ�
_FileWriteFromArray($sFile, $avCommon, 1)

; ���ļ������ӵڶ������鵽�ļ�
Local $hFile = FileOpen($sFile, 1) ; 1 = ����
_FileWriteFromArray($hFile, $avUser, 1)
FileClose($hFile)

; ��ʾ���
Run("notepad.exe " & $sFile)
