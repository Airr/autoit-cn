;������!! �ȴ��� !!!!!!!!!!!!!!!
$g_IP = "127.0.0.1"

; ��ʼ UDP ����
;==============================================
UDPStartup()

; ע��������.
OnAutoItExitRegister("Cleanup")

; ����һ�������׽���("SOCKET")
;==============================================
Local $socket = UDPBind($g_IP, 65432)
If @error <> 0 Then Exit

;--- ���������Ĵ���

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
