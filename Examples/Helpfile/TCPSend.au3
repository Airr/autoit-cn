;==============================================
;==============================================
;�ͻ���! ����ǰ����ȷ�������������(�ͻ���Ϊ������Ϣ��)
;==============================================
;==============================================

Example()

Func Example()
	; ��ʼ TCP ����
	;==============================================
	TCPStartup()

	; ����һЩ������Ϣ
	;--------------------------
	Local $ConnectedSocket, $szData
	; ���� $szIPADDRESS Ϊ�����IP. ����ʹ�ñ��صĻ�������ת��Ϊ IP ��ַ
	;	Local $szServerPC = @ComputerName
	;	Local $szIPADDRESS = TCPNameToIP($szServerPC)
	Local $szIPADDRESS = @IPAddress1
	Local $nPORT = 33891

	; ��ʼ��һ��������������
	;==============================================
	$ConnectedSocket = -1

	;�������ӵ������IP�� 33891 �˿�.
	;=======================================================
	$ConnectedSocket = TCPConnect($szIPADDRESS, $nPORT)

	; ��������˴���... ��ʾ����
	If @error Then
		MsgBox(4112, "����", "TCP����ʧ��,�����δ����!�������: " & @error)
		; �������û�д���,��ѭ��һ�� inputbox ���ڷ�������
		; �������
	Else
		;����ѭ��,ÿ�ν�ѯ�ʷ���ʲô���ݸ������
		While 1
			; ʹ�� InputBox �õ�Ҫ���͵����� 
			$szData = InputBox("�������ݸ������", @LF & @LF & "����һ��Ҫ���͸�����˵�����:")

			; �������� InputBox ��ȡ����ť����ʹ��һ�������ݽ��˳����ѭ��
			If @error Or $szData = "" Then ExitLoop

			; ����ȷ���� $szData ��������... Ȼ����ͨ�����ӷ�������.
			; convert AutoIt native UTF-16 to UTF-8
			TCPSend($ConnectedSocket, StringToBinary($szData, 4))

			; �������ʧ��(@error)���Ͽ�����
			;----------------------------------------------------------------
			If @error Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>Example