 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 #Include <WinINet.au3> 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main() 
   Local  $hGUI 
 
   ; �������� 
   $hGUI  = GUICreate ( " _WinINet_FtpCommand ", 600 , 400 ) 
 
   ; ����memo�ؼ� 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 2 , 596 , 396 , $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ��ʼ��WinINet 
   _WinINet_Startup () 
 
   ; ���ñ��� 
   Global $sServerName = "" 
   Global $iServerPort = 21 
   Global $sUsername = Default 
   Global $sPassword = Default 
 
   Global $iPauseTime = 3000 
   Global $sDirectory = " /_WININET_UDF_TEST_DIRECTORY_ " 
 
   ; ������� 
   Global $hInternetOpen = _WinINet_InternetOpen ( " AutoIt/ " & @AutoItVersion ) 
   Global $hInternetConnect = _WinINet_InternetConnect ( $hInternetOpen ,  $INTERNET_SERVICE_FTP ,  $sServerName ,  $iServerPort ,  0 ,  $sUsername ,  $sPassword ) 
 
   ; ����Ŀ¼ 
   MemoWrite( " Creating directory... " ) 
   Sleep ( $iPauseTime ) 
   _WinINet_FtpCommand ( $hInternetConnect , " MKD  " & $sDirectory ) 
   MemoWrite( " Server Response: " & _WinINet_InternetGetLastResponseInfo () & @CRLF ) 
 
   ; �ı䵱ǰ�Ĺ���Ŀ¼ 
   MemoWrite( " Entering created directory... " ) 
   Sleep ( $iPauseTime ) 
   _WinINet_FtpCommand ( $hInternetConnect , " CWD " & $sDirectory ) 
   MemoWrite( " Server Response: " & _WinINet_InternetGetLastResponseInfo () & @CRLF ) 
 
   ; �ı䵱ǰ�Ĺ���Ŀ¼ 
   MemoWrite( " Exiting created directory... " ) 
   Sleep ( $iPauseTime ) 
   _WinINet_FtpCommand ( $hInternetConnect , " CWD .. " ) 
   MemoWrite( " Server Response: " & _WinINet_InternetGetLastResponseInfo () & @CRLF ) 
 
   ; �Ƴ�Ŀ¼ 
   MemoWrite( " Removing created directory... " ) 
   Sleep ( $iPauseTime ) 
   _WinINet_FtpCommand ( $hInternetConnect , " RMD  " & $sDirectory ) 
   MemoWrite( " Server Response: " & _WinINet_InternetGetLastResponseInfo () & @CRLF ) 
 
   ; ��� 
   _WinINet_InternetCloseHandle ( $hInternetConnect ) 
   _WinINet_InternetCloseHandle ( $hInternetOpen ) 
   _WinINet_Shutdown () 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite( $sMessage = "" ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc    ;==>MemoWrite 
 
