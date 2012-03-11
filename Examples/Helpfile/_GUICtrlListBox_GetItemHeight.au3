#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

$Debug_LB = False ;��鴫�ݸ� ListBox ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hListBox

	; ���� GUI
	GUICreate("List Box Get Item Height", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; ����ַ���
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; ��ʾ��Ŀ�߶�
	MsgBox(4160, "��Ϣ", "Item height: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; ������Ŀ�߶�
	_GUICtrlListBox_SetItemHeight($hListBox, 26)

	; ��ʾ��Ŀ�߶�
	MsgBox(4160, "��Ϣ", "Item height: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
