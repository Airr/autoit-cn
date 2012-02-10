#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <WinINet.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" _WinINet_CommitUrlCacheEntry ", 600, 400)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ��ʼ��WinINet
	_WinINet_Startup()

	; �������⻺����
	Global $sSourceUrlName = " http://www.autoitscript.com/ "
	Global $sLocalFileName = _WinINet_CreateUrlCacheEntry($sSourceUrlName)

	; �����⻺�����ύ������
	_WinINet_CommitUrlCacheEntry($sSourceUrlName, $sLocalFileName)

	; ��ȡ��������Ϣ
	Global $avCacheEntryInfo = _WinINet_GetUrlCacheEntryInfo($sSourceUrlName)

	; ��ӡ��������Ϣ
	For $i = 0 To UBound($avCacheEntryInfo) - 1
		MemoWrite('-->[' & $i & ' ]:' & $avCacheEntryInfo[$i])
	Next

	; ɾ��������
	_WinINet_DeleteUrlCacheEntry($sSourceUrlName)

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

