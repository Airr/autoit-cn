#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#Include <WinHTTP.au3>

Opt('MustDeclareVars ', 1)

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()

; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, "thetimes.co.uk ")
; ���ͼ�����
Global $hRequest = _WinHttpSimpleSendRequest($hConnect)

; �򵥶�ȡ
Global $sRead = _WinHttpSimpleReadData($hRequest)
msgbox(64, "Returned (first 1100 characters) ", StringLeft($sRead, 1100) & " ... ")

; �رվ��
_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

