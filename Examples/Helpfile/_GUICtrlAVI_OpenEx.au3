#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; ��鴫�ݸ� AVI ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hAVI

_Main()

Func _Main()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("(External) AVI OpenEx", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; ���� AutoIt AVI ʵ��
	_GUICtrlAVI_OpenEx($hAVI, @SystemDir & "\Shell32.dll", 150)

	; ���� AutoIt AVI ʵ��
	_GUICtrlAVI_Play($hAVI)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Main
