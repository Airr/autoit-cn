#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hGui, $hToolTip, $hListView

	$hGui = GUICreate("ListView Get ToolTips", 400, 300)
	$hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Show tooltip handle
	$hToolTip = _GUICtrlListView_GetToolTips($hListView)
	MsgBox(4160, "��Ϣ", "ToolTip Handle: 0x" & Hex($hToolTip) & @CRLF & _
			"IsPtr = " & IsPtr($hToolTip) & " IsHWnd = " & IsHWnd($hToolTip))

	_GUICtrlListView_SetToolTips($hListView, $hToolTip)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
