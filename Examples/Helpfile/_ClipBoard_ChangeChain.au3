#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>

Global $iMemo, $hNext = 0

_Main()

Func _Main()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ʼ��������鿴��
	$hNext = _ClipBoard_SetViewer($hGUI)

	GUIRegisterMsg($WM_CHANGECBCHAIN, "WM_CHANGECBCHAIN")
	GUIRegisterMsg($WM_DRAWCLIPBOARD, "WM_DRAWCLIPBOARD")

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �رռ�����鿴��
	_ClipBoard_ChangeChain($hGUI, $hNext)
EndFunc   ;==>_Main

; д����Ϣ�� memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; ���� $WM_CHANGECBCHAIN ��Ϣ
Func WM_CHANGECBCHAIN($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; ��ʾ���յ�����Ϣ
	MemoWrite("***** $WM_CHANGECBCHAIN *****")

	; �����һ���������ڹر�, ��ô�޸���
	If $iwParam = $hNext Then
		$hNext = $ilParam
		; ���򴫵���Ϣ����һ���鿴��
	ElseIf $hNext <> 0 Then
		_SendMessage($hNext, $WM_CHANGECBCHAIN, $iwParam, $ilParam, 0, "hwnd", "hwnd")
	EndIf
EndFunc   ;==>WM_CHANGECBCHAIN

; ���� $WM_DRAWCLIPBOARD ��Ϣ
Func WM_DRAWCLIPBOARD($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	; ��ʾ�������е��ı�
	MemoWrite(_ClipBoard_GetData())

	; ������Ϣ����һ���鿴��
	If $hNext <> 0 Then _SendMessage($hNext, $WM_DRAWCLIPBOARD, $iwParam, $ilParam)
EndFunc   ;==>WM_DRAWCLIPBOARD