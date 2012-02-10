#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo
Global $tStruct = DllStructCreate('dword [ 8 ]')

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" Fill Struct ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	_WinAPI_FillStruct($tStruct, -1, 4)
	For $i = 1 To 8
		MemoWrite('0x' & Hex( DllStructGetData($tStruct, 1)) & @CR)
	Next

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

