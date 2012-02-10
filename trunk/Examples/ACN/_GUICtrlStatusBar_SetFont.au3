
#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

$Debug_SB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()

	Global $hGUI, $hStatus, $hFont
	Global $aParts[3] = [150, 250, -1]

	; ��������
	$hGUI = GUICreate("set statusbar font", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	GUISetState()

	; ���ò���
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Part 1 ")
	_GUICtrlStatusBar_SetText($hStatus, "Part 2 ", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Part 3 ", 2)

	; ����״̬������
	_GUICtrlStatusBar_SetFont($hStatus, 16, 800, 6, "Comic Sans MS ") ;4+2

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	_WinAPI_DeleteObject($hFont)
	GUIDelete()

endfunc   ;==>_Main

