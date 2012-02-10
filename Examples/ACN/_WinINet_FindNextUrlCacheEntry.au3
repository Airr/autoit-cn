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

	; �������л������еĵ�һ��
	Global $avCacheEntry = _WinINet_FindFirstUrlCacheEntry()

	If Not @error Then
		; �����ݴ��뷵�ص�����
		Global $hCacheEntry = $avCacheEntry[0]
		Global $avCacheEntryInfo = $avCacheEntry[1]
		$avCacheEntry = 0

		While Not @error
			; �����ǰ�ҵ��Ļ���ֵ
			MemoWrite(" ---------- ")
			For $i = 0 To UBound($avCacheGroupInfo) - 1
				MemoWrite( StringFormat(" --> [%d]: %s ", $i, $avCacheGroupInfo[$i]))
			Next
			MemoWrite(" ----------" & @CRLF)

			; ������һ������
			$avCacheEntryInfo = _WinINet_FindNextUrlCacheEntry($hCacheEntry)
		Wend
	EndIf

	; �رվ��
	_WinINet_FindCloseUrlCache($hCacheEntry)

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

