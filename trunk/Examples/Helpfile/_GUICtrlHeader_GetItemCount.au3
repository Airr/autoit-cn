ʧ��: - 1


ʾ��
#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Opt('MustDeclareVars ', 1)

$Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader

	; ��������
	$hGUI = GUICreate('Header ', 420, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit('', 2, 24, 426, 240)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; �����
	_GUICtrlHeader_AddItem($hHeader, "Column 1 ", 110)
	_GUICtrlHeader_AddItem($hHeader, "Column 2 ", 110)
	_GUICtrlHeader_AddItem($hHeader, "Column 3 ", 110)
	_GUICtrlHeader_AddItem($hHeader, "Column 4 ", 100)

	MemoWrite('Column count:' & _GUICtrlHeader_GetItemCount($hHeader))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

