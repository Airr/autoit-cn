 
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
 
     ; ������Դ 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     $hPen  =  _GDIPlus_PenCreate  ( 0xFF000000 ,  8 ) 
     _GDIPlus_PenSetEndCap ( $hPen ,  $GDIP_LINECAPARROWANCHOR ) 
 
     ; ��ʾ���յ���ñ 
     MsgBox ( 4096 ,  "Information" ,  "Pen end cap type: "  &  _GDIPlus_PenGetEndCap  ( $hPen )) 
 
     ; ���Ƽ�ͷ 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  130 ,  390 ,  130 ,  $hPen ) 
     _GDIPlus_PenSetWidth ( $hPen ,  6 ) 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  150 ,  390 ,  150 ,  $hPen ) 
     _GDIPlus_PenSetWidth ( $hPen ,  8 ) 
     _GDIPlus_GraphicsDrawLine  ( $hGraphic ,  10 ,  170 ,  390 ,  170 ,  $hPen ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_PenDispose  ( $hPen ) 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_ShutDown  () 
 
 EndFunc    ;==>_Main  

