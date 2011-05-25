;;����һ�� UDP ������
;;�������з����

; ��ʼ UDP ����
;==============================================
UDPStartup()

; ע��������.
OnAutoItExitRegister("Cleanup")

; �󶨵�һ���׽���(SOCKET)
;==============================================
Local $socket = UDPBind("127.0.0.1", 65532)
If @error <> 0 Then Exit

While 1
	Local $data = UDPRecv($socket, 50)
	If $data <> "" Then
        MsgBox(0, "UDP ����", $data, 1)
	EndIf
	Sleep(100)
WEnd

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup


