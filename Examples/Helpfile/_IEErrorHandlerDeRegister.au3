; *******************************************************
; ʾ�� - ע��һ���Զ��������, �Ժ�ע��
; *******************************************************
#include  <IE.au3>
; ע��һ���Զ��������
_IEErrorHandlerRegister(" MyErrFunc ")
; ��Щʲô
; ע���Զ��������
_IEErrorHandlerDeregister()
; ������Щʲô

Exit

Func MyErrFunc()
	$HexNumber = Hex($oIEErrorHandler .number, 8)
	MsgBox(0, "", "We intercepted a COM Error !" & @CRLF & _
			" Number is:" & $HexNumber & @CRLF
	" Windescription is:" & $oIEErrorHandler .windescription)
	SetError(1) ; ��������ʱ���
endfunc   ;==>MyErrFunc

