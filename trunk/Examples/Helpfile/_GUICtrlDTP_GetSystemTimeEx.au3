#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include  <GuiConstantsEx.au3>
#include  <GuiDateTimePicker.au3>

Opt(" MustDeclareVars ", 1)

$Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $iMemo, $tDate

_Main()

Func _Main()
	Local $hDTP

	; ��������
	GUICreate(" DateTimePick System TimeEx ", 400, 300)
	$hDTP = GUICtrlGetHandle( GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ������ʾ��ʽ
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd , yyyy hh:mm ttt ")

	; ����ϵͳʱ��
	$tDate = DllStructCreate($tagDTPTIME)
	DllStructSetData($tDate, "Year ", @YEAR)
	DllStructSetData($tDate, "Month ", 8)
	DllStructSetData($tDate, "Day ", 19)
	DllStructSetData($tDate, "Hour ", 21)
	DllStructSetData($tDate, "Minute ", 57)
	DllStructSetData($tDate, "Second ", 34)
	_GUICtrlDTP_SetSystemTimeEx($hDTP, $tDate)

	; ��ʾϵͳʱ��
	$tData = _GUICtrlDTP_GetSystemTimeEx($hDTP)
	MemoWrite(" Current date:" & GetDateStr())
	MemoWrite(" Current time:" & GetTimeStr())

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

; �������ڲ���
Func GetDateStr()
	Return StringFormat(" %02d/%02d/%04d ", DllStructGetData($tDate, "Month "), DllStructGetData($tDate, "Day "), DllStructGetData($tDate, "Year "))
endfunc   ;==>GetDateStr

; ����ʱ�䲿��
Func GetTimeStr()
	Return StringFormat(" %02d/%02d/%04d ", DllStructGetData($tDate, "Hour "), DllStructGetData($tDate, "Minute "), DllStructGetData($tDate, "Second "))
endfunc   ;==>GetTimeStr

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

