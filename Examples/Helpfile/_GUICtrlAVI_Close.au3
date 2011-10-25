#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Opt('MustDeclareVars ', 1)

$Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $hAVI

_Main()

Func _Main()
	Local $hGUI, $sFile = RegRead(" HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt ", "InstallDir ") & " \Examples\GUI\SampleAVI.avi "

	; ��������
	$hGUI = GUICreate("(External) AVI Close", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, $sFile, -1, 10, 10)
	GUISetState()

	; ����ʾ��AutoItӰƬ
	_GUICtrlAVI_Play($hAVI)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �ر�ӰƬ����
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
endfunc   ;==>_Main

