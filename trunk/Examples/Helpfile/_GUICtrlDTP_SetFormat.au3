 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiDateTimePicker.au3> 
 
 Opt ( " MustDeclareVars ", 1 ) 
 
 $Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $tLOGFONT , $hFont , $hDTP 
 
   ; �������� 
   GUICreate ( " DateTimePick Get Month Calendar Font ", 400 , 300 ) 
   $hDTP = GUICtrlGetHandle ( GUICtrlCreateDate ( "", 2 , 6 , 190 )) 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 32 , 396 , 266 , 0 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ������ʾ��ʽ 
   _GUICtrlDTP_SetFormat ( $hDTP , " ddd MMM dd , yyyy hh:mm ttt " ) 
 
   ; �������ؼ��½�һ������ 
   $tLOGFONT = DllStructCreate ( $tagLOGFONT ) 
   DllStructSetData ( $tLOGFONT , " Height ", 13 ) 
   DllStructSetData ( $tLOGFONT , " Weight ", 400 ) 
   DllStructSetData ( $tLOGFONT , " FaceName ", " Verdana " ) 
   $hFont = _WinAPI_CreateFontIndirect ( $tLOGFONT ) 
   _GUICtrlDTP_SetMCFont ( $hDTP , $hFont ) 
 
   ; ��ȡ���������� 
   GUICtrlSetData ( $iMemo , " Font Handle:  " & " 0x ", & Hex ( _GUICtrlDTP_GetMCFont ( $hDTP ) , 6 ) & @CRLF , 1 ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ�д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 
