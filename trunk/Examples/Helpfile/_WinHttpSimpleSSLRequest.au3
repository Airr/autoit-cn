 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 ; !!!ע���ʾ������Ϊ��Ч�û���������ʧ��!!! 
 Global $sDomain = " www.google.com " 
 Global $sPage = " accounts/ClientLogin " 
 Global $sUserName = " SomeUserName " 
 Global $sPassword = " SomePassword " 
 ; ������Ϣ�����http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html 
 Global $sAdditionalData = " accountType=HOSTED_OR_GOOGLE&Email= " & $sUserName & " &Passwd= " & $sPassword & " &service=mail&source=Gulp-CalGulp-1.05 " 
 ; ��ʼ������ȡ�Ự��� 
 Global $hOpen = _WinHttpOpen () 
 ; ��ȡ���Ӿ�� 
 Global $hConnect = _WinHttpConnect ( $hOpen , $sDomain ) 
 ; ����SimpleSSL-���� 
 Global $sReturned = _WinHttpSimpleSSLRequest ( $hConnect , " POST ", $sPage , Default , $sAdditionalData ) 
 
 ; �ȴ�Ӧ�� 
 _WinHttpReceiveResponse ( $hRequest ) 
 
 _WinHttpCloseHandle ( $hConnect ) 
 _WinHttpCloseHandle ( $hOpen ) 
 
 ; �鿴����ֵ 
 MsgBox ( 0 , " Returned ", $sReturned ) 
 
