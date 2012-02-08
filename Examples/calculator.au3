;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Plays with the calculator.
;


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
Local $iAnswer = MsgBox(4, "AutoIt ����", "����ű����м����������� 2 x 4 x 8 x 16 ���˳�.  ����")


; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
    MsgBox(0, "AutoIt", "�õ�,�ټ�!")
	Exit
EndIf


; Run the calculator
Run("calc.exe")


; Wait for the calculator to become active. The classname "CalcFrame" is monitored instead of the window title
WinWaitActive("[CLASS:CalcFrame]")


; Now that the calculator window is active type the values 2 x 4 x 8 x 16
; Use AutoItSetOption to slow down the typing speed so we can see it
AutoItSetOption("SendKeyDelay", 400)
Send("2*4*8*16=")
Sleep(2000)


; Now quit by sending a "close" request to the calculator window using the classname
WinClose("������")


; Now wait for the calculator to close before continuing
WinWaitClose("������")


; Finished!
