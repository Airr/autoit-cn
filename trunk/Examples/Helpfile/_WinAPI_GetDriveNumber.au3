#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo, $List[10]
Global $tSTORAGEDEVICENUMBER

_Main()

Func _Main()
	Local $hGUI, $Drive

	; ��������
	$hGUI = GUICreate(" Drive Num ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ��ȡӲ����Ϣ
	$Drive = DriveGetDrive(" FIXED ")

	; ��ȡӲ��������Ϣ
	For $i = 0 To UBound($Drive) - 1
		$List[$i] = ''
	Next
	If IsArray($Drive) Then
		For $i = 1 To $Drive[0]
			$tSTORAGEDEVICENUMBER = _WinAPI_GetDriveNumber($Drive[$i])
			If Not @error Then
				$List[DllStructGetData($tSTORAGEDEVICENUMBER, 'DeviceNumber')] &= StringUpper($Drive[$i]) & ''
			EndIf
		Next
	EndIf
	For $i = 0 To UBound($Drive) - 1
		If $List[$i] > '' Then
			MemoWrite('Drive' & $i & '  ==>' & $List[$i])
		EndIf
	Next
	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

