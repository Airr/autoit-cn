 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 ; !!!ʾ���ṹ��������������!!! 
 #cs 
 POST /admin.php HTTP/1.1 
 Connection: Keep-Alive 
 Accept: text/html, application/xhtml+xml, application/xml;q=0.9, */*;q=0.8 
 User-Agent: AutoIt/3.3 
 Content-Length: 0 
 Host: 127.0.0.1 
 Authorization: Basic YWRtaW46YWRtaW4= 
 #ce 

 ; ���ط����� 
 Global $sLocalIP = " 127.0.0.1 " 
 
 ; ��ʼ������ȡ�Ự��� 
 Global $hOpen = _WinHttpOpen () 
 
 ; ��ȡ���Ӿ�� 
 Global $hConnect = _WinHttpConnect ( $hOpen , $sLocalIP ) 
 
 ; �������� 
 Global $hRequest = _WinHttpOpenRequest ( $hConnect , _ 
    " POST ", _ ; ���� 
    " admin.php ", _ ; ���� 
    Default , _ ; �汾 
    Default , _ ; �ο� 
    " text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 " )  ; �������� 
 
 ; ����֤�� 
 _WinHttpSetCredentials ( $hRequest , $ WINHTTP_AUTH_TARGET_SERVER , $WINHTTP_AUTH_SCHEME_BASIC , " admin ", " admin " ) 
 
 ; �������� 
 _WinHttpSendRequest ( $hRequest ) 
 
 ; �ȴ�Ӧ�� 
 _WinHttpReceiveResponse ( $hRequest ) 
 
 ; �˴�������������ಿ�� 
 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hRequest ) 
 _WinHttpCloseHandle ( $hConnect ) 
 _WinHttpCloseHandle ( $hOpen ) 
 
