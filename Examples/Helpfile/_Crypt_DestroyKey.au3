#include <Crypt.au3>

; Exa,ple of resuing a key using _Crypt_DeriveKey

Local $StringsToCrypt[6] = ["Bluth", "Sunny", "AutoIt3", "SciTe", 42, "42"]
Local $Crypted[6]


; ���� DeriveKey/DestroyKey ���ڲ�����, �������ǲ���Ҫ _Crypt_Startup
Local $Key = _Crypt_DeriveKey("supersecretpassword", $CALG_RC4)

Local $DisplayStr = ""

For $Word In $StringsToCrypt
	$DisplayStr &= $Word & @TAB & " = " & _Crypt_EncryptData($Word, $Key, $CALG_USERKEY) & @CRLF
Next

MsgBox(0, "Crypt table", $DisplayStr)

_Crypt_DestroyKey($Key)
