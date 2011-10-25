#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()

	Local $hGUI
	Local $Url = 'http://social.msdn.microsoft.com/search/en-us?query=UrlGetPart'

	; ��������
	$hGUI = GUICreate(" _WinAPI_UrlGetPart ", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	MemoWrite('Scheme:' & _WinAPI_UrlGetPart($Url, $URL_PART_SCHEME) & @CR)
	MemoWrite('Host:' & _WinAPI_UrlGetPart($Url, $URL_PART_HOSTNAME) & @CR)
	MemoWrite('Query:' & _WinAPI_UrlGetPart($Url, $URL_PART_QUERY) & @CR)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

