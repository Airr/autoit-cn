#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ;��鴫�ݸ� ListBox ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hListBox

	; ���� GUI
	GUICreate("List Box Set Horizontal Extent", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState()

	; Add long string
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI.")

	; Show current horizontal extent
	MsgBox(4160, "��Ϣ", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	_GUICtrlListBox_SetHorizontalExtent($hListBox, 500)

	; Show current horizontal extent
	MsgBox(4160, "��Ϣ", "Horizontal Extent: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
