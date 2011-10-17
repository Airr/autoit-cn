 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 #Include <WinINet.au3> 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main() 
   Local  $hGUI 
 
   ; �������� 
   $hGUI  = GUICreate ( " _WinINet_FtpCreateDirectory ", 600 , 400 ) 
 
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
   Global $sFile = " _WININET_UDF_TEST_FILE_ " 
   Global $sFileRenamed = " _WININET_UDF_TEST_FILE_RENAMED_ " 
 
   ; ������� 
   Global $hInternetOpen = _WinINet_InternetOpen ( " AutoIt/ " & @AutoItVersion ) 
   Global $hInternetConnect = _WinINet_InternetConnect ( $hInternetOpen ,  $INTERNET_SERVICE_FTP ,  $sServerName ,  $iServerPort ,  0 ,  $sUsername ,  $sPassword ) 
 
   ; ����Ŀ¼ 
   _WinINet_FtpCreateDirectory ( $hInternetConnect ,  $sDirectory ) 
   _WinINet_FtpSetCurrentDirectory ( $hInternetConnect ,  $sDirectory ) 
   MemoWrite( " Current Directory: " & _WinINet_FtpGetCurrentDirectory ( $hInternetConnect ) & @CRLF ) 
 
   ; ����/�ϴ������ļ� 
   Sleep ( $iPauseTime ) 
   MemoWrite( " Uploading: " & @TempDir & " \ " & $sFile ) 
   FileWrite ( @TempDir & " \ " & $sFile , " AutoIt v " & @AutoItVersion ) 
   _WinINet_FtpPutFile ( $hInternetConnect ,  @TempDir & " \ " & $sFile ,  $sFile ) 
 
   ; �����������ļ� 
   Sleep ( $iPauseTime ) 
   MemoWrite( " Renaming to: " & $sFileRenamed ) 
   _WinINet_FtpRenameFile ( $hInternetConnect ,  $sFile ,  $sFileRenamed ) 
 
   ; ȷ��Զ���ļ����� 
   Global $avFtpFile = _WinINet_FtpFindFirstFile ( $hInternetConnect ,  $sFileRenamed ) 
   If @error Then 
     MemoWrite( " Found: " & DllStructGetData ( $avFtpFile [ 1 ] ,  " FileName " ) & @CRLF ) 
 
     ; ���Զ���ļ���С 
     Sleep ( $iPauseTime ) 
     MemoWrite( " Local Size: " & FileGetSize ( @TempDir & " \ " & $sFile )) 
 
     Global $hFtpOpenFile = _WinINet_FtpOpenFile ( $hInternetConnect ,  $sFileRenamed ,  $GENERIC_READ ) 
     Global $iFileSize = _WinINet_FtpGetFileSize ( $hFtpOpenFile ) 
     MemoWrite( " Remote Size: " & $iFileSize & @CRLF ) 
 
     ; ��ȡԶ���ļ� 
     Sleep ( $iPauseTime ) 
     Global $vReceived = Binary ( "" ) 
     Do 
       $vReceived &= _WinINet_InternetReadFile ( $hFtpOpenFile ,  $iFileSize ) 
     Until @error Or Not @extended 
     _WinINet_InternetCloseHandle ( $hFtpOpenFile ) 
 
     MemoWrite( " Remote file contents: " & BinaryToString ( $vReceived ) & @CRLF ) 
 
     ; ����Զ���ļ� 
     Sleep ( $iPauseTime ) 
     _WinINet_FtpGetFile ( $hInternetConnect ,  $sFileRenamed ,  @TempDir & " \ " & $sFileRenamed ) 
     MemoWrite( " Downloaded file contents: " & FileRead ( @TempDir & " \ " & $sFileRenamed ) & @CRLF ) 
 
     ; ɾ��Զ���ļ� 
     Sleep ( $iPauseTime ) 
     MemoWrite( " Deleting remote file... " ) 
     _WinINet_FtpDeleteFile ( $hInternetConnect ,  $sFileRenamed ) 
 
     ; ɾ��Զ��Ŀ¼ 
     Sleep ( $iPauseTime ) 
     MemoWrite( " Deleting remote directory... " & @CRLF ) 
     _WinINet_FtpSetCurrentDirectory ( $hInternetConnect ,  $sDirectory & " /.. " ) 
     _WinINet_FtpRemoveDirectory ( $hInternetConnect ,  $sDirectory ) 
   EndIf 
 
   ; ���... 
   MemoWrite( " Local cleanup... " ) 
   FileDelete ( @TempDir & " \ " & $sFile ) 
   FileDelete ( @TempDir & " \ " & $sFileRenamed ) 
 
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
 
