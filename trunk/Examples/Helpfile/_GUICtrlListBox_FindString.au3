
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GUIListBox.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

$Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

ʾ��()
ʾ��2()

Func ʾ��()
	Local $iIndex, $hListBox

	; ��������
	GUICreate( "List Box Find
	String" ,  400 ,  296 )
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState()

	; ����ַ���
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat( "%03d : Random
		string" ,  Random ( 1 ,  100 ,  1 )))
	Next
	_GUICtrlListBox_InsertString($hListBox, "eXaCt tExT", 3)
	_GUICtrlListBox_EndUpdate($hListBox)

	;
	������Ŀ
	$iIndex = _GUICtrlListBox_FindString($hListBox, "exa")
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>ʾ��

Func ʾ��2()
	Local $iIndex, $hListBox

	; ��������
	GUICreate( "List Box Find
	String Exact" ,  400 ,  296 )
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState()

	; ����ַ���
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat( "%03d : Random
		string" ,  Random ( 1 ,  100 ,  1 )))
	Next
	_GUICtrlListBox_InsertString($hListBox, "eXa", 2)
	_GUICtrlListBox_InsertString($hListBox, "eXaCt tExT", 3)
	_GUICtrlListBox_EndUpdate($hListBox)


	; �����ַ���
	$iIndex = _GUICtrlListBox_FindString($hListBox, "exact text", True)
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>ʾ��2

