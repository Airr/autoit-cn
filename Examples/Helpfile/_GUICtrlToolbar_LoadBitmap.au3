#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>

$Debug_TB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hGUI, $hToolbar
	Local Enum $idRed = 1000, $idGreen, $idBlue

	; ���� GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState()

	; Add bitmaps
	_GUICtrlToolbar_LoadBitmap($hToolbar, @ScriptDir & "\images\Red.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, @ScriptDir & "\Images\Green.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, @ScriptDir & "\Images\Blue.bmp")

	; ��Ӱ�ť
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main
