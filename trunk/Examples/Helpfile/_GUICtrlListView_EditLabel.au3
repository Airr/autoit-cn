 
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
   $hListView = GUICtrlCreateListView ("", 2 , 2 , 394 , 268 , BitOR ( $LVS_EDITLABELS , $$LVS_REPORT )) 
   _GUICtrlListView_SetUnicodeFormat ( $hListView , false ) 
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
   _GUICtrlListView_AddSubItem ( $hListView , 0 , "Row 1: Col 2" , 1 ) 
   _GUICtrlListView_AddSubItem ( $hListView , 0 , "Row 1: Col 3" , 2 ) 
   _GUICtrlListView_AddItem ( $hListView , "Row 2: Col 1" , 1 ) 
   _GUICtrlListView_AddSubItem ( $hListView , 1 , "Row 2: Col 2" , 1 ) 
   _GUICtrlListView_AddItem ( $hListView , "Row 3: Col 1" , 2 ) 
 
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
         Case $LVN_BEGINLABELEDITA, $LVN_BEGINLABELEDITW ; ��ʼ�༭��Ŀ��ǩ 
           $tInfo = DllStructCreate ( $tagNMLISTVIEW , $ilParam ) 
           memowrite ( "$LVN_BEGINLABELEDIT" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Mask:" & @TAB & $Mask & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tInfo , "Item" ) & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->State:" & @TAB & $State & @LF ) 
           memowrite( "-->StateMask:" & @TAB & $iStateMask & @LF ) 
           memowrite( "-->Image:" & @TAB & DllStructGetData ( $tInfo , "Image" ) & @LF ) 
           memowrite( "-->Param:" & @TAB & DllStructGetData ( $tInfo , "Param" ) & @LF ) 
           memowrite( "-->Indent:" & @TAB & DllStructGetData ( $tInfo , "Indent" ) & @LF ) 
           memowrite( "-->GroupID:" & @TAB & DllStructGetData ( $tInfo , "GroupID" ) & @LF ) 
           memowrite( "-->Columns:" & @TAB & DllStructGetData ( $tInfo , "Columns" ) & @LF ) 
           memowrite( "-->pColumns:" & @TAB & DllStructGetData ( $tInfo , "pColumns" ) & @LF ) 
           Return False ; ����༭��ǩ 
           ;Return True ; ��ֹ�༭��ǩ 
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
       Case $LVN_DELETEITEM ; ��ɾ��һ�� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           memowrite ( "$LVN_DELETEITEM" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Item:" & @TAB & $Item & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->NewState:" & @TAB & $NewState & @LF ) 
           memowrite( "-->OldState:" & @TAB & $OldState & @LF ) 
           memowrite( "-->Changed:" & @TAB & DllStructGetData ( $tInfo , "Changed" ) & @LF ) 
           memowrite( "-->ActionX:" & @TAB & DllStructGetData ( $tInfo , "ActionX" ) & @LF ) 
           memowrite( "-->ActionY:" & @TAB & DllStructGetData ( $tInfo , "ActionY" ) & @LF ) 
           memowrite( "-->Param:" & @TAB & DllStructGetData ( $tInfo , "Param" ) & @LF ) 
         ; �޷���ֵ 
       Case $LVN_ENDLABELEDIT, $LVN_ENDLABELEDITW ; ��Ŀ��ǩ�༭���� 
           $tInfo = DllStructCreate ( $tagNMITEMACTIVATE , $ilParam ) 
           $tBuffer = DllStructCreate ( "char Text[" & DllStructGetData ( $tInfo , "TextMax" ) & "]", & DllStructGetData ( $tInfo , "TextMax" )) 
           memowrite ( "$LVN_ENDLABELEDIT" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Mask:" & @TAB & $Mask & @LF ) 
           memowrite( "-->Item:" & @TAB & $Item & @LF ) 
           memowrite( "-->SubItem:" & @TAB & DllStructGetData ( $tInfo , "SubItem" ) & @LF ) 
           memowrite( "-->State:" & @TAB & $State & @LF ) 
           memowrite( "-->StateMask:" & @TAB & $iStateMask & @LF ) 
           memowrite( "-->Text:" & @TAB & $iText & @LF ) 
           memowrite( "-->TextMax:" & @TAB & DllStructGetData ( $tInfo , "TextMax" ) & @LF ) 
           memowrite( "-->Image:" & @TAB & DllStructGetData ( $tInfo , "Image" ) & @LF ) 
           memowrite( "-->Param:" & @TAB & DllStructGetData ( $tInfo , "Param" ) & @LF ) 
           memowrite( "-->Indent:" & @TAB & DllStructGetData ( $tInfo , "Indent" ) & @LF ) 
           memowrite( "-->GroupID:" & @TAB & DllStructGetData ( $tInfo , "GroupID" ) & @LF ) 
           memowrite( "-->Columns:" & @TAB & DllStructGetData ( $tInfo , "Columns" ) & @LF ) 
           memowrite( "-->pColumns:" & @TAB & DllStructGetData ( $tInfo , "pColumns" ) & @LF ) 
           ; ����ı��ǿ�, ��������������Ŀ��ǩΪ�༭���ı�, ���ؼپܾ� 
           ; ����ı�Ϊ�պ��Է���ֵ 
           Return True 
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
 
