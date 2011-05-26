#include-once

;===============================================================================
;
; Description:      Returns the name of the weekday, based on the specified day.
; Parameter(s):     $iDayNum - Day number
;                   $iShort  - Format:
;                              0 = Long name of the weekday
;                              1 = Abbreviated name of the weekday
; Requirement(s):   None
; Return Value(s):  On Success - Weekday name
;                   On Failure - A NULL string and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          English only
;
;===============================================================================
Func _DateDayOfWeekC($iDayNum = @WDAY)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $aDayOfWeek[8]

	$aDayOfWeek[1] = "������"
	$aDayOfWeek[2] = "����һ"
	$aDayOfWeek[3] = "���ڶ�"
	$aDayOfWeek[4] = "������"
	$aDayOfWeek[5] = "������"
	$aDayOfWeek[6] = "������"
	$aDayOfWeek[7] = "������"
	Select
		Case Not StringIsInt($iDayNum)
			SetError(1)
			Return ""
		Case $iDayNum < 1 Or $iDayNum > 7
			SetError(1)
			Return ""
		Case Else
			Return $aDayOfWeek[$iDayNum]
	EndSelect
EndFunc   ;==>_DateDayOfWeekC


;===============================================================================
;
; Description:      Returns the name of the month, based on the specified month.
; Parameter(s):     $iMonthNum - Month number
;                   $iShort    - Format:
;                                0 = Long name of the month
;                                1 = Abbreviated name of the month
; Requirement(s):   None
; Return Value(s):  On Success - Month name
;                   On Failure - A NULL string and sets @ERROR = 1
; Author(s):        Jeremy Landes <jlandes at landeserve dot com>
; Note(s):          English only
;
;===============================================================================
Func _DateMonthOfYear($iMonthNum = @MON)
	;==============================================
	; Local Constant/Variable Declaration Section
	;==============================================
	Local $aMonthOfYear[13]

	$aMonthOfYear[1] = "һ��"
	$aMonthOfYear[2] = "����"
	$aMonthOfYear[3] = "����"
	$aMonthOfYear[4] = "����"
	$aMonthOfYear[5] = "����"
	$aMonthOfYear[6] = "����"
	$aMonthOfYear[7] = "����"
	$aMonthOfYear[8] = "����"
	$aMonthOfYear[9] = "����"
	$aMonthOfYear[10] = "ʮ��"
	$aMonthOfYear[11] = "ʮһ��"
	$aMonthOfYear[12] = "ʮ����"

	Select
		Case Not StringIsInt($iMonthNum)
			SetError(1)
			Return ""
		Case $iMonthNum < 1 Or $iMonthNum > 12
			SetError(1)
			Return ""
		Case Else
			Return $aMonthOfYear[$iMonthNum]
	EndSelect
EndFunc   ;==>_DateMonthOfYear
