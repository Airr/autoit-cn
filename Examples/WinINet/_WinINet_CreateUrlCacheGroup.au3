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

	; �������⻺����
	Global $iCacheGroupID = _WinINet_CreateUrlCacheGroup()

	; ���û���������
	Global $avCacheGroupInfo[6] = [0, "Dummy Group "]
	Global $tCacheGroupInfo = _WinINet_Struct_InternetCacheGroupInfo_FromArray($avCacheGroupInfo)
	_WinINet_SetUrlCacheGroupAttribute($iCacheGroupID, $CACHEGROUP_ATTRIBUTE_GROUPNAME, DllStructGetPtr($tCacheGroupInfo))

	; ��ȡ����������
	$avCacheGroupInfo = _WinINet_GetUrlCacheGroupAttribute($iCacheGroupID, $CACHEGROUP_ATTRIBUTE_GET_ALL)

	; �����������Ϣ
	For $i = 0 To UBound($avCacheGroupInfo) - 1
		MemoWrite( StringFormat(" --> [%d]: %s ", $i, $avCacheGroupInfo[$i]))
	Next

	; ɾ��������
	_WinINet_DeleteUrlCacheGroup($iCacheGroupID, $CACHEGROUP_FLAG_FLUSHURL_ONDELETE)

	; �رվ��
	_WinINet_Shutdown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

