 
 #AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiListView.au3> 
 #include <GuiImageList.au3> 
 #include <WindowsConstants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_LV = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $hListView , $edit 
 
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
 ;~Local $tBuffer 
   $hWndListView = $hListView 
   If Not IsHWnd ( $hListView ) Then $hWndListView = GUICtrlGetHandle ( $hListView ) 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hWndListView 
       Switch $iCode 
 ;~      Case $LVN_BEGINDRAG ; ��ʼ������������ҷ���� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_BEGINDRAG" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_BEGINLABELEDIT ; ��ʼ�༭��Ŀ��ǩ 
 ;~        $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam) 
 ;~        memowrite("$LVN_BEGINLABELEDIT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("State:" & @TAB & DllStructGetData($tInfo, "State") & @LF) 
 ;~        memowrite("StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF) 
 ;~        memowrite("Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF) 
 ;~        memowrite("Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF) 
 ;~        memowrite("GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF) 
 ;~        memowrite("Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF) 
 ;~        memowrite("pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns")) 
 ;~        Return False ; ����༭��ǩ 
 ;~        ;Return True  ; ���Ʊ༭��ǩ 
 ;~      Case $LVN_BEGINRDRAG ; ��ʼ������Ҽ�����ҷ���� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_BEGINRDRAG" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_BEGINSCROLL ; ��ʼ��������, ��СϵͳWinXP 
 ;~        $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam) 
 ;~        memowrite("$LVN_BEGINSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF) 
 ;~        memowrite("DY:" & @TAB & DllStructGetData($tInfo, "DY")) 
 ;~        ; �޷���ֵ 
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
 ;~      Case $LVN_DELETEALLITEMS ; ��ɾ���ؼ��������� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_DELETEALLITEMS" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        Return True ; To suppress subsequent $LVN_DELETEITEM messages 
 ;~        ;Return False ; To receive subsequent $LVN_DELETEITEM messages 
 ;~      Case $LVN_DELETEITEM ; ��ɾ��һ�� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_DELETEITEM" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_ENDLABELEDIT ; ��Ŀ��ǩ�༭���� 
 ;~        $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam) 
 ;~        $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text")) 
 ;~        memowrite("$LVN_ENDLABELEDIT" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("State:" & @TAB & DllStructGetData($tInfo, "State") & @LF) 
 ;~        memowrite("StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF) 
 ;~        memowrite("Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF) 
 ;~        memowrite("TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF) 
 ;~        memowrite("Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF) 
 ;~        memowrite("Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF) 
 ;~        memowrite("GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF) 
 ;~        memowrite("Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF) 
 ;~        memowrite("pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns")) 
 ;~        ; ����ı��ǿ�, ��������������Ŀ��ǩΪ�༭���ı�, ���ؼپܾ� 
 ;~        ; ����ı�Ϊ�պ��Է���ֵ 
 ;~        Return True 
 ;~      Case $LVN_ENDSCROLL ; ������������, ��СϵͳWinXP 
 ;~        $tInfo = DllStructCreate($tagNMLVSCROLL, $ilParam) 
 ;~        memowrite("$LVN_ENDSCROLL" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("DX:" & @TAB & DllStructGetData($tInfo, "DX") & @LF) 
 ;~        memowrite("DY:" & @TAB & DllStructGetData($tInfo, "DY")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_GETDISPINFO ; �ṩ��ʾ�������б���Ŀ�ı�Ҫ��Ϣ 
 ;~        $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam) 
 ;~        $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text")) 
 ;~        memowrite("$LVN_GETDISPINFO" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("State:" & @TAB & DllStructGetData($tInfo, "State") & @LF) 
 ;~        memowrite("StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF) 
 ;~        memowrite("Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF) 
 ;~        memowrite("TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF) 
 ;~        memowrite("Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF) 
 ;~        memowrite("Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF) 
 ;~        memowrite("GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF) 
 ;~        memowrite("Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF) 
 ;~        memowrite("pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_GETINFOTIP ; ��$LVS_EX_INFOTIP��ʽ�Ĵ�ͼ���б���ͼ���� 
 ;~        $tInfo = DllStructCreate($tagNMLVGETINFOTIP, $ilParam) 
 ;~        $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text")) 
 ;~        memowrite("$LVN_GETINFOTIP" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Flags:" & @TAB & DllStructGetData($tInfo, "Flags") & @LF) 
 ;~        memowrite("Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF) 
 ;~        memowrite("TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("lParam:" & @TAB & DllStructGetData($tInfo, "lParam")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_HOTTRACK ; �û����������һ����ʱ���б���ͼ�ؼ����� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_HOTTRACK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        Return 0 ; �����б���ͼִ�м򵥵ĸ���ѡ������. 
 ;~        ;Return 1 ; ��Ŀ����ѡ��. 
 ;~      Case $LVN_INSERTITEM ; ��������Ŀ 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_INSERTITEM" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_ITEMACTIVATE ; ����һ��ʱ���б���ͼ�ؼ����� 
 ;~        $tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam) 
 ;~        memowrite("$LVN_ITEMACTIVATE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Index:" & @TAB & DllStructGetData($tInfo, "Index") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @LF) 
 ;~        memowrite("KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags")) 
 ;~        Return 0 
 ;~      Case $LVN_ITEMCHANGED ; �Ѹı�һ�� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_ITEMCHANGED" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        ; �޷���ֵ 
 ;~      Case $LVN_ITEMCHANGING ; �Ѹı�һ�� 
 ;~        $tInfo = DllStructCreate($tagNMLISTVIEW, $ilParam) 
 ;~        memowrite("$LVN_ITEMCHANGING" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @LF) 
 ;~        memowrite("OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @LF) 
 ;~        memowrite("Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @LF) 
 ;~        memowrite("ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @LF) 
 ;~        memowrite("ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param")) 
 ;~        Return True ; ��ֹ�ı� 
 ;~        ;Return False ; ����ı� 
         Case $LVN_KEYDOWN ; �Ѱ���һ�� 
           $tInfo = DllStructCreate ( $tagNMLVKEYDOWN , $ilParam ) 
           memowrite ( "$LVN_KEYDOWN" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->VKey:" & @TAB & DllStructGetData ( $tInfo , "VKey" ) & @LF ) 
           memowrite( "-->Flags:" & @TAB & DllStructGetData ( $tInfo , "Flags" )) 
           ; �޷���ֵ 
 ;~      Case $LVN_MARQUEEBEGIN ; �ѿ�ʼ�󶨾���ѡȡ 
 ;~        memowrite("$LVN_MARQUEEBEGIN" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode) 
 ;~        Return 0 ; ������Ϣ 
 ;~        ;Return 1 ; �˳���ѡȡ 
 ;~      Case $LVN_SETDISPINFO ; ����ά����Ŀ����Ϣ 
 ;~        $tInfo = DllStructCreate($tagNMLVDISPINFO, $ilParam) 
 ;~        $tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text")) 
 ;~        memowrite("$LVN_SETDISPINFO" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode & @LF) 
 ;~        memowrite("Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @LF) 
 ;~        memowrite("Item:" & @TAB & DllStructGetData($tInfo, "Item") & @LF) 
 ;~        memowrite("SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @LF) 
 ;~        memowrite("State:" & @TAB & DllStructGetData($tInfo, "State") & @LF) 
 ;~        memowrite("StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @LF) 
 ;~        memowrite("Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @LF) 
 ;~        memowrite("TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @LF) 
 ;~        memowrite("Image:" & @TAB & DllStructGetData($tInfo, "Image") & @LF) 
 ;~        memowrite("Param:" & @TAB & DllStructGetData($tInfo, "Param") & @LF) 
 ;~        memowrite("Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @LF) 
 ;~        memowrite("GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @LF) 
 ;~        memowrite("Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @LF) 
 ;~        memowrite("pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns")) 
 ;~        ; �޷���ֵ 
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
 ;~      Case $NM_HOVER ; ���������Ŀ��ʱ�ɿؼ����� 
 ;~        memowrite("$NM_HOVER" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF) 
 ;~        memowrite("IDFrom:" & @TAB & $iIDFrom & @LF) 
 ;~        memowrite("Code:" & @TAB & $iCode) 
 ;~        Return 0 ; �򵥻��� 
 ;~        ;Return 1 ; ��ֹ������� 
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
 
 Func memowrite ( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 
 
