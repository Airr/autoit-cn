 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 #include  <ScreenCapture.au3> 
 #include  <WinAPI.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hBitmap ,  $hImage ,  $hGraphic 
 
     ; ��ʼ��GDI+�� 
     _GDIPlus_Startup  () 
 
     ; ��׽��Ļ���� 
     $hBitmap  =  _ScreenCapture_Capture  ( "" ,  0 ,  0 ,  400 ,  300 ) 
     $hImage  =  _GDIPlus_BitmapCreateFromHBITMAP  ( $hBitmap ) 
 
     ; �����Ļ����ɫ 
     $hGraphic  =  _GDIPlus_ImageGetGraphicsContext  ( $hImage ) 
     _GDIPlus_GraphicsClear  ( $hGraphic ) 
 
     ; ������Ӧ��ͼ�� 
     _GDIPlus_ImageSaveToFile  ( $hImage ,  @MyDocumentsDir  &  "\GDIPlus_Image.jpg" ) 
 
     ; �����Դ 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_ImageDispose  ( $hImage ) 
     _WinAPI_DeleteObject  ( $hBitmap ) 
 
     ; �ر�GDI+�� 
     _GDIPlus_ShutDown  () 
 
 EndFunc    ;==>_Main  

