#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

Opt('MustDeclareVars ', 1)

$Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $msg, $align, $hImage

	; ��������
	$hGUI = GUICreate('Header ', 420, 300)
	$align = GUICtrlCreateButton('set/get item align ', 270, 118, 190, 20)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit('', 2, 24, 426, 240)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ���ͼ��
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList($hHeader, $hImage)

	; �����
	_GUICtrlHeader_AddItem($hHeader, "Column 1 ", 110, 0, 0)
	_GUICtrlHeader_AddItem($hHeader, "Column 2 ", 110, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Column 3 ", 110, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Column 4 ", 100)

	MemoWrite('Column 1 alignment:' & _GUICtrlHeader_GetItemAlign($hHeader, 0))

	Do
		$msg = GUIGetMsg()
		If $msg = $align Then
			; ������1���뷽ʽ
			_GUICtrlHeader_SetItemAlign($hHeader, 0, 2)
			; ��ʾ��1���뷽ʽ
			MemoWrite('Column 1 alignment:' & _GUICtrlHeader_GetItemAlign($hHeader, 0))
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

