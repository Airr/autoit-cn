#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

Global $sHost = "www.smijesne-slike.net"
Global $sTarget = "wp-content/uploads/2009/09/7.jpg"
Global $sDestination = @ScriptDir & "\CatHot.jpg"

; ��ʼ������ȡ�Ự���
Global $hHttpOpen = _WinHttpOpen()
If @error Then
	MsgBox(48, "Error", "Error initializing the usage of WinHTTP functions.")
	Exit 1
EndIf
; ��ȡ���Ӿ��
Global $hHttpConnect = _WinHttpConnect($hHttpOpen, $sHost)
If @error Then
	MsgBox(48, "Error", "Error specifying the initial target server of an HTTP request.")
	_WinHttpCloseHandle($hHttpOpen)
	Exit 2
EndIf
; ָ������
Global $hHttpRequest = _WinHttpOpenRequest($hHttpConnect, Default, $sTarget)
If @error Then
	MsgBox(48, "Error", "Error creating an HTTP request handle.")
	_WinHttpCloseHandle($hHttpConnect)
	_WinHttpCloseHandle($hHttpOpen)
	Exit 3
EndIf
; ��������
_WinHttpSendRequest($hHttpRequest)
If @error Then
	MsgBox(48, "Error", "Error sending specified request.")
	_WinHttpCloseHandle($hHttpConnect)
	_WinHttpCloseHandle($hHttpOpen)
	Exit 4
EndIf

; �ȴ���Ӧ
_WinHttpReceiveResponse($hHttpRequest)
; �����Ч���ȡ
Global $bChunk, $bData, $hFile
If _WinHttpQueryDataAvailable($hHttpRequest) Then
	While 1
		$bChunk = _WinHttpReadData($hHttpRequest, 2) ; ��ȡ������
		If @error Then ExitLoop
		$bData = _WinHttpBinaryConcat($bData, $bChunk) ; �������ζ���������
	WEnd
    ; ���浽�ļ�
	$hFile = FileOpen($sDestination, 26)
	FileWrite($hFile, $bData)
	FileClose($hFile)
Else
	MsgBox(48, "Error occurred", "No data available. " & @CRLF)
EndIf

; �رվ��
_WinHttpCloseHandle($hHttpRequest)
_WinHttpCloseHandle($hHttpConnect)
_WinHttpCloseHandle($hHttpOpen)

; �������ص���ʲô
ShellExecute($sDestination)