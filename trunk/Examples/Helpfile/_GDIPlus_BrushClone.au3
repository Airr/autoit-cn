 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 #include  <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hBrush1 ,  $hBrush2 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  596 ,  396 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; ������ˢ 
     _GDIPlus_Startup  () 
     $hBrush1  =  _GDIPlus_BrushCreateSolid  () 
     $hBrush2  =  _GDIPlus_BrushClone  ( $hBrush1 ) 
 
     ; ��ʾ��ˢ��Ϣ 
     MemoWrite ( "Brush 1 handle : 0x"  &  Hex ( $hBrush1 )) 
     MemoWrite ( "Brush 1 type ..: "  &  _GDIPlus_BrushGetType  ( $hBrush1 )) 
     MemoWrite ( "Brush 2 handle : 0x"  &  Hex ( $hBrush2 )) 
     MemoWrite ( "Brush 2 type ..: "  &  _GDIPlus_BrushGetType  ( $hBrush2 )) 
 
     ; �����Դ 
     _GDIPlus_BrushDispose  ( $hBrush2 ) 
     _GDIPlus_BrushDispose  ( $hBrush1 ) 
     _GDIPlus_ShutDown  () 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite ( $sMessage  =  '' ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
