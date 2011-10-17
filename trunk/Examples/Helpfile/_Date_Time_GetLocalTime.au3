 
 #include  <GuiConstantsEx.au3> 
 #include  <Date.au3> 
 #include  <WindowsConstants.au3> 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $tCur ,  $tNew 
 
     ; �������� 
     $hGUI  =  GUICreate ( "Time" ,  400 ,  300 ) 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; ��ʾ��ǰ����ʱ��/span> 
     $tCur  =  _Date_Time_GetLocalTime () 
     MemoWrite ( "Current date/time .: "  &  _Date_Time_SystemTimeToDateTimeStr ( $tCur )) 
 
     ; �����µı���ʱ�� 
     $tNew  =  _Date_Time_EncodeSystemTime ( 8 ,  19 ,  @YEAR ,  3 ,  10 ,  45 ) 
     _Date_Time_SetLocalTime ( DllStructGetPtr ( $tNew )) 
     $tNew  =  _Date_Time_GetLocalTime () 
     MemoWrite ( "New date/time .....: "  &  _Date_Time_SystemTimeToDateTimeStr ( $tNew )) 
 
     ; ���豾��ʱ�� 
     _Date_Time_SetLocalTime ( DllStructGetPtr ( $tCur )) 
 
     ; ��ʾ��ǰ����ʱ�� 
     $tCur  =  _Date_Time_GetLocalTime () 
     MemoWrite ( "Current date/time .: "  &  _Date_Time_SystemTimeToDateTimeStr ( $tCur )) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
     
 EndFunc    ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite ( $sMessage ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 

