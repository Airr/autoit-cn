
ͨ��ʹ��ObjEvent����Autoit�ܹ�����COM�����Ұ����Ǵ��ݸ�һ��������û����������.����UDF�����߻����һ������, ��Ϊ��ͬһʱ��ֻ��һ��COM�����������Ա�ʹ��.���û��Զ��庯��(UDF) Ҫʹ��COM����������ʱ��, ��������ע���û����������, ��װUDF�Լ��Ĵ��������Ȼ��Ѵ������ԭ.���ҵ���, ͨ�������, UDFû�а취ȡ���û����������ľ��.

��ĳ�̶ֳ��������ͨ��������ע�����COM���������, ��������Ҫע�����������ʱ��IE.au3���Ժܺõ��������Ƴ��͸�ԭ.�����ʹ�����Լ��Ĵ�����������ʹ��IE.au3Ĭ�ϴ������.ʹ��Ĭ�ϵ�IE.au3���������, ��Ҳ���Դӿ���̨�õ�һЩ�ܺõ������Ϣ����Ĭ�ϵ�һЩȫ�ֱ����������񵽵Ĵ�����Ϣ.
�������Ĭ�ϵĴ��������(__IEInternalErrorHandler), ������Щȫ�ֱ����ɹ���ο�:
$IEComErrorNumber, $IEComErrorNumberHex, $IEComErrorDescription, $IEComErrorScriptline, $IEComErrorWinDescription, $IEComErrorSource, $IEComErrorHelpFile, $IEComErrorHelpContext, $IEComErrorLastDllError, $IEComErrorComObj��$IEComErrorOutput

�������_IEErrorNotify����COM������Ϣ�Ƿ��ڿ���̨��ʾ.

��� _IEErrorHandlerDeRegister, _IEErrorNotify

ʾ��
; *******************************************************
; ע��Ȼ��ע��һ���Զ����Ĭ�ϵ�IE.au3������
; *******************************************************
;
#include  <IE.au3>
; ע��һ���Զ��������
_IEErrorHandlerRegister(" MyErrFunc")
; ��Щʲô
; ע���Զ��������
_IEErrorHandlerDeregister()
; ����Щʲô
; ע��Ĭ�ϵ�IE.au3 COM������
_IEErrorHandlerRegister()
; ������

Exit

Func MyErrFunc()
	; ��Ҫ: ������������������Ϊ$oIEErrorHandler
	$ErrorScriptline = $oIEErrorHandler .scriptline
	$ErrorNumber = $oIEErrorHandler .number
	$ErrorNumberHex = Hex($oIEErrorHandler .number, 8)
	$ErrorDescription = StringStripWS($oIEErrorHandler .description, 2)
	$ErrorWinDescription = StringStripWS($oIEErrorHandler .WinDescription, 2)
	$ErrorSource = $oIEErrorHandler .Source
	$ErrorHelpFile = $oIEErrorHandler .HelpFile
	$ErrorHelpContext = $oIEErrorHandler .HelpContext
	$ErrorLastDllError = $oIEErrorHandler .LastDllError
	$ErrorOutput = " "
	$ErrorOutput &= " --> COM Error Encountered in" & @ScriptName & @CR
	$ErrorOutput &= " ----> $ErrorScriptline =" & $ErrorScriptline & @CR
	$ErrorOutput &= " ----> $ErrorNumberHex =" & $ErrorNumberHex & @CR
	$ErrorOutput &= " ----> $ErrorNumber =" & $ErrorNumber & @CR
	$ErrorOutput &= " ----> $ErrorWinDescription =" & $ErrorWinDescription & @CR
	$ErrorOutput &= " ----> $ErrorDescription =" & $ErrorDescription & @CR
	$ErrorOutput &= " ----> $ErrorSource =" & $ErrorSource & @CR
	$ErrorOutput &= " ----> $ErrorHelpFile =" & $ErrorHelpFile & @CR
	$ErrorOutput &= " ----> $ErrorHelpContext =" & $ErrorHelpContext & @CR
	$ErrorOutput &= " ----> $ErrorLastDllError =" & $ErrorLastDllError
	MsgBox(0, "COM Error ", $ErrorOutput)
	SetError(1)
	Return
endfunc   ;==>MyErrFunc

