 
 #AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiListView.au3> 
 #include <GuiImageList.au3> 
 #include <WindowsConstants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $hListView, $edit 
 
 _Main () 
 
 Func _Main () 
 
     Local $GUI , $hImage 
     $GUI = GUICreate ( "(UDF Created) ListView Create" , 400 , 540 ) 
 
     $edit = GUICtrlCreateEdit ( "" , 2 , 277 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
     $hListView = _GUICtrlListView_Create ( $GUI , "" , 2 , 2 , 394 , 268 ) 
     _GUICtrlListView_SetExtendedListViewStyle ( $hListView , BitOR ( $LVS_EX_GRIDLINES , $LVS_EX_FULLROWSELECT , $LVS_EX_SUBITEMIMAGES )) 
     GUISetState () 
     
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ����ͼ�� 
     $hImage = _GUIImageList_Create () 
     _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0xFF0000 , 16 , 16 )) 
     _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0x00FF00 , 16 , 16 )) 
     _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0x0000FF , 16 , 16 )) 
     _GUICtrlListView_SetImageList ( $hListView , $hImage , 1 ) 
 
     ; ����� 
     _GUICtrlListView_InsertColumn ( $hListView , 0 , "Column 1" , 100 ) 
     _GUICtrlListView_InsertColumn ( $hListView , 1 , "Column 2" , 100 ) 
     _GUICtrlListView_InsertColumn ( $hListView , 2 , "Column 3" , 100 ) 
 
     ; ����� 
     _GUICtrlListView_AddItem ( $hListView , "Row 1: Col 1" , 0 ) 
     _GUICtrlListView_AddItem ( $hListView , "Row 2: Col 1" , 1 ) 
     _GUICtrlListView_AddItem ( $hListView , "Row 3: Col 1" , 2 ) 
 
     _GUICtrlListView_ClickItem ( $hListView , 1 , "left" , False , 2 ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUIDelete () 
 EndFunc    ;==>_Main 
 
 Func WM_NOTIFY ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg, $iwParam 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR , $hWndListView , $tInfo 
   $hWndListView = $hListView 
   If Not IsHWnd ( $hListView ) Then $hWndListView = GUICtrlGetHandle ( $hListView ) 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hWndListView 
       Switch $iCode 
         Case $NM_CLICK ; �����������Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           memowrite ( "$NM_CLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Index:" & @TAB & DllStructGetData ( $tInfo , "Index" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & DllStructGetData ( $tInfo , "NewState" ) & @LF ) 
           memowrite( "-->OldState:" & @TAB & DllStructGetData ( $tInfo , "OldState" ) & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->lParam:" & @TAB & DllStructGetData ( $tInfo , "lParam" ) & @LF ) 
           memowrite( "-->KeyFlags:" & @TAB & DllStructGetData ( $tInfo , "KeyFlags" )) 
           ; �޷���ֵ 
         Case $NM_DBLCLK ; ������˫����Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           memowrite ( "$NM_DBLCLK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Index:" & @TAB & DllStructGetData ( $tInfo , "Index" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & DllStructGetData ( $tInfo , "NewState" ) & @LF ) 
           memowrite( "-->OldState:" & @TAB & DllStructGetData ( $tInfo , "OldState" ) & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->lParam:" & @TAB & DllStructGetData ( $tInfo , "lParam" ) & @LF ) 
           memowrite( "-->KeyFlags:" & @TAB & DllStructGetData ( $tInfo , "KeyFlags" )) 
           ; �޷���ֵ 
         Case $NM_RCLICK ; ����Ҽ������Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           memowrite ( "$NM_RCBLCLK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Index:" & @TAB & DllStructGetData ( $tInfo , "Index" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & DllStructGetData ( $tInfo , "NewState" ) & @LF ) 
           memowrite( "-->OldState:" & @TAB & DllStructGetData ( $tInfo , "OldState" ) & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->lParam:" & @TAB & DllStructGetData ( $tInfo , "lParam" ) & @LF ) 
           memowrite( "-->KeyFlags:" & @TAB & DllStructGetData ( $tInfo , "KeyFlags" )) 
           ;Return 1 ; ������Ĭ�ϲ��� 
           Return 0 ; ����Ĭ�ϲ��� 
         Case $NM_RDBLCLK ; ����Ҽ�˫����Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           memowrite ( "$NM_RDBLCLK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Index:" & @TAB & DllStructGetData ( $tInfo , "Index" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & DllStructGetData ( $tInfo , "NewState" ) & @LF ) 
           memowrite( "-->OldState:" & @TAB & DllStructGetData ( $tInfo , "OldState" ) & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->lParam:" & @TAB & DllStructGetData ( $tInfo , "lParam" ) & @LF ) 
           memowrite( "-->KeyFlags:" & @TAB & DllStructGetData ( $tInfo , "KeyFlags" )) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_NOTIFY 
 
 Func memowrite ( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 
 
