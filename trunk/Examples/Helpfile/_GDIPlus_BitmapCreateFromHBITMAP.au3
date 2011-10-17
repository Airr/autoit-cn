 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 #include  <ScreenCapture.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hBMP ,  $hBitmap ,  $hGraphic 
 
     ; ��׽��Ļ���Ͻ� 
     $hBMP  =  _ScreenCapture_Capture  ( "" ,  0 ,  0 ,  400 ,  300 ) 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     GUISetState () 
 
     ; ��ʼ��GDI+�� 
     _GDIPlus_Startup  () 
 
     ; ��λͼ���Ƶ�GUI 
     $hBitmap  =  _GDIPlus_BitmapCreateFromHBITMAP  ( $hBMP ) 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hGUI ) 
     _GDIPlus_GraphicsDrawImage  ( $hGraphic ,  $hBitmap ,  0 ,  0 ) 
 
     ; �����Դ 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_ImageDispose  ( $hBitmap ) 
     _WinAPI_DeleteObject  ( $hBMP ) 
 
     ; �ر�GDI+�� 
     _GDIPlus_ShutDown  () 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
 EndFunc    ;==>_Main 
 
