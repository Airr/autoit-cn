 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main () 
   ; �������� 
   GUICreate ( "HTTP Status" ,  800 ,  600 ) 
 
   ; ����memo�ؼ� 
   $iMemo  =  GUICtrlCreateEdit ( ,""  2 ,  2 ,  796 ,  596 ,  $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
   GUISetState () 
 
   ; ��ʼ������ȡ�Ự��� 
   Global $hOpen = _WinHttpOpen () 
   If @error Then 
     MsgBox ( 48 , " Error ", " Error initializing the usage of WinHTTP functions. " ) 
     Exit 1 
   EndIf 
   ; ��ȡ���Ӿ�� 
   Global $hConnect = _WinHttpConnect ( $hOpen , " yahoo.com " ) 
   If @error Then 
     MsgBox ( 48 , " Error ", " Error specifying the initial target server of an HTTP request. " ) 
     _WinHttpCloseHandle ( $hOpen ) 
   Exit 2 
   EndIf 
   ; �������� 
   Global $hRequest = _WinHttpOpenRequest ( $hConnect , Default , $sTarget ) 
   If @error Then 
     MsgBox ( 48 , " Error ", " Error creating an HTTP request handle. " ) 
     _WinHttpCloseHandle ( $hConnect ) 
     _WinHttpCloseHandle ( $hOpen ) 
     Exit 3 
   EndIf 
 
   ; �������� 
   _WinHttpSendRequest ( $hRequest ) 
   If @error Then 
     MsgBox ( 48 , " Error ", " Error sending specified request. " ) 
     _WinHttpCloseHandle ( $hConnect ) 
     _WinHttpCloseHandle ( $hOpen ) 
     Exit 4 
   EndIf 
 
   ; �ȴ�Ӧ�� 
   _WinHttpReceiveResponse ( $hRequest ) 
 
   ; ����Ƿ��п����ڶ�ȡ������ 
   Global $sChunk , $sData , $hFile 
   If _WinHttpQueryDataAvailable ( $hRequest ) Then 
     While 1 
       $sChunk = _WinHttpReadData ( $hRequest ) 
       If @error Then ExitLoop 
       MemoWrite( $sChunk ) 
     Wend 
   Else 
     MsgBox ( 48 , " Error occurred ", " Site is experiencing problems. " ) 
   EndIf 
 
   ; �رվ�� 
   _WinHttpCloseHandle ( $hRequest ) 
   _WinHttpCloseHandle ( $hConnect ) 
   _WinHttpCloseHandle ( $hOpen ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite ( $sMessage  =  "" ) 
   GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
