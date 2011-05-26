#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	Local $filemenu, $fileitem, $helpmenu
	Local $infoitem, $exititem, $recentfilesmenu, $viewmenu
	Local $viewstatusitem, $cancelbutton, $statuslabel, $msg, $file

	GUICreate("�ҵ�ͼ�β˵�", 300, 200)

	Global $defaultstatus = "Ready"

	$filemenu = GUICtrlCreateMenu("�ļ�(&F)")
	$fileitem = GUICtrlCreateMenuItem("��", $filemenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON);����ָ���ؼ�Ϊ���ڵ�Ĭ�ϰ�ť
	$helpmenu = GUICtrlCreateMenu("?"); ����һ���˵��ؼ�
	GUICtrlCreateMenuItem("����", $filemenu)
	GUICtrlSetState(-1, $GUI_DISABLE);����ָ���ؼ�Ϊ��ɫ״̬
	$infoitem = GUICtrlCreateMenuItem("��Ϣ", $helpmenu)
	$exititem = GUICtrlCreateMenuItem("�˳�", $filemenu)
	$recentfilesmenu = GUICtrlCreateMenu("��ʷ�ļ�", $filemenu, 1)

	GUICtrlCreateMenuItem("", $filemenu, 2) 	; �����ָ���

	$viewmenu = GUICtrlCreateMenu("�鿴", -1, 1); ����һ���˵��ؼ�
	$viewstatusitem = GUICtrlCreateMenuItem("״̬��", $viewmenu)
	GUICtrlSetState(-1, $GUI_CHECKED);����ָ���ؼ�Ϊѡ��״̬
	GUICtrlCreateButton("ȷ��", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	$cancelbutton = GUICtrlCreateButton("ȡ��", 180, 130, 70, 20)

	$statuslabel = GUICtrlCreateLabel($defaultstatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState()
	While 1
		$msg = GUIGetMsg()

		If $msg = $fileitem Then
			$file = FileOpenDialog("ѡ���ļ�...", @TempDir, "All (*.*)")
			If @error <> 1 Then GUICtrlCreateMenuItem($file, $recentfilesmenu)
		EndIf
		If $msg = $viewstatusitem Then
			If BitAND(GUICtrlRead($viewstatusitem), $GUI_CHECKED) = $GUI_CHECKED Then
				GUICtrlSetState($viewstatusitem, $GUI_UNCHECKED)
				GUICtrlSetState($statuslabel, $GUI_HIDE)
			Else
				GUICtrlSetState($viewstatusitem, $GUI_CHECKED)
				GUICtrlSetState($statuslabel, $GUI_SHOW)
			EndIf
		EndIf
		If $msg = $GUI_EVENT_CLOSE Or $msg = $cancelbutton Or $msg = $exititem Then ExitLoop
		If $msg = $infoitem Then MsgBox(0, "��Ϣ", "��������...")
	WEnd
	GUIDelete()
EndFunc   ;==>Example