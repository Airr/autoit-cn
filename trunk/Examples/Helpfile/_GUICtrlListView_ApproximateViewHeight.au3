#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <Constants.au3>

$Debug_LV = False ; ��鴫�ݸ� ListView ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $iY, $hListView

	GUICreate("ListView Approximate View Height", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; Add column
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)

	; �����Ŀ
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Row " & $iI)
	Next

	MsgBox(4096, "��Ϣ", "Approximate View Height")
	; Resize view height
	$iY = _GUICtrlListView_ApproximateViewHeight($hListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($hListView), 0, 2, 2, 394, $iY, $SWP_NOZORDER)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
