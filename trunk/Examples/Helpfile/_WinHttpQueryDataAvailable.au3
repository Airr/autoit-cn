#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#Include <WinHttp.au3>

Opt('MustDeclareVars ', 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "google.com ")
; ��������
Global $hRequest = _WinHttpOpenRequest($hConnect)
; ��������
_WinHttpSendRequest($hRequest)

; �ȴ�Ӧ��
_WinHttpReceiveResponse($hRequest)

; ����Ƿ������ݿ���
If _WinHttpQueryDataAvailable($hRequest) Then
	msgbox(64, "OK ", "Data from google.com is available! ")
Else
	msgbox(48, "Error ", "Site is experiencing problems (or you). ")
EndIf

; �رվ��
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

