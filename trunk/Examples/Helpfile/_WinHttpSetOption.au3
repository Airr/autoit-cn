#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()

; �����û������ַ���
_WinHttpSetOption($hOpen, $WINHTTP_OPTION_USER_AGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; ru; rv:1.9.2.3) Gecko/20100401 Firefox/4.0 (.NET CLR 3.5.30729)")

; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "google.com")

; ָ������:
Global $hRequest = _WinHttpOpenRequest($hConnect)

; ��������
_WinHttpSendRequest($hRequest)

; �ȴ���Ӧ
_WinHttpReceiveResponse($hRequest)

Global $sHeader
; ���������Ч...
If _WinHttpQueryDataAvailable($hRequest) Then $sHeader = _WinHttpQueryHeaders($hRequest) ; ...��ȡ����ͷ��

; ����
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

; ��ʾ��ȡ��ͷ��
ConsoleWrite($sHeader & @CRLF)

