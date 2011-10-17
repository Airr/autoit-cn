 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 Global $iMemo 
 ; ע��ص����� 
 Global $hWINHTTP_STATUS_CALLBACK = DllCallbackRegister ( " __WINHTTP_STATUS_CALLBACK ", " none ", " handle;dword_ptr;dword;ptr;dword ") 
 
 _Main () 
 
 Func _Main () 
   ; �������� 
   GUICreate ( "HTTP Status" ,  400 ,  300 ) 
 
   ; ����memo�ؼ� 
   $iMemo  =  GUICtrlCreateEdit ("" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
   GUISetState () 
 
   ; ��ʼ������ȡ�Ự��� 
   Global $hOpen = _WinHttpOpen () 
   ; ���ص�������þ������ 
   _WinHttpSetStatusCallback ( $hOpen , $hWINHTTP_STATUS_CALLBACK ) 
 
   ; ��ȡ���Ӿ�� 
   Global $hConnect = _WinHttpConnect ( $hOpen , " google.com " ) 
   ; �������� 
   Global $hRequest = _WinHttpOpenRequest ( $hConnect ) 
   ; �������� 
   _WinHttpSendRequest ( $hRequest ) 
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
 
   ; ��΢�ӳٲ鿴�Ƿ��и����¼� 
   Sleep ( 2000 ) 
 
   ; ������Ҫʱ�ͷŻص�����(��������ɺ���) 
   DllCallbackFree ( $hWINHTTP_STATUS_CALLBACK ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ����ص����� 
 Func __WINHTTP_STATUS_CALLBACK( $hInternet , $iContext , $iInternetStatus , $pStatusInformation , $iStatusInformationLength ) 
  #forceref $hInternet, $iContext, $pStatusInformation, $iStatusInformationLength 
  ; ����״̬ 
  Local $sStatus 
  Switch $iInternetStatus 
    Case $WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION 
      $sStatus = " Closing the connection to the server " 
    Case $WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER 
      $sStatus = " Successfully connected to the server. " 
    Case $WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER 
      $sStatus = " Connecting to the server. " 
    Case $WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED 
      $sStatus = " Successfully closed the connection to the server. " 
    Case $WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE 
      $sStatus = " Data is available to be retrieved with WinHttpReadData. " 
    Case $WINHTTP_CALLBACK_STATUS_HANDLE_CREATED 
      $sStatus = " An HINTERNET handle has been created. " 
    Case $WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING 
      $sStatus = " This handle value has been terminated. " 
    Case $WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE 
      $sStatus = " The response header has been received and is available with WinHttpQueryHeaders. " 
    Case $WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE 
      $sStatus = " Received an intermediate (100 level) status code message from the server. " 
    Case $WINHTTP_CALLBACK_STATUS_NAME_RESOLVED 
      $sStatus = " Successfully found the IP address of the server. " 
    Case $WINHTTP_CALLBACK_STATUS_READ_COMPLETE 
      $sStatus = " Data was successfully read from the server. " 
    Case $WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE 
      $sStatus = " Waiting for the server to respond to a request. " 
    Case $WINHTTP_CALLBACK_STATUS_REDIRECT 
      $sStatus = " An HTTP request is about to automatically redirect the request. " 
    Case $WINHTTP_CALLBACK_STATUS_REQUEST_ERROR 
      $sStatus = " An error occurred while sending an HTTP request. " 
    Case $WINHTTP_CALLBACK_STATUS_REQUEST_SENT 
      $sStatus = " Successfully sent the information request to the server. " 
    Case $WINHTTP_CALLBACK_STATUS_RESOLVING_NAME 
      $sStatus = " Looking up the IP address of a server name. " 
    Case $WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED 
      $sStatus = " Successfully received a response from the server. " 
    Case $WINHTTP_CALLBACK_STATUS_SECURE_FAILURE 
      $sStatus = " One or more errors were encountered while retrieving a Secure Sockets Layer (SSL) certificate from the server. " 
    Case $WINHTTP_CALLBACK_STATUS_SENDING_REQUEST 
      $sStatus = " Sending the information request to the server. " 
    Case $WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE 
      $sStatus = " The request completed successfully. " 
    Case $WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE 
      $sStatus = " Data was successfully written to the server. " 
  EndSwitch 
  ; ��� 
  MemoWrite( $iInternetStatus & @CRLF & $sStatus ) 
 EndFunc ;==>__WINHTTP_STATUS_CALLBACK 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite ( $sMessage  =  "" ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
