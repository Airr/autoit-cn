#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo, $tDISKGEOMETRYEX, $Drive = 0

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" SysVerion Info ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	UISetState()

	; ��ȡϵͳ�汾��Ϣ
	$Result = _WinAPI_GetProcessMemoryInfo()
	MemoWrite('MajorVersion ==>' & $Result[0] & @CR)
	MemoWrite('MinorVersion ==>' & $Result[1] & @CR)
	MemoWrite('BuildNumber ==>' & $Result[2] & @CR)
	MemoWrite('PlatformId ==>' & $Result[3] & @CR)
	MemoWrite('CSDVersion ==>' & $Result[4] & @CR)
	MemoWrite('ServicePackMajor ==>' & $Result[5] & @CR)
	MemoWrite('ServicePackMinor ==>' & $Result[6] & @CR)
	MemoWrite('SuiteMask ==>' & $Result[7] & @CR)
	MemoWrite('ProductType ==>' & $Result[8] & @CR)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

