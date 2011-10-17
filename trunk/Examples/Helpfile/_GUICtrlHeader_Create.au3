 #include <GuiConstantsEx.au3> 
 #include <GuiHeader.au3> 
 #include <WindowsConstants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_HDR = False ; ��鴫�ݸ��ؼ�������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $hHeader , $edit 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "Header" , 400 , 300 ) 
   $hHeader = _GUICtrlHeader_Create ( $hGUI ) 
   $edit = GUICtrlCreateEdit ( "" , 2 , 40 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   GUISetState () 
   
   GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
   ; ����� 
   _GUICtrlHeader_AddItem ( $hHeader , "1" , 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , "2" , 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , "3" , 100 ) 
   _GUICtrlHeader_AddItem ( $hHeader , "4" , 100 ) 
 
   ; ������й����� 
   _GUICtrlHeader_ClearFilterAll ( $hHeader ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 Func WM_NOTIFY ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   Local $hWndFrom , $iIDFrom , $iCode 
   Local $tNMHDR , $tNMHEADER , $tNMHDFILTERBTNCLICK , $tNMHDDISPINFO 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hHeader 
       Switch $iCode 
         Case $HDN_BEGINDRAG ; ���ؼ���һ����Ŀ����ҷʱ���� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_BEGINDRAG" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           Return False ; ����ؼ��Զ�������ҷ���� 
 ;~            Return True  ; ָʾ�ⲿ(�ֶ�)��ҷ��������ؼ������ṩ��Ϊ��ҷ����һ���ֵ��Զ������ 
         Case $HDN_BEGINTRACK , $HDN_BEGINTRACKW ; ֪ͨ�ؼ��������û���ʼ�϶��ؼ��еķָ��� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_BEGINTRACK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           Return False ; ������ٷָ��� 
 ;~            Return True  ; ��ֹ���� 
         Case $HDN_DIVIDERDBLCLICK , $HDN_DIVIDERDBLCLICKW ; ֪ͨ�ؼ��������û�˫���ؼ��еķָ��� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_DIVIDERDBLCLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_ENDDRAG ; ��Կؼ����϶�����ʱ�ɿؼ����� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ENDDRAG" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           Return False ; ����ؼ��Զ����úͼ�¼��Ŀ 
 ;~            Return True  ; ��ֹ������Ŀ 
         Case $HDN_ENDTRACK , $HDN_ENDTRACKW ; ֪ͨ�ؼ��������û�����϶��ؼ��еķָ��� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ENDTRACK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_FILTERBTNCLICK ; �������˰�����Ӧ��$HDM_SETITEM��Ϣʱ֪ͨ�ؼ������� 
           $tNMHDFILTERBTNCLICK = DllStructCreate ( $tagNMHDFILTERBTNCLICK , $ilParam ) 
           memowrite( "$HDN_FILTERBTNCLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Item" ) & @LF ) 
           memowrite( "-->Left:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Left" ) & @LF ) 
           memowrite( "-->Top:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Top" ) & @LF ) 
           memowrite( "-->Right:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Right" ) & @LF ) 
           memowrite( "-->Bottom:" & @TAB & DllStructGetData ( $HDN_FILTERBTNCLICK , "Bottom" )) 
 ;~            Return True  ; $HDN_FILTERCHANGE֪ͨ�����͵��ؼ������� 
           ; ��֪ͨʹ�����ڿɽ��û�����Ԫ��ͬ�� 
           Return False ; �����뷢��֪ͨʱ 
         Case $HDN_FILTERCHANGE ; ֪ͨ�ؼ������ڿؼ��������������ڸı�򱻱༭ 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_FILTERCHANGE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_GETDISPINFO , $HDN_GETDISPINFOW ; ���͸��ؼ������ؼ���Ҫ�ص����������Ϣ 
           $HDN_GETDISPINFO = DllStructCreate ( $tagNMHDDISPINFO , $ilParam ) 
           memowrite( "$HDN_GETDISPINFO" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $HDN_GETDISPINFO , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $HDN_GETDISPINFO , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $HDN_GETDISPINFO , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $HDN_GETDISPINFO , "Item" )) 
 ;~            �޷���ֵ 
         Case $HDN_ITEMCHANGED , $HDN_ITEMCHANGEDW ; ֪ͨ�ؼ������ڱ����������Ѹı� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ITEMCHANGED" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_ITEMCHANGING , $HDN_ITEMCHANGINGW ; ֪ͨ�ؼ������ڱ��������Խ��ı� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ITEMCHANGING" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           Return False ; ����ı� 
 ;~            Return True  ; ��ֹ�ı� 
         Case $HDN_ITEMCLICK , $HDN_ITEMCLICKW ; ֪ͨ�ؼ��������û������ؼ� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ITEMCLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_ITEMDBLCLICK , $HDN_ITEMDBLCLICKW ; ֪ͨ�ؼ��������û�˫���ؼ� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_ITEMDBLCLICK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           ; �޷���ֵ 
         Case $HDN_TRACK , $HDN_TRACKW ; ֪ͨ�ؼ��������û�������ҷ�������ؼ��е�һ���ָ��� 
           $tNMHEADER = DllStructCreate ( $tagNMHEADER , $ilParam ) 
           memowrite( "$HDN_TRACK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tNMHEADER , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tNMHEADER , "Code" ) & @LF ) 
           memowrite( "-->Item:" & @TAB & DllStructGetData ( $tNMHEADER , "Item" ) & @LF ) 
           memowrite( "-->Button:" & @TAB & DllStructGetData ( $tNMHEADER , "Button" )) 
           Return False ; �������ٷָ��� 
 ;~            Return True  ; �������� 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_NOTIFY 
 
 Func memowrite ( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 
 
