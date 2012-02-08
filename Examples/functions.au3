;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Demo of using functions
;


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
Local $iAnswer = MsgBox(4, "AutoIt ����", "����ű�������������Զ��庯��.  ����?")


; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox(0, "AutoIt", "�õ�,�ټ�!")
	Exit
EndIf


; Run TestFunc1
TestFunc1()

; Run TestFunc2
TestFunc2(20)

; Finished!
MsgBox(0, "AutoIt ����", "���!")
Exit


; TestFunc1
Func TestFunc1()
	MsgBox(0, "AutoIt ����", "�ڲ� TestFunc1()")
EndFunc   ;==>TestFunc1


; TestFunc2
Func TestFunc2($vVar)
	MsgBox(0, "AutoIt ����", "�ڲ� TestFunc2() - $vVar Ϊ: " & $vVar)
EndFunc   ;==>TestFunc2
