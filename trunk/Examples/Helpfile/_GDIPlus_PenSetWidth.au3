 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hWnd ,  $hGraphic ,  $hPen 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $hWnd  =  WinGetHandle ( "GDI+" ) 
     GUISetState () 
 
     ; ����ֱ�� 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     $hPen  =  _GDIPlus_PenCreate  ( 0xFF000000 ,  8 ) 
     _GDIPlus_PenSetWidth ( $hPen ,  4 ) 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  10 ,  390 ,  10 ,  $hPen ) 
 
     ; ��ʾ���ʿ�� 
     MsgBox ( 4096 ,  "Information" ,  "Pen Width: "  &  _GDIPlus_PenGetWidth  ( $hPen )) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; Clean up resources 
     _GDIPlus_PenDispose  ( $hPen ) 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_ShutDown  () 
 
 EndFunc    ;==>_Main  

