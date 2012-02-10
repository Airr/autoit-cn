#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <WinINet.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" _WinINet_UrlCache ", 600, 400)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ��ʼ��WinINet
	_WinINet_Startup()

	; ����������⻺����
	Global $iGroupIDCount = 10
	Global $aiCacheGroupIDs[$iGroupIDCount]
	For $i = 0 To $iGroupIDCount - 1
		$aiCacheGroupIDs[$i] = _WinINet_CreateUrlCacheGroup()
	Next

	; ö�ٻ�����
	Global $avCacheGroup = _WinINet_FindFirstUrlCacheGroup()
	While Not @error
		MemoWrite($avCacheGroup[1])
		$avCacheGroup[1] = _WinINet_FindNextUrlCacheGroup($avCacheGroup[0])
	Wend

	; ɾ��������
	For $i = 0 To $iGroupIDCount - 1
		_WinINet_DeleteUrlCacheGroup($aiCacheGroupIDs[$i], $CACHEGROUP_FLAG_FLUSHURL_ONDELETE)
	Next

	; ���
	_WinINet_Shutdown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

