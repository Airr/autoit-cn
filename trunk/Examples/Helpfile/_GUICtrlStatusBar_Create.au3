
 #include <GuiConstantsEx.au3> 
 #include <GuiStatusBar.au3> 
 #include  <ComboConstants.au3> 
#include <EditConstants.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_SB =  False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo , $MainGUI , $hStatus , $edit 
 
 Example1 () 
 Example2 () 
 Example3 () 
 Example4 () 
 Example5 () 
 Example6 () 
 
 Func Example1 () 
 
     Local $hGUI 
     Local $aParts [ 3 ] = [ 75 , 150 , - 1 ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 1) StatusBar Create" , 400 , 300 ) 
 
     ; Ĭ��һ������, ���ı� 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI ) 
     _GUICtrlStatusBar_SetParts ( $hStatus , $aParts ) 
 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
    GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & @TAB & "Handle to GUI window" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
    Until GUIGetMsg () = $GUI_EVENT_CLOSE 
       GUISetState ( @SW_ENABLE , $MainGUI ) 
       GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example1 
 
 Func Example2 () 
 
     Local $hGUI 
     Local $aParts [ 3 ] = [ 75 , 150 , - 1 ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 2) StatusBar Create" , 400 , 300 ) 
 
     ; ���ò����ı��Ķ������ 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI , $aParts ) 
 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
     GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & _ 
             @TAB & "Handle to GUI window" & @CRLF & _ 
             @TAB & "part width array of 3 elements" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUISetState ( @SW_ENABLE , $MainGUI ) 
     GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example2 
 
 Func Example3 () 
 
     Local $hGUI 
     Local $aText [ 3 ] = [ "Left Justified" , @TAB & "Centered" , @TAB & @TAB & "Right Justified" ] 
     Local $aParts [ 3 ] = [ 100 , 175 , - 1 ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 3) StatusBar Create" , 400 , 300 ) 

     ; ���ô��ı��Ķ������ 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI , $aParts , $aText ) 
 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
     GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & _ 
             @TAB & "only Handle," & @CRLF & _ 
             @TAB & "part width array of 3 elements" & @CRLF & _ 
             @TAB & "part text array of 3 elements" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
    ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUISetState ( @SW_ENABLE , $MainGUI ) 
     GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example3 
 
 Func Example4 () 
 
     Local $hGUI 
     Local $aText [ 3 ] = [ "Left Justified" , @TAB & "Centered" , @TAB & @TAB & "Right Justified" ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 4) StatusBar Create" , 400 , 300 ) 
 
     ; �������ڿ�Ȳ����Ĳ��� 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI , 100 , $aText ) 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
     GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & _ 
             @TAB & "only Handle," & @CRLF & _ 
             @TAB & "part width number" & @CRLF & _ 
             @TAB & "part text array of 3 elements" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUISetState ( @SW_ENABLE , $MainGUI ) 
     GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example4 
 
 Func Example5 () 
 
     Local $hGUI 
     Local $aText [ 3 ] = [ "Left Justified" , @TAB & "Centered" , @TAB & @TAB & "Right Justified" ] 
     Local $aParts [ 2 ] = [ 100 , 175 ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 5) StatusBar Create" , 400 , 300 ) 
 
     ; ����Ϊ���ݹ������������ (�ı��������) 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI , $aParts , $aText ) 
 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
     GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & _ 
             @TAB & "only Handle," & @CRLF & _ 
             @TAB & "part width array of 2 elements" & @CRLF & _ 
             @TAB & "part text array of 3 elements" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUISetState ( @SW_ENABLE , $MainGUI ) 
     GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example5 
 
 Func Example6 () 
 
     Local $hGUI 
     Local $aText [ 2 ] = [ "Left Justified" , @TAB & "Centered" ] 
     Local $aParts [ 3 ] = [ 100 , 175 , - 1 ] 
 
     ; �������� 
     $hGUI = GUICreate ( "(Example 6) StatusBar Create" , 400 , 300 ) 
 
     ; ����Ϊ���ݹ������������(���ֿ�����) 
     $hStatus = _GUICtrlStatusBar_Create ( $hGUI , $aParts , $aText ) 
     ; ������¼��ز����Ŀؼ� 
     $edit = GUICtrlCreateEdit ( "" , 2 , 136 , 396 , 138 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL , $ES_READONLY )) 
     ; ������ʾ�ؼ���Ϣ�Ŀؼ� 
     $iMemo = GUICtrlCreateEdit ( "" , 2 , 2 , 396 , 133 , $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , "Courier New" ) 
     GUICtrlSendMsg ( $iMemo , $EM_SETREADONLY , True , 0 ) 
     GUICtrlSetBkColor ( $iMemo , 0xFFFFFF ) 
     infoout ( "StatusBar Created with:" & @CRLF & _ 
             @TAB & "only Handle," & @CRLF & _ 
             @TAB & "part width array of 3 elements" & @CRLF & _ 
             @TAB & "part text array of 2 elements" & @CRLF ) 
     GUISetState () 
 
     GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
     ; ��ȡ�߽�ߴ� 
     infoout ( "Horizontal border width .: " & _GUICtrlStatusBar_GetBordersHorz ( $hStatus )) 
     infoout ( "Vertical border width ...: " & _GUICtrlStatusBar_GetBordersVert ( $hStatus )) 
     infoout ( "Width between rectangles : " & _GUICtrlStatusBar_GetBordersRect ( $hStatus )) 
     infoout ( " " ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until GUIGetMsg () = $GUI_EVENT_CLOSE 
     GUISetState ( @SW_ENABLE , $MainGUI ) 
     GUIDelete ( $hGUI ) 
 EndFunc    ;==>Example6 
 
 ; ��memo�ؼ�д����Ϣ 
 Func infoout ( $sMessage = "" ) 
     GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc    ;==>infoout 
 
 Func WM_NOTIFY( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg, $iwParam 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR , $tInfo 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hStatus 
       Switch $iCode 
         Case $NM_CLICK ; �����������Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMMOUSE , $ilParam ) 
           $hWndFrom = DllStructCreate ( $tagNMMOUSE , "hWndFrom" ) 
           $iIDFrom = DllStructCreate ( $tagNMMOUSE , "IDFrom" ) 
           $iCode = DllStructCreate ( $tagNMMOUSE , "Code" ) 
           memowrite( "$NM_CLICK" & @LF ) 
           memowrite( "-->$hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->ItemSpec:" & @TAB & DllStructGetData ( $tInfo , "ItemSpec" ) & @LF ) 
           memowrite( "-->ItemData:" & @TAB & DllStructGetData ( $tInfo , "ItemData" ) & @LF ) 
           memowrite( "-->X:" & @TAB & DllStructGetData ( $tInfo , "X" ) & @LF ) 
           memowrite( "-->Y:" & @TAB & DllStructGetData ( $tInfo , "Y" ) & @LF ) 
           memowrite( "-->HitInfo:" & @TAB & DllStructGetData ( $tInfo , "HitInfo" )) 
           Return TRUE ; ��ʾ�ѻ�ȡ���������ϵͳ��ֹĬ�ϲ��� 
 ;~         Return FALSE ;��������Ĭ�ϲ���. 
         Case $NM_DBLCLK   ; �ڿؼ���˫�������� 
           $tInfo = DllStructCreate ( $tagNMMOUSE , $ilParam ) 
           $hWndFrom = DllStructCreate ( $tagNMMOUSE , "hWndFrom" ) 
           $iIDFrom = DllStructCreate ( $tagNMMOUSE , "IDFrom" ) 
           $iCode = DllStructCreate ( $tagNMMOUSE , "Code" ) 
           memowrite ( "$NM_DBLCLK" & @LF ) 
           memowrite( "-->$hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->ItemSpec:" & @TAB & DllStructGetData ( $tInfo , "ItemSpec" ) & @LF ) 
           memowrite( "-->ItemData:" & @TAB & DllStructGetData ( $tInfo , "ItemData" ) & @LF ) 
           memowrite( "-->X:" & @TAB & DllStructGetData ( $tInfo , "X" ) & @LF ) 
           memowrite( "-->Y:" & @TAB & DllStructGetData ( $tInfo , "Y" ) & @LF ) 
           memowrite( "-->HitInfo:" & @TAB & DllStructGetData ( $tInfo , "HitInfo" )) 
           Return TRUE ; ��ʾ�ѻ�ȡ���������ϵͳ��ֹĬ�ϲ��� 
 ;~         Return FALSE ;��������Ĭ�ϲ���. 
         Case $NM_RCLICK ; ����Ҽ������Ŀʱ�ɿؼ����� 
           $tInfo = DllStructCreate ( $tagNMMOUSE , $ilParam ) 
           $hWndFrom = DllStructCreate ( $tagNMMOUSE , "hWndFrom" ) 
           $iIDFrom = DllStructCreate ( $tagNMMOUSE , "IDFrom" ) 
           $iCode = DllStructCreate ( $tagNMMOUSE , "Code" ) 
           memowrite ( "$NM_RCLICK" & @LF ) 
           memowrite( "-->$hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->ItemSpec:" & @TAB & DllStructGetData ( $tInfo , "ItemSpec" ) & @LF ) 
           memowrite( "-->ItemData:" & @TAB & DllStructGetData ( $tInfo , "ItemData" ) & @LF ) 
           memowrite( "-->X:" & @TAB & DllStructGetData ( $tInfo , "X" ) & @LF ) 
           memowrite( "-->Y:" & @TAB & DllStructGetData ( $tInfo , "Y" ) & @LF ) 
           memowrite( "-->HitInfo:" & @TAB & DllStructGetData ( $tInfo , "HitInfo" )) 
           Return TRUE ; ��ʾ�ѻ�ȡ���������ϵͳ��ֹĬ�ϲ��� 
 ;~         Return FALSE ;��������Ĭ�ϲ���. 
         Case $NM_RDBLCLK   ; �ڿؼ���˫������Ҽ� 
           $tInfo = DllStructCreate ( $tagNMMOUSE , $ilParam ) 
           $hWndFrom = DllStructCreate ( $tagNMMOUSE , "hWndFrom" ) 
           $iIDFrom = DllStructCreate ( $tagNMMOUSE , "IDFrom" ) 
           $iCode = DllStructCreate ( $tagNMMOUSE , "Code" ) 
           memowrite ( "$NM_DBLCLK" & @LF ) 
           memowrite( "-->$hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->ItemSpec:" & @TAB & DllStructGetData ( $tInfo , "ItemSpec" ) & @LF ) 
           memowrite( "-->ItemData:" & @TAB & DllStructGetData ( $tInfo , "ItemData" ) & @LF ) 
           memowrite( "-->X:" & @TAB & DllStructGetData ( $tInfo , "X" ) & @LF ) 
           memowrite( "-->Y:" & @TAB & DllStructGetData ( $tInfo , "Y" ) & @LF ) 
           memowrite( "-->HitInfo:" & @TAB & DllStructGetData ( $tInfo , "HitInfo" )) 
           Return TRUE ; ��ʾ�ѻ�ȡ���������ϵͳ��ֹĬ�ϲ��� 
 ;~         Return FALSE ;��������Ĭ�ϲ���. 
         Case $SBN_SIMPLEMODECHANGE   ; �ڿؼ���˫������Ҽ� 
           memowrite ( "$SBN_SIMPLEMODECHANGE" & @LF ) 
           memowrite( "-->$hWndFrom:" = @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode ) 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc ;==>WM_NOTIFY 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 

