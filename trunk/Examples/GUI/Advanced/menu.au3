#include <GUIConstantsEx.au3>
#include <Constants.au3>

_Main()

Func _Main()
	Local $filemenu, $fileitem, $recentfilesmenu, $separator1
	Local $exititem, $helpmenu, $aboutitem, $okbutton, $cancelbutton
	Local $msg, $file
	#forceref $separator1

GUICreate("GUI �˵�",300,200)

$filemenu = GUICtrlCreateMenu ("�ļ�(&F)")
$fileitem = GUICtrlCreateMenuItem ("��(&O)...",$filemenu)
$recentfilesmenu = GUICtrlCreateMenu ("��ʷ�ļ�(&R)",$filemenu)
	$separator1 = GUICtrlCreateMenuItem("", $filemenu)
$exititem = GUICtrlCreateMenuItem ("�˳�(&X)",$filemenu)
$helpmenu = GUICtrlCreateMenu ("����(&H)")
$aboutitem = GUICtrlCreateMenuItem ("����(&A)",$helpmenu)

$okbutton = GUICtrlCreateButton ("ȷ��",50,130,70,20)

$cancelbutton = GUICtrlCreateButton ("ȡ��",180,130,70,20)

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
			MsgBox($MB_SYSTEMMODAL, "����","��������[ȷ��]��ť!")

			Case $msg = $aboutitem
			MsgBox($MB_SYSTEMMODAL,"����","GUI �˵�����")
		EndSelect
	WEnd

	GUIDelete()

	Exit
EndFunc   ;==>_Main
