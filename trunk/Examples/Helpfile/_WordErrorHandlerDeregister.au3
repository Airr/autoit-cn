; *******************************************************
; ʾ�� 1 - ע�Ტ�ں���ע���Զ�����������
; *******************************************************
;
#include <Word.au3>

; ע���Զ�����������
_WordErrorHandlerRegister("MyErrFunc")
; ִ��һЩ����
; ע���Զ�����������
_WordErrorHandlerDeRegister()
; ִ����������

Exit

Func MyErrFunc()
	Local $HexNumber = Hex($oWordErrorHandler.number, 8)
	MsgBox(4096, "", "We intercepted a COM Error !" & @CRLF & _
			"Number is: " & $HexNumber & @CRLF & _
			"Windescription is: " & $oWordErrorHandler.windescription)
	SetError(1) ; ���˺�������ʱ��������һЩ��Ϣ
EndFunc   ;==>MyErrFunc