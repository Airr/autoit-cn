
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Global $iI, $hListView

	; ��������
	GUICreate( "ListView Find
	Text" ,  400 ,  300 )
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; �����
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; �����
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 49
		_GUICtrlListView_AddItem($hListView, "Item" & $iI)
	Next
	_GUICtrlListView_AddItem($hListView, "Target item")

	For $iI = 51 To 100
		_GUICtrlListView_AddItem($hListView, "Item" & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)


	; ����Ŀ����Ŀ
	$iI = _GUICtrlListView_FindText($hListView, "tArGeT")
	MsgBox(4160, "Information", "Target Item Index:" & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; ѭ�����û��˳�

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

