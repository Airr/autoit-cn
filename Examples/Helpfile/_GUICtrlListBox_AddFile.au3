#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>

$Debug_LB = False ; ��鴫�ݸ� ListBox ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hListBox

	; ���� GUI
	GUICreate("List Box Add File", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; ����ļ�
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\notepad.exe")

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
