#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>

$Debug_Ed = False ; ��鴫�ݸ� Edit ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hEdit
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"

	; ���� GUI
	GUICreate("Edit Get Line", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	MsgBox(4160, "Information", _GUICtrlEdit_GetLine($hEdit, 2))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
