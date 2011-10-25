#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo, $tDISKGEOMETRYEX, $Drive = 0

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" Mem Info ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	UISetState()

	; ��ȡ�ڴ�ʹ����Ϣ
	$Result = _WinAPI_GetProcessMemoryInfo()
	MemoWrite('Number of page faults:' & $Result[0] & ' bytes' & @CR)
	MemoWrite('Peak working set size:' & $Result[1] & ' bytes' & @CR)
	MemoWrite('Current working set size:' & $Result[2] & ' bytes' & @CR)
	MemoWrite('Peak paged pool usage:' & $Result[3] & ' bytes' & @CR)
	MemoWrite('Current paged pool usage:' & $Result[4] & ' bytes' & @CR)
	MemoWrite('Peak nonpaged pool usage:' & $Result[5] & ' bytes' & @CR)
	MemoWrite('Current nonpaged pool usage:' & $Result[6] & ' bytes' & @CR)
	MemoWrite('Peak space allocated for the pagefile:' & $Result[7] & ' bytes' & @CR)
	MemoWrite('Current space allocated for the pagefile:' & $Result[8] & ' bytes' & @CR)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

