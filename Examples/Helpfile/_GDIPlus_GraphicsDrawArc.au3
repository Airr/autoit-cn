 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hWnd ,  $hGraphic 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $hWnd  =  WinGetHandle ( "GDI+" ) 
     GUISetState () 
 
     ; ���ƻ� 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     _GDIPlus_GraphicsDrawArc  ( $hGraphic ,  160 ,  100 ,  10 ,  10 ,  180 ,  360 ) 
     _GDIPlus_GraphicsDrawArc  ( $hGraphic ,  180 ,  100 ,  10 ,  10 ,  180 ,  360 ) 
     _GDIPlus_GraphicsDrawArc  ( $hGraphic ,  160 ,  104 ,  30 ,  30 ,  160 ,  - 140 ) 
     _GDIPlus_GraphicsDrawArc  ( $hGraphic ,  140 ,  80 ,  70 ,  70 ,  180 ,  360 ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_Shutdown  () 
 
 EndFunc    ;==>_Main  

