; *******************************************************
; ʾ�� 1 - ע�Ტ�ں���ȡ��ע���Զ����Ĭ�� IE.au3 ���������
; *******************************************************

#include <IE.au3>

; ע���Զ�����������
_IEErrorHandlerRegister("MyErrFunc")
; ִ��һЩ����
; ȡ��ע���Զ�����������
_IEErrorHandlerDeRegister()
; ִ����������
; ע��Ĭ�� IE.au3 COM ���������
_IEErrorHandlerRegister()
; ִ�и������

Exit

Func MyErrFunc()
	; ��Ҫ��ʾ: �������������Ʊ���Ϊ $oIEErrorHandler
	Local $ErrorScriptline = $oIEErrorHandler.scriptline
	Local $ErrorNumber = $oIEErrorHandler.number
	Local $ErrorNumberHex = Hex($oIEErrorHandler.number, 8)
	Local $ErrorDescription = StringStripWS($oIEErrorHandler.description, 2)
	Local $ErrorWinDescription = StringStripWS($oIEErrorHandler.WinDescription, 2)
	Local $ErrorSource = $oIEErrorHandler.Source
	Local $ErrorHelpFile = $oIEErrorHandler.HelpFile
	Local $ErrorHelpContext = $oIEErrorHandler.HelpContext
	Local $ErrorLastDllError = $oIEErrorHandler.LastDllError
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
