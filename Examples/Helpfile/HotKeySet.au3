; ��Esc����ֹ�ű�, ��Pause/Break����ͣ

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("+!d", "ShowMessage") ;Shift-Alt-d

;;;; �����ǳ������� ;;;;
While 1
	Sleep(100)
WEnd
;;;;;;;;

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('�ű��Ѿ�"��ͣ"��',0,0)
	WEnd
	ToolTip("")
EndFunc

Func Terminate()
	Exit 0
EndFunc

Func ShowMessage()
	MsgBox(4096,"����","����һ����Ϣ.")
EndFunc
