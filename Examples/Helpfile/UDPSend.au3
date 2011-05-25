;;����һ�� UDP �ͻ���
;;�������з����

; ��ʼ UDP ����
;==============================================
UDPStartup()

; ע��������.
OnAutoItExitRegister("Cleanup")

; ��һ��"�׽���"("SOCKET")
;==============================================
Local $socket = UDPOpen("127.0.0.1", 65532)
If @error <> 0 Then Exit

Local $n = 0
While 1
	Sleep(2000)
	$n = $n + 1
	Local $status = UDPSend($socket, "��Ϣ #" & $n)
	If $status = 0 Then
		MsgBox(0, "����", "������ UDP ��Ϣʱ��������: " & @error)
		Exit
	EndIf
WEnd

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
