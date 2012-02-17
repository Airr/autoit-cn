; *******************************************************
; ʾ�� 1 - ע�Ტ�ں���ע���Զ����Ĭ�� Word.au3 ���������
; *******************************************************
;
#include <Word.au3>

; ע���Զ���Ĵ�����
_WordErrorHandlerRegister("MyErrFunc")
; ִ��һЩ����
; ע���Զ�����������
_WordErrorHandlerDeRegister()
; ִ����������
; ע��Ĭ�� IE.au3 COM ���������
_WordErrorHandlerRegister()
; ִ�и������

Exit

Func MyErrFunc()
	; ��Ҫ:������������������Ϊ $oWordErrorHandler
	Local $ErrorScriptline = $oWordErrorHandler.scriptline
	Local $ErrorNumber = $oWordErrorHandler.number
	Local $ErrorNumberHex = Hex($oWordErrorHandler.number, 8)
	Local $ErrorDescription = StringStripWS($oWordErrorHandler.description, 2)
	Local $ErrorWinDescription = StringStripWS($oWordErrorHandler.WinDescription, 2)
	Local $ErrorSource = $oWordErrorHandler.Source
	Local $ErrorHelpFile = $oWordErrorHandler.HelpFile
	Local $ErrorHelpContext = $oWordErrorHandler.HelpContext
	Local $ErrorLastDllError = $oWordErrorHandler.LastDllError
	Local $ErrorOutput = ""
	$ErrorOutput &= "--> COM Error Encountered in " & @ScriptName & @CR
	$ErrorOutput &= "----> $ErrorScriptline = " & $ErrorScriptline & @CR
	$ErrorOutput &= "----> $ErrorNumberHex = " & $ErrorNumberHex & @CR
	$ErrorOutput &= "----> $ErrorNumber = " & $ErrorNumber & @CR
	$ErrorOutput &= "----> $ErrorWinDescription = " & $ErrorWinDescription & @CR
	$ErrorOutput &= "----> $ErrorDescription = " & $ErrorDescription & @CR
	$ErrorOutput &= "----> $ErrorSource = " & $ErrorSource & @CR
	$ErrorOutput &= "----> $ErrorHelpFile = " & $ErrorHelpFile & @CR
	$ErrorOutput &= "----> $ErrorHelpContext = " & $ErrorHelpContext & @CR
	$ErrorOutput &= "----> $ErrorLastDllError = " & $ErrorLastDllError
	MsgBox(4096, "COM Error", $ErrorOutput)
	SetError(1)
	Return
EndFunc   ;==>MyErrFunc