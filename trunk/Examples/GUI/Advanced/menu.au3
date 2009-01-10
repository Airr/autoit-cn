#include <GUIConstantsEx.au3>


_Main()

Func _Main()
	Local $filemenu, $fileitem, $recentfilesmenu, $separator1
	Local $exititem, $helpmenu, $aboutitem, $okbutton, $cancelbutton
	Local $msg, $file
	#forceref $separator1

GUICreate("GUI �˵�",300,200)

$filemenu = GuiCtrlCreateMenu ("�ļ�(&F)")
$fileitem = GuiCtrlCreateMenuitem ("��(&O)...",$filemenu)
$recentfilesmenu = GuiCtrlCreateMenu ("��ʷ�ļ�(&R)",$filemenu)
	$separator1 = GUICtrlCreateMenuItem("", $filemenu)
$exititem = GuiCtrlCreateMenuitem ("�˳�(&X)",$filemenu)
$helpmenu = GuiCtrlCreateMenu ("����(&H)")
$aboutitem = GuiCtrlCreateMenuitem ("����(&A)",$helpmenu)

$okbutton = GuiCtrlCreateButton ("ȷ��",50,130,70,20)

$cancelbutton = GuiCtrlCreateButton ("ȡ��",180,130,70,20)

	GUISetState()

	While 1
		$msg = GUIGetMsg()


		Select
			Case $msg = $GUI_EVENT_CLOSE Or $msg = $cancelbutton
				ExitLoop

			Case $msg = $fileitem
			$file = FileOpenDialog("ѡ���ļ�...",@TempDir,"�����ļ�(*.*)")
				If @error <> 1 Then GUICtrlCreateMenuItem($file, $recentfilesmenu)

			Case $msg = $exititem
				ExitLoop

			Case $msg = $okbutton
			MsgBox(0, "����","��������[ȷ��]��ť!")

			Case $msg = $aboutitem
			Msgbox(0,"����","GUI �˵�����")
		EndSelect
	WEnd

	GUIDelete()

	Exit
EndFunc   ;==>_Main
