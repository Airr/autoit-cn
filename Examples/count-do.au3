;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at hiddensoft com)
;
; Script Function:
;   Counts to 5 using a "do" loop


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
Local $iAnswer = MsgBox(4, "AutoIt ����", "����ű���������5�� 'Do' ѭ��.  ����?")


; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox(0, "AutoIt ����", "�õ�,�ټ�!")
	Exit
EndIf


; Set the counter to 1
Local $iCount = 1

; Execute the loop "until" the counter is greater than 5
Do
	; Print the count value
	MsgBox(0, "AutoIt ����", "������Ϊ: " & $iCount)

	; Increase the count by one
	$iCount = $iCount + 1 ; Alternatively $iCount += 1 can be used to increase the value of $iCount by one

Until $iCount > 5


; Finished!
MsgBox(0, "AutoIt ����", "���!")