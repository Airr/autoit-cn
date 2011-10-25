
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiListView.au3>
#include  <GuiImageList.au3>

Opt('MustDeclareVars', 1)

$Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

_Main()

Func _Main()
	Global $hImage, $iIndex, $hListView

	; ��������
	GUICreate( "ListView Find
	Nearest" ,  400 ,  300 )
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUICtrlSetStyle($hListView, $LVS_ICON)
	GUISetState()

	; ����ͼ��
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap( GUICtrlGetHandle($hListView), 0xFF0000, 16, 16))

	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap( GUICtrlGetHandle($hListView), 0x00FF00, 16, 16))

	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap( GUICtrlGetHandle($hListView), 0x0000FF, 16, 16))

	_GUICtrlListView_SetImageList($hListView, $hImage, 0)

	; �����
	_GUICtrlListView_AddItem($hListView, "Item 1", 0)
	_GUICtrlListView_AddItem($hListView, "Item 2", 1)
	_GUICtrlListView_AddItem($hListView, "Item 3", 2)

	; �����������Ŀ

	$iIndex = _GUICtrlListView_FindNearest($hListView, 100, 10)
	MsgBox(4160, "Information", "Item nearest [100, 10]:" & $iIndex)

	$iIndex = _GUICtrlListView_FindNearest($hListView, 200, 10)

	MsgBox(4160, "Information", "Item nearest [200, 10]:" & $iIndex)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

