#include  <GuiConstantsEx.au3>
#include  <WinApiEx.au3>
#include  <WindowsConstants.au3>

Global $iMemo
Global Const $sPath1 = ' C:\\Test\\ '
Global Const $sPath2 = ' C:/Test/Test.txt '
Global Const $sPath3 = ' Notepad.exe '

_Main()

Func _Main()
	Local $hGUI, $aDisk

	; ��������
	$hGUI = GUICreate("Qualified Path", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ��ʽ����·��
	MemoWrite($sPath1 & ' =>' & _WinAPI_PathSearchAndQualify($sPath1) & @CR)
	MemoWrite($sPath2 & ' =>' & _WinAPI_PathSearchAndQualify($sPath2) & @CR)
	MemoWrite($sPath3 & ' =>' & _WinAPI_PathSearchAndQualify($sPath3) & @CR)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

