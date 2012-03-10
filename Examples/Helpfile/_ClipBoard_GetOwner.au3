#include <GUIConstantsEx.au3>
#include <Clipboard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; �򿪼�����
	If _ClipBoard_Open($hGUI) Then

		ShowData($hGUI)

		; �رռ�����
		_ClipBoard_Close()
	Else
		_WinAPI_ShowError("_ClipBoard_Open ʧ��")
	EndIf

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; ��ʾ������ͳ����Ϣ
Func ShowData($hGUI)
	MemoWrite("GUI handle ............: " & $hGUI)
	MemoWrite("Clipboard owner .......: " & _ClipBoard_GetOwner())
	MemoWrite("Clipboard open window .: " & _ClipBoard_GetOpenWindow())
	MemoWrite("Clipboard sequence ....: " & _ClipBoard_GetSequenceNumber())
	MemoWrite()
EndFunc   ;==>ShowData

; д����Ϣ�� memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
