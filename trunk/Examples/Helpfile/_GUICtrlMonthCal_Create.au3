 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiMonthCal.au3> 
 #include <WindowsConstants.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_MC = False ; ��鴫�ݸ�MonthCal����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hMonthCal , $edit 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "Month Calendar Create" , 460 , 190 ) 
   $edit = GUICtrlCreateEdit ( "" , 228 , 4 , 225 , 180 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   $hMonthCal = _GUICtrlMonthCal_Create ( $hGUI , 4 , 4 , $WS_BORDER ) 
   GUISetState () 
 
   GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Main 
 
 Func WM_NOTIFY ( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg, $iwParam 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR , $tInfo 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hMonthCal 
       Switch $iCode 
         Case $MCN_GETDAYSTATE ; �����ؼ�������Ϣȷ�������ʾ������ 
           $tInfo = DllStructCreate ( $tagNMDAYSTATE , $ilParam ) 
           memowrite( "$MCN_GETDAYSTATE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->Year:" & @TAB & DllStructGetData ( $tInfo , "Year" ) & @LF ) 
           memowrite( "-->Month:" & @TAB & DllStructGetData ( $tInfo , "Month" ) & @LF ) 
           memowrite( "-->DOW:" & @TAB & DllStructGetData ( $tInfo , "DOW" ) & @LF ) 
           memowrite( "-->Day:" & @TAB & DllStructGetData ( $tInfo , "Day" ) & @LF ) 
           memowrite( "-->Hour:" & @TAB & DllStructGetData ( $tInfo , "Hour" ) & @LF ) 
           memowrite( "-->Minute:" & @TAB & DllStructGetData ( $tInfo , "Minute" ) & @LF ) 
           memowrite( "-->Second:" & @TAB & DllStructGetData ( $tInfo , "Second" ) & @LF ) 
           memowrite( "-->MSeconds:" & @TAB & DllStructGetData ( $tInfo , "MSeconds" ) & @LF ) 
           memowrite( "-->DayState:" & @TAB & DllStructGetData ( $tInfo , "DayState" ) & @LF ) 
           memowrite( "-->pDayState:" & @TAB & DllStructGetData ( $tInfo , "pDayState" )) 
           ; MONTHDAYSTATE�������ַ (����һ���·���ÿ��״̬��DWORD��λ�ֶ�) 
           ; ÿһλ(1��31)�������е�һ���״̬. �����λ����, ��Ӧ�ս�������ʾ; ����ǿ����ʾ. 
           ; �޷���ֵ 
         Case $MCN_SELCHANGE ; ����ǰѡ�����ڻ����ڷ�Χ�ı�ʱ�������ؼ����� 
           $tInfo = DllStructCreate ( $tagNMSELCHANGE , $ilParam ) 
           memowrite( "$MCN_SELCHANGE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->BegYear:" & @TAB & DllStructGetData ( $tInfo , "BegYear" ) & @LF ) 
           memowrite( "-->BegMonth:" & @TAB & DllStructGetData ( $tInfo , "BegMonth" ) & @LF ) 
           memowrite( "-->BegDOW:" & @TAB & DllStructGetData ( $tInfo , "BegDOW" ) & @LF ) 
           memowrite( "-->BegDay:" & @TAB & DllStructGetData ( $tInfo , "BegDay" ) & @LF ) 
           memowrite( "-->BegHour:" & @TAB & DllStructGetData ( $tInfo , "BegHour" ) & @LF ) 
           memowrite( "-->BegMinute:" & @TAB & DllStructGetData ( $tInfo , "BegMinute" ) & @LF ) 
           memowrite( "-->BegSecond:" & @TAB & DllStructGetData ( $tInfo , "BegSecond" ) & @LF ) 
           memowrite( "-->BegMSeconds:" & @TAB & DllStructGetData ( $tInfo , "BegMSeconds" ) & @LF ) 
           memowrite( "-->EndYear:" & @TAB & DllStructGetData ( $tInfo , "EndYear" ) & @LF ) 
           memowrite( "-->EndMonth:" & @TAB & DllStructGetData ( $tInfo , "EndMonth" ) & @LF ) 
           memowrite( "-->EndDOW:" & @TAB & DllStructGetData ( $tInfo , "EndDOW" ) & @LF ) 
           memowrite( "-->EndDay:" & @TAB & DllStructGetData ( $tInfo , "EndDay" ) & @LF ) 
           memowrite( "-->EndHour:" & @TAB & DllStructGetData ( $tInfo , "EndHour" ) & @LF ) 
           memowrite( "-->EndMinute:" & @TAB & DllStructGetData ( $tInfo , "EndMinute" ) & @LF ) 
           memowrite( "-->EndSecond:" & @TAB & DllStructGetData ( $tInfo , "EndSecond" ) & @LF ) 
           memowrite( "-->EndMSeconds:" & @TAB & DllStructGetData ( $tInfo , "EndMSeconds" )) 
           ; �޷���ֵ 
         Case $MCN_SELECT ; ���û�������ȷ������ѡ��ʱ�������ؼ����� 
           $tInfo = DllStructCreate ( $tagNMSELCHANGE , $ilParam ) 
           memowrite( "$MCN_SELECT" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           memowrite( "-->BegYear:" & @TAB & DllStructGetData ( $tInfo , "BegYear" ) & @LF ) 
           memowrite( "-->BegMonth:" & @TAB & DllStructGetData ( $tInfo , "BegMonth" ) & @LF ) 
           memowrite( "-->BegDOW:" & @TAB & DllStructGetData ( $tInfo , "BegDOW" ) & @LF ) 
           memowrite( "-->BegDay:" & @TAB & DllStructGetData ( $tInfo , "BegDay" ) & @LF ) 
           memowrite( "-->BegHour:" & @TAB & DllStructGetData ( $tInfo , "BegHour" ) & @LF ) 
           memowrite( "-->BegMinute:" & @TAB & DllStructGetData ( $tInfo , "BegMinute" ) & @LF ) 
           memowrite( "-->BegSecond:" & @TAB & DllStructGetData ( $tInfo , "BegSecond" ) & @LF ) 
           memowrite( "-->BegMSeconds:" & @TAB & DllStructGetData ( $tInfo , "BegMSeconds" ) & @LF ) 
           memowrite( "-->EndYear:" & @TAB & DllStructGetData ( $tInfo , "EndYear" ) & @LF ) 
           memowrite( "-->EndMonth:" & @TAB & DllStructGetData ( $tInfo , "EndMonth" ) & @LF ) 
           memowrite( "-->EndDOW:" & @TAB & DllStructGetData ( $tInfo , "EndDOW" ) & @LF ) 
           memowrite( "-->EndDay:" & @TAB & DllStructGetData ( $tInfo , "EndDay" ) & @LF ) 
           memowrite( "-->EndHour:" & @TAB & DllStructGetData ( $tInfo , "EndHour" ) & @LF ) 
           memowrite( "-->EndMinute:" & @TAB & DllStructGetData ( $tInfo , "EndMinute" ) & @LF ) 
           memowrite( "-->EndSecond:" & @TAB & DllStructGetData ( $tInfo , "EndSecond" ) & @LF ) 
           memowrite( "-->EndMSeconds:" & @TAB & DllStructGetData ( $tInfo , "EndMSeconds" )) 
           ; �޷���ֵ 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_NOTIFY 
 
 Func memowrite ( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 
 
