;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Demonstrates the InputBox, looping and the use of @error.
;


; Prompt the user to run the script - use a Yes/No prompt (4 - see help file)
Local $iAnswer = MsgBox(4, "AutoIt ���� (Ӣ��+��ϵͳ������)", "����ű���һ�������,��Ҫ��������һЩ�ı�.  ����?")


; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox(4096, "AutoIt", "�õ�,�ټ�!")
	Exit
EndIf

; Loop around until the user gives a valid "thesnow" answer. This is not case-sensitive, therefore AutoIt and AuToIT are acceptable values as well
Local $iLoop = 1, $sText = ""
While $iLoop = 1
	$sText = InputBox("AutoIt ����", "������:""thesnow"" ������ȷ��")
	If @error = 1 Then
		MsgBox(4096, "����", "�������� 'ȡ��' - ������!")
	Else
		; They clicked OK, but did they type the right thing?
	If $sText <> "thesnow" Then
			MsgBox(4096, "����", "�ѵ�����֪��С�������� thesnow ��? - ������!")
		Else
			$iLoop = 0 ; Exit the loop - ExitLoop would have been an alternative too :)
		EndIf
	EndIf
WEnd

; Print the success message
MsgBox(4096,"AutoIt ����", "����������ȷ�ĵ���!  ��ϲ.")

; Finished!
