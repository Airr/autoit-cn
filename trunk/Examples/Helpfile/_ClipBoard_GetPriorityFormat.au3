#include  <GuiConstantsEx.au3>
#include  <ClipBoard.au3>
#include  <WinAPI.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars ', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $aFormats[3] = [2, $CF_TEXT, $CF_OEMTEXT]

	; ��������
	$hGUI = GUICreate(" " Clipboard ", 600 , 400 )
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; �鿴���������Ƿ����ı�
	MemoWrite(" Priority formats .:." & _ClipBoard_GetPriorityFormat($aFormats))
	MemoWrite(" Unicode available .:" & _ClipBoard_IsFormatAvailable($CF_UNICODETEXT))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite
