#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiSlider.au3>

$Debug_S = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hSlider, $aTics

	; ���� GUI
	GUICreate("Slider Get Logical Tic Positions", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 300, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	$aTics = _GUICtrlSlider_GetLogicalTics($hSlider)
	MemoWrite("Number Tics Excluding 1st and last .....: " & UBound($aTics))
	For $x = 0 To UBound($aTics) - 1
		MemoWrite(StringFormat("(%02d) Logical Tick Position .............: %d", $x, $aTics[$x]))
	Next

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
