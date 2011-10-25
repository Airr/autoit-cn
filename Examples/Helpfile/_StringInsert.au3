#include <GuiConstantsEx.au3>
#include <EditConstants.au3>
#include <String.au3>
#include <WindowsConstants.au3>

Global $edit

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate("String Instert", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, BitOR($WS_VSCROLL, $ES_AUTOVSCROLL, $ES_READONLY))
	GUISetState()

	; ���������»��߲���ӡ������̨��
	For $i_loop = -20 To 20
		memowrite($i_loop & @TAB & _StringInsert("Supercalifragilistic", "___", $i_loop) & @CR)
	Next

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

Func memowrite($s_text)
	GUICtrlSetData($iMemo, $s_text, 1)
endfunc   ;==>memowrite

