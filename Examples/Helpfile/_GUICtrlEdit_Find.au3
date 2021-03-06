#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_Ed = False ; 检查传递给 Edit 函数的类名, 设置为真并使用另一控件的句柄可以看出它是否有效

Example_Internal()
Example_External()

Func Example_Internal()
	Local $s_texttest = "this is a test" & @CRLF & _
			"this is only a test" & @CRLF & _
			"this testing should work for you as well as it does for me"
	Local $Button1, $Button2, $msg, $hEdit

	GUICreate('Find And Replace Example with AutoIt ' & FileGetVersion(@AutoItExe), 622, 448, 192, 125)
	$hEdit = GUICtrlCreateEdit($s_texttest, 64, 24, 505, 233, _
			BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $WS_HSCROLL, $ES_NOHIDESEL))
	$Button1 = GUICtrlCreateButton("Find", 176, 288, 121, 33, 0)
	$Button2 = GUICtrlCreateButton("Find And Replace", 368, 288, 121, 33, 0)
	GUISetState()

	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $Button1
				_GUICtrlEdit_Find($hEdit)
			Case $msg = $Button2
				_GUICtrlEdit_Find($hEdit, True)
			Case Else
				;;;;;;;
		EndSelect
	WEnd
	GUIDelete()
EndFunc   ;==>Example_Internal

Func Example_External()
	Local $s_texttest = 'Find And Replace Example with AutoIt ' & FileGetVersion(@AutoItExe) & @LF & _
			"this is a test" & @LF & _
			"this is only a test" & @LF & _
			"this testing should work for you as well as it does for me"
	Local $whandle, $handle
	Local $Title = "[CLASS:Notepad]"

	Run("notepad.exe", "", @SW_MAXIMIZE)
	;等待 "无标题" 窗口出现
	WinWait($Title)

	; 获取记事本窗口句柄
	$whandle = WinGetHandle($Title)
	If @error Then
		MsgBox(4096, "错误", "Could not find the correct window")
	Else
		$handle = ControlGetHandle($whandle, "", "Edit1")
		If @error Then
			MsgBox(4096, "错误", "Could not find the correct control")
		Else
			; 直接发送一些文本到此窗口的编辑控件
			ControlSend($whandle, "", "Edit1", $s_texttest)
			_GUICtrlEdit_Find($handle, True)
		EndIf
	EndIf
EndFunc   ;==>Example_External
