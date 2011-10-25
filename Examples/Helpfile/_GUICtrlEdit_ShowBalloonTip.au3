
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include  <GuiEdit.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

$Debug_Ed = False ; ��鴫�ݸ�Edit ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hEdit, $sTitle = "ShowBalloonTip", $sText = "Displays a balloon tip associated with an edit control"

	; ��������
	GUICreate("Edit ShowBalloonTip", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState()

	; �����ı�
	_GUICtrlEdit_SetText($hEdit, "This is a test" & @CRLF & "Another Line" & @CRLF & "Append to the end?")
	; ��ʾ������ʾ
	_GUICtrlEdit_ShowBalloonTip($hEdit, $sTitle, $sText, $TTI_INFO)
	; ��ʱ
	Sleep(5000)
	; ����������ʾ
	_GUICtrlEdit_HideBalloonTip($hEdit)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

