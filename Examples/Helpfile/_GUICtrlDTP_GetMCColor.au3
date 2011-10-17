 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiDateTimePicker.au3> 
 #include  <Constants.au3> 
 
 Opt (' MustDeclareVars ', 1 ) 
 
 $Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $hDTP 
 
   ; �������� 
   GUICreate ( " DateTimePick Get Month Calendar Color ", 400 , 300 ) 
   $hDTP  =  GUICtrlGetHandle ( GUICtrlCreateDate ( "", 2 , 6 , 190 )) 
   $iMemo  =  GUICtrlCreateEdit ( " " , 2 , 32 , 396 , 266 , 0 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ������ʾ��ʽ 
   _GUICtrlDTP_SetFormat ( $hDTP , " ddd MMM dd, yyyy hh:mm ttt " ) 
   ; ������������ɫ 
   _GUICtrlDTP_SetMCColor ( $hDTP , 2 , $CLR_MONEYGREEN ) 
 
   ; ���ÿؼ���ɫ 
   MemoWrite( " Background between months: " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 0 ) , 6 )) 
   MemoWrite( " Text within months ......: " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 1 ) , 6 )) 
   MemoWrite( " Title background ........: " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 2 ) , 6 )) 
   MemoWrite( " Title text ..............: " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 3 ) , 6 )) 
   MemoWrite( " Background within months : " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 4 ) , 6 )) 
   MemoWrite( " Header trailing .........: " & " 0x " & Hex ( _GUICtrlDTP_GetMCColor ( $hDTP , 5 ) , 6 )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg ()= $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ���д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 
