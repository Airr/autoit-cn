#include <Constants.au3>
#include <GUIConstantsEx.au3>

_Main()

Func _Main()
	Local $idFileMenu, $idFileItem, $idRecentFilesMenu, $idSeparator1
	Local $idExitItem, $idHelpMenu, $idAboutItem, $idOkButton, $idCancelButton
	Local $iMsg, $sFile
	#forceref $idSeparator1

	GUICreate("GUI �˵�",300,200)

	$idFileMenu = GUICtrlCreateMenu("�ļ�(&F)")
	$idFileItem = GUICtrlCreateMenuItem("��(&O)...", $idFileMenu)
	$idRecentFilesMenu = GUICtrlCreateMenu("��ʷ�ļ�(&R)", $idFileMenu)
	$idSeparator1 = GUICtrlCreateMenuItem("", $idFileMenu)
	$idExitItem = GUICtrlCreateMenuItem("�˳�(&X)", $idFileMenu)
	$idHelpMenu = GUICtrlCreateMenu("����(&H)")
	$idAboutItem = GUICtrlCreateMenuItem("����(&A)", $idHelpMenu)

	$idOkButton = GUICtrlCreateButton("ȷ��", 50, 130, 70, 20)

	$idCancelButton = GUICtrlCreateButton("ȡ��", 180, 130, 70, 20)

	GUISetState()

	While 1
		$iMsg = GUIGetMsg()

		Select
			Case $iMsg = $GUI_EVENT_CLOSE Or $iMsg = $idCancelButton
				ExitLoop

			Case $iMsg = $idFileItem
			$sFile = FileOpenDialog("ѡ���ļ�...",@TempDir,"�����ļ�(*.*)")
				If @error <> 1 Then GUICtrlCreateMenuItem($sFile, $idRecentFilesMenu)

			Case $iMsg = $idExitItem
				ExitLoop

			Case $iMsg = $idOkButton
			MsgBox($MB_SYSTEMMODAL, "����","��������[ȷ��]��ť!")

			Case $iMsg = $idAboutItem
			MsgBox($MB_SYSTEMMODAL,"����","GUI �˵�����")
		EndSelect
	WEnd

	GUIDelete()

	Exit
EndFunc   ;==>_Main
