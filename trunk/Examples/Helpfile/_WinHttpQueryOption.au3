#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()

; �����û������ַ���
_WinHttpSetOption($hOpen, $WINHTTP_OPTION_USER_AGENT, "Who the fuc*k is Alice???")

; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "google.com")

; ָ������
Global $hRequest = _WinHttpOpenRequest($hConnect)

; ��������
_WinHttpSendRequest($hRequest)

; �����ʹ�õ��û������ַ���
ConsoleWrite("! Custom agent: " & _WinHttpQueryOption($hOpen, $WINHTTP_OPTION_USER_AGENT) & @CRLF & @CRLF)

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