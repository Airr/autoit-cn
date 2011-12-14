#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; ��鴫�ݸ� MonthCal ����������, ����Ϊ�沢ʹ����һ�ؼ��ľ�����Կ������Ƿ���Ч

_Main()

Func _Main()
	Local $hMonthCal

	; ���� GUI
	GUICreate("Month Calendar Set Day State", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_DAYSTATE), 0x00000000)

	; ��ȡ���Ǳ������ε��·���.  ����ʱ�����ֽ�Ϊ 3.
	Local $aMasks[_GUICtrlMonthCal_GetMonthRangeSpan($hMonthCal, True)]

	; �õ�ǰ�·ݵĵ�һ, �ڰ˺͵�ʮ������ʾΪ����. ����Ķ���������Ϊ 1000 0000 1000 0001 ��
	; ʮ��������Ϊ 0x8081.
	$aMasks[1] = 0x8081
	_GUICtrlMonthCal_SetDayState($hMonthCal, $aMasks)

	GUISetState()

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
