
#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_HDR = False ; ��鴫�ݸ��ؼ�������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $hHeader

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; �����
	_GUICtrlHeader_AddItem($hHeader, "1", 100)
	_GUICtrlHeader_AddItem($hHeader, "2", 100)
	_GUICtrlHeader_AddItem($hHeader, "3", 100)
	_GUICtrlHeader_AddItem($hHeader, "4", 100)

	; ������й�����
	_GUICtrlHeader_ClearFilterAll($hHeader)

	MsgBox(4096, "Information", "About to Destroy Header")

	_GUICtrlHeader_Destroy($hHeader)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

