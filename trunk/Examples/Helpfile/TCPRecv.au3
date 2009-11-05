#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)

;==============================================
;==============================================
;�����! ��������ú�,�����ÿͻ���(�����Ϊ������Ϣ��)
;==============================================
;==============================================

Example()

Func Example()
	; ����һЩ������Ϣ
	; ������������Ĺ���IP��ַ (@IPAddress1).
;	Local $szServerPC = @ComputerName
;	Local $szIPADDRESS = TCPNameToIP($szServerPC)
	Local $szIPADDRESS = @IPAddress1;��Ĺ���IP��ַ
	Local $nPORT = 33891;�˿�
	Local $MainSocket, $GOOEY, $edit, $ConnectedSocket, $szIP_Accepted
	Local $msg, $recv

	; ��ʼ TCP ����
	;==============================================
	TCPStartup()

	; ����һ������ "SOCKET".
	;   ʹ������IP��ַ�Ͷ˿�33891.
	;==============================================
	$MainSocket = TCPListen($szIPADDRESS, $nPORT)

	; ����׽��ִ���ʧ�ܣ��˳�.
	If $MainSocket = -1 Then Exit


	; ����һ��ͼ���û�������Ϣ��
	;==============================================
	$GOOEY = GUICreate("My Server (IP: " & $szIPADDRESS & ")", 300, 200)
	$edit = GUICtrlCreateEdit("", 10, 10, 280, 180)
	GUISetState()


	; ��ʼ��һ��������������
	;==============================================
	$ConnectedSocket = -1


	;�ȴ��ͽ�������
	;==============================================
	Do
		$ConnectedSocket = TCPAccept($MainSocket)
	Until $ConnectedSocket <> -1


	; ȡ�����ӵĿͻ��˵�IP
	$szIP_Accepted = SocketToIP($ConnectedSocket)

	; ѭ��ͼ���û�������Ϣ
	;==============================================
	While 1
		$msg = GUIGetMsg()

		; �ر�ͼ���û�����
		;--------------------
		If $msg = $GUI_EVENT_CLOSE Then ExitLoop

		; ���Խ��գ���ߣ�2048�ֽ�
		;----------------------------------------------------------------
		$recv = TCPRecv($ConnectedSocket, 2048)

		; �������ʧ��(@error)���Ͽ�����   
		;----------------------------------------------------------------
		If @error Then ExitLoop

		; Update the edit control with what we have received
		;----------------------------------------------------------------
		If $recv <> "" Then GUICtrlSetData($edit, _
				$szIP_Accepted & " > " & $recv & @CRLF & GUICtrlRead($edit))
	WEnd


	If $ConnectedSocket <> -1 Then TCPCloseSocket($ConnectedSocket)

	TCPShutdown()
EndFunc   ;==>Example

; ��������һ�����ӵ��׽��ֵ�IP��ַ. 
;----------------------------------------------------------------------
Func SocketToIP($SHOCKET)
	Local $sockaddr, $aRet
	
	$sockaddr = DllStructCreate("short;ushort;uint;char[8]")

	$aRet = DllCall("Ws2_32.dll", "int", "getpeername", "int", $SHOCKET, _
			"ptr", DllStructGetPtr($sockaddr), "int*", DllStructGetSize($sockaddr))
	If Not @error And $aRet[0] = 0 Then
		$aRet = DllCall("Ws2_32.dll", "str", "inet_ntoa", "int", DllStructGetData($sockaddr, 3))
		If Not @error Then $aRet = $aRet[0]
	Else
		$aRet = 0
	EndIf

	$sockaddr = 0

	Return $aRet
EndFunc   ;==>SocketToIP