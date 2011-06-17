#include <Date.au3>
#include <WinAPI.au3>

; ����ϵͳ��ȫ��,�� Vista �� Windows API "SetSystemTimeAdjustment" ���ܱ��ܾ�

_Main()

Func _Main()
	Local $aInfo

	; ��ʱ���������ǿ��Թ۲쵽��Ȥ������
	Run("RunDll32.exe shell32.dll,Control_RunDLL timedate.cpl")
	WinWaitActive("[CLASS:#32770]")

	; ��ȡ��ǰʱ���������
	$aInfo = _Date_Time_GetSystemTimeAdjustment()

	; ����ʱ��
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1] / 10, False) Then
		MsgBox(4096, "Error", "System clock cannot be DOWN" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	MsgBox(4096, "Information", "Slowing down system clock", 2)

	Sleep(5000)

	; �ӿ�ʱ��
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1] * 10, False) Then
		MsgBox(4096, "Error", "System clock cannot be UP" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
	EndIf
	MsgBox(4096, "Information", "Speeding up system clock", 2)

	Sleep(5000)

	; ����ʱ���������
	If Not _Date_Time_SetSystemTimeAdjustment($aInfo[1], True) Then
		MsgBox(4096, "Error", "System clock cannot be RESET" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
	Else
		MsgBox(4096, "Information", "System clock restored")
	EndIf

EndFunc   ;==>_Main
