 
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiDateTimePicker.au3> 
 #include <WindowsConstants.au3> 
 #include <GuiConstantsEx.au3> 
 #include <EditConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $hDTP , $edit 
 
 _Main () 
 
 Func _Main () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( "(UDF Created) DateTimePick Create" , 400 , 300 ) 
   $edit = GUICtrlCreateEdit ( "" , 2 , 32 , 394 , 258 , BitOR ( $WS_VSCROLL , $ES_AUTOVSCROLL )) 
   $hDTP = _GUICtrlDTP_Create ( $hGUI , 2 , 6 , 394 ) 
   GUISetState () 
 
   ; ������ʾ��ʽ 
   _GUICtrlDTP_SetFormat ( $hDTP , "ddd MMM dd, yyyy hh:mm ttt" ) 
 
   GUIRegisterMsg ( $WM_NOTIFY , "WM_NOTIFY" ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 Func  WM_NOTIFY( $hWnd , $iMsg , $iwParam , $ilParam ) 
   #forceref $hWnd, $iMsg, $iwParam 
   Local $hWndFrom , $iIDFrom , $iCode , $tNMHDR , $tInfo , $tBuffer , $tBuffer2 
 
   $tNMHDR = DllStructCreate ( $tagNMHDR , $ilParam ) 
   $hWndFrom = HWnd ( DllStructGetData ( $tNMHDR , "hWndFrom" )) 
   $iIDFrom = DllStructGetData ( $tNMHDR , "IDFrom" ) 
   $iCode = DllStructGetData ( $tNMHDR , "Code" ) 
   Switch $hWndFrom 
     Case $hDTP 
       Switch $iCode 
         Case $DTN_CLOSEUP ; ���û��ر���������ʱ������ʱ��ʰȡ��(DTP)�ؼ����� 
           memowrite ( "$DTN_CLOSEUP" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & $hWndFrom & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & $iIDFrom & @LF ) 
           memowrite( "-->Code:" & @TAB & $iCode & @LF ) 
           ; ��ʹ�ô���Ϣ�ķ���ֵ 
         Case $DTN_DATETIMECHANGE ; ���ۺ�ʱ�����ı�������ʱ��ʰȡ��(DTP)�ؼ����� 
           $tInfo = DllStructCreate ( $tagNMDATETIMECHANGE , $ilParam ) 
           memowrite ( "$DTN_DATETIMECHANGE" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           memowrite( "-->Flag:" & @TAB & DllStructGetData ( $tInfo , "Flag" ) & @LF ) 
           memowrite( "-->Year:" & @TAB & DllStructGetData ( $tInfo , "Year" ) & @LF ) 
           memowrite( "-->Month:" & @TAB & DllStructGetData ( $tInfo , "Month" ) & @LF ) 
           memowrite( "-->DOW:" & @TAB & DllStructGetData ( $tInfo , "DOW" ) & @LF ) 
           memowrite( "-->Day:" & @TAB & DllStructGetData ( $tInfo , "Day" ) & @LF ) 
           memowrite( "-->Hour:" & @TAB & DllStructGetData ( $tInfo , "Hour" ) & @LF ) 
           memowrite( "-->Minute:" & @TAB & DllStructGetData ( $tInfo , "Minute" ) & @LF ) 
           memowrite( "-->Second:" & @TAB & DllStructGetData ( $tInfo , "Second" ) & @LF ) 
           memowrite( "-->MSecond:" & @TAB & DllStructGetData ( $tInfo , "MSecond" )& @LF ) 
           Return 0 
         Case $DTN_DROPDOWN ; ���û�������������ʱ������ʱ��ʰȡ��(DTP)�ؼ����� 
           memowrite ( "$DTN_DROPDOWN" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           ; ��ʹ�ô���Ϣ�ķ���ֵ 
         Case $DTN_FORMAT ; ������ʱ��ʰȡ��(DTP)�ؼ���������Ҫ���ڻؽ�������ʾ�ı� 
           $tInfo = DllStructCreate ( $tagNMDATETIMEFORMAT , $ilParam ) 
           $tBuffer = DllStructCreate ( "char Format[128]" , DllStructGetData ( $tInfo , "Format" )) 
           $tBuffer2 = DllStructCreate ( "char Display[64]" , DllStructGetData ( $tInfo , "pDisplay" )) 
           memowrite( "$DTN_FORMAT" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           memowrite( "-->Format:" & @TAB & DllStructGetData ( $tBuffer , "Format" ) & @LF ) 
           memowrite( "-->Year:" & @TAB & DllStructGetData ( $tInfo , "Year" ) & @LF ) 
           memowrite( "-->Month:" & @TAB & DllStructGetData ( $tInfo , "Month" ) & @LF ) 
           memowrite( "-->DOW:" & @TAB & DllStructGetData ( $tInfo , "DOW" ) & @LF ) 
           memowrite( "-->Day:" & @TAB & DllStructGetData ( $tInfo , "Day" ) & @LF ) 
           memowrite( "-->Hour:" & @TAB & DllStructGetData ( $tInfo , "Hour" ) & @LF ) 
           memowrite( "-->Minute:" & @TAB & DllStructGetData ( $tInfo , "Minute" ) & @LF ) 
           memowrite( "-->Second:" & @TAB & DllStructGetData ( $tInfo , "Second" ) & @LF ) 
           memowrite( "-->MSecond:" & @TAB & DllStructGetData ( $tInfo , "MSecond" ) & @LF ) 
           memowrite( "-->Display:" & @TAB & DllStructGetData ( $tBuffer2 , "Display" ) & @LF ) 
           Return 0 
         Case $DTN_FORMATQUERY ; ������ʱ��ʰȡ��(DTP)�ؼ������Ի�ȡ�ڻؽ��������ʾ����������ȵ��ַ��� 
           $tInfo = DllStructCreate ( $tagNMDATETIMEFORMATQUERY , $ilParam ) 
           $tBuffer = DllStructCreate ( "char Format[128]" , DllStructGetData ( $tInfo , "Format" )) 
           memowrite( "$DTN_FORMATQUERY" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           memowrite( "-->Format:" & @TAB & DllStructGetData ( $tInfo , "Format" ) & @LF ) 
           memowrite( "-->SizeX:" & @TAB & DllStructGetData ( $tInfo , "SizeX" ) & @LF ) 
           memowrite( "-->SizeY:" & @TAB & DllStructGetData ( $tInfo , "SizeY" ) & @LF ) 
           DllStructSetData ( $tInfo , "SizeX" , 64 ) 
           DllStructSetData ( $tInfo , "SizeY" , 10 ) 
           Return 0 
         Case $DTN_USERSTRING ; ���û���ɱ༭�ؼ��е��ַ���ʱ������ʱ��ʰȡ��(DTP)�ؼ����� 
           $tInfo = DllStructCreate ( $tagNMDATETIMESTRING , $ilParam ) 
           $tBuffer = DllStructCreate ( "char UserString[128]" , DllStructGetData ( $tInfo , "UserString" )) 
           memowrite( "$DTN_USERSTRING" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           memowrite( "-->UserString:" & @TAB & DllStructGetData ( $tInfo , "UserString" ) & @LF ) 
           memowrite( "-->Year:" & @TAB & DllStructGetData ( $tInfo , "Year" ) & @LF ) 
           memowrite( "-->Month:" & @TAB & DllStructGetData ( $tInfo , "Month" ) & @LF ) 
           memowrite( "-->DOW:" & @TAB & DllStructGetData ( $tInfo , "DOW" ) & @LF ) 
           memowrite( "-->Day:" & @TAB & DllStructGetData ( $tInfo , "Day" ) & @LF ) 
           memowrite( "-->Hour:" & @TAB & DllStructGetData ( $tInfo , "Hour" ) & @LF ) 
           memowrite( "-->Minute:" & @TAB & DllStructGetData ( $tInfo , "Minute" ) & @LF ) 
           memowrite( "-->Second:" & @TAB & DllStructGetData ( $tInfo , "Second" ) & @LF ) 
           memowrite( "-->MSecond:" & @TAB & DllStructGetData ( $tInfo , "MSecond" ) & @LF ) 
           memowrite( "-->Flags:" & @TAB & DllStructGetData ( $tInfo , "Flags" ) & @LF ) 
           Return 0 
         Case $DTN_WMKEYDOWN ; ���û��ڻؽ��������ʱ������ʱ��ʰȡ��(DTP)�ؼ����� 
           $tInfo = DllStructCreate ( $tagNMDATETIMEFORMATQUERY , $ilParam ) 
           $tBuffer = DllStructCreate ( "char Format[128]" , DllStructGetData ( $tInfo , "Format" )) 
           memowrite( "$DTN_WMKEYDOWN" & @LF ) 
           memowrite( "-->hWndFrom:" & @TAB & DllStructGetData ( $tInfo , "hWndFrom" ) & @LF ) 
           memowrite( "-->IDFrom:" & @TAB & DllStructGetData ( $tInfo , "IDFrom" ) & @LF ) 
           memowrite( "-->Code:" & @TAB & DllStructGetData ( $tInfo , "Code" ) & @LF ) 
           memowrite( "-->VirtKey:" & @TAB & DllStructGetData ( $tInfo , "VirtKey" ) & @LF ) 
           memowrite( "-->Format:" & @TAB & DllStructGetData ( $tInfo , "Format" ) & @LF ) 
           memowrite( "-->Year:" & @TAB & DllStructGetData ( $tInfo , "Year" ) & @LF ) 
           memowrite( "-->Month:" & @TAB & DllStructGetData ( $tInfo , "Month" ) & @LF ) 
           memowrite( "-->DOW:" & @TAB & DllStructGetData ( $tInfo , "DOW" ) & @LF ) 
           memowrite( "-->Day:" & @TAB & DllStructGetData ( $tInfo , "Day" ) & @LF ) 
           memowrite( "-->Hour:" & @TAB & DllStructGetData ( $tInfo , "Hour" ) & @LF ) 
           memowrite( "-->Minute:" & @TAB & DllStructGetData ( $tInfo , "Minute" ) & @LF ) 
           memowrite( "-->Second:" & @TAB & DllStructGetData ( $tInfo , "Second" ) & @LF ) 
           memowrite( "-->MSecond:" & @TAB & DllStructGetData ( $tInfo , "MSecond" ) & @LF ) 
           Return 0 
       EndSwitch 
   EndSwitch 
   Return $GUI_RUNDEFMSG 
 EndFunc    ;==>WM_NOTIFY 
 
 Func memowrite( $s_text ) 
   GUICtrlSetData ( $edit , $s_text & @CRLF , 1) 
 EndFunc    ;==>memowrite 

