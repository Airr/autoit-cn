Opt('MustDeclareVars', 1)

;==============================================
;==============================================
;�ͻ���! ����ǰ����ȷ�������������(�ͻ���Ϊ������Ϣ��)
;==============================================
;==============================================

Example()

Func Example()
	; ����һЩ������Ϣ
	;--------------------------
	Local $ConnectedSocket, $szData
	; ���� $szIPADDRESS Ϊ�����IP. ����ʹ�ñ��صĻ�������ת��Ϊ IP ��ַ
;	Local $szServerPC = @ComputerName
;	Local $szIPADDRESS = TCPNameToIP($szServerPC)
	Local $szIPADDRESS = @IPAddress1
	Local $nPORT = 33891

	; ��ʼ TCP ����
	;==============================================
	TCPStartup()

	; ��ʼ��һ��������������
	;==============================================
	$ConnectedSocket = -1

	;�������ӵ������IP�� 33891 �˿�.
	;=======================================================
	$ConnectedSocket = TCPConnect($szIPADDRESS, $nPORT)

	; ��������˴���... ��ʾ����
	If @error Then
		MsgBox(4112, "����", "TCP����ʧ��,�����δ���ã��������: " & @error)
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
			TCPSend($ConnectedSocket, $szData)

			; �������ʧ��(@error)���Ͽ�����
			;----------------------------------------------------------------
			If @error Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>Example