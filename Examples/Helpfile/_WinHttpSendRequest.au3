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
 Global $hOpen = _WinHttpOpen ( " Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.6) Gecko/20100625 Firefox/3.6.6 " ) 
 ; ��ȡ���Ӿ�� 
 Global $hConnect = _WinHttpConnect ( $hOpen , $sDomain ) 
 ; �������� 
 Global $hRequest = _WinHttpOpenRequest ( $hConnect , " POST ", $sPage , -1 , -1 , -1 , $WINHTTP_FLAG_SECURE ) 
 ; ��������, ���ƶ���������, ��ҪGoogle API 
 _WinHttpSendRequest ( $hRequest , " Content-Type: application/x-www-form-urlencoded ", $sAdditionalData ) 
 
 ; �ȴ�Ӧ�� 
 _WinHttpReceiveResponse ( $hRequest ) 
 
 ; ��鷵������ 
 Global $sReturned 
 If _WinHttpQueryDataAvailable ( $hRequest ) Then 
  Do 
    $sReturned &= _WinHttpReadData ( $hRequest ) 
  Until @error 
 EndIf 
 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hRequest ) 
 _WinHttpCloseHandle ( $hConnect ) 
 _WinHttpCloseHandle ( $hOpen ) 
 
 ; �鿴����ֵ 
 MsgBox ( 0 , " Returned ", $sReturned ) 
 
