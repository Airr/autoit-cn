#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_Ed = False ; ��鴫�ݸ� Edit ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hEdit
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"
	Local $sBefore, $sAfter

	; ���� GUI
	GUICreate("Edit FmtLines", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState()

	; �����ı�
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile, 500))

	; ��ȡĬ�ϸ�ʽ���ı�
	$sBefore = _GUICtrlEdit_GetText($hEdit)

	; ��������з�
	_GUICtrlEdit_FmtLines($hEdit, True)

	; ��������з����ı�
	$sAfter = _GUICtrlEdit_GetText($hEdit)

	MsgBox(4096, "Information", "Before:" & @LF & @LF & $sBefore & @LF & _
			'--------------------------------------------------------------' & @LF & _
			"After:" & @LF & @LF & $sAfter)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
