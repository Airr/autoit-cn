#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ��鴫�ݸ� DTP ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hGUI, $HandleBefore, $hDTP

	; ���� GUI
	$hGUI = GUICreate("(UDF Created) DateTimePick Destroy", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState()

	MsgBox(4160, "��Ϣ", "Destroying the Control for Handle: " & $hDTP)
	$HandleBefore = $hDTP
	MsgBox(4160, "��Ϣ", "Control Destroyed: " & _GUICtrlDTP_Destroy($hDTP) & @LF & _
			"Handel Before Destroy: " & $HandleBefore & @LF & _
			"Handle After Destroy: " & $hDTP)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
