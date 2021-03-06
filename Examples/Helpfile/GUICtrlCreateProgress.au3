#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>

Example()

Func Example()
	Local $progressbar1, $progressbar2, $button, $wait, $s, $msg, $m

	GUICreate("我的 GUI 进度条", 220, 100, 100, 200)
	$progressbar1 = GUICtrlCreateProgress(10, 10, 200, 20)
	GUICtrlSetColor(-1, 32250); 在 Windows XP 样式下不工作
	$progressbar2 = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
	$button = GUICtrlCreateButton("开始", 75, 70, 70, 20)
	GUISetState()

	$wait = 20; wait 20ms for next progressstep
	$s = 0; progressbar-saveposition
	Do
		$msg = GUIGetMsg()
		If $msg = $button Then
			GUICtrlSetData($button, "停止")
			For $i = $s To 100
				If GUICtrlRead($progressbar1) = 50 Then MsgBox(4096, "信息", "一半已经完成...", 1)
				$m = GUIGetMsg()

				If $m = -3 Then ExitLoop

				If $m = $button Then
					GUICtrlSetData($button, "继续")
					$s = $i;保存当前坐标到 $s
					ExitLoop
				Else
					$s = 0
					GUICtrlSetData($progressbar1, $i)
					GUICtrlSetData($progressbar2, (100 - $i))
					Sleep($wait)
				EndIf
			Next
			If $i > 100 Then
				;		$s=0
				GUICtrlSetData($button, "开始")
			EndIf
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example