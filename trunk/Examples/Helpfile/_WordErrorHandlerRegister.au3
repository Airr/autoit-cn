
AutoIt ����������COM����, ��ͨ��ʹ��ObjEvent���������Զ��������. �����UDF�ı�д����һ������, ��Ϊͬһʱ��ֻ����һ��COM����������ʹ����. ����ʹ��COM��������UDF�����Ƚ��û��ľ��ע��, ��װ���Լ��ľ��֮���ٽ��û������λ. ���ҵ���, UDFĬ���޷���ȡ���û�������.

�����ʹ����һ����ע�����COM��������ͨ���÷�ʽWord.au3�ɱ������Ƴ�������Ҫʱ�����ͷ�.
��Ҳ����ָ�����Լ�����Ļ���һ��ΪWord.au3(Ĭ�ϵ�) �����Ĵ�����. ʹ��Ĭ�ϵ�Word.au3������, ����Ի��һ����д�����̨�������Ϣ��һЩ���������صĴ������Ϣ��ȫ�ֱ���.

�������ʵ�������Լ���COM������ʱû��ʹ����һ����, Word.au3���޷�����һЩCOM����, ����������һЩͻȻ�Ľű��ж�.


��� _WordErrorHandlerDeRegister

ʾ��

; *******************************************************
; ʾ�� - ע��һ���Զ���ĺ�Ĭ�ϵ�Word.au3�����������ע��
; *******************************************************
#include <Word.au3>
; ע���Զ��������
_WordErrorHandlerRegister(" MyErrFunc ")
; ��Щʲô
; ע���Զ��������
_WordErrorHandlerDeregister()
; ����Щʲô
; ע��Ĭ�ϵ� IE.au3 COM ������
_WordErrorHandlerRegister()
; ����Щ����
Exit

Func MyErrFunc()
	; ��Ҫ: ������������������Ϊ $oWordErrorHandler
	$ErrorScriptline = $oWordErrorHandler.scriptline
	$ErrorNumber = $oWordErrorHandler.number
	$ErrorNumberHex = Hex($oWordErrorHandler.number, 8)
	$ErrorDescription = StringStripWS($oWordErrorHandler.description, 2)
	$ErrorWinDescription = StringStripWS($oWordErrorHandler.WinDescription, 2)
	$ErrorSource = $oWordErrorHandler.Source
	$ErrorHelpFile = $oWordErrorHandler.HelperFile
	$ErrorHelpContext = $oWordErrorHandler.HelpContext
	$ErrorLastDllError = $oWordErrorHandler.LastDllError
	$ErrorOutput = ""
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

