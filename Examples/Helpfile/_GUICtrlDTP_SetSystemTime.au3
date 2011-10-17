 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiDateTimePicker.au3> 
 
 Opt ( " MustDeclareVars ", 1 ) 
 
 $Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo , $aDate , $tRange 
 
 _Main() 
 
 Func _Main() 
   Local $hDTP , $a_Date [ 7 ] = [ False , @YEAR , 8 , 19 , 21 , 57 , 53 ] 
 
   ; �������� 
   GUICreate ( " DateTimePick System Time ", 400 , 300 ) 
   $hDTP = GUICtrlGetHandle ( GUICtrlCreateDate ( "", 2 , 6 , 190 )) 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 32 , 396 , 266 , 0 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ������ʾ��ʽ 
   _GUICtrlDTP_SetFormat ( $hDTP , " ddd MMM dd , yyyy hh:mm ttt " ) 
 
   ; ����ϵͳʱ�� 
   _GUICtrlDTP_SetSystemTime ( $hDTP , $a_Date ) 
 
   ; ��ʾϵͳʱ�� 
   $aData = _GUICtrlDTP_GetSystemTime ( $hDTP ) 
   MemoWrite( " Current date: " & GetDateStr()) 
   MemoWrite( " Current time: " & GetTimeStr()) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; �������ڲ��� 
 Func GetDateStr() 
   Return StringFormat ( " %02d/%02d/%04d ", $aData [ 1 ] , $aData [ 2 ] , $aData [ 0 ]) 
 EndFunc ;==>GetDateStr 
 
 ; ����ʱ�䲿�� 
 Func GetTimeStr() 
   Return StringFormat ( " %02d:%02d:%02d ", $aData [ 3 ] , $aData[ 4 ] , $aData [ 5 ]) 
 EndFunc ;==>GetTimeStr 
 
 ; ��memo�ؼ�д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 
