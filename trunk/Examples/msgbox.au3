;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon@hiddensoft.com)
;
; Script Function:
;   Demo of using multiple lines in a message box
;

; Use the @CRLF macro to create a newline in a MsgBox - it is similar to the \n in v2.64
;~ @CR=�س�
;~ @LF=����
;~ @CRLF=�س�+����

MsgBox(0, "AutoIt ����", "���ǵ�һ��" & @CRLF & "���ǵڶ���" & @CRLF & "���ǵ�����")
