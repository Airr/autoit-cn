 
 #include  <GuiConstantsEx.au3> 
 #include  <Date.au3> 
 #include  <WindowsConstants.au3> 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $aDate 
 
     ; �������� 
     $hGUI  =  GUICreate ( "Time" ,  400 ,  300 ) 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; Show FAT date 
     $aDate  =  _Date_Time_DOSDateToArray ( 0x3621 )  ; 01/01/2007 
     MemoWrite ( "FAT date .: "  &  StringFormat ( "%02d/%02d/%04d" ,  $aDate [ 0 ],  $aDate [ 1 ],  $aDate [ 2 ])) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
 EndFunc    ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite ( $sMessage ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite  

