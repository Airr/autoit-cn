
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Set Unicode Format", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)

	GUISetState()

	;
	�����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; ����Unicode��ʽ
	_GUICtrlListView_SetUnicodeFormat($hListView, False)
	MsgBox(4160, "Information", "Unicode:" & _GUICtrlListView_GetUnicodeFormat($hListView))

	_GUICtrlListView_SetUnicodeFormat($hListView, True)
	MsgBox(4160, "Information", "Unicode:" & _GUICtrlListView_GetUnicodeFormat($hListView))


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

