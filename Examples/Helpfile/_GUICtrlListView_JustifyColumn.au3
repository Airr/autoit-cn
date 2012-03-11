#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $aInfo, $hListView

	GUICreate("ListView Justify Column", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Column 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Column 3", 100)

	; Change column
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "��Ϣ", "Column 1 Justification: " & $aInfo[0])
	_GUICtrlListView_JustifyColumn($hListView, 0, 2)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "��Ϣ", "Column 1 Justification: " & $aInfo[0])

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
