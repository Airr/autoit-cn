
#include  <Crypt.au3>

$sTest = "The quick brown fox jumps over the lazy dog"

;  ���Լ��ܿ�������ͽ���
_Crypt_Startup()
msgbox(0, "MD5", $sTest & @CRLF & _Crypt_HashData($sTest, $CALG_MD5))
_Crypt_Shutdown()

; ��������
msgbox(0, "MD5", $sTest & @CRLF & _Crypt_HashData($sTest, $CALG_MD5))

