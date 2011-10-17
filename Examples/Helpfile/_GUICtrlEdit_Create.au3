
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiEdit.au3> 
 #include <WinAPI.au3> ; used for Lo/Hi word 
 #include <WindowsConstants.au3> 
 #include <GuiConstantsEx.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_Ed = False ; �鿴���ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hEdit 
 
 _Example1 () 
 _Example2 () 
 
 Func _Example1 () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "Edit Create" , 400 , 532 ) 
   $hEdit = _GUICtrlEdit_Create ( $hGUI , "This is a test" & @CRLF & "Another Line" , 2 , 2 , 394 , 268 ) 
   $iMemo = GUICtrlCreateEdit ( "" , 2 , 272 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_COMMAND , "WM_COMMAND" ) 
 
   _GUICtrlEdit_AppendText ( $hEdit , @CRLF & "Append to the end?" ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Example1 
 
 Func _Example2 () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "Edit Create" , 400 , 532 ) 
   $hEdit = _GUICtrlEdit_Create ( $hGUI , "" , 2 , 2 , 394 , 268 ) 
   $iMemo = GUICtrlCreateEdit ( "" , 2 , 272 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_COMMAND , "WM_COMMAND" ) 
 
   _GUICtrlEdit_SetText ( $hEdit , "This is a test" & @CRLF & "Another Line" ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Example2 
 
 Func WM_COMMAND ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg 
   Local $hWndFrom , $iIDFrom , $iCode , $hWndEdit 
   If Not IsHWnd ( $hEdit ) Then $hWndEdit = GUICtrlGetHandle ( $hEdit ) 
   $hWndFrom = $ilParam 
  $iIDFrom = _WinAPI_LoWord ( $iwParam ) 
   $iCode = _WinAPI_HiWord ( $iwParam ) 
   Switch $hWndFrom 
     Case $hEdit , $hWndEdit 
       Switch $iCode 
         Case $EN_ALIGN_LTR_EC ; ���༭�ؼ������Ϊ������ʱ���� 
           memowrite ( "$EN_ALIGN_LTR_EC" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_ALIGN_RTL_EC ; ���༭�ؼ������Ϊ���ҵ���ʱ���� 
           memowrite ( "$EN_ALIGN_RTL_EC" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_CHANGE ; �ı�ؼ��е��ı�ʱ���� 
           memowrite ( "$EN_CHANGE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_ERRSPACE ; �ؼ��޷������㹻�ڴ�����ָ������ʱ���� 
           memowrite ( "$EN_ERRSPACE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_HSCROLL ; ����ؼ�ˮƽ������ʱ���� 
           memowrite ( "$EN_HSCROLL" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_KILLFOCUS ; �ؼ���ʧ���̽���ʱ���� 
           memowrite ( "$EN_KILLFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_MAXTEXT ; ��ǰ�ı������ѳ����༭���ַ���ָ������ʱ���� 
           memowrite ( "$EN_MAXTEXT" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; ���༭�ؼ�������$ES_AUTOHSCROLL��ʽ�ҽ�������ַ������������༭�ؼ����ʱ�ᷢ��. 
           ; ���༭�ؼ�������$ES_AUTOVSCROLL��ʽ�Ҳ����ı�������ԭ�ı����������������ؼ��߶�ʱҲ�ᷢ�� 
           ; �޷���ֵ 
         Case $EN_SETFOCUS ; �ؼ��յ����̽���ʱ���� 
           memowrite ( "$EN_SETFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_UPDATE ; �༭�ؼ����ػ�ʱ���� 
           memowrite ( "$EN_UPDATE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
         Case $EN_VSCROLL ; ����༭�ؼ���ֱ���������ڿؼ���ת��������ʱ���� 
           memowrite ( "$EN_VSCROLL" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_COMMAND 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $iMemo , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 

