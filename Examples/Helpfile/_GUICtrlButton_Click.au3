#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIConstantsEx.au3>
#include <GuiButton.au3>

Opt(" MustDeclareVars ", 1)

Global $btn[6], $iMemo, $iRand

HotKeySet(" !b ", "Clickit ")

_Main()

Func _Main()
	Local $y = 70

	GUICreate(" Buttons ", 510, 400)
	$iMemo = GUICtrlCreateEdit(" ", 119, 10, 376, 374, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")

	MemoWrite(" Press Alt+b to Click Button ")

	$btn[0] = GUICtrlCreateButton(" Button1 ", 10, 10, 100, 50)

	For $x = 1 To 5
		$btn[$x] = GUICtrlCreateButton(" Button" & $x + 1, 10, $y, 100, 50)
		$y += 60
	Next

	$iRand = Random(0, 5, 1)
	_GUICtrlButton_SetText($btn[$iRand], "New Text" & $iRand + 1)

	GUISetState()

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn[$iRand]
				MemoWrite( _GUICtrlButton_GetText($btn[$iRand]) & " Clicked ")
		EndSwitch
	WEnd

	Exit
endfunc   ;==>_Main

Func Clickit()
	$iRand = Random(0, 5, 1)
	_GUICtrlButton_Click($btn[$iRand])
endfunc   ;==>Clickit

; 向memo控件写入一行
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

