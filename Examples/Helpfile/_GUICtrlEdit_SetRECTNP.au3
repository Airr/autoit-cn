 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiEdit.au3> 
 #include  <GuiStatusBar.au3> 
 #include  <GuiConstantsEx.au3> 
 #include  <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_Ed = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main () 
 
 Func _Main() 
   Local $StatusBar , $hEdit , $hGUI 
   Local $sFile = RegRead ( ' HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt ', ' InstallDir ' ) & ' \include\changelog.txt ' 
   Local $aPartRightSide [ 6 ] = [ 50 , 130 , 210 , 290 , 378 ,  -1 ] ,  $aRect 
 
   ; �������� 
   $hGUI = GUICreate ( ' Edit Set RECTNP ', 400 , 300 ) 
   $hEdit = GUICtrlCreateEdit ( '', 2 , 2 , 394 , 268 , BitOR ( $ES_WANTRETURN , $WS_VSCROLL )) 
   $StatusBar = _GUICtrlStatusBar_Create ( $hGUI , $aPartRightSide ) 
   _GUICtrlStatusBar_SetIcon ( $StatusBar , 5 , 97 , ' shell32.dll ' ) 
   _GUICtrlStatusBar_SetText ( $StatusBar , ' Rect ' ) 
   GUISetState () 
 
   ; ��ȡ���� 
   $aRect = _GUICtrlEdit_GetRECT ( $hEdit ) 
   $aRect [ 0 ] += 10 
   $aRect [ 1 ] += 10 
   $aRect [ 2 ] -= 10 
   $aRect [ 3 ] -= 10 
 
   ; ����ı� 
   _GUICtrlEdit_AppendText ( $hEdit , FileRead ( $sFile )) 
   _GUICtrlEdit_LineScroll ( $hEdit , 0 , _GUICtrlEdit_GetLineCount ( $hEdit ) * - 1 ) 
 
   ; ���þ��� 
   _GUICtrlEdit_SetRECTNP ( $hEdit , $aRect ) 
 
   ; ��ȡ���� 
   $aRect = _GUICtrlEdit_GetRECT ( $hEdit ) 
   _GUICtrlStatusBar_SetText ( $StatusBar , ' Left: ' & $aRect [ 0 ] , 1 ) 
   _GUICtrlStatusBar_SetText ( $StatusBar , ' Topt: ' & $aRect [ 1 ] , 2 ) 
   _GUICtrlStatusBar_SetText ( $StatusBar , ' Right: ' & $aRect [ 2 ] , 3 ) 
   _GUICtrlStatusBar_SetText ( $StatusBar , ' Bottom: ' & $aRect [ 3 ] , 4 ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc   ;==>_Main 
 
