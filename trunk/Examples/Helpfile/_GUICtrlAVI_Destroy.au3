#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $hAVI

_Main()

Func _Main()
	Local $hGUI, $sFile = RegRead(" HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt", "InstallDir") & " \ʾ��s\GUI\SampleAVI.avi"

	; ��������
	$hGUI = GUICreate(" (External) AVI Destroy ", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_Open($hAVI, $sFile)

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_Play($hAVI)

	Sleep(3000)

	; �����ֹͣӰƬ����
	_GUICtrlAVI_Stop($hAVI)

	; �ر�ӰƬ����
	_GUICtrlAVI_Close($hAVI)

	MsgBox(4160, "Information ", "Destroy AVI Control ")
	_GUICtrlAVI_Destroy($hAVI)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
endfunc   ;==>_Main

