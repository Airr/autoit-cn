 
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
     $hEndCap  =  _GDIPlus_ArrowCapCreate  ( 4 ,  6 ) 
 
     ; ��ʾ���״̬ 
     MsgBox ( 4096 ,  "Information" ,  "Fill state: "  &  _GDIPlus_ArrowCapGetFillState ( $hEndCap )) 
 
     ; ���Ƽ�ͷ1 
     _GDIPlus_PenSetCustomEndCap ( $hPen ,  $hEndCap ) 
     _GDIPlus_GraphicsDrawLine ( $hGraphic ,  10 ,  130 ,  390 ,  130 ,  $hPen ) 
 
     ; ���Ƽ�ͷ2 
     _GDIPlus_ArrowCapSetFillState ( $hEndCap ,  False ) 
     _GDIPlus_PenSetCustomEndCap ( $hPen ,  $hEndCap ) 
     _GDIPlus_GraphicsDrawLine ( $hGraphic ,  10 ,  160 ,  390 ,  160 ,  $hPen ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_ArrowCapDispose  ( $hEndCap ) 
     _GDIPlus_PenDispose  ( $hPen ) 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_Shutdown  () 
 EndFunc    ;==>_Main 
 

