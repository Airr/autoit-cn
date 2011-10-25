
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GUIListBox.au3>
#include  <GuiConstantsEx.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $sText, $hListBox

	; ��������
	GUICreate( "List Box
	Sort" ,  400 ,  296 )
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_MULTIPLESEL, $LBS_SORT))
	GUISetState()

	;
	����ַ���
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		$sText = StringFormat( "%03d : Random
		string " ,  Random ( 1 ,  100 ,  1 ))
		For $iX = 1 To Random(1, 20, 1)

			$sText &= Chr( Random(65, 90, 1))

		Next

		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_InsertString($hListBox, "This is a test", 0) ; ʹ�ò����ǲ����Զ�����
	_GUICtrlListBox_EndUpdate($hListBox)


	; ����
	MsgBox(4160, "Information", "Sort Data")

	_GUICtrlListBox_Sort($hListBox)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

