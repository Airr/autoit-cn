#include <File.au3>

Local $s_TempFile, $s_FileName

; ����@TempDir��Ψһ���ļ���
$s_TempFile = _TempFile()

; ���ɸ���Ŀ¼����tst_��ͷ��Ψһ�ļ���
$s_FileName = _TempFile("C:\", "tst_", ".txt", 7)

MsgBox(4096, "Info", "Names suitable for new temporary file : " & @LF & $s_TempFile & @LF & $s_FileName)

Exit
