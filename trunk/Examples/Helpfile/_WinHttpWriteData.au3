#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "www.snee.com")
; ָ������
Global $hRequest = _WinHttpOpenRequest($hConnect, "POST", "xml/crud/posttest.cgi?sgs")

Global $sPostData = "Additional data to send"
; ��������
_WinHttpSendRequest($hRequest, Default, Default, StringLen($sPostData))

; д�븽�����ݵ�������
_WinHttpWriteData($hRequest, $sPostData)

; �ȴ���Ӧ
_WinHttpReceiveResponse($hRequest)

; ��������Ƿ���Ч...
If _WinHttpQueryDataAvailable($hRequest) Then
	MsgBox(64, "OK", _WinHttpReadData($hRequest))
Else
	MsgBox(48, "Error", "Site is experiencing problems (or you).")
EndIf

; �رվ��
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)
