#include  <GuiConstantsEx.au3>
#include  <WinApiEx.au3>
#include  <WindowsConstants.au3>

Global $iMemo, $Text
Global $Drive = DriveGetDrive('ALL')

_Main()

Func _Main()
	Local $hGUI, $aDisk

	; ��������
	$hGUI = GUICreate(" Disk Writable? ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	If IsArray($Drive) Then
		For $i = 1 To $Drive[0]
			If _WinAPI_IsWritable($Drive[$i]) Then
				$Text = ' Writable '
			Else
				$Text = ' Not writable '
			EndIf
			If Not @error Then
				MemoWrite( StringUpper($Drive[$i]) & '  =>' & $Text)
			EndIf
		Next
	EndIf

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

