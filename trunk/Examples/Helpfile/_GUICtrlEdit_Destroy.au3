
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiEdit.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

$Debug_Ed = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hGUI, $hEdit

	; ��������
	$hGUI = GUICreate("Edit Destroy", 400, 300)

	$hEdit = _GUICtrlEdit_Create($hGUI, "This is a test" & @CRLF & "Another Line", 2, 2, 394, 268)

	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "Append to the end?")

	MsgBox(4160, "Information", "Destroy Edit Control")
	_GUICtrlEdit_Destroy($hEdit)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

