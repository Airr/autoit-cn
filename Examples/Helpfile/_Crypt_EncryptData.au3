#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <Crypt.au3>
#include <WinAPI.au3>

; ʵʱ RC4 ����ʾ��

GUICreate("Realtime Encrypting", 400, 300, -1)
Global $hInputEdit = GUICtrlCreateEdit("", 0, 0, 400, 150, $ES_WANTRETURN)
Global $hOutputEdit = GUICtrlCreateEdit("", 0, 150, 400, 150, $ES_READONLY)
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
GUISetState(@SW_SHOW)

; Ϊ�˸����������ǳ�ʼ���Ⲣ�����ܳ�
_Crypt_Startup()
Local $hKey = _Crypt_DeriveKey("SomePassword", $CALG_RC4)

Do
	Local $msg = GUIGetMsg()
Until $msg = $GUI_EVENT_close

_Crypt_DestroyKey($hKey)
_Crypt_Shutdown()

Func WM_COMMAND($hWinHandle, $iMsg, $wParam, $lParam)
	#forceref $hWinHandle, $iMsg, $lParam
	; ������༭�������ݱ仯ʱ
	If _WinAPI_HiWord($wParam) = $EN_CHANGE And _WinAPI_LoWord($wParam) = $hInputEdit Then
		Local $bEncrypted = _Crypt_EncryptData(GUICtrlRead($hInputEdit), $hKey, $CALG_USERKEY)
		GUICtrlSetData($hOutputEdit, $bEncrypted)
	EndIf
EndFunc   ;==>WM_COMMAND
