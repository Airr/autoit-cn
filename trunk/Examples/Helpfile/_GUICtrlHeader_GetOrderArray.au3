 #include <GuiConstantsEx.au3> 
 #include <GuiHeader.au3> 
 #include <GuiImageList.au3> 
 #include <WinAPI.au3> 
 
 Opt (' MustDeclareVars ' , 1 ) 
 
 $Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI , $hHeader , $msg , $hImage , $array , $aItem 
   Local $array , $aOrder [ 5 ] = [ 4 , 3 , 1 , 2 , 0 ] 
 
   ; �������� 
   $hGUI = GUICreate ( ' Header ', 430 , 520 ) 
   $array = GUICtrlCreateButton ( ' set/get item order array ', 10 , 300 , 190 , 20 ) 
   $hHeader = _GUICtrlHeader_Create ( $hGUI ) 
   $iMemo = GUICtrlCreateEdit ( '', 2 , 24 , 426 , 274 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
   GUISetState () 
 
   ; ���ͼ�� 
   $hImage = _GUIImageList_Create ( 11 , 11 ) 
   _GUIImageList_Add ( $hImage , _WinAPI_CreateSolidBitmap ( $hGUI , 0xFF0000 , 11 , 11 )) 
   _GUIImageList_Add ( $hImage , _WinAPI_CreateSolidBitmap ( $hGUI , 0x00FF00 , 11 , 11 )) 
   _GUIImageList_Add ( $hImage , _WinAPI_CreateSolidBitmap ( $hGUI , 0x0000FF , 11 , 11 )) 
   _GUICtrlHeader_SetImageList ( $hHeader , $hImage ) 
 
   ; ����� 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 1 ", 110 , 0 , 0 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 2 ", 110 , 0 , 1 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 3 ", 110 , 0 , 2 ) 
   _GUICtrlHeader_AddItem ( $hHeader , " Column 4 ", 100 ) 
 
   $aItem = _GUICtrlHeader_GetOrderArray ( $hHeader ) 
   For $iI = 0  To  $aItem [ 0 ] 
     MemoWrite( ' Column ' & $iI & ' : ' & $aOrder [ $iI ]) 
   Next 
 
   Do 
     $msg = GUIGetMsg() 
     If $msg = $array Then 
       ; ����˳������ 
       _GUICtrlHeader_SetOrderArray ( $hHeader , $aOrder ) 
       ; ��ʾ˳������ 
       $aOrder = _GUICtrlHeader_GetOrderArray ( $hHeader ) 
       For $iI = 0  To  $aOrder [ 0 ] 
         MemoWrite( ' Column ' & $iI & ' : ' & $aOrder [ $iI ]) 
       Next 
     EndIf 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ�д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc   ;==>MemoWrite 
 
