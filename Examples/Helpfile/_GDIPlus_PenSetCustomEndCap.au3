 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hWnd ,  $hGraphic ,  $hPen ,  $hEndCap 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $hWnd  =  WinGetHandle ( "GDI+" ) 
     GUISetState () 
 
     ; ������Դ 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     $hPen  =  _GDIPlus_PenCreate  ( 0xFF000000 ,  4 ) 
     $hEndCap  =  _GDIPlus_ArrowCapCreate  ( 3 ,  6 ) 
     _GDIPlus_PenSetCustomEndCap  ( $hPen ,  $hEndCap ) 
 
     ; ��ʾ�����յ���ñ 
     MsgBox ( 4096 ,  "Information" ,  "Pen end cap: "  &  _GDIPlus_PenGetCustomEndCap  ( $hPen )) 
 
     ; ���Ƽ�ͷ 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  120 ,  390 ,  120 ,  $hPen ) 
     _GDIPlus_PenSetWidth  ( $hPen ,  6 ) 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  150 ,  390 ,  150 ,  $hPen ) 
     _GDIPlus_PenSetWidth  ( $hPen ,  8 ) 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  200 ,  390 ,  200 ,  $hPen ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_PenDispose  ( $hPen ) 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_ShutDown  () 
 
 EndFunc    ;==>_Main  

