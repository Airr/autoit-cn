
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Set View", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����Ŀ
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item" & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; ������ͼ
	MsgBox(4160, "Information", "View:" & _GUICtrlListView_GetView($hListView))
	_GUICtrlListView_SetView($hListView, 4)
	MsgBox(4160, "Information", "View:" & _GUICtrlListView_GetView($hListView))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

