#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>

$Debug_Ed = False ; ��鴫�ݸ� Edit ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hStatusBar, $hEdit, $hGUI
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $aPartRightSide[4] = [120, 248, 378, -1]

	; ���� GUI
	$hGUI = GUICreate("Edit Get Modify", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 3, 97, "shell32.dll")
	GUISetState()

	; ���ñ߾�
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; ����ı�
	_GUICtrlEdit_AppendText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * - 1)

	; ��ȡ�޸ı�־
	_GUICtrlStatusBar_SetText($hStatusBar, "Modified: " & _GUICtrlEdit_GetModify($hEdit), 2)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
