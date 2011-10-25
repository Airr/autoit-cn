#include <WinApiEx.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Global $i = 0, $iData, $iMemo

_Main()

Func _Main()
	Local $hGUI, $iI, $aInfo

	; ��������
	$hGUI = GUICreate(" Display Settings ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	While 1
		$Data = _WinAPI_EnumDisplaySettings('', $i)
		If IsArray($Data) Then
			MemoWrite($Data[0] & '  x' & $Data[1] & '  x' & $Data[2] & '  bit')
		Else
			ExitLoop
		EndIf
		$i += 1
	WEnd

	$Data = _WinAPI_EnumDisplaySettings('', $ENUM_CURRENT_SETTINGS)
	MemoWrite('===========Current settings=========')
	MemoWrite($Data[0] & '  x' & $Data[1] & '  x' & $Data[2] & '  bit')

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

