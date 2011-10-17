 #include <GuiConstantsEx.au3> 
 #include <GuiHeader.au3> 
 #include <GuiImageList.au3> 
 #include <WinAPI.au3> 
 
 Opt (' MustDeclareVars ' , 1 ) 
 
 $Debug_HDR = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI , $hHeader , $msg , $hImage , $tItem , $item 
 
   ; �������� 
   $hGUI = GUICreate ( ' Header ', 420 , 300 ) 
   $item = GUICtrlCreateButton ( ' set/get item ', 270 , 118 , 190 , 20 ) 
   $hHeader = _GUICtrlHeader_Create ( $hGUI ) 
   $iMemo = GUICtrlCreateEdit ( '', 2 , 24 , 426 , 240 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
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
 
   Do 
     $msg = GUIGetMsg() 
     If $msg  = $item  Then 
       ; ������3ͼ������ 
       $tItem = DllStructCreate ( $tagHDITEM ) 
       DllStructSetData ( $tItem , "Mask" , $HDI_IMAGE ) 
       DllStructSetData ( $tItem , "Image" , 2 ) 
       _GUICtrlHeader_SetItem ( $hHeader , 2 , $tItem ) 
       ; ��ʾ��3ͼ������ 
       $tItem = DllStructCreate ( $tagHDITEM ) 
       DllStructSetData ( $tItem , "Mask" , $HDI_IMAGE ) 
       _GUICtrlHeader_GetItem ( $hHeader , 2 , $tItem ) 
       MemoWrite( ' Column 3 image index: ' & DllStructGetData ( $tItem , "Image" )) 
     EndIf 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ�д��һ�� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc   ;==>MemoWrite 
 
