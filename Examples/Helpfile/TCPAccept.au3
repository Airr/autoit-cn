;������!! ���������� !!!!!!!!!!!!!!!
Local $g_IP = "127.0.0.1"

; ��ʼ TCP ����
;==============================================
TCPStartup()

; ���������׽���(SOCKET)
;==============================================
Local $MainSocket = TCPListen($g_IP, 65432, 100)
If $MainSocket = -1 Then Exit

;  �ȴ��ͻ�������
;--------------------
While 1
	Local $ConnectedSocket = TCPAccept($MainSocket)
	If $ConnectedSocket >= 0 Then
	MsgBox(4096,"","�ҵķ����� - �ͻ���������")
		Exit
	EndIf
WEnd
