 
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiListView.au3> 
 #include <GuiStatusBar.au3> 
 #include <GuiImageList.au3> 
 #include <WindowsConstants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hListView , $edit , $StatusBar , $iIndex = - 1 , $iSubIndex = - 1 
 
 _Main () 
 
 Func _Main () 
   Local $hImage , $GUI 
 
   ; �������� 
   $GUI = GUICreate ( "ListView SubItem Hit Test" , 400 , 410 ) 
   $edit = GUICtrlCreateEdit ( "" , 2 , 126 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   $hListView = GUICtrlCreateListView ( "" , 2 , 2 , 394 , 120 ) 
   $hListView = GUICtrlGetHandle ( $hListView ) ; ��ȡ�����¼�֪ͨ�ľ�� 
   $StatusBar = _GUICtrlStatusBar_Create ( $GUI , - 1 , "" ) 
 
   ; ʹ�ؼ���չ��ʽ��Ч 
   _GUICtrlListView_SetExtendedListViewStyle ( $hListView , $LVS_EX_SUBITEMIMAGES ) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
   ; ����ͼ�� 
   $hImage = _GUIImageList_Create () 
   _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0xFF0000 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0x00FF00 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlListView_CreateSolidBitMap ( $hListView , 0x0000FF , 16 , 16 )) 
   _GUICtrlListView_SetImageList ( $hListView , $hImage , 1 ) 
 
   ; ����� 
   _GUICtrlListView_AddColumn ( $hListView , "Column 1" , 100 ) 
   _GUICtrlListView_AddColumn ( $hListView , "Column 2" , 100 ) 
   _GUICtrlListView_AddColumn ( $hListView , "Column 3" , 100 ) 
 
   ; �����Ŀ 
   _GUICtrlListView_AddItem ( $hListView , "Row 1: Col 1" , 0 ) 
   _GUICtrlListView_AddSubItem ( $hListView , 0 , "Row 1: Col 2" , 1 , 1 ) 
   _GUICtrlListView_AddSubItem ( $hListView , 0 , "Row 1: Col 3" , 2 , 2 ) 
   _GUICtrlListView_AddItem ( $hListView , "Row 2: Col 1" , 1 ) 
   _GUICtrlListView_AddSubItem ( $hListView , 1 , "Row 2: Col 2" , 1 , 2 ) 
   _GUICtrlListView_AddItem ( $hListView , "Row 3: Col 1" , 2 ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Main 
 
 Func ListView_Click () 
   Local $aHit 
 
   $aHit = _GUICtrlListView_SubItemHitTest ( $hListView ) 
   If ( $aHit [ 0 ] <> - 1 ) And (( $aHit [ 0 ] <> $iIndex ) Or ( $aHit [ 1 ] <> $iSubIndex )) Then 
     _GUICtrlStatusBar_SetText ( $StatusBar , @TAB & StringFormat ( "HitTest Item: %d, SubItem: %d" , $aHit [ 0 ], $aHit [ 1 ])) 
     $iIndex = $aHit [ 0 ] 
     $iSubIndex = $aHit [ 1 ] 
   EndIf 
 EndFunc    ;==>ListView_Click 
 
 Func WM_NOTIFY( $hWnd , $iMsg , $iwParam , $ilParam ) 
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
         Case $LVN_COLUMNCLICK ; ���һ�� 
           $tInfo = DllStructCreate ( $tagNMLISTVIEW , $ilParam ) 
           memowrite ( "$LVN_COLUMNCLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tInfo , "Item" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & DllStructGetData ( $tInfo , "NewState" ) & @LF ) 
           memowrite( "-->OldState:" & @TAB & DllStructGetData ( $tInfo , "OldState" ) & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->Param:" & @TAB & DllStructGetData ( $tInfo , "Param" )) 
           ; �޷���ֵ 
         Case $LVN_KEYDOWN ; �Ѱ���һ�� 
           $tInfo = DllStructCreate ( $tagNMLVKEYDOWN , $ilParam ) 
           memowrite ( "$LVN_KEYDOWN" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->VKey:" & @TAB & DllStructGetData ( $tInfo , "VKey" ) & @LF ) 
           memowrite( "-->Flags:" & @TAB & DllStructGetData ( $tInfo , "Flags" )) 
           ; �޷���ֵ 
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
           ListView_Click() 
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
         Case $NM_KILLFOCUS ; �ؼ�ʧȥ���뽹�� 
           memowrite ( "$NM_KILLFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode ) 
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
         Case $NM_RETURN ; �ؼ��������뽹�����û��Ѱ���ENTER�� 
           memowrite ( "$NM_RETURN" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode ) 
           ; �޷���ֵ 
         Case $NM_SETFOCUS ; �ؼ����յ����뽹�� 
           memowrite ( "$NM_SETFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode ) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_NOTIFY 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 
 
