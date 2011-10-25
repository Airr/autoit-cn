
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GUIListBox.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

$Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $aTabs[4] = [3, 100, 200, 300], $hListBox

	; ��������
	GUICreate( "List Box Set Tab
	Stops" ,  400 ,  296 )
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_USETABSTOPS))
	GUISetState()

	;
	���ñ�ǩ��ֹ��
	_GUICtrlListBox_SetTabStops($hListBox, $aTabs)

	;
	��ӱ�ǩ�ַ���
	_GUICtrlListBox_AddString($hListBox, "Column 1" & @TAB & "Column 2" & @TAB & "Column 3")


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

