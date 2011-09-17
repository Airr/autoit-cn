#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; Windows Live ID. JavaScript required to sign in, remember that.
Global $sDomain = "accountservices.passport.net"
Global $sPage = "uiresetpw.srf"

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, $sDomain)

; ���ɼ򵥵� SSL ����
Global $hRequestSSL = _WinHttpSimpleSendSSLRequest($hConnect, Default, $sPage)

; ��ȡ...
Global $sReturned = _WinHttpSimpleReadData($hRequestSSL)
; �رվ��
_WinHttpCloseHandle($hRequestSSL)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

; �������ص���ʲô
ConsoleWrite($sReturned & @CRLF)
MsgBox(64 + 262144, "Done", "Page source is printed to console")