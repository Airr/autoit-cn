
#include  <GuiConstantsEx.au3>
#include  <GuiHeader.au3>

Opt('MustDeclareVars', 1)

$Debug_HDR = False ; ��鴫�ݸ��ؼ�������,
����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Local $hGUI, $hHeader

	; ��������
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState()

	;
	�����
	_GUICtrlHeader_AddItem($hHeader, "Column 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 4", 100)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

