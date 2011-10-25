#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

Opt('MustDeclareVars ', 1)

$Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $msg, $hImage, $bitmap

	; ��������
	$hGUI = GUICreate('Header ', 430, 300)
	$bitmap = GUICtrlCreateButton('get item bitmap handle ', 118, 270, 190, 20)
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

	MemoWrite('Column 4 bitmap handle:' & ' 0x' & Hex( _GUICtrlHeader_GetItemBitmap($hHeader, 3)))

	Do
		$msg = GUIGetMsg()
		If $msg = $bitmap Then
			; ������4λͼ
			_GUICtrlHeader_SetItemBitmap($hHeader, 3, _WinAPI_CreateSolidBitmap($hGUI, 0xFF00FF, 11, 11))
			; ��ʾ��4λͼ���
			MemoWrite('Column 4 bitmap handle:' & ' 0x' & Hex( _GUICtrlHeader_GetItemBitmap($hHeader, 3)))
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

