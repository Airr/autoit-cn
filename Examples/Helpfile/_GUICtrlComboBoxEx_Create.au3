 #include <GuiComboBoxEx.au3> 
 #include <WindowsConstants.au3> 
 #include <GuiConstantsEx.au3> 
 #include <EditConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hCombo , $edit 
 
 _Main () 
 
 Func _Main() 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( " ComboBoxEx Create ", 400 , 300 ) 
   $hCombo = _GUICtrlComboBoxEx_Create ( $hGUI , " This is a test|Line 2 ", 2 , 276 , 394 , 268 ) 
   $edit = GUICtrlCreateEdit ( "", 2 , 2 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_NOTIFY , " WM_NOTIFY " ) 
 
   _GUICtrlComboBoxEx_AddString ( $hCombo , " Some More Text " ) 
   _GUICtrlComboBoxEx_InsertString ( $hCombo , " Inserted Text ", 1 ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 Func WM_NOTIFY ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , " hWndFrom " ) 
   $iIDFrom = DllStructGetData ( $tNMHDR , " IDFrom " ) 
   $iCode = DllStructGetData ( $tNMHDR , " Code " ) 
   Switch $hWndFrom 
     Case $hCombo 
       Switch $iCode 
         Case $CBEN_BEGINEDIT ; �û����������б�����ؼ��༭��ʱ���� 
           memowrite ( " $CBEN_BEGINEDIT " & @LF ) 
           memowrite( " -->hWndFrom: " & @TAB & $hWndFrom & @LF ) 
           memowrite( " -->IDFrom: " & @TAB & $iIDFrom & @LF ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
           Return 0 
         Case $CBEN_DELETEITEM 
           _GetComboBoxEx( " $CBEN_DELETEITEM ", $ilParam ) 
           Return 0 
         Case $CBEN_DRAGBEGINA , $CBEN_DRAGBEGINW 
           Local $tInfo = DllStructCreate ( $tagNMCBEDRAGBEGIN , $ilParam ) 
           If DllStructGetData ( $tInfo , " ItemID " ) Then _GetComboBoxEx( " $CBEN_DRAGBEGIN ", $ilParam ) 
           memowrite( " $CBEN_DRAGBEGIN " & @LF) 
           memowrite( " -->hWndFrom: " & @TAB & DllStructGetData ( $tInfo , " hWndFrom " ) & @LF ) 
           memowrite( " -->IDFrom: " & @TAB & DllStructGetData ( $tInfo , " IDFrom " ) & @LF ) 
           memowrite( " -->Code: " & @TAB & DllStructGetData ( $tInfo , " Code " ) & @LF ) 
           memowrite( " -->ItemID: " & @TAB & DllStructGetData ( $tInfo , " ItemID " ) & @LF ) 
           memowrite( " -->Text: " & @TAB & DllStructGetData ( $tInfo , " Text " )) 
           ; ���Է���ֵ 
         Case $CBEN_ENDEDITA , $CBEN_ENDEDITW ; �û��Ա༭���в������������б���ѡȡһ��ʱ���� 
           Local $tInfo = DllStructCreate ( $tagNMCBEENDEDIT , $ilParam ) 
           memowrite( " $CBEN_ENDEDIT " & @LF) 
           memowrite( " -->hWndFrom: " & @TAB & DllStructGetData ( $tInfo , " hWndFrom " ) & @LF ) 
           memowrite( " -->IDFrom: " & @TAB & DllStructGetData ( $tInfo , " IDFrom " ) & @LF ) 
           memowrite( " -->Code: " & @TAB & DllStructGetData ( $tInfo , " Code " ) & @LF ) 
           memowrite( " -->fChanged: " & @TAB & DllStructGetData ( $tInfo , " fChanged " ) & @LF ) 
           memowrite( " -->NewSelection: " & @TAB & DllStructGetData ( $tInfo , " NewSelection " ) & @LF ) 
           memowrite( " -->Text: " & @TAB & DllStructGetData ( $tInfo , " Text " ) & @LF ) 
           memowrite( " -->Why: " & @TAB & DllStructGetData ( $tInfo , " Why " )) 
           Return False ; ����֪ͨ������ؼ���ʾѡȡ����Ŀ 
 ;~          Return True  ; ��֮ 
         Case $CBEN_GETDISPINFOA , $CBEN_GETDISPINFOW ; ���͹��ڻص���Ŀ����ʾ��Ϣ 
           _GetComboBoxEx( " $CBEN_GETDISPINFO ", $ilParam ) 
           Return 0 
         Case $CBEN_INSERTITEM 
           Local $tInfo = DllStructCreate ( $tagNMCOMBOBOXEX , $ilParam ) 
           Local $tBuffer = DllStructCreate ( " wchar Text[ " & DllStructGetData ( $tInfo , " TextMax " ) & " ] ", DllStructGetData ( $tInfo , " Text " )) 
           memowrite( " $CBEN_INSERTITEM " & @LF ) 
           memowrite( " -->hWndFrom: " & @TAB & DllStructGetData ( $tInfo , " hWndFrom " ) & @LF ) 
           memowrite( " -->IDFrom: " & @TAB & DllStructGetData ( $tInfo , " IDFrom " ) & @LF ) 
           memowrite( " -->Code: " & @TAB & DllStructGetData ( $tInfo , " Code " ) & @LF ) 
           memowrite( " -->Mask: " & @TAB & DllStructGetData ( $tInfo , " Mask " ) & @LF ) 
           memowrite( " -->Item: " & @TAB & DllStructGetData ( $tInfo , " Item " ) & @LF ) 
           memowrite( " -->Text: " & @TAB & DllStructGetData ( $tInfo , " Text " ) & @LF ) 
           memowrite( " -->TextMax: " & @TAB & DllStructGetData ( $tInfo , " TextMax " ) & @LF ) 
           memowrite( " -->Indent: " & @TAB & DllStructGetData ( $tInfo , " Indent " ) & @LF ) 
           memowrite( " -->Image: " & @TAB & DllStructGetData ( $tInfo , " Image " ) & @LF ) 
           memowrite( " -->SelectedImage: " & @TAB & DllStructGetData ( $tInfo , " SelectedImage " ) & @LF ) 
           memowrite( " -->OverlayImage: " & @TAB & DllStructGetData ( $tInfo , " OverlayImage " ) & @LF ) 
           memowrite( " -->Param: " & @TAB & DllStructGetData ( $tInfo , " Param " )) 
           Return 0 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc ;==>WM_NOTIFY 
 
 Func _GetComboBoxEx( $i , $ilParam ) 
   Local $tInfo = DllStructCreate ( $tagNMCOMBOBOXEX , $ilParam ) 
   Local $aItem = _GUICtrlComboBoxEx_GetItem ( $hCombo , DllStructGetData ( $tInfo , " Item " )) 
   memowrite( $i & @LF ) 
   memowrite( " -->hWndFrom: " & @TAB & DllStructGetData ( $tInfo , " hWndFrom " ) & @LF ) 
   memowrite( " -->IDFrom: " & @TAB & DllStructGetData ( $tInfo , " IDFrom " ) & @LF ) 
   memowrite( " -->Code: " & @TAB & DllStructGetData ( $tInfo , " Code " ) & @LF ) 
   memowrite( " -->Mask: " & @TAB & DllStructGetData ( $tInfo , " Mask " ) & @LF ) 
   memowrite( " -->Item: " & @TAB & DllStructGetData ( $tInfo , " Item " ) & @LF ) 
   memowrite( " -->Text: " & @TAB & $aItem[ 0 ] & @LF ) 
   memowrite( " -->TextMax: " & @TAB & $aItem[ 1 ] & @LF ) 
   memowrite( " -->Indent: " & @TAB & $aItem[ 3 ] & @LF ) 
   memowrite( " -->Image: " & @TAB & $aItem[ 4 ] & @LF ) 
   memowrite( " -->SelectedImage: " & @TAB & $aItem[ 5 ] & @LF ) 
   memowrite( " -->OverlayImage: " & @TAB & $aItem[ 6 ] & @LF ) 
   memowrite( " -->Param: " & @TAB & DllStructGetData ( $tInfo , " Param " )) 
 EndFunc ;==>_GetComboBoxEx 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1 ) 
 EndFunc ;==>memowrite 
 
