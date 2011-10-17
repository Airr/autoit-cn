 #include <GuiConstantsEx.au3> 
 #include <GuiHeader.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI , $hHeader 
 
   ; �������� 
   $hGUI = GUICreate ( ' Header ', 400 , 300 ) 
   $hHeader = _GUICtrlHeader_Create ( $hGUI ) 
   $iMemo = GUICtrlCreateEdit ( '', 2 , 24 , 396 , 274 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
   GUISetState () 
 
   ; ����� 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 1 ", 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 2 ", 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 3 ", 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 4 ", 100 ) 
 
   MemoWrite( ' Order 3 index: ' & _GUICtrlHeader_OrderToIndex ( $hHeader , 2 )) 
 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ�д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc   ;==>MemoWrite 
 
