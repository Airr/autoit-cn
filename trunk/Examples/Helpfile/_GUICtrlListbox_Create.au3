 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIListBox.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 #include <Constants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hListBox , $edit 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "(UDF Created) List Box Create" , 400 , 296 ) 
   $hListBox = _GUICtrlListBox_Create ( $hGUI , "String upon creation" , 2 , 2 , 396 , 296 ) 
   $edit = GUICtrlCreateEdit ( "" , 10 , 30 , 380 , 180 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   GUISetState () 
 
   MsgBox ( 4160 , "Information" , "Adding Items" ) 
 
   GUIRegisterMsg ( $WM_COMMAND , "WM_COMMAND" ) 
 
   ; ����ļ� 
   _GUICtrlListBox_BeginUpdate ( $hListBox ) 
   _GUICtrlListBox_ResetContent ( $hListBox ) 
   _GUICtrlListBox_InitStorage ( $hListBox , 100 , 4096 ) 
   _GUICtrlListBox_Dir ( $hListBox , @WindowsDir & "\win*.exe" ) 
   _GUICtrlListBox_AddFile ( $hListBox , @WindowsDir & "\Notepad.exe" ) 
   _GUICtrlListBox_Dir ( $hListBox , "" , $DDL_DRIVES ) 
   _GUICtrlListBox_Dir ( $hListBox , "" , $DDL_DRIVES , False ) 
   _GUICtrlListBox_EndUpdate ( $hListBox ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 Func WM_COMMAND ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg 
   Local $hWndFrom , $iIDFrom , $iCode , $hWndListBox 
   If Not IsHWnd ( $hListBox ) Then $hWndListBox = GUICtrlGetHandle ( $hListBox ) 
   $hWndFrom = $ilParam 
   $iIDFrom = BitAND ( $iwParam , 0xFFFF ) ; Сд��ĸ 
   $iCode = BitShift ( $iwParam , 16 ) ; ��д��ĸ 
 
   Switch $hWndFrom 
     Case $hListBox , $hWndListBox 
       Switch $iCode 
         Case $LBN_DBLCLK ; �û�˫���б����е��ַ���ʱ���� 
           memowrite ( "$LBN_DBLCLK" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
         Case $LBN_ERRSPACE ; �б����޷���ָ����������㹻�ڴ�ʱ���� 
           memowrite ( "$LBN_ERRSPACE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
         Case $LBN_KILLFOCUS ; �б��䶪ʧ���̽���ʱ���� 
           memowrite ( "$LBN_KILLFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
         Case $LBN_SELCANCEL ; �û�ȡ�����б����е�ѡ��ʱ���� 
           memowrite ( "$LBN_SELCANCEL" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
         Case $LBN_SELCHANGE ; ���б����е�ѡ��ı�ʱ���� 
           memowrite ( "$LBN_SELCHANGE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
         Case $LBN_SETFOCUS ; ���б�����ռ��̽���ʱ���� 
           memowrite ( "$LBN_SETFOCUS" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $IDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $Code ) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   ; ִ��Ĭ�ϵ�Autoit3�ڲ���Ϣ����Ҳ������ȫ���Ը���. 
   ; !!!����û���κ�ֵ��'Return'��ʹ�ú��������޷�ִ��Ĭ�ϵ�Autoit3��Ϣ!!! 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_COMMAND 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 

