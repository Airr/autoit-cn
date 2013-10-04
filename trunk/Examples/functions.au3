#include <Constants.au3>

;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at autoitscript dot com)
;
; Script Function:
;   Demo of using functions
;

; Prompt the user to run the script - use a Yes/No prompt with the flag parameter set at 4 (see the help file for more details)
Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "AutoIt ����", "����ű�������������Զ��庯��.  ����?")

; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox($MB_SYSTEMMODAL, "AutoIt", "�õ�,�ټ�!")
	Exit
EndIf

; Run TestFunc1
TestFunc1()

; Run TestFunc2
TestFunc2(20)

; Finished!
MsgBox($MB_SYSTEMMODAL, "AutoIt ����", "���!")
Exit

; TestFunc1
Func TestFunc1()
	MsgBox($MB_SYSTEMMODAL, "AutoIt ����", "�ڲ� TestFunc1()")
EndFunc   ;==>TestFunc1

; TestFunc2
Func TestFunc2($vVar)
	MsgBox($MB_SYSTEMMODAL, "AutoIt ����", "�ڲ� TestFunc2() - $vVar Ϊ: " & $vVar)
EndFunc   ;==>TestFunc2
