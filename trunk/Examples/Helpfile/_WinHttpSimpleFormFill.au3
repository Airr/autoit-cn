#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

Global $hOpen, $hConnect
Global $sRead, $hFileHTM, $sFileHTM = @ScriptDir & "\Form.htm"

; ʾ��1:
;    1. �� APNIC whois ҳ�� (http://wq.apnic.net/apnic-bin/whois.pl)
;    2. ʹ����Щֵ/������д�Ǹ�ҳ��ı�:
;         - ��дĬ�ϱ�
;         - ���� IP ��ַ 4.2.2.2 �������. ʹ���������Զ�λ����
;         - ���ͱ� (�����ť)
;         - �ɼ����ص�����

; ��ʼ������ȡ�Ự���
$hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
$hConnect = _WinHttpConnect($hOpen, "wq.apnic.net")
; ��д��ҳ��ı�
$sRead = _WinHttpSimpleFormFill($hConnect, "apnic-bin/whois.pl", Default, "name:searchtext", "4.2.2.2")
; �ر����Ӿ��
_WinHttpCloseHandle($hConnect)
; �رջỰ���
_WinHttpCloseHandle($hOpen)

; ����������ʲô (��Ĭ�������������ʲô��)
If $sRead Then
	MsgBox(64 + 262144, "Done!", "Will open returned page in your default browser now." & @CRLF & _
			"When you close that window another example will run.")
	$hFileHTM = FileOpen($sFileHTM, 2)
	FileWrite($hFileHTM, $sRead)
	FileClose($hFileHTM)
	ShellExecuteWait($sFileHTM)
EndIf


;=====================================================================================================================
If MsgBox(262148, "Example 2", "Run new example?") = 7 Then Exit

; ʾ�� 2:
;    1. �� w3schools ��ҳ�� (http://www.w3schools.com/html/html_forms.asp)
;    2. ʹ����Щֵ/������д�Ǹ�ҳ��ı�:
;         - ���Ǹ��������Ʊ�ʶ��, ����Ϊ "input0"
;         - ���� "OMG!!!" ���ݵ������. ���������ҵ������. ����Ϊ "user"
;         - �ɼ�����

; ��ʼ������ȡ�Ự���
$hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
$hConnect = _WinHttpConnect($hOpen, "w3schools.com")
; ��д��ҳ��ı�
$sRead = _WinHttpSimpleFormFill($hConnect, "html/html_forms.asp", "name:input0", "name:user", "OMG!!!")
; �ر����Ӿ��
_WinHttpCloseHandle($hConnect)
; �رջỰ���
_WinHttpCloseHandle($hOpen)

If $sRead Then
	MsgBox(64 + 262144, "Done!", "Will open returned page in your default browser now." & @CRLF & _
			"You should see 'OMG!!!' or 'OMG%21%21%21' (encoded version) somewhere on that page.")
	$hFileHTM = FileOpen($sFileHTM, 2)
	FileWrite($hFileHTM, $sRead)
	FileClose($hFileHTM)
	ShellExecuteWait($sFileHTM)
EndIf


;=====================================================================================================================
If MsgBox(262148, "Example 3", "Run new example?") = 7 Then Exit

; ʾ�� 3:
;    1. Open cs.tut.fi forms page (http://www.cs.tut.fi/~jkorpela/forms/testing.html)
;    2. ʹ����Щֵ/������д�Ǹ�ҳ��ı�:
;         - ���Ǹ�����������ʶ��, ����ҳ���ϵ��׸���, ������Ϊ 0
;         - ���� "Johnny B. Goode" ���ݵ��ı���. ���� "Comments" �����ҵ���.
;         - ѡ�и�ѡ��. �������� "box" �ҵ���. ѡ�е�ֵΪ "yes".
;         - ���� "This is hidden, so what?" ���ݵ��� "hidden field" ���Ʊ�ʶ�������ֶ�.
;         - �ɼ�����

; ��ʼ������ȡ�Ự���
$hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
$hConnect = _WinHttpConnect($hOpen, "www.cs.tut.fi")
; ��д��ҳ��ı�
$sRead = _WinHttpSimpleFormFill($hConnect, "~jkorpela/forms/testing.html", "index:0", "name:Comments", "Johnny B. Goode", "name:box", "yes", "name:hidden field", "This is hidden, so what?")
; �ر����Ӿ��
_WinHttpCloseHandle($hConnect)
; ���ڹرղ�����Ҫ�ĻỰ���
_WinHttpCloseHandle($hOpen)

If $sRead Then
	MsgBox(64 + 262144, "Done!", "Will open returned page in your default browser now." & @CRLF & _
			"It should show sent data.")
	$hFileHTM = FileOpen($sFileHTM, 2)
	FileWrite($hFileHTM, $sRead)
	FileClose($hFileHTM)
	ShellExecuteWait($sFileHTM)
EndIf


;=====================================================================================================================
If MsgBox(262148, "Example 4", "Run new example?") = 7 Then Exit

; ʾ�� 4:
;    1. ���Ż������¼ҳ�� (https://login.yahoo.com/config/login_verify2?&.src=ym)
;    2. ʹ����Щֵ/������д�Ǹ�ҳ��ı�:
;         - ���Ǹ��������Ʊ�ʶ��, ����Ϊ "login_form"
;         - ���� "MyUserName" ���ݵ��û��������. ������ ID �ҵ������. ���� "username"
;         - ���� "MyPassword" ���ݵ����������. ������ ID �ҵ������. ���� "passwd"
;         - �ɼ�����

; ��ʼ������ȡ�Ự���
$hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
$hConnect = _WinHttpConnect($hOpen, "login.yahoo.com")
; ��д��ҳ��ı�
$sRead = _WinHttpSimpleFormFill($hConnect, "config/login_verify2?&.src=ym", "name:login_form", "username", "MyUserName", "passwd", "MyPassword")
;�ر����Ӿ��
_WinHttpCloseHandle($hConnect)
; �رջỰ���
_WinHttpCloseHandle($hOpen);��ӡ���ص�:

ConsoleWrite($sRead & @CRLF)
MsgBox(262144, "The End", "Source of the last example is printed to console." & @CRLF & _
 "In case valid login data was passed it will be user's mail page on yahoo.mail")


