
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>
#include  <Constants.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $aXY, $hListView

	GUICreate("ListView Approximate View Rect", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)

	_GUICtrlListView_SetUnicodeFormat($hListView, False)
	GUISetState()

	; �����
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)

	; �����
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Row" & $iI)
	Next

	MsgBox(4096, "Information", "Approximate View Rect")
	; �ı���ͼ��С
	$aXY = _GUICtrlListView_ApproximateViewRect($hListView)
	_WinAPI_SetWindowPos( GUICtrlGetHandle($hListView), 0, 2, 2, $aXY[0], $aXY[1], $SWP_NOZORDER)
	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

