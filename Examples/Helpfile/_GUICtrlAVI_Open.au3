#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; ��鴫�ݸ� AVI ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

Global $hAVI

_Main()

Func _Main()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; ���� GUI
	$hGUI = GUICreate("(External) AVI Open", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; ���� AutoIt AVI ʵ��
	_GUICtrlAVI_Open($hAVI, $sFile)

	; ���� AutoIt AVI ʵ��
	_GUICtrlAVI_Play($hAVI)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر� AVI ����
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Main
