#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo, $hGUI, $aArray, $Drive = 0

_Main()

Func _Main()

	; ��������
	$hGUI = GUICreate("Disk Geo Info", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡӲ�̷ֲ���Ϣ
	While 1
		$aArray = _WinAPI_GetDriveGeometryEx($Drive)
		If @error Then
			ExitLoop
		EndIf
		MemoWrite('-------------------------------' & @CR)
		MemoWrite('Drive:' & @TAB & $Driver & @CR)
		MemoWrite('Cylinders:' & @TAB & $aArray[0] & @CR)
		MemoWrite('Tracks per Cylinder:' & @TAB & $aArray[1] & @CR)
		MemoWrite('Sectors per Track:' & @TAB & $aArray[2] & @CR)
		MemoWrite('Bytes per Sector:' & @TAB & $aArray[3] & @CR)
		MemoWrite('Total Space:' & @TAB & $aArray[4] & '  bytes ' @CR)
		MemoWrite('-------------------------------' & @CR)
	Wend

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

