#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hStatus

_Main()

Func _Main()

	Local $hGUI
	Local $aParts[3] = [75, 150, -1]

	; ���� GUI
	$hGUI = GUICreate("StatusBar Resize", 400, 300, -1, -1, $WS_SIZEBOX)

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	GUISetState()

	GUIRegisterMsg($WM_SIZE, "WM_SIZE")

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; �� GUI ��С�ı�ʱ����״̬����С
Func WM_SIZE($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam, $ilParam
	_GUICtrlStatusBar_Resize($hStatus)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE
