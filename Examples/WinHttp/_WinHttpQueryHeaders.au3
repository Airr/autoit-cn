#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#Include <WinHTTP.au3>

; ��������
$hOpen = _WinHttpOpen()
$hConnect = _WinHttpConnect($hOpen, "msdn.microsoft.com ")
; ָ������
$hRequest = _WinHttpOpenRequest($hConnect, Default, "en-us/library/aa384101(VS.85).aspx ")

; ��������
_WinHttpSendRequest($hRequest)

; �ȴ�Ӧ��
_WinHttpReceiveResponse($hRequest)

Global $sHeader
If _WinHttpQueryDataAvailable($hRequest) Then
	$sHeader = _WinHttpQueryHeaders($hRequest)
EndIf

_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

; ��ʾ��ȡ��ͷ��
msgbox(0, "Header ", $sHeader)

