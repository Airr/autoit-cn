; *******************************************************
; ʾ�� 1 - ע�Ტ�ں���ȡ��ע���Զ�����������
; *******************************************************

#include <IE.au3>

; ע���Զ�����������
_IEErrorHandlerRegister("MyErrFunc")
; ִ��һЩ����
; ȡ��ע���Զ�����������
_IEErrorHandlerDeRegister()
; ִ����������

Exit

Func MyErrFunc()
	Local $HexNumber = Hex($oIEErrorHandler.number, 8)
	MsgBox(4096, "", "We intercepted a COM Error !" & @CRLF & _
			"Number is: " & $HexNumber & @CRLF & _
			"Windescription is: " & $oIEErrorHandler.windescription)
	SetError(1) ; ���˺�������ʱ��������һЩ��Ϣ
EndFunc   ;==>MyErrFunc
