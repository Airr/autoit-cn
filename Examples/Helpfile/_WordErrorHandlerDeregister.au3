; *******************************************************
; ʾ�� - ע��Ȼ��ע��һ���û�������.
; *******************************************************
#include <Word.au3>
; ע��һ���û�������
_WordErrorHandlerRegister(" MyErrFunc ")
; ��������
; ע���û�������
_WordErrorHandlerDeregister()
; ��������

Exit

Func MyErrFunc()
	$HexNumber = Hex($oWordErrorHandler.number, 8)
	MsgBox(0, "", "We intercepted a COM Error !" & @CRLF & _
			" Number is:" & $HexNumber & @CRLF & _
			" Windescription is:" & $oWordErrorHandler.windescript)
	SetError(1) ; ��������ʱ���
endfunc   ;==>MyErrFunc

