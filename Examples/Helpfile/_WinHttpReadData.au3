#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; ��ʼ��
Global $hOpen = _WinHttpOpen()

If @error Then
	MsgBox(48, "Error", "Error initializing the usage of WinHTTP functions.")
	Exit 1
EndIf

; ָ�����ӵ�����
Global $hConnect = _WinHttpConnect($hOpen, "yahoo.com") ; <- �������Ŀ��
If @error Then
	MsgBox(48, "Error", "Error specifying the initial target server of an HTTP request.")
	_WinHttpCloseHandle($hOpen)
	Exit 2
EndIf

; ��������
Global $hRequest = _WinHttpOpenRequest($hConnect)
If @error Then
	MsgBox(48, "Error", "Error creating an HTTP request handle.")
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hOpen)
	Exit 3
EndIf

; ������
_WinHttpSendRequest($hRequest)
If @error Then
	MsgBox(48, "Error", "Error sending specified request.")
	_WinHttpCloseHandle($hRequest)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hOpen)
	Exit 4
EndIf

; �ȴ���Ӧ
_WinHttpReceiveResponse($hRequest)
If @error Then
	MsgBox(48, "Error", "Error waiting for the response from the server.")
	_WinHttpCloseHandle($hRequest)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hOpen)
	Exit 5
EndIf

; �����Ƿ������ݶ�ȡ
Global $sChunk, $sData
If _WinHttpQueryDataAvailable($hRequest) Then
	; ��ȡ
	While 1
		$sChunk = _WinHttpReadData($hRequest)
		If @error Then ExitLoop
		$sData &= $sChunk
	WEnd
	ConsoleWrite($sData & @CRLF) ; ��ӡ������̨
Else
	MsgBox(48, "Error", "Site is experiencing problems.")
EndIf

; ������Ҫ��Щ���ʱ�ر�����
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)