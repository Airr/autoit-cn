#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include "WinHttp.au3"

Opt("MustDeclareVars", 1)

; !!!ע������û�����������Ч, ��ô�����ӽ�ʧ��!!!

; ʹ����ʵ���������������֤
Global $sUserName = "SomeUserName"
Global $sPassword = "SomePassword"
Global $sDomain = "www.google.com"
Global $sPage = "accounts/ClientLogin"
; ���� http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html ��ȡ������Ϣ
Global $sAdditionalData = "accountType=HOSTED_OR_GOOGLE&Email=" & $sUserName & "&Passwd=" & $sPassword & "&service=mail&source=Gulp-CalGulp-1.05"

; ��ʼ������ȡ�Ự���
Global $hOpen = _WinHttpOpen()
; ��ȡ���Ӿ��
Global $hConnect = _WinHttpConnect($hOpen, $sDomain)

; ���м� SSL ����...
Global $sReturned = _WinHttpSimpleSSLRequest($hConnect, "POST", $sPage, Default, $sAdditionalData)

; �رվ��
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

; �������ص���ʲô
MsgBox(0, "Returned", $sReturned)