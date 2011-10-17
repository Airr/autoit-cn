 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTab.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_TAB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $hTab 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( " (UDF Created) Tab Control Create " , 400 , 300 ) 
   $hTab = _GUICtrlTab_Create ( $hGUI , 2 , 2 , 396 , 296 ) 
   $iMemo = GUICtrlCreateEdit ( " " , 2 , 32 , 396 , 266 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_NOTIFY , " WM_NOTIFY " ) 
 
   ; ��ӱ�ǩҳ 
   _GUICtrlTab_InsertItem ( $hTab , 0 , " Tab 1 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 1 , " Tab 2 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 2 , " Tab 3 " ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Main 
 
 Func WM_NOTIFY ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg, $iwParam 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR , $hWndTab 
   $hWndTab = $hTab 
   If Not IsHWnd ( $hTab ) Then $hWndTab = GUICtrlGetHandle ( $hTab ) 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , " hWndFrom " )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , " IDFrom " ) 
   $iCode = DllStructGetData ( $tNMHDR , " Code " ) 
   Switch $hWndFrom 
     Case $hWndTab 
       Switch $iCode 
         Case $NM_CLICK ; �ڿؼ��е�������� 
           memowrite( " $NM_CLICK " ) 
           memowrite( " --> hWndFrom: " & @TAB & $hWndFrom ) 
           memowrite( " -->DFrom: " & @TAB & $iIDFrom ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
           ; ��ǩ�ؼ����Է���ֵ 
         Case $NM_DBLCLK ; �ڿؼ���˫�������� 
           memowrite( " $NM_DBLCLK " ) 
           memowrite( " --> hWndFrom: " & @TAB & $hWndFrom ) 
           memowrite( " -->DFrom: " & @TAB & $iIDFrom ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
 ;~          Return 1 ; ��0Ϊ������Ĭ�ϲ��� 
           Return 0 ; 0Ϊ����Ĭ�ϲ��� 
         Case $NM_RCLICK ; �ڿؼ��е������Ҽ� 
           memowrite( " $NM_RCLICK " ) 
           memowrite( " --> hWndFrom: " & @TAB & $hWndFrom ) 
           memowrite( " -->DFrom: " & @TAB & $iIDFrom ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
 ;~          Return 1 ; ��0Ϊ������Ĭ�ϲ��� 
           Return 0 ; 0Ϊ����Ĭ�ϲ��� 
         Case $NM_RDBLCLK ; �ڿؼ���˫������Ҽ� 
           memowrite( " $NM_RDBLCLK " ) 
           memowrite( " --> hWndFrom: " & @TAB & $hWndFrom ) 
           memowrite( " -->DFrom: " & @TAB & $iIDFrom ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
 ;~          Return 1 ; ��0Ϊ������Ĭ�ϲ��� 
           Return 0 ; 0Ϊ����Ĭ�ϲ��� 
         Case $NM_RELEASEDCAPTURE ; �ؼ��ͷ���겶׽ 
           memowrite( " $NM_RELEASEDCAPTURE " ) 
           memowrite( " --> hWndFrom: " & @TAB & $hWndFrom ) 
           memowrite( " -->DFrom: " & @TAB & $iIDFrom ) 
           memowrite( " -->Code: " & @TAB & $iCode ) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc ;==>WM_NOTIFY 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $iMemo , $s_text , 1 ) 
 EndFunc ;==>memowrite 
 
