#include <Crypt.au3>

; ��ʾ _Crypt_Startup ���÷�ʾ��:

Local $sTest = "The quick brown fox jumps over the lazy dog"

; ��ʼ�����ܿ����в���, ������ɺ�ر�
_Crypt_Startup()
MsgBox(0, "MD5", $sTest & @CRLF & _Crypt_HashData($sTest, $CALG_MD5))
_Crypt_Shutdown()

; û�г�ʼ�����ܿ�ʱ���в���
MsgBox(0, "MD5", $sTest & @CRLF & _Crypt_HashData($sTest, $CALG_MD5))

