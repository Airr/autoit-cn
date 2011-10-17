 
 #include  <GuiConstantsEx.au3> 
 #include  <NetShare.au3> 
 #include  <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $sServer ,  $aFile ,  $aInfo 
 
     ; �������� 
     $hGUI  =  GUICreate ( "NetShare" ,  400 ,  300 ) 
 
     ; ����memo�ؼ� 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; ��ȡ��������������Ϣ 
     $sServer  =  InputBox ( "NetWork Demo" ,  "Enter Server Name:" ,  "\\MyServer" ,  "" ,  200 ,  130 ) 
     If  @error  Then  Exit 
 
     ; ö�ٷ������ϴ򿪵��ļ� 
     $aFile  =  _Net_Share_FileEnum  ( $sServer ) 
     MemoWrite ( "Error ...................: "  &  @error ) 
     MemoWrite ( "Entries read ............: "  &  $aFile [ 0 ][ 0 ]) 
     MemoWrite () 
 
     ; ��ȡÿ�����ļ�����Ϣ(��ͬ��$aFile��Ϣ) 
     For  $iI  =  1  To  $aFile [ 0 ][ 0 ] 
         $aInfo  =  _Net_Share_FileGetInfo  ( $sServer ,  $aFile [ $iI ][ 0 ]) 
         MemoWrite ( "Error ...................: "  &  @error ) 
         MemoWrite ( "File permissions ........: "  &  _Net_Share_PermStr  ( $aInfo [ 1 ])) 
         MemoWrite ( "File locks ..............: "  &  $aInfo [ 2 ]) 
         MemoWrite ( "File path ...............: "  &  $aInfo [ 3 ]) 
         MemoWrite ( "File user ...............: "  &  $aInfo [ 4 ]) 
         MemoWrite () 
     Next 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite ( $sMessage  =  "" ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
