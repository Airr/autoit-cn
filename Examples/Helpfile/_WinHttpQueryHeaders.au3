#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ����Ҫ�ľ��
Global $hOpen = _WinHttpOpen()
Global $hConnect = _WinHttpConnect($hOpen, "msdn.microsoft.com")
; ָ������:
Global $hRequest = _WinHttpOpenRequest($hConnect, Default, "en-us/library/aa384101(VS.85).aspx")

; ��������
_WinHttpSendRequest($hRequest)

; �ȴ���Ӧ
_WinHttpReceiveResponse($hRequest)

; ��ȡ����ͷ��
Global $sHeader = _WinHttpQueryHeaders($hRequest)

; �رվ��
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

; ��ʾ��ȡ��ͷ��
MsgBox(0, "Header", $sHeader)