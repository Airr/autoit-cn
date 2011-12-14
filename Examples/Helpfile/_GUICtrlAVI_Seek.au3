#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; ��鴫�ݸ� AVI ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hAVI

_Example_Internal()
_Example_External()

Func _Example_Internal()
	; ���� GUI
	GUICreate("(Internal) AVI Seek", 300, 100)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	GUISetState()

	; ѭ��ֱ���û��˳�
	Do
		Sleep(100)
		; ���ҵ� AVI �����е�һ�����֡
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Example_Internal

Func _Example_External()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("(External) AVI Seek", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 160, 10, 10)
	GUISetState()

	; ѭ��ֱ���û��˳�
	Do
		Sleep(100)
		; ���ҵ� AVI �����е�һ�����֡
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Example_External
