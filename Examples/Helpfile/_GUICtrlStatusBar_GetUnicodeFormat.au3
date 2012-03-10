#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()

	Local $hGUI, $hStatus

	; ���� GUI
	$hGUI = GUICreate("(Example 1) StatusBar Get Unicode Format", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; ���� memo �ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ/���� Unicode ��ʽ
	MemoWrite("Unicode format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))
	_GUICtrlStatusBar_SetUnicodeFormat($hStatus)
	MemoWrite("Unicode format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д����Ϣ�� memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
