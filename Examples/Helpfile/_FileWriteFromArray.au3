#include <File.au3>

$avCommon = _FileListToArray(@CommonFilesDir)
$avUser = _FileListToArray(@UserProfileDir)
$sFile = @ScriptDir & "\Test.txt"

; ͨ���ļ���д���һ������
_FileWriteFromArray($sFile, $avCommon, 1)

; ���ļ����ӵڶ�������
$hFile = FileOpen($sFile, 1) ; 1 = ����
_FileWriteFromArray($hFile, $avUser, 1)
FileClose($hFile)

; ��ʾ���
Run("notepad.exe" & $sFile)

