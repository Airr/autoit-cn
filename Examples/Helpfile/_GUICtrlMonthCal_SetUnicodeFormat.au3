
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiMonthCal.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_MC = False ; ��鴫�ݸ�MonthCal����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $hMonthCal

	; ��������
	GUICreate( "Month Calendar
	Get / Set Unicode Format" ,  400 ,  300 )
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	GUISetState()

	;
	��ȡ / ����Unicode����
	_GUICtrlMonthCal_SetUnicodeFormat($hMonthCal, False)

	MemoWrite("Unicode:" & _GUICtrlMonthCal_GetUnicodeFormat($hMonthCal))

	_GUICtrlMonthCal_SetUnicodeFormat($hMonthCal, True)
	MemoWrite("Unicode:" & _GUICtrlMonthCal_GetUnicodeFormat($hMonthCal))


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

