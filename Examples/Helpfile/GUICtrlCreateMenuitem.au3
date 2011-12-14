#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

_Main()

Func _Main()
	Local $iCancel, $iExit, $iFileItem, $iFileMenu, $iHelpMenu, $iInfoItem
	Local $iRecentFilesMenu, $iStatusLabel, $iViewMenu, $iViewStatusItem, $sFilePath, $sStatus = "Ready"

	GUICreate("�ҵ�ͼ�β˵�", 300, 200)

	$sStatus = "Ready"

	$iFileMenu = GUICtrlCreateMenu("�ļ�(&F)")
	$iFileItem = GUICtrlCreateMenuItem("��", $iFileMenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON);����ָ���ؼ�Ϊ���ڵ�Ĭ�ϰ�ť
	$iHelpMenu = GUICtrlCreateMenu("?"); ����һ���˵��ؼ�
	GUICtrlCreateMenuItem("����", $iFileMenu)
	GUICtrlSetState(-1, $GUI_DISABLE);����ָ���ؼ�Ϊ��ɫ״̬
	$iInfoItem = GUICtrlCreateMenuItem("��Ϣ", $iHelpMenu)
	$iExit = GUICtrlCreateMenuItem("�˳�", $iFileMenu)
	$iRecentFilesMenu = GUICtrlCreateMenu("��ʷ�ļ�", $iFileMenu, 1)

	GUICtrlCreateMenuItem("", $iFileMenu, 2) 	; �����ָ���

	$iViewMenu = GUICtrlCreateMenu("�鿴", -1, 1); ����һ���˵��ؼ�
	$iViewStatusItem = GUICtrlCreateMenuItem("״̬��", $iViewMenu)
	GUICtrlSetState(-1, $GUI_CHECKED);����ָ���ؼ�Ϊѡ��״̬
	GUICtrlCreateButton("ȷ��", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	$iCancel = GUICtrlCreateButton("ȡ��", 180, 130, 70, 20)

	$iStatusLabel = GUICtrlCreateLabel($sStatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iCancel, $iExit
				Exit

			Case $iInfoItem
				MsgBox(64, "Info", "Only a test...")

			Case $iFileItem
				$sFilePath = FileOpenDialog("ѡ��һ���ļ�...", @TempDir, "All (*.*)")
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlCreateMenuItem($sFilePath, $iRecentFilesMenu)

			Case $iViewStatusItem
				If BitAND(GUICtrlRead($iViewStatusItem), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($iViewStatusItem, $GUI_UNCHECKED)
					GUICtrlSetState($iStatusLabel, $GUI_HIDE)
				Else
					GUICtrlSetState($iViewStatusItem, $GUI_CHECKED)
					GUICtrlSetState($iStatusLabel, $GUI_SHOW)
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>_Main
