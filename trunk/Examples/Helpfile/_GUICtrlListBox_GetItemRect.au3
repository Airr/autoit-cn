
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GUIListBox.au3>
#include  <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

$Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $aRect, $hListBox

	; ��������
	GUICreate( "List Box Get
	Item Rect" ,  400 ,  296 )
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; ����ַ���
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat( "%03d : Random
		string" ,  Random ( 1 ,  100 ,  1 )))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)


	; ��ʾ��Ŀ����
	$aRect = _GUICtrlListBox_GetItemRect($hListBox, 4)
	MsgBox(4160, "Information", "Item 5 Rectangle:" & $aRect[0] & ",
	"  &  $aRect [ 1 ]  &  "," &  $aRect [ 2 ]  &  "," &  $aRect [ 3 ])

	; ѭ�����û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

