 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 ; ��ʼ������ȡ�Ự��� 
 Global $hOpen = _WinHttpOpen () 
 ; �����û������ַ��� 
 _WinHttpSetOption ( $hOpen , $WINHTTP_OPTION_USER_AGENT , " Who the fuc*k is Alice??? " ) 
 ; ��ȡ���Ӿ�� 
 Global $hConnect = _WinHttpConnect ( $hOpen , " google.com " ) 
 ; �������� 
 Global $hRequest = _WinHttpOpenRequest ( $hConnect ) 
 ; �������� 
 _WinHttpSendRequest ( $hRequest ) 
 
 ; ���ʹ�õ��û������ַ��� 
 Global $option = _WinHttpQueryOption ( $hOpen , $WINHTTP_OPTION_USER_AGENT ) 
 ; �ȴ�Ӧ�� 
 _WinHttpReceiveResponse ( $hRequest ) 
 
 ; ����Ƿ������ݿ��� 
 If _WinHttpQueryDataAvailable ( $hRequest ) Then 
  Global $sHeader = _WinHttpQueryHeaders ( $hRequest ) 
 EndIf 
 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hRequest ) 
 _WinHttpCloseHandle ( $hConnect ) 
 _WinHttpCloseHandle ( $hOpen ) 
 
 ; ��ʾ���� 
 MsgBox ( 0 , " Query ", $option & @CRLF & @CRLF & $sHeader ) 
 
