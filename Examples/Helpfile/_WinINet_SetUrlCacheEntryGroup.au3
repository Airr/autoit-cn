 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 #Include <WinINet.au3> 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main() 
   Local  $hGUI 
 
   ; �������� 
   $hGUI  = GUICreate ( " _WinINet_UrlCache ", 600 , 400 ) 
 
   ; ����memo�ؼ� 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 2 , 596 , 396 , $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ��ʼ��WinINet 
   _WinINet_Startup () 
 
   ; �������⻺���� 
   Global $sSourceUrlName = " http://www.autoitscript.com/ " 
   Global $sLocalFileName = _WinINet_CreateUrlCacheGroup ( $sSourceUrlName ) 
 
   ; �������������� 
   _WinINet_CommitUrlCacheEntry ( $sSourceUrlName , $sLocalFileName ) 
 
   ; �������⻺���� 
   Global $iCacheGroupID = _WinINet_CreateUrlCacheGroup () 
 
   ; ����URLΪ�������һ���� 
   _WinINet_SetUrlCacheEntryGroup ( $sSourceUrlName , $INTERNET_CACHE_GROUP_ADD , $iCacheGroupID ) 
 
   ; ö�ٻ������еĻ����� 
   Global $avCacheEntry = _WinINet_FindFirstUrlCacheEntryEx ( 0 , $NORMAL_CACHE_ENTRY , $iCacheGroupID ) 
 
   If Not @error Then 
     ; �����ݴ��뷵�ص����� 
     Global $hCacheEntry = $avCacheEntry [ 0 ] 
     Global $avCacheEntryInfo = $avCacheEntry [ 1 ] 
     $avCacheEntry = 0 
 
     While Not @error 
       ; �����ǰ�ҵ��Ļ���ֵ 
       MemoWrite ( " ---------- " ) 
       For $i = 0  To  UBound ( $avCacheEntryInfo ) - 1 
         MemoWrite ( StringFormat ( " --> [%d]: %s ", $i , $avCacheEntryInfo [ $i ])) 
       Next 
       MemoWrite ( " ---------- " & @CRLF ) 
 
       ; ������һ������ 
       $avCacheEntryInfo = _WinINet_FindNextUrlCacheEntryEx ( $hCacheEntry ) 
     Wend 
 
     ; �رվ�� 
     _WinINet_FindCloseUrlCache ( $hCacheEntry ) 
   EndIf 
 
   ; ɾ�������� 
   _WinINet_DeleteUrlCacheGroup ( $iCacheGroupID , $CACHEGROUP_FLAG_FLUSHURL_ONDELETE ) 
 
   ; ��� 
   _WinINet_Shutdown () 
 
   ; ѭ�����û��˳� 
   Do 
   Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite( $sMessage = "" ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc    ;==>MemoWrite 
 
