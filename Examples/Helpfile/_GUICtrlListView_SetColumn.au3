#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $aInfo, $hListView

	GUICreate("ListView Set Column", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Column 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 3", 100)

	; �ı���
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "��Ϣ", "Column 1 Width: " & $aInfo[4])
	_GUICtrlListView_SetColumn($hListView, 0, "New Column 1", 150, 1)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "��Ϣ", "Column 1 Width: " & $aInfo[4])

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
