 
 #include  <GuiConstantsEx.au3> 
 #include  <Date.au3> 
 #include  <WindowsConstants.au3> 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $tLocal ,  $tSystem 
 
     ; �������� 
     $hGUI  =  GUICreate ( "Time" ,  400 ,  300 ) 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; ��ϵͳʱ��ת��Ϊ����ʱ�� 
     $tSystem  =  _Date_Time_GetSystemTime () 
     $tLocal   =  _Date_Time_SystemTimeToTzSpecificLocalTime ( DllStructGetPtr ( $tSystem )) 
     MemoWrite ( "System time to local time .: "  &  _Date_Time_SystemTimeToDateTimeStr ( $tLocal  )) 
 
     $tLocal   =  _Date_Time_GetLocalTime () 
     $tSystem  =  _Date_Time_TzSpecificLocalTimeToSystemTime ( DllStructGetPtr ( $tLocal )) 
     MemoWrite ( "Local time to system time .: "  &  _Date_Time_SystemTimeToDateTimeStr ( $tSystem )) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
     
 EndFunc    ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite ( $sMessage ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
