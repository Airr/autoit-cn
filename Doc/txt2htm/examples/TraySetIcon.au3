#NoTrayIcon

Opt("TrayMenuMode",1)	; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ. 

Local $exititem = TrayCreateItem("�˳�")

TraySetState()

Local $start = 0
While 1
	Local $msg = TrayGetMsg()
	If $msg = $exititem Then ExitLoop
	Local $diff = TimerDiff($start)
	If $diff > 1000 Then
		Local $num = -Random(0,100,1)	; ���������
		ToolTip("#icon=" & $num)
		TraySetIcon("Shell32.dll", $num)
		$start = TimerInit()
	EndIf
WEnd

Exit
